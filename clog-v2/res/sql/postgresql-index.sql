SELECT CURRENT_USER AS "user", CONCAT(CURRENT_DATABASE(), '.', CURRENT_SCHEMA()) AS db, INET_SERVER_ADDR() AS address, VERSION();


-- !! INFO
-- EXECUTION HERE MUST USE `theone` ROLE!
SET ROLE theone;
SELECT CURRENT_USER AS active_role, SESSION_USER AS active_user;


SELECT * FROM svw_indexes();



-- INTERNAL SYNC LOG
CREATE INDEX CONCURRENTLY IF NOT EXISTS internal_sync_log_$table_name
  ON internal_sync_log USING HASH (table_name);

-- INTERNAL
CREATE INDEX CONCURRENTLY IF NOT EXISTS internal_$created_at
  ON internal USING BTREE (created_at);

-- NOTE V1
CREATE INDEX CONCURRENTLY IF NOT EXISTS note_v1_$created_at
  ON note_v1 USING BTREE (created_at);

-- DBQ V1
CREATE INDEX CONCURRENTLY IF NOT EXISTS dbq_v1_$created_at
  ON dbq_v1 USING BTREE (created_at);

-- HTTP CALL V1
CREATE INDEX CONCURRENTLY IF NOT EXISTS http_call_v1_$created_at
  ON http_call_v1 USING BTREE (created_at);

-- SERVICE PIECE V1
CREATE INDEX CONCURRENTLY IF NOT EXISTS service_piece_v1_$created_at
  ON service_piece_v1 USING BTREE (created_at);

-- SERVICE V1
CREATE INDEX CONCURRENTLY IF NOT EXISTS service_v1_$created_at
  ON service_v1 USING BTREE (created_at);

-- GRPC V1
CREATE INDEX CONCURRENTLY IF NOT EXISTS grpc_v1_$created_at
  ON grpc_v1 USING BTREE (created_at);
