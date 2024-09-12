-- Databricks notebook source
Lakehouse= DL+DW
Building lakehouse--- DELTA LAKE (default), Iceberg, hudi

-- COMMAND ----------

use catalog teqdata;
use naval_schema

-- COMMAND ----------

create table if not exists teqdata.naval_schema.employees (id int,name string, age int)

-- COMMAND ----------

INsert into employees values(1,'a',25),(2,'b',30),(3,'c',28)

-- COMMAND ----------

views: virtual table 
1. std view (persisted/ saved) (SQL)
2. temp view (not persisted) (sql, pyspark)
3. global temp () (sql, pyspark)

-- COMMAND ----------

-- DBTITLE 1,std view
create view teqdata.naval_schema.emp_view as select * from employees where id>2

-- COMMAND ----------

-- DBTITLE 1,temp view
create temp view emp_temp_view as select * from employees where id=1

-- COMMAND ----------

show views
