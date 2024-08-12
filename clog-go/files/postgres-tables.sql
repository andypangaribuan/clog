DROP TABLE IF EXISTS service_log;
CREATE TABLE IF NOT EXISTS service_log (
  id          VARCHAR(30)    NOT NULL,
  uid         VARCHAR(25)    NOT NULL,
  user_id     VARCHAR(50),
  partner_id  VARCHAR(50),
  xid         VARCHAR(50),
  svc_name    VARCHAR(50)    NOT NULL,
  svc_version VARCHAR(25)    NOT NULL,
  svc_parent  VARCHAR(50),
  endpoint    VARCHAR(500)   NOT NULL,
  version     VARCHAR(10)    NOT NULL,
  message     VARCHAR(2000),
  severity    VARCHAR(10)    NOT NULL,
  path        VARCHAR(1000)  NOT NULL,
  function    VARCHAR(1000)  NOT NULL,
  req_header  TEXT,
  req_body    TEXT,
  req_par     TEXT,
  res_data    TEXT,
  res_code    INTEGER,
  data        TEXT,
  error       VARCHAR(1000),
  stack_trace TEXT,
  client_ip   VARCHAR(200)   NOT NULL,
  duration_ms INTEGER        NOT NULL,
  start_at    TIMESTAMPTZ(6) NULL,
  finish_at   TIMESTAMPTZ(6) NULL,
  created_at  TIMESTAMPTZ(6) NULL,
  PRIMARY KEY (id)
);



DROP TABLE IF EXISTS dbq_log;
CREATE TABLE dbq_log
(
  id          VARCHAR(30)    NOT NULL,
  uid         VARCHAR(25)    NOT NULL,
  user_id     VARCHAR(50),
  partner_id  VARCHAR(50),
  xid         VARCHAR(50),
  svc_name    VARCHAR(50)    NOT NULL,
  svc_version VARCHAR(25)    NOT NULL,
  svc_parent  VARCHAR(50),
  sql_query   TEXT           NOT NULL,
  sql_pars    TEXT,
  severity    VARCHAR(10)    NOT NULL,
  path        VARCHAR(1000)  NOT NULL,
  function    VARCHAR(1000)  NOT NULL,
  error       TEXT,
  stack_trace TEXT,
  duration_ms INTEGER        NOT NULL,
  start_at    TIMESTAMPTZ(6) NULL,
  finish_at   TIMESTAMPTZ(6) NULL,
  created_at  TIMESTAMPTZ(6) NULL,
  PRIMARY KEY (id)
);



DROP TABLE IF EXISTS info_log;
CREATE TABLE info_log
(
  id          VARCHAR(30)    NOT NULL,
  uid         VARCHAR(25)    NOT NULL,
  user_id     VARCHAR(50),
  partner_id  VARCHAR(50),
  xid         VARCHAR(50),
  svc_name    VARCHAR(50)    NOT NULL,
  svc_version VARCHAR(25)    NOT NULL,
  svc_parent  VARCHAR(50),
  message     VARCHAR(1000)  NOT NULL,
  severity    VARCHAR(10)    NOT NULL,
  path        VARCHAR(1000)  NOT NULL,
  function    VARCHAR(1000)  NOT NULL,
  data        TEXT,
  created_at  TIMESTAMPTZ(6) NOT NULL,
  PRIMARY KEY (id)
);



DROP TABLE IF EXISTS internal_sync_log;
CREATE TABLE info_log
(
  table_name VARCHAR(30)    NOT NULL,
  last_sync  TIMESTAMPTZ(6) NOT NULL,
  PRIMARY KEY (table_name)
);



COMMENT ON COLUMN service_log.severity IS 'types:\n- info\n- warning\n- error';
COMMENT ON COLUMN dbq_log.severity IS 'types:\n- info\n- warning\n- error';
COMMENT ON COLUMN info_log.severity IS 'types:\n- info\n- warning\n- error';






-- INIT INDEX INDEX

SELECT
  current_user AS "user",
  CONCAT(current_database(), '.', current_schemas(false)) AS db,
  inet_server_addr() AS server_addr,
  inet_client_addr() AS client_addr,
  version();


-- !! WARNING
-- EXECUTION HERE MUST USING `clog_owg` ROLE!
SET ROLE clog_owg;
SELECT CURRENT_USER AS active_role, SESSION_USER AS active_user;

-- SHOW TABLE INDEXES
SELECT tablename, indexname, indexdef FROM pg_indexes
WHERE schemaname='public'
ORDER BY tablename, indexname;




-- SERVICE LOG
CREATE INDEX IF NOT EXISTS service_log_$uid
  ON service_log USING HASH (uid);

CREATE INDEX IF NOT EXISTS service_log_$created_at
  ON service_log USING BTREE (created_at DESC);

CREATE INDEX IF NOT EXISTS service_log_$created_at_$svc_name_$user_id
  ON service_log USING BTREE (created_at DESC, svc_name, user_id);

CREATE INDEX IF NOT EXISTS service_log_$created_at_$svc_name_$res_code
  ON service_log USING BTREE (created_at DESC, svc_name, res_code);

CREATE INDEX IF NOT EXISTS service_log_$created_at_$svc_name_$res_code_$endpoint
  ON service_log USING BTREE (created_at DESC, svc_name, res_code, endpoint);

-- for partner
CREATE INDEX IF NOT EXISTS service_log_$created_at_$svc_name_$res_code_$partner_id
  ON service_log USING BTREE (created_at DESC, svc_name, res_code, partner_id);





-- DBQ LOG
CREATE INDEX IF NOT EXISTS dbq_log_$uid
  ON dbq_log USING HASH (uid);

CREATE INDEX IF NOT EXISTS dbq_log_$created_at
  ON dbq_log USING BTREE (created_at DESC);

CREATE INDEX IF NOT EXISTS dbq_log_$created_at_$svc_name_$duration_ms
  ON dbq_log USING BTREE (created_at DESC, svc_name, duration_ms);

CREATE INDEX IF NOT EXISTS dbq_log_$created_at_$svc_name_$severity
  ON dbq_log USING BTREE (created_at DESC, svc_name, severity);





-- INFO LOG
CREATE INDEX IF NOT EXISTS info_log_$uid
  ON info_log USING HASH (uid);

CREATE INDEX IF NOT EXISTS info_log_$created_at
  ON info_log USING BTREE (created_at DESC);

CREATE INDEX IF NOT EXISTS info_log_$created_at_$svc_name
  ON info_log USING BTREE (created_at DESC, svc_name);

CREATE INDEX IF NOT EXISTS info_log_$created_at_$svc_name_$message
  ON info_log USING BTREE (created_at DESC, svc_name, message);

CREATE INDEX IF NOT EXISTS info_log_$created_at_$svc_name_$severity
  ON info_log USING BTREE (created_at DESC, svc_name, severity);

-- for partner
CREATE INDEX IF NOT EXISTS info_log_$created_at_$svc_name_$message_$partner_id
  ON info_log USING BTREE (created_at DESC, svc_name, message, partner_id);

CREATE INDEX IF NOT EXISTS info_log_$created_at_$svc_name_$severity_$partner_id
  ON info_log USING BTREE (created_at DESC, svc_name, severity, partner_id);

