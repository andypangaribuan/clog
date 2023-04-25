DROP TABLE IF EXISTS service_log;
CREATE TABLE IF NOT EXISTS service_log (
  id VARCHAR(30) NOT NULL,
  uid VARCHAR(25) NOT NULL,
  user_id VARCHAR(50) NULL,
  partner_id VARCHAR(50) NULL,
  xid VARCHAR(50) NULL,
  svc_name VARCHAR(50) NOT NULL,
  svc_version VARCHAR(25) NOT NULL,
  svc_parent VARCHAR(50) NULL,
  endpoint VARCHAR(200) NOT NULL,
  version VARCHAR(10) NOT NULL,
  message VARCHAR(100) NULL,
  severity VARCHAR(10) NOT NULL,
  path VARCHAR(1000) NOT NULL,
  function VARCHAR(1000) NOT NULL,
  req_header TEXT NULL,
  req_body TEXT NULL,
  req_par TEXT NULL,
  res_data TEXT NULL,
  res_code INT NULL,
  data TEXT NULL,
  error VARCHAR(200) NULL,
  stack_trace TEXT NULL,
  client_ip VARCHAR(200) NOT NULL,
  duration_ms INT NOT NULL,
  start_at TIMESTAMP(3) WITH TIME ZONE NOT NULL,
  finish_at TIMESTAMP(3) WITH TIME ZONE NOT NULL,
  created_at TIMESTAMP(0) WITH TIME ZONE NOT NULL,
  PRIMARY KEY (id));

COMMENT ON COLUMN service_log.severity IS 'types:\n- info\n- warning\n- error';

CREATE INDEX service_log_idx_uid ON service_log (uid ASC);
CREATE INDEX service_log_idx_userId ON service_log (user_id ASC);
CREATE INDEX service_log_idx_partnerId ON service_log (partner_id ASC);
CREATE INDEX service_log_idx_xid ON service_log (xid ASC);
CREATE INDEX service_log_idx_userId_partnerId ON service_log (user_id ASC, partner_id ASC);
CREATE INDEX service_log_idx_svcName ON service_log (svc_name ASC);
CREATE INDEX service_log_idx_svcName_svcParent ON service_log (svc_name ASC, svc_parent ASC);
CREATE INDEX service_log_idx_svcName_endpoint ON service_log (svc_name ASC, endpoint ASC);
CREATE INDEX service_log_idx_svcName_message ON service_log (svc_name ASC, message ASC);
CREATE INDEX service_log_idx_svcName_severity ON service_log (svc_name ASC, severity ASC);
CREATE INDEX service_log_idx_svcName_severity_message ON service_log (svc_name ASC, severity ASC, message ASC);
CREATE INDEX service_log_idx_svcName_severity_error ON service_log (svc_name ASC, severity ASC, error ASC);
CREATE INDEX service_log_idx_svcName_severity_stackTrace ON service_log (svc_name ASC, severity ASC, stack_trace ASC);
CREATE INDEX service_log_idx_svcName_resCode ON service_log (svc_name ASC, res_code ASC);
CREATE INDEX service_log_idx_svcName_durationMs ON service_log (svc_name ASC, duration_ms ASC);
CREATE INDEX service_log_idx_svcName_createdAt ON service_log (svc_name ASC, created_at ASC);



DROP TABLE IF EXISTS info_log;
CREATE TABLE IF NOT EXISTS info_log (
  id VARCHAR(30) NOT NULL,
  uid VARCHAR(25) NOT NULL,
  user_id VARCHAR(50) NULL,
  partner_id VARCHAR(50) NULL,
  xid VARCHAR(50) NULL,
  svc_name VARCHAR(50) NOT NULL,
  svc_version VARCHAR(25) NOT NULL,
  svc_parent VARCHAR(50) NULL,
  message VARCHAR(100) NOT NULL,
  severity VARCHAR(10) NOT NULL,
  path VARCHAR(1000) NOT NULL,
  function VARCHAR(1000) NOT NULL,
  data TEXT NULL,
  created_at TIMESTAMP(0) WITH TIME ZONE NOT NULL,
  PRIMARY KEY (id));

COMMENT ON COLUMN info_log.severity IS 'types:\n- info\n- warning\n- error';

CREATE INDEX info_log_idx_uid ON info_log (uid ASC);
CREATE INDEX info_log_idx_userId ON info_log (user_id ASC);
CREATE INDEX info_log_idx_partnerId ON info_log (partner_id ASC);
CREATE INDEX info_log_idx_xid ON info_log (xid ASC);
CREATE INDEX info_log_idx_userId_partnerId ON info_log (user_id ASC, partner_id ASC);
CREATE INDEX info_log_idx_svcName ON info_log (svc_name ASC);
CREATE INDEX info_log_idx_svcName_message ON info_log (svc_name ASC, message ASC);
CREATE INDEX info_log_idx_svcName_severity ON info_log (svc_name ASC, severity ASC);
CREATE INDEX info_log_idx_svcName_createdAt ON info_log (svc_name ASC, created_at ASC);



DROP TABLE IF EXISTS dbq_log;
CREATE TABLE IF NOT EXISTS dbq_log (
  id VARCHAR(30) NOT NULL,
  uid VARCHAR(25) NOT NULL,
  user_id VARCHAR(50) NULL,
  partner_id VARCHAR(50) NULL,
  xid VARCHAR(50) NULL,
  svc_name VARCHAR(50) NOT NULL,
  svc_version VARCHAR(25) NOT NULL,
  svc_parent VARCHAR(50) NULL,
  sql_query TEXT NOT NULL,
  sql_pars TEXT NULL,
  severity VARCHAR(10) NOT NULL,
  path VARCHAR(1000) NOT NULL,
  function VARCHAR(1000) NOT NULL,
  error TEXT NULL,
  stack_trace TEXT NULL,
  duration_ms INT NOT NULL,
  start_at TIMESTAMP(3) WITH TIME ZONE NOT NULL,
  finish_at TIMESTAMP(3) WITH TIME ZONE NOT NULL,
  created_at TIMESTAMP(3) WITH TIME ZONE NOT NULL,
  PRIMARY KEY (id));

COMMENT ON COLUMN dbq_log.severity IS 'types:\n- info\n- warning\n- error';

CREATE INDEX dbq_log_idx_uid ON dbq_log (uid ASC);
CREATE INDEX dbq_log_idx_userId ON dbq_log (user_id ASC);
CREATE INDEX dbq_log_idx_partnerId ON dbq_log (partner_id ASC);
CREATE INDEX dbq_log_idx_xid ON dbq_log (xid ASC);
CREATE INDEX dbq_log_idx_userId_partnerId ON dbq_log (user_id ASC, partner_id ASC);
CREATE INDEX dbq_log_idx_svcName ON dbq_log (svc_name ASC);
CREATE INDEX dbq_log_idx_svcName_severity ON dbq_log (svc_name ASC, severity ASC);
CREATE INDEX dbq_log_idx_svcName_durationMs ON dbq_log (svc_name ASC, duration_ms ASC);
CREATE INDEX dbq_log_idx_svcName_startAt ON dbq_log (svc_name ASC, start_at ASC);
