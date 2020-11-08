-- 條件篩選取值

--  1.1 equal ;查詢年齡為二十歲的客戶名字
select first_name from customer_table where age = 20;
--  1.2 great than ;查詢年齡大於二十歲的客戶名字
select first_name from customer_table where age > 20;
--  1.3 less than ;查詢年齡小於二十歲的客戶名字
select first_name from customer_table where age < 20;

--  2.1 AND sample; 查詢年齡介於 20 歲～30歲的客戶名字
select first_name from customer_table where age >= 20 AND age <= 30;
--  2.2 OR sample; 查詢年齡小於 20 歲或大於 30 歲的客戶名字
select first_name from customer_table where age < 20 OR age > 30;
--  2.3 NOT sample; 查詢年齡不等於 20 歲的客戶名字
select first_name from customer_table where NOT age = 20;
--  2.4 AND NOT sample; 查詢年齡不等於 20 歲且名字為 Jay 的客戶
select first_name from customer_table where NOT age = 20 AND NOT first_name = 'Jay';

-- 3.1 IN  篩選出位於 Los Angeles、Seattle 這兩個城市的客戶
select * from customer where city in ('Los Angeles', 'Seattle');

-- 3.2 IN & OR; 配合 OR 篩選出位於 Los Angeles、Seattle 這兩個城市的客戶 -> 與 3.1的回傳結果相同
select * from customer where city='Los Angeles' OR city='Seattle' ;

-- 4.1 BETWEEN
select first_name from customer_table where age BETWEEN 20 AND 30;

-- 4.2
select first_name from customer_table where age NOT BETWEEN 20 AND 30;

-- 4.3 
select * from sales where ship_date BETWEEN '2015-11-01' AND '2015-12-01' ;

-- 5.1  
select * from customer where customer_name LIKE 'A%';

-- 5.2
select * from customer where customer_name LIKE '%Alan%';

-- 5.3
select * from customer where customer_name LIKE '____ %';

-- 5.4
select * from customer where customer_name LIKE '____ %';

-- 5.5 找出所有非 S 開頭的城市名稱
select distinct city from customer where city NOT LIKE 'S %';

-- 6.1 
select * from customer where state = 'California' ORDER BY customer_name  ;

-- 6.2 
select * from customer where state = 'California' ORDER BY customer_name DESC ;

-- 6.3
select * from customer ORDER BY city ASC, customer_name DESC;

-- 6.4 
select * from customer ORDER BY 2 DESC;

-- 6.4 
select * from customer ORDER BY age DESC;

-- 7.1
select * from customer where age > 30 ORDER BY age DESC LIMIT 10 ;

-- 8.1
select customer_id AS "c_id Number", customer_name AS c_name, age AS c_age from customer;
