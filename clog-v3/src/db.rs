/*
 * Copyright (c) 2026.
 * Created by Andy Pangaribuan (iam.pangaribuan@gmail.com)
 * https://github.com/apangaribuan
 *
 * This product is protected by copyright and distributed under
 * licenses restricting copying, distribution and decompilation.
 * All Rights Reserved.
 */

use crate::grc::grc_clog::LogEntryRequest;
use rmod::chrono::{DateTime, Utc};
use rmod::sqlx::{self, types::JsonValue};
use rmod::store;

#[allow(dead_code)]
/// Initialize master table and partitions in PostgreSQL database.
pub async fn init_db() -> Result<(), sqlx::Error> {
    let pool = store::db();

    sqlx::query(
        r#"
CREATE TABLE IF NOT EXISTS app_logs
(
  created_at   TIMESTAMPTZ(6) NOT NULL,
  uid          VARCHAR(20)    NOT NULL,
  service_name VARCHAR(64)    NOT NULL,
  trace_id     VARCHAR(20)    NOT NULL,            -- Root request UID
  parent_uid   VARCHAR(20)    NOT NULL DEFAULT '', -- Parent action UID (empty for root)
  user_uid     VARCHAR(20)    NOT NULL,
  log_type     VARCHAR(40)    NOT NULL,
  action_name  TEXT           NOT NULL,            -- Endpoint path or SQL query summary
  duration_ms  INT            NOT NULL DEFAULT 0,  -- Execution duration
  status_code  INT            NOT NULL DEFAULT 0,  -- HTTP/gRPC status or DB success (200, 500, etc.)
  payload      JSONB,
  PRIMARY KEY (created_at, uid)
) PARTITION BY RANGE (created_at);

CREATE INDEX IF NOT EXISTS app_logs_x_trace_id ON app_logs (trace_id);
CREATE INDEX IF NOT EXISTS app_logs_x_user_uid ON app_logs (user_uid);
"#,
    )
    .execute(pool)
    .await?;

    // Create current day default partition if missing
    let today = Utc::now().format("%Y_%m_%d").to_string();
    let start_date = Utc::now().format("%Y-%m-%d 00:00:00+00").to_string();
    let end_date = (Utc::now() + rmod::chrono::Duration::days(1)).format("%Y-%m-%d 00:00:00+00").to_string();

    let partition_sql = format!(
        "CREATE TABLE IF NOT EXISTS app_logs_{} PARTITION OF app_logs FOR VALUES FROM ('{}') TO ('{}');",
        today, start_date, end_date
    );

    let _ = sqlx::query(&partition_sql).execute(pool).await;

    Ok(())
}

/// Bulk insert log entries into PostgreSQL using UNNEST array batching.
pub async fn bulk_insert(entries: Vec<LogEntryRequest>) -> Result<usize, sqlx::Error> {
    if entries.is_empty() {
        return Ok(0);
    }

    let pool = store::db();
    let count = entries.len();
    let mut uids: Vec<String> = Vec::with_capacity(count);
    let mut created_ats: Vec<DateTime<Utc>> = Vec::with_capacity(count);
    let mut service_names: Vec<String> = Vec::with_capacity(count);
    let mut trace_ids: Vec<String> = Vec::with_capacity(count);
    let mut parent_uids: Vec<String> = Vec::with_capacity(count);
    let mut user_uids: Vec<String> = Vec::with_capacity(count);
    let mut log_types: Vec<String> = Vec::with_capacity(count);
    let mut action_names: Vec<String> = Vec::with_capacity(count);
    let mut duration_ms: Vec<i32> = Vec::with_capacity(count);
    let mut status_codes: Vec<i32> = Vec::with_capacity(count);
    let mut payloads: Vec<JsonValue> = Vec::with_capacity(count);

    for e in entries {
        let dt = DateTime::from_timestamp_millis(e.timestamp_unix_ms).unwrap_or_else(Utc::now);
        let payload_json: JsonValue = rmod::json::from_str(&e.payload_json).unwrap_or(rmod::json::json!({ "raw": e.payload_json }));

        created_ats.push(dt);
        uids.push(e.uid);
        service_names.push(e.service_name);
        trace_ids.push(e.trace_id);
        parent_uids.push(e.parent_uid);
        user_uids.push(e.user_uid);
        log_types.push(e.log_type);
        action_names.push(e.action_name);
        duration_ms.push(e.duration_ms);
        status_codes.push(e.status_code);
        payloads.push(payload_json);
    }

    sqlx::query(
        r#"
        INSERT INTO app_logs (
            created_at, uid, service_name, trace_id, parent_uid,
            user_uid, log_type, action_name, duration_ms, status_code,
            payload
        )
        SELECT * FROM UNNEST(
            $1::timestamptz[], $2::varchar[], $3::varchar[], $4::varchar[], $5::varchar[],
            $6::varchar[], $7::varchar[], $8::text[], $9::int[], $10::int[],
            $11::jsonb[]
        );
        "#,
    )
    .bind(&created_ats)
    .bind(&uids)
    .bind(&service_names)
    .bind(&trace_ids)
    .bind(&parent_uids)
    .bind(&user_uids)
    .bind(&log_types)
    .bind(&action_names)
    .bind(&duration_ms)
    .bind(&status_codes)
    .bind(&payloads)
    .execute(pool)
    .await?;

    Ok(count)
}
