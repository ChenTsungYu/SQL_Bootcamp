-- Delete the rows in data table

-- 1.1 delete single row
delete from customer_table where cust_id = 1;
-- 1.2 delete multiple rows
delete from customer_table where age < 20;
-- 1.3 delete all rows
delete from customer_table;
