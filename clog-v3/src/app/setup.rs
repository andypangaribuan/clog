/*
 * Copyright (c) 2026.
 * Created by Andy Pangaribuan. All Rights Reserved.
 * This product is protected by copyright and distributed under
 * licenses restricting copying, distribution and decompilation.
 */

use super::env;
use rmod::config;

pub async fn setup() {
    rmod::store::update_db_with_deleted_at(false);
    if let Some(timezone) = super::env::timezone() {
        config::timezone(&timezone);
    }

    if env::db_enabled() {
        config::db_setup("clog", env::db(), None, 0, "active", "").await.unwrap_or_else(|err| {
            panic!("failed to setup clog db: {:#?}", err);
        });
    }

    if env::nats_enabled() {
        crate::nats::setup().await;
    }
}
