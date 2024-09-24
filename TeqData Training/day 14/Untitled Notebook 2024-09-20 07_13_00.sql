-- Databricks notebook source
Stream (batch)
DLT (workflow jobs)
Databricks SQL
Unity Catalog 

-- COMMAND ----------

Task: 
Reading: 1. Read csv and create DF
Tranformation 2. New columns current_timestamp and path
write 3: Managed Table. catalog: teqdata, schema: bronze, tblname: sales_yourname

-- COMMAND ----------

select * from csv.`/Volumes/teqdata/naval_schema/raw_data/sales.csv`
