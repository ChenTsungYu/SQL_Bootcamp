-- 1.1
select order_line, CEIL(sales), FLOOR(sales), discount from sales WHERE discount > 0;

-- 1.2
select order_line, sales, ROUND(sales) as round_num from sales;

-- 1.3
select age, POWER(age, 2) as pow_age from customer;