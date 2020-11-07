-- Import data from file

-- ** Comfirm the path of file **

-- CSV
copy customer_table from '/Users/tsungyuchen/Desktop/programming/SQL_Bootcamp/sql_master_course/Data/copy.csv' delimiter ',' csv header;

-- TXT
copy customer_table from '/Users/tsungyuchen/Desktop/programming/SQL_Bootcamp/sql_master_course/Data/copytext.txt' delimiter ',';
