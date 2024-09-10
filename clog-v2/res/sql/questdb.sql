-- SAMPLE QUERIES
-- SELECT * FROM table_name WHERE created_at IN '2024-05-18;3d';
-- SELECT res_code, COUNT() FROM table_name WHERE created_at IN '2024-06-17;3d' ORDER BY res_code;
-- ALTER TABLE table_name DROP PARTITION LIST '2024-01';


/*
 * this log only for clog service
 * if any error occurs
 */
DROP TABLE IF EXISTS internal;
CREATE TABLE IF NOT EXISTS internal
(
  created_at    TIMESTAMP,
  uid           VARCHAR,
  exec_path     VARCHAR,
  exec_function VARCHAR,
  data          VARCHAR,
  error_message VARCHAR,
  stack_trace   VARCHAR
) TIMESTAMP (created_at) PARTITION BY MONTH WAL;


/*
 * this is a custom log, from direct add
 */
DROP TABLE IF EXISTS note_v1;
CREATE TABLE IF NOT EXISTS note_v1
(
  created_at    TIMESTAMP,
  uid           VARCHAR,
  user_id       VARCHAR,
  partner_id    SYMBOL CACHE,
  svc_name      SYMBOL CACHE,
  svc_version   VARCHAR,
  exec_path     VARCHAR,
  exec_function VARCHAR,
  key           SYMBOL CACHE,
  sub_key       SYMBOL CACHE,
  data          VARCHAR
) TIMESTAMP (created_at) PARTITION BY MONTH WAL;


/*
 * severity   : enum [success, warning, error]
 * startedAt  : format "yyyy-MM-dd HH:mm:ss.SSSSSS TZ"
 * finishedAt : format "yyyy-MM-dd HH:mm:ss.SSSSSS TZ"
 */
DROP TABLE IF EXISTS dbq_v1;
CREATE TABLE IF NOT EXISTS dbq_v1
(
  created_at    TIMESTAMP,
  uid           VARCHAR,
  user_id       VARCHAR,
  partner_id    SYMBOL CACHE,
  svc_name      SYMBOL CACHE,
  svc_version   VARCHAR,
  sql_query     VARCHAR,
  sql_args      VARCHAR,
  severity      SYMBOL CACHE,
  exec_path     VARCHAR,
  exec_function VARCHAR,
  error_message VARCHAR,
  stack_trace   VARCHAR,
  host1         VARCHAR,
  host2         VARCHAR,
  duration1     INT,
  duration2     INT,
  duration      INT,
  started_at    TIMESTAMP,
  finished_at   TIMESTAMP
) TIMESTAMP (created_at) PARTITION BY MONTH WAL;


/*
 * startedAt  : format "yyyy-MM-dd HH:mm:ss.SSSSSS TZ"
 * finishedAt : format "yyyy-MM-dd HH:mm:ss.SSSSSS TZ"
 */
DROP TABLE IF EXISTS http_call_v1;
CREATE TABLE IF NOT EXISTS http_call_v1
(
  created_at    TIMESTAMP,
  uid           VARCHAR,
  user_id       VARCHAR,
  partner_id    SYMBOL CACHE,
  svc_name      SYMBOL CACHE,
  svc_version   VARCHAR,
  url           SYMBOL CACHE,
  severity      SYMBOL CACHE,
  req_header    VARCHAR,
  req_param     VARCHAR,
  req_query     VARCHAR,
  req_form      VARCHAR,
  req_files     VARCHAR,
  req_body      VARCHAR,
  res_data      VARCHAR,
  res_code      SYMBOL CACHE,
  error_message VARCHAR,
  stack_trace   VARCHAR,
  duration      INT,
  started_at    TIMESTAMP,
  finished_at   TIMESTAMP
) TIMESTAMP (created_at) PARTITION BY MONTH WAL;


/*
 * startedAt : format "yyyy-MM-dd HH:mm:ss.SSSSSS TZ"
 */
DROP TABLE IF EXISTS service_piece_v1;
CREATE TABLE IF NOT EXISTS service_piece_v1
(
  created_at         TIMESTAMP,
  uid                VARCHAR,
  svc_name           SYMBOL CACHE,
  svc_version        VARCHAR,
  svc_parent_name    SYMBOL CACHE,
  svc_parent_version VARCHAR,
  endpoint           SYMBOL CACHE,
  url                SYMBOL CACHE,
  req_version        VARCHAR,
  req_source         VARCHAR,
  req_header         VARCHAR,
  req_param          VARCHAR,
  req_query          VARCHAR,
  req_form           VARCHAR,
  req_body           VARCHAR,
  client_ip          VARCHAR,
  started_at         TIMESTAMP
) TIMESTAMP (created_at) PARTITION BY MONTH WAL;


/*
 * severity   : server (1xx & 3xx), success (2xx), warning (4xx), error (5xx)
 * startedAt  : format "yyyy-MM-dd HH:mm:ss.SSSSSS TZ"
 * finishedAt : format "yyyy-MM-dd HH:mm:ss.SSSSSS TZ"
 */
