-- 1.1
select a.order_line, a.product_id, a.customer_id, a.sales, b.customer_name, b.age 
from sales AS a INNER JOIN customer as b ON a.customer_id=b.customer_id order by customer_id;

-- 2.1
select a.order_line, a.product_id, a.customer_id, a.sales, b.customer_name, b.age 
from sales AS a LEFT JOIN customer as b ON a.customer_id=b.customer_id order by age desc;

-- 3.1
select a.order_line, a.product_id, a.customer_id, a.sales, b.customer_name, b.age 
from sales AS a RIGHT JOIN customer as b ON a.customer_id=b.customer_id order by customer_id ;

-- 4.1
select a.order_line, a.product_id, a.customer_id, a.sales, b.customer_name, b.age 
from sales AS a FULL JOIN customer as b ON a.customer_id=b.customer_id order by customer_id ;

-- 5.1
select a.order_line, b.customer_id from sales AS a , customer as b ;

-- 6.1
select customer_id from sales 
EXCEPT
select customer_id from customer;
