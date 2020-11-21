-- 1.1
CREATE VIEW logistics AS
select s.order_id, c.customer_name, c.city, c.state, c.country
from sales as s
LEFT JOIN customer as c
ON s.customer_id = c.customer_id
ORDER BY s.order_line;

select * from logistics; -- 查詢 View table的結果

-- 1.2
CREATE OR REPLACE VIEW logistics AS
select s.order_id, c.customer_name, c.city, c.state, c.country
from sales as s
LEFT JOIN customer as c
ON s.customer_id = c.customer_id
ORDER BY s.order_line;

select * from logistics; -- 查詢 View table的結果

-- 1.3
DROP VIEW logistics;