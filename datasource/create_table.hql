create database if not exists testdb;
use testdb;

CREATE EXTERNAL TABLE IF NOT EXISTS order_detail_csv (
    order_created_timestamp timestamp,
    status string,
    price integer,
    discount float,
    id string,
    driver_id string,
    user_id string,
    restaurant_id string
)
PARTITIONED BY(dt string)
row format delimited
fields terminated by ','
lines terminated by '\n'
stored as textfile location 'hdfs://namenode:8020/user/hive/warehouse/testdb.db/order_detail_csv'
;

CREATE EXTERNAL TABLE IF NOT EXISTS restaurant_detail_csv (
    id string,
    restaurant_name string,
    category string,
    esimated_cooking_time float,
    latitude float,
    longitude float
)
PARTITIONED BY(dt string)
row format delimited
fields terminated by ','
lines terminated by '\n'
stored as textfile location 'hdfs://namenode:8020/user/hive/warehouse/testdb.db/restaurant_detail_csv'
;


CREATE EXTERNAL TABLE IF NOT EXISTS order_detail (
    order_created_timestamp timestamp,
    status string,
    price integer,
    discount float,
    id string,
    driver_id string,
    user_id string,
    restaurant_id string
)
PARTITIONED BY(dt string)
row format delimited
fields terminated by ','
lines terminated by '\n'
STORED AS PARQUET
;

CREATE EXTERNAL TABLE IF NOT EXISTS restaurant_detail (
    id string,
    restaurant_name string,
    category string,
    esimated_cooking_time float,
    latitude float,
    longitude float
)
PARTITIONED BY(dt string)
row format delimited
fields terminated by ','
lines terminated by '\n'
STORED AS PARQUET
;