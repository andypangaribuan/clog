/*
 * Copyright (c) 2026.
 * Created by Andy Pangaribuan. All Rights Reserved.
 * This product is protected by copyright and distributed under
 * licenses restricting copying, distribution and decompilation.
 */

use rmod::util::env;

pub fn app() -> (String, u16) {
    let app_name = env::string_or("APP_NAME", "clog");
    let port: u16 = env::int_or("APP_PORT_GRPC", 50051);

    (app_name, port)
}

pub fn timezone() -> Option<String> {
    env::string_opt("APP_TIMEZONE")
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
