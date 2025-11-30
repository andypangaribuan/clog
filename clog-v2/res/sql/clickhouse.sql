-- !! IMPORTANT
-- CHANGE YOUR REGION, e.q. Asia/Jakarta



/*
 * this log only for clog service
 * if any error occurs
 */
CREATE TABLE internal
(
  created_at    DateTime64(6, 'Asia/Jakarta'),
  uid           FixedString(20),
  exec_path     String,
  exec_function String,
  data          String,
  error_message String,
  stack_trace   String
)
engine = MergeTree
PARTITION BY toYYYYMMDD(created_at)
ORDER BY (created_at);



/*
 * this is a custom log, from direct adding
 */
CREATE TABLE note_v1
(
  created_at    DateTime64(6, 'Asia/Jakarta'),
  uid           FixedString(20),
  user_id       FixedString(20) DEFAULT '<null>',
  partner_id    FixedString(20) DEFAULT '<null>',
  svc_name      LowCardinality(String),
  svc_version   LowCardinality(String),
  exec_path     String,
  exec_function String,
  key           LowCardinality(String) DEFAULT '<null>',
  sub_key       String DEFAULT '<null>',
  data          String,
  occurred_at   DateTime64(6, 'Asia/Jakarta')
)
engine = MergeTree
PARTITION BY toYYYYMMDD(occurred_at)
ORDER BY (svc_name, occurred_at);



/*
 * severity: enum [success, warning, error]
 */
CREATE TABLE dbq_v1
(
  created_at    DateTime64(6, 'Asia/Jakarta'),
  uid           FixedString(20),
  user_id       FixedString(20) DEFAULT '<null>',
  partner_id    FixedString(20) DEFAULT '<null>',
  svc_name      LowCardinality(String),
  svc_version   LowCardinality(String),
  sql_query     String,
  sql_args      String DEFAULT '<null>',
  severity      LowCardinality(String),
  exec_path     String,
  exec_function String,
  error_message String DEFAULT '<null>',
  stack_trace   String DEFAULT '<null>',
  db_name       String DEFAULT '<null>',
  schema_name   String DEFAULT '<null>',
  host1         String,
  host2         String DEFAULT '<null>',
  duration1     UInt32,
  duration2     UInt32 DEFAULT 0,
  duration      UInt32,
  started_at    DateTime64(6, 'Asia/Jakarta'),
  finished_at   DateTime64(6, 'Asia/Jakarta')
)
engine = MergeTree
PARTITION BY toYYYYMMDD(started_at)
ORDER BY (svc_name, started_at);



CREATE TABLE http_call_v1
(
  created_at    DateTime64(6, 'Asia/Jakarta'),
  uid           FixedString(20),
  user_id       FixedString(20) DEFAULT '<null>',
  partner_id    FixedString(20) DEFAULT '<null>',
  svc_name      LowCardinality(String),
  svc_version   LowCardinality(String),
  url           String,
  severity      LowCardinality(String),
  req_header    String DEFAULT '<null>',
  req_param     String DEFAULT '<null>',
  req_query     String DEFAULT '<null>',
  req_form      String DEFAULT '<null>',
  req_files     String DEFAULT '<null>',
  req_body      String DEFAULT '<null>',
  res_data      String DEFAULT '<null>',
  res_code      UInt32,
  error_message String DEFAULT '<null>',
  stack_trace   String DEFAULT '<null>',
  duration      UInt32,
  started_at    DateTime64(6, 'Asia/Jakarta'),
  finished_at   DateTime64(6, 'Asia/Jakarta')
)
engine = MergeTree
PARTITION BY toYYYYMMDD(started_at)
ORDER BY (svc_name, started_at);



