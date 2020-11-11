-- 1.1 計算資料筆數
select COUNT(*) from sales;

-- 1.2 
select COUNT(order_line) as "Number of Product ordered", COUNT(distinct order_id) as "Number of orders" 
from sales where customer_id = 'CG-12520';

-- 2.1 
select SUM(profit) as "Total Profit" from sales;

-- 2.2 
select SUM(quantity) as "Total Quantity" from sales where product_id = 'FUR-CH-10000454';

-- 3.1
select AVG(age) as "Avarage Customer" from customer;

-- 3.2
select AVG(sales * 0.10) as "Avarage Commision" from sales;

-- 4.1
select MIN(sales) as "Minimum sales in June 2015" from sales where order_date between '2015-06-01' and '2015-06-30';

-- 4.2
select MAX(sales) as "Maximum sales in June 2015" from sales where order_date between '2015-06-01' and '2015-06-30';

-- 5.1
select customer_name, LENGTH(customer_name) as characters_num from customer;

-- 6.1
select customer_name, UPPER(customer_name) as upper_characters, LOWER(customer_name) as lower_characters from customer;

-- 7.1

