
/*
 * dbq_log
 */
CREATE INDEX IF NOT EXISTS dbq_log_bix_$created_at
    ON dbq_log USING BTREE (created_at);

CREATE INDEX IF NOT EXISTS dbq_log_hix_$uid
    ON dbq_log USING HASH (uid);
