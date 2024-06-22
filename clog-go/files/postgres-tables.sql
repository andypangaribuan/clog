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
    message     VARCHAR(3000),
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
    start_at    TIMESTAMPTZ(3) NULL,
    finish_at   TIMESTAMPTZ(3) NULL,
    created_at  TIMESTAMPTZ(3) NULL,
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
    start_at    TIMESTAMPTZ(3) NULL,
    finish_at   TIMESTAMPTZ(3) NULL,
    created_at  TIMESTAMPTZ(3) NULL,
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
    created_at  TIMESTAMPTZ(3) NOT NULL,
    PRIMARY KEY (id)
);



COMMENT ON COLUMN service_log.severity IS 'types:\n- info\n- warning\n- error';
COMMENT ON COLUMN dbq_log.severity IS 'types:\n- info\n- warning\n- error';
COMMENT ON COLUMN info_log.severity IS 'types:\n- info\n- warning\n- error';
