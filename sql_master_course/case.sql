-- case

-- 1.1
select customer_id,age, CASE

WHEN age < 30 THEN 'Young'
WHEN age > 60 THEN 'Senior'
ELSE 'Middle age'
end as Age_category

from customer;