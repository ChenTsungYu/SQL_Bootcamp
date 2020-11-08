# PostgreSQL
## 本地連接 PostgreSQL
```shell
psql postgres
```
## 查看資料庫版本
```sql
select version();
```
## Server 啟動時間與換算成已開機時間
```sql
select pg_postmaster_start_time();
```
output
```
+-------------------------------+
|   pg_postmaster_start_time    |
+-------------------------------+
| 2020-10-27 22:37:35.747442+08 |
+-------------------------------+
```

回傳帶時區精準度較高的格式，可以利用函數 `date_trunc` 取到秒
```sql
select date_trunc('second', current_timestamp - pg_postmaster_start_time()) as uptime;
```
output
```
+--------------------------+
|          uptime          |
+--------------------------+
| @ 1 hour 54 mins 32 secs |
+--------------------------+
```
## 列出Server上的Database
```sql
select datname as db_name
  from pg_database
 where datname 
   not in ('postgres', 'template0', 'template1')
    -- 屏蔽系統資料庫,與系統模板資料庫
 order by datname;
```
output
```
   db_name
-------------
 Training
 api
 bookstore
 eCommerce
 tours
 transport
 tsungyuchen
(7 rows)
```

## 查看資料庫大小
```sql
SELECT pg_size_pretty(
       pg_database_size(
       current_database()));
```
output
```
pg_size_pretty
----------------
 8097 kB
```
###  一起查看資料庫大小&名稱
select datname as db_name
     , pg_size_pretty(
       pg_database_size(
       datname)) as db_size
  from pg_database
 where datname 
   not in ('postgres', 'template0', 'template1')
 order by datname;

## 列出設定檔位置
```sql
show config_file;
```
### 列出目前設定情況不是default的
```sql
select name
     , source
     , setting
  from pg_settings
 where source != 'default'
   and source != 'override'
 order by 2, 1;
```
![](./image/showing-setting-not-default.png)

## 檔案匯入DB
運用 `COPY` 指令 — 在檔案和資料表之間複製資料;
`delimiter`: 指定用於分隔檔案每行內欄位的字元。預設值為 `text` 格式的 `tab` 字元，`CSV` 格式的逗號。
### CSV
```sql
copy customer_table from '/Users/tsungyuchen/Desktop/programming/SQL_Bootcamp/sql_master_course/Data/copy.csv' delimiter ',' csv header;
```
成功匯入所回傳的訊息
### TXT
```sql
copy customer_table from '/Users/tsungyuchen/Desktop/programming/SQL_Bootcamp/sql_master_course/Data/copytext.txt' delimiter ',';
```
![](./image/COPY_msg.png)

