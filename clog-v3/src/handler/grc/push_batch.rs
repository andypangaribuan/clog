use crate::app::env;
use crate::grc::grc_clog::{LogBatchRequest, LogResponse};

pub async fn push_batch(request: rmod::tonic::Request<LogBatchRequest>) -> Result<rmod::tonic::Response<LogResponse>, rmod::tonic::Status> {
    let batch = request.into_inner();
    let count = batch.entries.len();

    let mut inserted_count = count;

    if env::db_enabled() {
        match crate::db::bulk_insert(batch.entries.clone()).await {
            Ok(inserted) => inserted_count = inserted,
            Err(e) => {
                eprintln!("[clog][ERROR] Bulk insert failed for {} entries: {}", count, e);
                return Err(rmod::tonic::Status::internal(format!("Database bulk insert failed: {}", e)));
            }
        }
    }

    if env::nats_enabled() {
        crate::nats::publish_batch(&batch.entries).await;
    }

    Ok(rmod::tonic::Response::new(LogResponse { success: true, accepted_count: inserted_count as i32 }))
}
