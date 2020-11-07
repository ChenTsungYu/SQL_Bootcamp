-- SQL 查詢(select) 語法

-- 1.1 single row
select first_name from customer_table;

-- 1.2 multiple rows
select first_name, last_name from customer_table;

-- 1.3 all rows
select * from customer_table;

-- 2.1 distinct:  remove duplicates in single row
select distinct first_name from customer_table;
-- 2.2 distinct:  remove duplicates in multiple rows
select distinct first_name, age from customer_table;