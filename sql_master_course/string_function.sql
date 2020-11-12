-- 1.1
select customer_name, LENGTH(customer_name) as characters_num from customer;

-- 2.1
select customer_name, UPPER(customer_name) as upper_characters, LOWER(customer_name) as lower_characters from customer;

-- 3.1
select customer_name, country, REPLACE(country, 'United States', 'US') as country_New from customer;

-- 4.1
select TRIM(leading '  ' from '  Tom is awesome       ');

-- 4.2
select TRIM(trailing '  ' from '  Tom is awesome       ');

-- 4.3
select TRIM(both '  ' from '  Tom is awesome       ');

-- 4.4
select RTRIM('  Tom is awesome       ', ' ');

-- 4.5
select LTRIM('  Tom is awesome       ', ' ');

-- 5.1
select customer_name, city || ', ' ||  state || ', ' || country as address from customer;

-- 6.1
select customer_id, customer_name, SUBSTRING(customer_id for 2) as customer_num from customer where SUBSTRING(customer_id for 2) = 'AB'; 

-- 6.2
select customer_id, customer_name, SUBSTRING(customer_id from 4 for 5) as customer_num from customer where SUBSTRING(customer_id for 2) = 'AB'; 

-- 7.1
select order_id, string_agg(product_id, ', ') from sales group by order_id order by order_id;


