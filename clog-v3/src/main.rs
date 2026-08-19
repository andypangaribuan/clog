/*
 * Copyright (c) 2026.
 * Created by Andy Pangaribuan (iam.pangaribuan@gmail.com)
 * https://github.com/apangaribuan
 *
 * This product is protected by copyright and distributed under
 * licenses restricting copying, distribution and decompilation.
 * All Rights Reserved.
 */

mod app;
mod ch;
mod db;
mod grc;
mod handler;
mod nats;
mod nats_sync;

extern crate rmod as chrono;
extern crate rmod as prost;
extern crate rmod as serde;
extern crate rmod as sqlx;
extern crate rmod as tokio;
extern crate rmod as tonic;

use crate::app::env;
use rmod::{
    config,
    util::{ext, lifecycle},
};

#[rmod::main]
async fn main() {
    ext::sleep();
    config::healthcheck().await;

    let (app_name, port) = env::app();

    rmod::log!("🔥 starting...");
    rmod::log!("🔥 app setup...");
    app::setup().await;

    rmod::log!("🔥 grpc setup...");
    rmod::fuse::grpc(
        &format!("0.0.0.0:{}", port),
        handler::grc::service(),
        Some(|| {
            rmod::log!("🔥 {} running on port {}", app_name, port);
            lifecycle::before_graceful_shutdown(vec![before_graceful_shutdown]);
            lifecycle::start();
        }),
    )
    .await;
}

async fn before_graceful_shutdown() {
    rmod::log!("🔥 graceful shutdown");
}
