-- 在 Customer_table 新增資料

--對所有的欄位新增資料
insert into Customer_table values (
	1,
	'bee',
	'cee',
	20,
	'c1@gmail.com'
);

-- 對特定的欄位新增資料
-- sample: 不新增 last_name 欄位的資料，該筆資料的 last_name 欄位顯示 null
insert into Customer_table (cust_id, first_name, age, email) values (
	3,
	'bee3',
	40,
	'c4@gmail.com'
);

-- 新增多筆資料
insert into customer_table values 
(4,'bee4','cee4',20,'c4@gmail.com'),
(5,'bee5','cee5',10,'c5@gmail.com'),
(6,'bee6','cee6',70,'c6@gmail.com'),
(7,'bee7','cee7',40,'c7@gmail.com');



