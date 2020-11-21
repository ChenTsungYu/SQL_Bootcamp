-- 1.1
select EXTRACT(day from current_date);

-- 1.2
select CURRENT_TIMESTAMP, EXTRACT(hour from CURRENT_TIMESTAMP);

-- 1.3
select order_date, ship_date, ( extract(epoch from ship_date) - extract(epoch from order_date) ) as sec_taken from sales;
