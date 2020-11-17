-- Having

-- 1.1
select region, COUNT(customer_id) as customer_count from customer group by region HAVING COUNT(customer_id) > 200;

-- 1.2
select region, COUNT(customer_id) as customer_count from customer where age > 40 group by region HAVING COUNT(customer_id) > 100;

