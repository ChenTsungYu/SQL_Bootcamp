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