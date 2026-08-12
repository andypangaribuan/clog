use crate::grc::grc_clog::{LogBatchRequest, LogResponse};

pub async fn push_batch(
    request: rmod::tonic::Request<LogBatchRequest>,
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