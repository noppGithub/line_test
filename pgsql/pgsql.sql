create database testdb;
\c testdb ;

CREATE TABLE IF NOT EXISTS public.order_detail (
    order_created_timestamp timestamp,
    status varchar,
    price integer,
    discount float,
    id varchar,
    driver_id varchar,
    user_id varchar,
    restaurant_id varchar
);

CREATE TABLE IF NOT EXISTS public.restaurant_detail (
    id varchar,
    restaurant_name varchar,
    category varchar,
    esimated_cooking_time float,
    latitude float,
    longitude float
);