CREATE TABLE service_piece_v1
(
  created_at         DateTime64(6, 'Asia/Jakarta'),
  uid                FixedString(20),
  svc_name           LowCardinality(String),
  svc_version        LowCardinality(String),
  svc_parent_name    LowCardinality(String) DEFAULT '<null>',
  svc_parent_version LowCardinality(String) DEFAULT '<null>',
  endpoint           String,
  url                String,
  req_version        String DEFAULT '<null>',
  req_source         String DEFAULT '<null>',
  req_header         String DEFAULT '<null>',
  req_param          String DEFAULT '<null>',
  req_query          String DEFAULT '<null>',
  req_form           String DEFAULT '<null>',
  req_body           String DEFAULT '<null>',
  client_ip          String,
  started_at         DateTime64(6, 'Asia/Jakarta')
)
engine = MergeTree
PARTITION BY toYYYYMMDD(started_at)
ORDER BY (svc_name, started_at);



CREATE TABLE service_v1
(
  created_at         DateTime64(6, 'Asia/Jakarta'),
  uid                FixedString(20),
  user_id            FixedString(20) DEFAULT '<null>',
  partner_id         FixedString(20) DEFAULT '<null>',
  svc_name           LowCardinality(String),
  svc_version        LowCardinality(String),
  svc_parent_name    LowCardinality(String) DEFAULT '<null>',
  svc_parent_version LowCardinality(String) DEFAULT '<null>',
  endpoint           String,
  url                String,
  severity           LowCardinality(String),
  exec_path          String,
  exec_function      String,
  req_version        String DEFAULT '<null>',
  req_source         String DEFAULT '<null>',
  req_header         String DEFAULT '<null>',
  req_param          String DEFAULT '<null>',
  req_query          String DEFAULT '<null>',
  req_form           String DEFAULT '<null>',
  req_files          String DEFAULT '<null>',
  req_body           String DEFAULT '<null>',
  res_data           String DEFAULT '<null>',
  res_code           UInt16,
  res_sub_code       String,
  error_message      String DEFAULT '<null>',
  stack_trace        String DEFAULT '<null>',
  client_ip          String,
  duration           UInt32,
  started_at         DateTime64(6, 'Asia/Jakarta'),
  finished_at        DateTime64(6, 'Asia/Jakarta')
)
engine = MergeTree
PARTITION BY toYYYYMMDD(started_at)
ORDER BY (svc_name, started_at);



/*
 * severity: info, warning, error
 */
CREATE TABLE grpc_v1
(
  created_at         DateTime64(6, 'Asia/Jakarta'),
  uid                FixedString(20),
  user_id            FixedString(20) DEFAULT '<null>',
  partner_id         FixedString(20) DEFAULT '<null>',
  svc_name           LowCardinality(String),
  svc_version        LowCardinality(String),
  svc_parent_name    LowCardinality(String) DEFAULT '<null>',
  svc_parent_version LowCardinality(String) DEFAULT '<null>',
  destination        LowCardinality(String),
  severity           LowCardinality(String),
  exec_path          String,
  exec_function      String,
  req_header         String DEFAULT '<null>',
  data               String DEFAULT '<null>',
  error_message      String DEFAULT '<null>',
  stack_trace        String DEFAULT '<null>',
  duration           UInt32,
  started_at         DateTime64(6, 'Asia/Jakarta'),
  finished_at        DateTime64(6, 'Asia/Jakarta')
)
engine = MergeTree
PARTITION BY toYYYYMMDD(started_at)
ORDER BY (svc_name, started_at);



CREATE TABLE distlock_v1
(
  created_at    DateTime64(6, 'Asia/Jakarta'),
  uid           FixedString(20),
  user_id       FixedString(20) DEFAULT '<null>',
  partner_id    FixedString(20) DEFAULT '<null>',
  svc_name      LowCardinality(String),
  svc_version   LowCardinality(String),
  engine        String,
  address       String,
  key           String,
  error_when    String DEFAULT '<null>',
  error_message String DEFAULT '<null>',
  stack_trace   String DEFAULT '<null>',
  duration      UInt32,
  started_at    DateTime64(6, 'Asia/Jakarta'),
  finished_at   DateTime64(6, 'Asia/Jakarta')
)
engine = MergeTree
PARTITION BY toYYYYMMDD(started_at)
ORDER BY (svc_name, started_at);
