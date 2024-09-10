SELECT * FROM service_log WHERE created_at IN '2024-05-18;3d';
SELECT * FROM dbq_log     WHERE created_at IN '2024-05-13;3d';
SELECT * FROM info_log    WHERE created_at IN '2024-05-13;3d';


SELECT res_code, COUNT() FROM service_log WHERE created_at IN '2024-06-17;3d' ORDER BY res_code;


ALTER TABLE service_log DROP PARTITION LIST '2024-01';
ALTER TABLE dbq_log     DROP PARTITION LIST '2024-01';
ALTER TABLE info_log    DROP PARTITION LIST '2024-01';






DROP TABLE IF EXISTS service_log;
CREATE TABLE IF NOT EXISTS service_log (
    id          VARCHAR,
    uid         VARCHAR,
    user_id     VARCHAR,
    partner_id  SYMBOL CACHE,
    xid         VARCHAR,
    svc_name    SYMBOL CACHE,
    svc_version VARCHAR,
    svc_parent  VARCHAR,
    endpoint    SYMBOL CACHE,
    version     VARCHAR,
    message     VARCHAR,
    severity    SYMBOL CACHE,
    path        VARCHAR,
    function    VARCHAR,
    req_header  VARCHAR,
    req_body    VARCHAR,
    req_par     VARCHAR,
    res_data    VARCHAR,
    res_code    SYMBOL CACHE,
    data        VARCHAR,
    error       VARCHAR,
    stack_trace VARCHAR,
    client_ip   VARCHAR,
    duration_ms INT,
    start_at    TIMESTAMP,
    finish_at   TIMESTAMP,
    created_at  TIMESTAMP
) TIMESTAMP (created_at) PARTITION BY DAY WAL;



DROP TABLE IF EXISTS dbq_log;
CREATE TABLE dbq_log (
    id          VARCHAR,
    uid         VARCHAR,
    user_id     VARCHAR,
    partner_id  SYMBOL CACHE,
    xid         VARCHAR,
    svc_name    SYMBOL CACHE,
    svc_version VARCHAR,
    svc_parent  VARCHAR,
    sql_query   VARCHAR,
    sql_pars    VARCHAR,
    severity    SYMBOL CACHE,
    path        VARCHAR,
    function    VARCHAR,
    error       VARCHAR,
    stack_trace VARCHAR,
    duration_ms INT,
    start_at    TIMESTAMP,
    finish_at   TIMESTAMP,
    created_at  TIMESTAMP
) TIMESTAMP (created_at) PARTITION BY DAY WAL;



DROP TABLE IF EXISTS info_log;
CREATE TABLE info_log (
    id          VARCHAR,
    uid         VARCHAR,
    user_id     VARCHAR,
    partner_id  SYMBOL CACHE,
    xid         VARCHAR,
    svc_name    SYMBOL CACHE,
    svc_version VARCHAR,
    svc_parent  VARCHAR,
    message     VARCHAR,
    severity    SYMBOL CACHE,
    path        VARCHAR,
    function    VARCHAR,
    data        VARCHAR,
    created_at  TIMESTAMP
) TIMESTAMP (created_at) PARTITION BY DAY WAL;




ALTER TABLE service_log ALTER COLUMN partner_id ADD INDEX;
ALTER TABLE service_log ALTER COLUMN svc_name ADD INDEX;
ALTER TABLE service_log ALTER COLUMN endpoint ADD INDEX;
ALTER TABLE service_log ALTER COLUMN severity ADD INDEX;
ALTER TABLE service_log ALTER COLUMN res_code ADD INDEX;


ALTER TABLE dbq_log ALTER COLUMN partner_id ADD INDEX;
ALTER TABLE dbq_log ALTER COLUMN svc_name ADD INDEX;
ALTER TABLE dbq_log ALTER COLUMN severity ADD INDEX;


ALTER TABLE info_log ALTER COLUMN partner_id ADD INDEX;
ALTER TABLE info_log ALTER COLUMN svc_name ADD INDEX;
ALTER TABLE info_log ALTER COLUMN severity ADD INDEX;

