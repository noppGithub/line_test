### Steps
- docker compose up
- set up Postgre tables
    - `docker exec -it line_test-pgdb-1 /bin/bash`
    - psql -U postgres <./pgsql/pgsql.sql
    - psql -U postgres -d testdb -c 'select * from public.order_detail'
    - psql -U postgres -d testdb -c 'select * from public.restaurant_detail'
- setup Hive tables and load files
    - `docker exec -it hive-server /bin/bash`
    - cd ../datasource/
    - hive -f create_table.hql 
    - hadoop fs -put order_detail.csv hdfs://namenode:8020/user/hive/warehouse/testdb.db/order_detail_csv
    - hadoop fs -put restaurant_detail.csv hdfs://namenode:8020/user/hive/warehouse/testdb.db/restaurant_detail_csv
    - hadoop fs -ls hdfs://namenode:8020/user/hive/warehouse/testdb.db/order_detail_csv
    - hadoop fs -ls hdfs://namenode:8020/user/hive/warehouse/testdb.db/restaurant_detail_csv
    - hadoop fs -ls hdfs://namenode:8020/user/hive/warehouse/testdb.db/
    - hive
    - use testdb;
    - select * from order_detail_csv;

Please accept my apology that I can not complete the part of Hive(ingestion), I was only use the data from loaded Hive table.