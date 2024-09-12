-- Databricks notebook source
Delta Lake: open source storage framework 
helps you to build Lakehouse (existing data lake (S3))
1. it brings ACID to your existing data lake

All tables in databricks are Delta By default


-- COMMAND ----------

select * from teqdata.naval_schema.employees

-- COMMAND ----------

describe extended teqdata.naval_schema.employees

-- COMMAND ----------

-- MAGIC %fs ls abfss://unity-catalog-storage@dbstoragektf7l5xnbkm2o.dfs.core.windows.net/1345841051158968/teqdata/__unitystorage/catalogs/cad3bdaa-e74f-4c80-bbc6-7fbca7b6321c/tables/038c822f-3b88-4c88-af72-98c7f7a49f18

-- COMMAND ----------


