/*
 * this log only for clog service
 * if any error occurs
 */
CREATE TABLE IF NOT EXISTS internal (
    created_at    TIMESTAMP(3)  WITH TIME ZONE NOT NULL,
    uid           VARCHAR(20)   NOT NULL,
    exec_path     VARCHAR(500)  NOT NULL,
    exec_function VARCHAR(500)  NOT NULL,
    data          TEXT          NOT NULL,
    error_message VARCHAR(1000) NOT NULL,
    stack_trace   TEXT          NOT NULL
);



/*
 * severity: enum [success, warning, error]
 * startedAt  : format "yyyy-MM-dd HH:mm:ss.SSSSSS TZ"
 * finishedAt : format "yyyy-MM-dd HH:mm:ss.SSSSSS TZ"
 */
CREATE TABLE IF NOT EXISTS dbq_v1 (
    created_at    TIMESTAMP(3)  WITH TIME ZONE NOT NULL,
    uid           VARCHAR(20)   NOT NULL,
    user_id       VARCHAR(20),
    partner_id    VARCHAR(20),
    svc_name      VARCHAR(50)   NOT NULL,
    svc_version   VARCHAR(15)   NOT NULL,
    sql_query     TEXT          NOT NULL,
    sql_args      TEXT,
    severity      VARCHAR(10)   NOT NULL,
    exec_path     VARCHAR(500)  NOT NULL,
    exec_function VARCHAR(500)  NOT NULL,
    error_message VARCHAR(1000),
    stack_trace   TEXT,
    host1         VARCHAR(20)   NOT NULL,
    host2         VARCHAR(20),
    duration1     INTEGER       NOT NULL,
    duration2     INTEGER,
    duration      INTEGER       NOT NULL,
    started_at    TIMESTAMP(3)  WITH TIME ZONE NOT NULL,
    finished_at   TIMESTAMP(3)  WITH TIME ZONE NOT NULL
);



/*
 * startedAt : format "yyyy-MM-dd HH:mm:ss.SSSSSS TZ"
 */
CREATE TABLE IF NOT EXISTS service_piece_v1 (
    created_at         TIMESTAMP(3)   WITH TIME ZONE NOT NULL,
    uid                VARCHAR(20)    NOT NULL,
    svc_name           VARCHAR(50)    NOT NULL,
    svc_version        VARCHAR(15)    NOT NULL,
    svc_parent         VARCHAR(50),
    svc_parent_version VARCHAR(15),
    endpoint           VARCHAR(1000)  NOT NULL,
    url                VARCHAR(1500)  NOT NULL,
    req_version        VARCHAR(5),
    req_header         VARCHAR(2000),
    req_param          VARCHAR(2000),
    req_query          VARCHAR(2000),
    req_form           VARCHAR(2000),
    req_body           TEXT,
    client_ip          VARCHAR(150)    NOT NULL,
    started_at         TIMESTAMP(3)   WITH TIME ZONE NOT NULL
);



/*
 * severity   : server (1xx & 3xx), success (2xx), warning (4xx), error (5xx)
 * startedAt  : format "yyyy-MM-dd HH:mm:ss.SSSSSS TZ"
 * finishedAt : format "yyyy-MM-dd HH:mm:ss.SSSSSS TZ"
 */
CREATE TABLE IF NOT EXISTS service_v1 (
    created_at         TIMESTAMP(3)   WITH TIME ZONE NOT NULL,
    uid                VARCHAR(20)    NOT NULL,
    user_id            VARCHAR(20),
    partner_id         VARCHAR(20),
    svc_name           VARCHAR(50)    NOT NULL,
    svc_version        VARCHAR(15)    NOT NULL,
    svc_parent         VARCHAR(50),
    svc_parent_version VARCHAR(15),
    endpoint           VARCHAR(1000)  NOT NULL,
    url                VARCHAR(1500)  NOT NULL,
    severity           VARCHAR(10)    NOT NULL,
    exec_path          VARCHAR(500)   NOT NULL,
    exec_function      VARCHAR(500)   NOT NULL,
    req_version        VARCHAR(5),
    req_header         VARCHAR(2000),
    req_param          VARCHAR(2000),
    req_query          VARCHAR(2000),
    req_form           VARCHAR(2000),
    req_body           TEXT,
    res_data           TEXT,
    res_code           INTEGER        NOT NULL,
    error_message      VARCHAR(1000),
    stack_trace        TEXT,
    client_ip          VARCHAR(150)   NOT NULL,
    duration           INTEGER        NOT NULL,
    started_at         TIMESTAMP(3)   WITH TIME ZONE NOT NULL,
    finished_at        TIMESTAMP(3)   WITH TIME ZONE NOT NULL
);
