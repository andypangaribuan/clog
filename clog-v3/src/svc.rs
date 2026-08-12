/*
 * Copyright (c) 2026.
 * Created by Andy Pangaribuan (iam.pangaribuan@gmail.com)
 * https://github.com/apangaribuan
 *
 * This product is protected by copyright and distributed under
 * licenses restricting copying, distribution and decompilation.
 * All Rights Reserved.
 */

use rmod::clog::{CentralLogService, CentralLogServiceServer, LogBatch, LogResponse};

pub fn service() -> CentralLogServiceServer<CentralLogServiceImpl> {
    CentralLogServiceServer::new(CentralLogServiceImpl {})
}

pub struct CentralLogServiceImpl {}

#[rmod::async_trait]
impl CentralLogService for CentralLogServiceImpl {
    async fn push_log_batch(
        &self,
        request: rmod::tonic::Request<LogBatch>,
    ) -> Result<rmod::tonic::Response<LogResponse>, rmod::tonic::Status> {
        let batch = request.into_inner();
        let count = batch.entries.len();

        match crate::db::bulk_insert(batch.entries).await {
            Ok(inserted) => Ok(rmod::tonic::Response::new(LogResponse { success: true, accepted_count: inserted as i32 })),
            Err(e) => {
                eprintln!("[clog][ERROR] Bulk insert failed for {} entries: {}", count, e);
                Err(rmod::tonic::Status::internal(format!("Database bulk insert failed: {}", e)))
            }
        }
    }
}
