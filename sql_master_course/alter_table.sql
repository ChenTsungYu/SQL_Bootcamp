-- 1.1
ALTER TABLE customer_table ADD test_col varchar(255);

-- 1.2
ALTER TABLE customer_table DROP column  test_col;

-- 1.3
ALTER TABLE customer_table Alter column age TYPE varchar(100) ;

-- 1.4
ALTER TABLE customer_table Alter column age TYPE INT USING age::INTEGER; ;

-- 1.5
ALTER TABLE customer_table rename column email to customer_email;

-- 1.6
ALTER TABLE customer_table ALTER column cust_id SET NOT NULL ;
-- 1.7  Test NOT NULL
insert into customer_table (first_name, last_name, age, customer_email) values('aa', 'bb', 25, '123@gmail.com') ;

-- 1.8  
ALTER TABLE customer_table ALTER column cust_id DROP NOT NULL;

-- 1.9
ALTER TABLE customer_table ADD constraint cust_id CHECK (cust_id > 0);

-- 2.1
insert into customer_table (cust_id, first_name, last_name, age, customer_email) values(0,'aa', 'bb', 25, '123@gmail.com') ;

-- 2.2
ALTER TABLE customer_table DROP CONSTRAINT cust_id;

-- 2.3
ALTER TABLE customer_table ADD PRIMARY KEY (cust_id);
