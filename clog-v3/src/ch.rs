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
use clickhouse::{Client, Row};
use rmod::serde::Serialize;
use std::sync::OnceLock;

static CLICKHOUSE_CLIENT: OnceLock<Client> = OnceLock::new();
static CLICKHOUSE_TABLE: OnceLock<String> = OnceLock::new();

#[derive(Row, Serialize, Debug, Clone)]
#[serde(crate = "rmod::serde")]
pub struct AppLogRow {
    pub created_at: i64,
    pub uid: String,
    pub env_name: String,
    pub service_name: String,
    pub trace_id: String,
    pub parent_uid: String,
    pub user_uid: String,
    pub log_type: String,
    pub action_name: String,
    pub duration_ms: i32,
    pub status_code: i16,
    pub payload: String,
    pub pod_name: String,
    pub info: String,
}

pub async fn setup() {
    let (ch_url, ch_db, ch_table, ch_user, ch_pass) = env::clickhouse();
    rmod::log!("🔥 connecting to ClickHouse at {} (db: {}, table: {})...", ch_url, ch_db, ch_table);

    let client = create_client(&ch_url, &ch_db, &ch_user, &ch_pass);

    // if let Err(e) = init_table(&client, &ch_table).await {
    //     panic!("failed to initialize ClickHouse table '{}': {}", ch_table, e);
    // }

    let _ = CLICKHOUSE_CLIENT.set(client);
    let _ = CLICKHOUSE_TABLE.set(ch_table.clone());
    rmod::log!("🔥 ClickHouse table '{}' ready.", ch_table);
}

pub fn get_client() -> Option<&'static Client> {
    CLICKHOUSE_CLIENT.get()
}

pub fn get_table() -> &'static str {
    CLICKHOUSE_TABLE.get().map(|s| s.as_str()).unwrap_or("app_logs")
}

pub fn create_client(url: &str, db: &str, user: &str, pass: &str) -> Client {
    let mut client = Client::default().with_url(url).with_database(db);
    if !user.is_empty() {
        client = client.with_user(user);
    }
    if !pass.is_empty() {
        client = client.with_password(pass);
    }
    client
}

#[allow(dead_code)]
pub async fn init_table(client: &Client, table_name: &str) -> Result<(), clickhouse::error::Error> {
    let ddl = format!(
        r#"
CREATE TABLE IF NOT EXISTS {}
(
    created_at        DateTime64(6, 'Asia/Jakarta'),
    uid               String,
    env_name          LowCardinality(String),
    service_name      LowCardinality(String),
    trace_id          String,
    parent_uid        String,
    user_uid          String,
    log_type          LowCardinality(String),
    action_name       String,
    duration_ms       Int32,
    status_code       Int16,
    payload           String,
    pod_name          LowCardinality(String),
    info              String,
    INDEX idx_trace_id trace_id TYPE bloom_filter(0.01) GRANULARITY 1
)
ENGINE = ReplacingMergeTree()
PARTITION BY toYYYYMMDD(created_at)
ORDER BY (env_name, service_name, log_type, created_at, uid)
TTL toDateTime(created_at) + INTERVAL 200 DAY;
"#,
        table_name
    );

    client.query(&ddl).execute().await
}

pub async fn bulk_insert(client: &Client, table_name: &str, rows: &[AppLogRow]) -> Result<(), clickhouse::error::Error> {
    let mut insert = client.insert(table_name)?;
    for row in rows {
        insert.write(row).await?;
    }
    insert.end().await?;
    Ok(())
}
