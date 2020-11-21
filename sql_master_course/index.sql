-- 1.1
CREATE INDEX customer_idx ON customer(customer_name);

-- 1.2
CREATE INDEX customer_idx ON customer(customer_name, city);

-- 1.3
ALTER INDEX IF EXISTS customer_idx RENAME TO customerName_idx ;

-- 1.4
DROP INDEX IF EXISTS customer_idx RESTRICT;