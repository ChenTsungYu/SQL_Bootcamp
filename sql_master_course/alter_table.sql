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
