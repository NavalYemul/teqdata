-- Databricks notebook source
-- MAGIC %python
-- MAGIC ETL
-- MAGIC
-- MAGIC Create table as
-- MAGIC select * from file_format.`path`
-- MAGIC
-- MAGIC spark.read.csv("path").write.saveAsTable("tblname")

-- COMMAND ----------

-- DBTITLE 1,Read
-- MAGIC %python
-- MAGIC df=spark.read.csv("path")

-- COMMAND ----------

-- DBTITLE 1,Write
-- MAGIC %python
-- MAGIC File (Data lake)
-- MAGIC df.write.parquet("path")
-- MAGIC
-- MAGIC Table (Data warehouse)
-- MAGIC df.write.saveAsTable("tblanme")
-- MAGIC
-- MAGIC Lakehouse(Delta, Iceberg)
-- MAGIC

-- COMMAND ----------

-- MAGIC %python
-- MAGIC Delta: 
-- MAGIC     Open Source storage framework. 
-- MAGIC     Developed by databricks and donated to linux foundataion
-- MAGIC     Helps you to build lakehouse.
-- MAGIC     Delta help to get ACID to your existing Data Lake

-- COMMAND ----------

-- MAGIC %python
-- MAGIC dbutils.fs.rm("dbfs:/user/hive/warehouse/emp",True)

-- COMMAND ----------

create table emp_external(id int, name string) location 'dbfs:/FileStore/tables/teqdata/emp_external'

-- COMMAND ----------

Insert into emp_external values(1,'Suresh')

-- COMMAND ----------

create table emp(id int, name string)

-- COMMAND ----------

Insert into emp values(1,'Naval')

-- COMMAND ----------

describe detail emp

-- COMMAND ----------

describe extended emp

-- COMMAND ----------

drop table emp

-- COMMAND ----------

drop table emp_external

-- COMMAND ----------

select * from delta.`dbfs:/FileStore/tables/teqdata/emp_external`

-- COMMAND ----------

-- MAGIC %md
-- MAGIC 1. Managed Table== drop== table + (data+metadata) 
-- MAGIC 2. External Table== drop == table 
