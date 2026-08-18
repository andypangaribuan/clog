ATTACH TABLE _ UUID '8f1b12e7-4b9e-4df9-8a57-463ee42410a2'
(
    `hostname` LowCardinality(String) COMMENT 'Hostname of the server executing the query.',
    `event_date` Date COMMENT 'Event date.',
    `event_time` DateTime COMMENT 'Event time.',
    `event_time_microseconds` DateTime64(6) COMMENT 'Event time with microseconds precision.',
    `query_id` String COMMENT 'Identifier of the query associated with the background task.',
    `database` LowCardinality(String) COMMENT 'Name of the database.',
    `table` LowCardinality(String) COMMENT 'Name of the table.',
    `table_uuid` UUID COMMENT 'UUID of the table the background task belongs to.',
    `log_name` LowCardinality(String) COMMENT 'Name of the background task.',
    `duration_ms` UInt64 COMMENT 'Duration of the task execution in milliseconds.',
    `error` UInt16 COMMENT 'The error code of the occurred exception.',
    `exception` String COMMENT 'Text message of the occurred error.',
    INDEX event_time_index event_time TYPE minmax GRANULARITY 1,
    INDEX event_time_microseconds_index event_time_microseconds TYPE minmax GRANULARITY 1,
    INDEX query_id_index query_id TYPE bloom_filter(0.001) GRANULARITY 1
)
ENGINE = MergeTree
PARTITION BY toYYYYMM(event_date)
ORDER BY (event_date, event_time)
SETTINGS index_granularity = 8192
COMMENT 'Contains history of background schedule pool task executions.\n\nIt is safe to truncate or drop this table at any time.'
