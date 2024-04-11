/*
 * severity: enum [success, warning, error]
 */
CREATE TABLE IF NOT EXISTS dbq_log_v1 (
    created_at    TIMESTAMP(3) WITH TIME ZONE NOT NULL,
    uid           VARCHAR(20)  NOT NULL,
    user_id       VARCHAR(20),
    partner_id    VARCHAR(20),
    svc_name      VARCHAR(50)  NOT NULL,
    svc_version   VARCHAR(15)  NOT NULL,
    sql_query     TEXT         NOT NULL,
    sql_args      TEXT,
    severity      VARCHAR(10)  NOT NULL,
    exec_path     VARCHAR(500) NOT NULL,
    function      VARCHAR(500) NOT NULL,
    error_message VARCHAR(1000),
    stack_trace   TEXT,
    host1         VARCHAR(20)  NOT NULL,
    host2         VARCHAR(20),
    duration1     INTEGER      NOT NULL,
    duration2     INTEGER,
    duration      INTEGER      NOT NULL,
    started_at    TIMESTAMP(3) WITH TIME ZONE NOT NULL,
    finished_at   TIMESTAMP(3) WITH TIME ZONE NOT NULL
);


CREATE TABLE IF NOT EXISTS service_piece_log_v1 (
    created_at  TIMESTAMP(3)  WITH TIME ZONE NOT NULL,
    uid         VARCHAR(20)   NOT NULL,
    svc_name    VARCHAR(50)   NOT NULL,
    svc_version VARCHAR(15)   NOT NULL,
    endpoint    VARCHAR(1000) NOT NULL,
    url         VARCHAR(1500) NOT NULL,
    req_header  VARCHAR(2000),
    req_param   VARCHAR(2000),
    req_query   VARCHAR(2000),
    req_form    VARCHAR(2000),
    req_body    TEXT,
    client_ip   VARCHAR(50)   NOT NULL,
    started_at  TIMESTAMP(3)  WITH TIME ZONE NOT NULL
);