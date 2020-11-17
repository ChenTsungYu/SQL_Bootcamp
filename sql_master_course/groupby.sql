-- Group By

-- 1.1 
select region, Count(customer_id) as customer_count from customer group by region;

-- 1.2
select product_id, SUM(quantity) as quantity_sold from sales group by product_id order by quantity_sold desc;

-- 1.3
select customer_id, MIN(sales) as Min_sales, MAX(sales) as Max_sales, AVG(sales) as Average_sales, SUM(sales) as Total_sales from sales group by customer_id order by Total_sales desc limit 10;