-- Databricks notebook source
Delta Lake: open source storage framework 
helps you to build Lakehouse (existing data lake (S3))
1. it brings ACID to your existing data lake

All tables in databricks are Delta By default
Time travel

-- COMMAND ----------

-- MAGIC %fs ls

-- COMMAND ----------

-- MAGIC %python
-- MAGIC dbutils.fs.rm("dbfs:/FileStore/teqdata/delta/emp",True)

-- COMMAND ----------

create table teq_emp (id int, name string ) location 'dbfs:/FileStore/teqdata/delta/emp'

-- COMMAND ----------

insert into teq_emp values (1,'a')

-- COMMAND ----------

insert into teq_emp values (2,'b'),(3,'c'),(4,'d');

-- COMMAND ----------

insert into teq_emp values (5,'b'),(6,'c'),(8,'d');
insert into teq_emp values (20,'b'),(31,'c'),(44,'d');
insert into teq_emp values (12,'b'),(13,'c'),(14,'d');

-- COMMAND ----------

select * from teq_emp

-- COMMAND ----------

delete from teq_emp where id = 2

-- COMMAND ----------

delta
parquet files( Data)
+ 
_delta_logs 
1. crc (cyclic redundnat check)
2.json 
3. parquet_checkpoint

-- COMMAND ----------

-- MAGIC %fs head
-- MAGIC dbfs:/FileStore/teqdata/delta/emp/_delta_log/00000000000000000007.json

-- COMMAND ----------

describe history teq_emp

-- COMMAND ----------

select * from teq_emp version as of 2

-- COMMAND ----------

-- MAGIC %fs head
-- MAGIC dbfs:/FileStore/teqdata/delta/emp/_delta_log/00000000000000000003.json

-- COMMAND ----------

-- MAGIC %fs head
-- MAGIC dbfs:/FileStore/teqdata/delta/emp/_delta_log/00000000000000000004.json

-- COMMAND ----------

-- MAGIC %fs head
-- MAGIC dbfs:/FileStore/teqdata/delta/emp/_delta_log/00000000000000000005.json

-- COMMAND ----------

select * from teq_emp

-- COMMAND ----------

update teq_emp
set name= 'naval'
where id= 3

-- COMMAND ----------

-- DBTITLE 1,time travel using version
create table teq_empv2 as 
select * from teq_emp version as of 2

-- COMMAND ----------

-- DBTITLE 1,time travel using timestamp
select * from teq_emp timestamp as of '2024-09-11T01:52:29.000+00:00'
