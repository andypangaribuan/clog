/*
 * Copyright (c) 2026.
 * Created by Andy Pangaribuan (iam.pangaribuan@gmail.com)
 * https://github.com/apangaribuan
 *
 * This product is protected by copyright and distributed under
 * licenses restricting copying, distribution and decompilation.
 * All Rights Reserved.
 */

use crate::app::env;
use crate::grc::grc_clog::LogEntryRequest;
use async_nats::jetstream::{self, Context};
use rmod::serde::{Deserialize, Serialize};
use std::sync::OnceLock;

static NATS_JS: OnceLock<Context> = OnceLock::new();
static NATS_CONFIG: OnceLock<(String, String)> = OnceLock::new();

#[derive(Serialize, Deserialize, Debug, Clone)]
#[serde(crate = "rmod::serde")]
pub struct NatsLogPayloadOwned {
    pub uid: String,
    pub timestamp_unix_us: i64,
    pub env_name: String,
    pub service_name: String,
    pub trace_id: String,
    pub parent_uid: String,
    pub user_uid: String,
    pub partner_uid: String,
    pub log_type: String,
    pub action_name: String,
    pub duration_ms: i32,
    pub status_code: i32,
    pub payload_json: String,
    pub pod_name: String,
    pub info: String,
}

#[derive(Serialize)]
#[serde(crate = "rmod::serde")]
pub struct NatsLogPayload<'a> {
    pub uid: &'a str,
    pub timestamp_unix_us: i64,
    pub env_name: &'a str,
    pub service_name: &'a str,
    pub trace_id: &'a str,
    pub parent_uid: &'a str,
    pub user_uid: &'a str,
    pub partner_uid: &'a str,
    pub log_type: &'a str,
    pub action_name: &'a str,
    pub duration_ms: i32,
    pub status_code: i32,
    pub payload_json: &'a str,
    pub pod_name: &'a str,
    pub info: &'a str,
}

impl<'a> From<&'a LogEntryRequest> for NatsLogPayload<'a> {
    fn from(e: &'a LogEntryRequest) -> Self {
        Self {
            uid: &e.uid,
            timestamp_unix_us: e.timestamp_unix_us,
            env_name: &e.env_name,
            service_name: &e.service_name,
            trace_id: &e.trace_id,
            parent_uid: &e.parent_uid,
            user_uid: &e.user_uid,
            partner_uid: &e.partner_uid,
            log_type: &e.log_type,
            action_name: &e.action_name,
            duration_ms: e.duration_ms,
            status_code: e.status_code,
            payload_json: &e.payload_json,
            pod_name: &e.pod_name,
            info: &e.info_json,
        }
    }
}

pub async fn setup() {
    if !env::nats_enabled() {
        return;
    }

    let (url, stream_name, subject_prefix) = env::nats();
    rmod::log!("🔥 connecting to NATS JetStream at {}...", url);

    let client = async_nats::connect(&url).await.unwrap_or_else(|e| {
        panic!("failed to connect to NATS at {}: {}", url, e);
    });

    let js = jetstream::new(client);

    // Ensure Stream exists
    let stream_subject = format!("{}.>", subject_prefix);
    let _ = js
        .get_or_create_stream(jetstream::stream::Config { name: stream_name.clone(), subjects: vec![stream_subject], ..Default::default() })
        .await
        .unwrap_or_else(|e| {
            panic!("failed to get/create NATS JetStream stream '{}': {}", stream_name, e);
        });

    let _ = NATS_JS.set(js);
    let _ = NATS_CONFIG.set((stream_name, subject_prefix));
    rmod::log!("🔥 NATS JetStream stream ready.");
}

pub async fn publish_batch(entries: &[LogEntryRequest]) {
    let Some(js) = NATS_JS.get() else {
        return;
    };
    let Some((_, subject_prefix)) = NATS_CONFIG.get() else {
        return;
    };

    for entry in entries {
        let subject = if !entry.service_name.is_empty() {
            format!("{}.{}", subject_prefix, entry.service_name)
        } else {
            format!("{}.default", subject_prefix)
        };

        let log_payload = NatsLogPayload::from(entry);
        if let Ok(payload) = rmod::json::to_vec(&log_payload)
            && let Err(e) = js.publish(subject, payload.into()).await
        {
            eprintln!("[clog][ERROR] Failed to publish log entry to NATS: {}", e);
        }
    }
}
