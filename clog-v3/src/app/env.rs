/*
 * Copyright (c) 2026.
 * Created by Andy Pangaribuan. All Rights Reserved.
 * This product is protected by copyright and distributed under
 * licenses restricting copying, distribution and decompilation.
 */

use rmod::util::env;

pub fn app() -> (String, i16) {
    let app_name = env::string_or("APP_NAME", "clog");
    let port: i16 = env::int_or("APP_PORT_GRPC", 10102);

    (app_name, port)
}

pub fn timezone() -> Option<String> {
    env::string_opt("APP_TIMEZONE")
}

#[derive(Debug, Clone, PartialEq, Eq)]
pub enum ServiceMode {
    Writer,
    Sync,
}

pub fn service_mode() -> ServiceMode {
    let val = env::string_or("SERVICE_MODE", "writer").to_lowercase();
    match val.as_str() {
        "sync" => ServiceMode::Sync,
        _ => ServiceMode::Writer,
    }
}

pub fn clickhouse() -> (String, String, String, String, String) {
    let url = env::string_or("CLICKHOUSE_URL", "http://127.0.0.1:8123");
    let database = env::string_or("CLICKHOUSE_DATABASE", "default");
    let table = env::string_or("CLICKHOUSE_TABLE", "app_logs");
    let username = env::string_or("CLICKHOUSE_USERNAME", "default");
    let password = env::string_or("CLICKHOUSE_PASSWORD", "");

    (url, database, table, username, password)
}

pub fn db_enabled() -> bool {
    env::bool_or("DB_ENABLED", true)
}

pub fn nats_enabled() -> bool {
    env::bool_or("NATS_ENABLED", false)
}

pub fn nats() -> (String, String, String) {
    let url = env::string_or("NATS_URL", "nats://127.0.0.1:4222");
    let stream = env::string_or("NATS_STREAM", "CLOG_STREAM");
    let subject = env::string_or("NATS_SUBJECT", "logs.clog");

    (url, stream, subject)
}

pub(super) fn db() -> rmod::config::DbConfig {
    rmod::config::DbConfig {
        host: env::string_or("DB_HOST", "127.0.0.1"),
        port: env::int_or("DB_PORT", 5432),
        database: env::string_or("DB_NAME", "clog"),
        schema: env::string_opt("DB_SCHEMA"),
        username: env::string_or("DB_USERNAME", "postgres"),
        password: env::string_or("DB_PASSWORD", "postgres"),
        max_connections: env::int_or("DB_MAX_CONN", 20),
        min_connections: env::int_or("DB_MIN_CONN", 2),
        acquire_timeout: env::int_opt("DB_ACQUIRE_TIMEOUT"),
        idle_timeout: env::int_opt("DB_IDLE_TIMEOUT"),
        lock_timeout: None,
    }
}
