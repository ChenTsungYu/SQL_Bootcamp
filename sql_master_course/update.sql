-- Update the rows in data table

-- 1.1 single row ; 修改客戶id為4的客戶名稱為Tom，年齡為18
update customer_table set last_name = 'Tom' , age=18 where cust_id = 4;
-- 1.2 update multiple rows in multiple conditons
update customer_table set email='test123' where first_name = 'bee' or first_name = 'Gee';