DROP TABLE IF EXISTS service_v1;
CREATE TABLE IF NOT EXISTS service_v1
(
  created_at         TIMESTAMP,
  uid                VARCHAR,
  user_id            VARCHAR,
  partner_id         SYMBOL CACHE,
  svc_name           SYMBOL CACHE,
  svc_version        VARCHAR,
  svc_parent_name    SYMBOL CACHE,
  svc_parent_version VARCHAR,
  endpoint           SYMBOL CACHE,
  url                SYMBOL CACHE,
  severity           SYMBOL CACHE,
  exec_path          VARCHAR,
  exec_function      VARCHAR,
  req_version        VARCHAR,
  req_source         VARCHAR,
  req_header         VARCHAR,
  req_param          VARCHAR,
  req_query          VARCHAR,
  req_form           VARCHAR,
  req_files          VARCHAR,
  req_body           VARCHAR,
  res_data           VARCHAR,
  res_code           SYMBOL CACHE,
  res_sub_code       SYMBOL CACHE,
  error_message      VARCHAR,
  stack_trace        VARCHAR,
  client_ip          VARCHAR,
  duration           INT,
  started_at         TIMESTAMP,
  finished_at        TIMESTAMP
) TIMESTAMP (created_at) PARTITION BY MONTH WAL;


/*
 * severity : info, warning, error
 */
DROP TABLE IF EXISTS grpc_v1;
CREATE TABLE IF NOT EXISTS grpc_v1
(
  created_at         TIMESTAMP,
  uid                VARCHAR,
  user_id            VARCHAR,
  partner_id         SYMBOL CACHE,
  svc_name           SYMBOL CACHE,
  svc_version        VARCHAR,
  svc_parent_name    SYMBOL CACHE,
  svc_parent_version VARCHAR,
  destination        SYMBOL CACHE,
  severity           SYMBOL CACHE,
  exec_path          VARCHAR,
  exec_function      VARCHAR,
  req_header         VARCHAR,
  data               VARCHAR
) TIMESTAMP (created_at) PARTITION BY MONTH WAL;





ALTER TABLE note_v1 ALTER COLUMN partner_id  ADD INDEX;
ALTER TABLE note_v1 ALTER COLUMN svc_name    ADD INDEX;
ALTER TABLE note_v1 ALTER COLUMN key         ADD INDEX;
ALTER TABLE note_v1 ALTER COLUMN sub_key     ADD INDEX;


ALTER TABLE dbq_v1 ALTER COLUMN partner_id  ADD INDEX;
ALTER TABLE dbq_v1 ALTER COLUMN svc_name    ADD INDEX;
ALTER TABLE dbq_v1 ALTER COLUMN severity    ADD INDEX;


ALTER TABLE http_call_v1 ALTER COLUMN partner_id  ADD INDEX;
ALTER TABLE http_call_v1 ALTER COLUMN svc_name    ADD INDEX;
ALTER TABLE http_call_v1 ALTER COLUMN url         ADD INDEX;
ALTER TABLE http_call_v1 ALTER COLUMN severity    ADD INDEX;
ALTER TABLE http_call_v1 ALTER COLUMN res_code    ADD INDEX;


ALTER TABLE service_piece_v1 ALTER COLUMN svc_name        ADD INDEX;
ALTER TABLE service_piece_v1 ALTER COLUMN svc_parent_name ADD INDEX;
ALTER TABLE service_piece_v1 ALTER COLUMN endpoint        ADD INDEX;
ALTER TABLE service_piece_v1 ALTER COLUMN url             ADD INDEX;


ALTER TABLE service_v1 ALTER COLUMN partner_id      ADD INDEX;
ALTER TABLE service_v1 ALTER COLUMN svc_name        ADD INDEX;
ALTER TABLE service_v1 ALTER COLUMN svc_parent_name ADD INDEX;
ALTER TABLE service_v1 ALTER COLUMN endpoint        ADD INDEX;
ALTER TABLE service_v1 ALTER COLUMN url             ADD INDEX;
ALTER TABLE service_v1 ALTER COLUMN severity        ADD INDEX;
ALTER TABLE service_v1 ALTER COLUMN res_code        ADD INDEX;
ALTER TABLE service_v1 ALTER COLUMN res_sub_code    ADD INDEX;


ALTER TABLE grpc_v1 ALTER COLUMN partner_id       ADD INDEX;
ALTER TABLE grpc_v1 ALTER COLUMN svc_name         ADD INDEX;
ALTER TABLE grpc_v1 ALTER COLUMN svc_parent_name  ADD INDEX;
ALTER TABLE grpc_v1 ALTER COLUMN destination      ADD INDEX;
ALTER TABLE grpc_v1 ALTER COLUMN severity         ADD INDEX;
