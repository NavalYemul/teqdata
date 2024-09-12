# Databricks notebook source
# MAGIC %sql
# MAGIC select * from json.`dbfs:/FileStore/formula1/constructors.json`

# COMMAND ----------

# MAGIC %sql
# MAGIC -- CTAS
# MAGIC Create table formula1.constructors1 as 
# MAGIC select * from json.`dbfs:/FileStore/formula1/constructors.json`

# COMMAND ----------

# MAGIC %sql
# MAGIC select * from formula1.constructors1
