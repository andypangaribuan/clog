/*
 * Copyright (c) 2026.
 * Created by Andy Pangaribuan (iam.pangaribuan@gmail.com)
 *
 * This product is protected by copyright and distributed under
 * licenses restricting copying, distribution and decompilation.
 * All Rights Reserved.
 */

use crate::grc::grc_clog::log_service_server::{LogService, LogServiceServer};
use crate::grc::grc_clog::{LogBatchRequest, LogResponse};

pub fn service() -> LogServiceServer<LogServiceImpl> {
    LogServiceServer::new(LogServiceImpl {})
}

pub struct LogServiceImpl {}

#[rmod::async_trait]
impl LogService for LogServiceImpl {
    async fn push_batch(
        &self,
        request: rmod::tonic::Request<LogBatchRequest>,
    ) -> Result<rmod::tonic::Response<LogResponse>, rmod::tonic::Status> {
        super::push_batch::push_batch(request).await
    }
}