更多用法參考[官方文件](https://docs.postgresql.tw/reference/sql-commands/copy)

## 查詢(Select)
見[select.sql](./select.sql)

### Distinct
一張資料表中某欄位中可能會有多筆重複的資料，透過 ` SELECT` 查詢語法可用 `DISTINCT` 關鍵字過濾重複出現的值，見[select.sql](./select.sql) 的 **2.1** 範例。

> 注意:
> 如果 `SELECT DISTINCT` 後面有指定兩個以上的欄位(column)，則要符合**所有欄位值皆**重複的情形，該筆資料才會被捨棄。若只有其中一個欄位值相同但其它欄位值並不同，該筆資料仍會被取出

### Where
作為條件判斷，取出符合條件的值
範例見[where.sql](./where.sql) 1.1 ~ 1.3

### Logical Operator: 
適當搭配邏輯運算子`(AND & OR & NOT)`，可達成多個條件的查詢
- `AND` 表示該左右兩邊的條件皆需符合才成立
- `OR` 表示該左右兩邊的條件至少需符合一個才成立

範例見[where.sql](./where.sql) 2.1 ~ 2.4

### IN
限制必需符合**某些欄位值為條件**來搜尋資料表中的特定資料
範例見[where.sql](./where.sql) 3.1 ~ 2.4

### BETWEEN
限定某範圍內連續的值作為條件來搜尋資料表中的特定資料，可將範例[where.sql](./where.sql) 2.1 用`BETWEEN` 來進行改寫。

範例見[where.sql](./where.sql) 4.1~4.2。
除了以數值篩選之外，也可以用日期為篩選條件
範例見[where.sql](./where.sql) 4.3

### LIKE 
模糊查詢，可依循**特定的規則**來搜尋資料表中的特定資料。
**特定的規則**如: 萬用字元 (SQL Wildcards)，利用萬用字元來建立一個模式 (pattern)。 [PostgreSQL 官方文件](https://docs.postgresql.tw/the-sql-language/functions-and-operators/pattern-matching#9-7-1-like)提供相當多的資訊。

| 萬用字元 | 解釋 | 範例
| -------- | -------- | -------- | 
| `%`    | 匹配零～多個字元 | `A%` 表A開頭的字串都符合這個規則; e.g. ABC、AABCC; `%A` 表A結尾的字串; `B%A` 表 B 開頭 A 結尾的字串 |  
|  `_`  | 匹配一個字元 |  `AB_C` 表 AB 開頭 | 
| [charlist]     | 匹配「一個」在列舉範圍內的字元  |  待補 |
| [^charlist] 或 [!charlist]	     | 匹配「一個」不在列舉範圍內的字元  |   待補 | 


## Update
`update` 語句用於修改資料表中的資料
範例見[update.sql](./update.sql) 1.1 ~ 1.2
## Delete
`delete` 語句用於刪除資料表中的資料
範例見[delete.sql](./delete.sql) 1.1 ~ 1.3

## ALTER
`ALTER`  用來修改**已存在**的資料表（Table）結構
語句型式：
```sql
ALTER TABLE table_name  <<Spacific Action>> ;
```
`<<Spacific Action>>`的地方不同的對象，可以有以下操作行為：
- Columns：Add、Delete (Drop) 、Modify、Rename
- Constraints：Add、Delete (Drop)
- Index：Add、Delete (Drop)

### Columns
- 新增資料欄位 (Column) ，語法結構:
```sql
ALTER TABLE table_name ADD <column_name> <data_type> ;
```
其中`<column_name>` 替換成資料欄位名稱;  `<data_type>` 替換成該資料欄位的屬性
[範例1.1](./alter_table.sql) : 新增名為 test_col 的欄位名稱，欄位屬性為`varchar`，長度限制為255
![](./image/ALTER_TABLE_ADD_col.png)

- 刪除資料欄位 (Column) ，語法結構:
```sql
ALTER TABLE table_name DROP column <column_name>;
```
[範例1.2](./alter_table.sql)：刪除名為 test_col 的欄位名稱 
- 修改欄位資料型別
```sql
ALTER TABLE table_name ALTER COLUMN <column_name> TYPE <datatype>;
```
[範例1.3](./alter_table.sql)：修改 age 欄位的資料型別為 `varchar`
[範例1.4](./alter_table.sql)：修改 age 欄位的資料型回 `integer`
- 修改欄位名稱
```sql
ALTER TABLE table_name RENAME COLUMN <column_name_old> TO <column_name_new>;
```
[範例1.5](./alter_table.sql)：對欄位名稱  `email` 重新命名為 `customer_email`

### Constraint
有條件地限制哪些資料才能被存入資料表中。
使用時機包含**建立資料表 (Create Table)**、**修改資料表 (Alter Table)**

#### 包含的限制條件類型
- `NOT NULL`: 資料庫預設為允許欄位為空值(`NULL`)，可透過設置限制條件，使欄位不允許為`Null`
[範例1.6](./alter_table.sql)：`SET NOT NULL`; 對欄位名稱  `cust_id` 設定限制條件為 `NOT NULL`，表示新增資料時該欄位**一定要有值**
[範例1.7](./alter_table.sql)：對 範例1.6 的設定條件做測試，會回傳錯誤提示`null value in column "cust_id" violates not-null constraint` 
![](./image/ALTER_TABLE_ADD_set_not_table.png)

[範例1.8](./alter_table.sql)：`DROP NOT NULL` 取消對欄位名稱  `cust_id` 設定的限制條件`NOT NULL`。執行執行成功後再重新執行一次 範例1.7 的SQL 語句即可完成新增
- `CHECK`： 用來限制欄位中可用的值，確保該欄位中的值都會符合設定的條件
[範例1.9](./alter_table.sql): `ADD constraint` ... `CHECK`; 限制 `customer_table` 資料表中的 `cust_id` 欄位值都**必需要大於 0**
[範例2.1](./alter_table.sql): 對 範例1.9 的設定條件做測試，會回傳錯誤提示`new row for relation "customer_table" violates check constraint "cust_id"`
![](./image/ALTER_TABLE_ADD_check.png)

[範例2.2](./alter_table.sql): 移除 範例1.9 設定的限制
- `UNIQUE`
- `PRIMARY KEY`：設定`PRIMARY KEY (主鍵)` 的欄位確保在資料表中的唯一性，`PRIMARY KEY`欄位中的每一筆資料在資料表中都必需是**唯一**
[範例2.3](./alter_table.sql): 將 `cust_id` 設為`RIMARY KEY`
- `FOREIGN KEY`: `FOREIGN KEY(外鍵)`為一個 (or 多個) 指向其它資料表中主鍵的欄位，欄位限制的值只能是源自另一張資料表的主鍵。
語法結構:
```sql
ALTER TABLE <table_name>
ADD FOREIGN KEY <foreign_key_name> REFERENCES <table_name>(<primary_key_name>);
```
- `DEFAULT`： 用來設定欄位的預設值


### 注意 ： 
若欄位中已經 **存在/不存在** 被 **Add/Drop** 的欄位名稱，系統會跳出錯誤提示，若要避免引發錯誤，可在 SQL 敘述中後面加上 `IF EXISTS` 
Sample:
```sql
ALTER TABLE customer_table DROP column IF EXISTS test_col ;
```

# Convertion Functions
## Numbers / Date => String

## String => Numbers / Date





