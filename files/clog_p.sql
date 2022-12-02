DROP TABLE IF EXISTS service_log;
CREATE TABLE IF NOT EXISTS service_log (
  id VARCHAR(25) NOT NULL,
  svc_name VARCHAR(50) NOT NULL,
  svc_parent VARCHAR(50) NULL,
  message VARCHAR(100) NULL,
  severity VARCHAR(10) NOT NULL,
  path VARCHAR(1000) NOT NULL,
  function VARCHAR(100) NOT NULL,
  req_header TEXT NULL,
  req_body TEXT NULL,
  req_par TEXT NULL,
  res_data TEXT NULL,
  res_code INT NULL,
  data TEXT NULL,
  error VARCHAR(200) NULL,
  stack_trace TEXT NULL,
  duration_ms INT NOT NULL,
  start_at TIMESTAMP(3) WITH TIME ZONE NOT NULL,
  finish_at TIMESTAMP(3) WITH TIME ZONE NOT NULL,
  created_at TIMESTAMP(0) WITH TIME ZONE NOT NULL,
  PRIMARY KEY (id, svc_name));

COMMENT ON COLUMN service_log.severity IS 'types:\n- info\n- warning\n- error';

CREATE INDEX service_log_idx_svcName_message ON service_log (svc_name ASC, message ASC);
CREATE INDEX service_log_idx_svcName_severity ON service_log (svc_name ASC, severity ASC);
CREATE INDEX service_log_idx_svcName_severity_message ON service_log (svc_name ASC, severity ASC, message ASC);
CREATE INDEX service_log_idx_svcName_resCode ON service_log (svc_name ASC, res_code ASC);
CREATE INDEX service_log_idx_svcName_createdAt ON service_log (svc_name ASC, created_at ASC);
CREATE INDEX service_log_idx_durationMs ON service_log (duration_ms ASC);
CREATE INDEX service_log_idx_createdAt ON service_log (created_at ASC);
CREATE INDEX service_log_idx_svcName ON service_log (svc_name ASC);



DROP TABLE IF EXISTS info_log;
CREATE TABLE IF NOT EXISTS info_log (
  id VARCHAR(25) NOT NULL,
  svc_name VARCHAR(50) NOT NULL,
  svc_parent VARCHAR(50) NULL,
  message VARCHAR(100) NOT NULL,
  severity VARCHAR(10) NOT NULL,
  path VARCHAR(1000) NOT NULL,
  function VARCHAR(100) NOT NULL,
  data TEXT NULL,
  created_at TIMESTAMP(0) WITH TIME ZONE NOT NULL,
  PRIMARY KEY (id, svc_name));

COMMENT ON COLUMN info_log.severity IS 'types:\n- info\n- warning\n- error';

CREATE INDEX info_log_idx_svcName ON info_log (svc_name ASC);
CREATE INDEX info_log_idx_svcName_message ON info_log (svc_name ASC, message ASC);
CREATE INDEX info_log_idx_svcName_severity ON info_log (svc_name ASC, severity ASC);
CREATE INDEX info_log_idx_svcName_createdAt ON info_log (svc_name ASC, created_at ASC);
CREATE INDEX info_log_idx_createdAt ON info_log (created_at ASC);