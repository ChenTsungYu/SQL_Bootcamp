-- WHERE 中的子查詢
-- 1.1
select * from sales 
where customer_id 
in (select customer_id from customer where age < 20) ;

-- FROM 中的子查詢
-- 1.2
select p.product_id, p.product_name, p.category, s.total_quantity 
from product as p 
LEFT JOIN (select product_id, SUM(quantity) as total_quantity 
		   from sales GROUP BY product_id ) as s
ON p.product_id = s.product_id 
ORDER BY s.total_quantity desc;

-- SELECT 中的子查詢
-- 1.3
select customer_id, order_line,
	(select customer_name from customer as c 
 	WHERE c.customer_id = s.customer_id)
from sales as s
ORDER BY customer_id;

