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

# Reference
- [以Postgresql為主,聊聊資料庫 - ithome 30 Days](https://ithelp.ithome.com.tw/users/20050647/ironman/2818)
