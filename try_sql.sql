CREATE TABLE IF NOT EXISTS order_detail (
    order_created_timestamp timestamp,
    status varchar,
    price integer,
    discount float,
    id varchar,
    driver_id varchar,
    user_id varchar,
    restaurant_id varchar
);

CREATE TABLE IF NOT EXISTS restaurant_detail (
    id varchar,
    restaurant_name varchar,
    category varchar,
    esimated_cooking_time float,
    latitude float,
    longitude float
);

-- ====================================== hive ======================================
CREATE EXTERNAL TABLE IF NOT EXISTS order_detail (
    order_created_timestamp timestamp,
    status string,
    price integer,
    discount float,
    id string,
    driver_id string,
    user_id string,
    restaurant_id string,
    dt string
)
PARTITIONED BY(dt string)
row format delimited fields terminated by '\t' LINES TERMINATED BY '\n' stored as Parquet ;
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
row format delimited fields terminated by '\t' LINES TERMINATED BY '\n' stored as Parquet ;
;