/*
 * Copyright (c) 2026.
 * Created by Andy Pangaribuan. All Rights Reserved.
 * This product is protected by copyright and distributed under
 * licenses restricting copying, distribution and decompilation.
 */

use crate::app::env;
use crate::ch::{self, AppLogRow};
use crate::nats::NatsLogPayloadOwned;
use async_nats::jetstream::{self, consumer::pull};
use futures_util::StreamExt;

pub async fn setup() {
    let Some(ch_client) = ch::get_client() else {
        panic!("ClickHouse client is not initialized");
    };
    let ch_table = ch::get_table();

    let (nats_url, stream_name, _) = env::nats();
    rmod::log!("🔥 connecting to NATS JetStream at {} for sync...", nats_url);

    let client = async_nats::connect(&nats_url).await.unwrap_or_else(|e| {
        panic!("failed to connect to NATS at {}: {}", nats_url, e);
    });

    let js = jetstream::new(client);

    let stream = js.get_stream(&stream_name).await.unwrap_or_else(|e| {
        panic!("failed to get NATS JetStream stream '{}': {}", stream_name, e);
    });

    let consumer = stream
        .get_or_create_consumer(
            "clickhouse_inserter",
            pull::Config {
                durable_name: Some("clickhouse_inserter".to_string()),
                ack_policy: jetstream::consumer::AckPolicy::Explicit,
                ..Default::default()
            },
        )
        .await
        .unwrap_or_else(|e| {
            panic!("failed to get/create NATS JetStream durable consumer: {}", e);
        });

    rmod::log!("🔥 NATS JetStream -> ClickHouse sync worker started.");

    let ch_client = ch_client.clone();
    let ch_table = ch_table.to_string();

    rmod::tokio::spawn(async move {
        let mut row_buffer: Vec<AppLogRow> = Vec::with_capacity(5000);
        let mut msg_buffer: Vec<jetstream::Message> = Vec::with_capacity(5000);

        loop {
            match consumer.fetch().max_messages(5000).messages().await {
                Ok(mut messages) => {
                    while let Some(msg_result) = messages.next().await {
                        match msg_result {
                            Ok(msg) => {
                                if let Ok(payload) = rmod::json::from_slice::<NatsLogPayloadOwned>(&msg.payload) {
                                    row_buffer.push(AppLogRow {
                                        created_at: payload.timestamp_unix_ms * 1000,
                                        uid: payload.uid,
                                        env_name: payload.env_name,
                                        service_name: payload.service_name,
                                        trace_id: payload.trace_id,
                                        parent_uid: payload.parent_uid,
                                        user_uid: payload.user_uid,
                                        log_type: payload.log_type,
                                        action_name: payload.action_name,
                                        duration_ms: payload.duration_ms,
                                        status_code: payload.status_code as i16,
                                        payload: payload.payload_json,
                                        pod_name: payload.pod_name,
                                        info: payload.info,
                                    });
                                    msg_buffer.push(msg);
                                }

                                if row_buffer.len() >= 5000 {
                                    flush_to_clickhouse(&ch_client, &ch_table, &mut row_buffer, &mut msg_buffer).await;
                                }
                            }
                            Err(e) => eprintln!("[clog][ERROR] Error receiving NATS message: {}", e),
                        }
                    }

                    if !row_buffer.is_empty() {
                        flush_to_clickhouse(&ch_client, &ch_table, &mut row_buffer, &mut msg_buffer).await;
                    }
                }
                Err(e) => {
                    eprintln!("[clog][ERROR] Error fetching NATS JetStream batch: {}", e);
                    rmod::tokio::time::sleep(rmod::tokio::time::Duration::from_secs(1)).await;
                }
            }
        }
    });
}

async fn flush_to_clickhouse(
    ch_client: &clickhouse::Client,
    table_name: &str,
    row_buffer: &mut Vec<AppLogRow>,
    msg_buffer: &mut Vec<jetstream::Message>,
) {
    if row_buffer.is_empty() {
        return;
    }

    match ch::bulk_insert(ch_client, table_name, row_buffer).await {
        Ok(_) => {
            for msg in msg_buffer.iter() {
                let _ = msg.ack().await;
            }
        }
        Err(e) => {
            eprintln!("[clog][ERROR] ClickHouse bulk insert failed for {} rows: {}", row_buffer.len(), e);
        }
    }

    row_buffer.clear();
    msg_buffer.clear();
}
