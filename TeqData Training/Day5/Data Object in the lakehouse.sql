-- Databricks notebook source
-- MAGIC %python
-- MAGIC Lakehouse= DL+DW
-- MAGIC to Build lakehouse= Delta lake== open source storage framework, ACID to your existing DL
-- MAGIC
-- MAGIC Data Objects
-- MAGIC
-- MAGIC Catalog
-- MAGIC Schemas
-- MAGIC Tables, Views, Functions
-- MAGIC
-- MAGIC Tables: Managed table, Unmanaged(External Table)

-- COMMAND ----------

-- MAGIC %python
-- MAGIC json, csv
-- MAGIC
-- MAGIC 1. CTAS 
-- MAGIC select * from file_format.`path`
-- MAGIC
-- MAGIC 2. spark.read.json("path").write.saveAsTable("tblname")
-- MAGIC
-- MAGIC Table Type == Delta 

-- COMMAND ----------

create schema if not exists teqdata;
use teqdata

-- COMMAND ----------

create schema if not exists teqdata;
use teqdata;
create or replace table teqdata.employee(id int, name string);
insert into teqdata.employee values(1,'Naval'),(2,'Suresh')

-- COMMAND ----------

select * from employee

-- COMMAND ----------

describe detail employee;
describe extended employee

-- COMMAND ----------

describe extended employee

-- COMMAND ----------


