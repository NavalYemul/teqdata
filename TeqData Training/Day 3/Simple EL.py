# Databricks notebook source
two ways to create a TABLE

1. SQL: select * from file_format.`path` (Query the raw file) (CSV do not work) (simple json, parquet, delta)
2. PySpark: df= spark.read.csv("path")
    RDD, DF, DS

# COMMAND ----------

# DBTITLE 1,SQL
# MAGIC %sql 
# MAGIC select * from csv.`dbfs:/FileStore/formula1/circuits.csv`

# COMMAND ----------

df=spark.read.csv("dbfs:/FileStore/formula1/circuits.csv")

# COMMAND ----------

df=spark.read.option("header",True).option("inferSchema",True).csv("dbfs:/FileStore/formula1/circuits.csv")

# COMMAND ----------

df=spark.read.csv("dbfs:/FileStore/formula1/circuits.csv",header=True,inferSchema=True)

# COMMAND ----------

Spark as LAzy evalutaion

# COMMAND ----------

df.display()

# COMMAND ----------

# MAGIC %sql
# MAGIC create database formula1

# COMMAND ----------

df.write.saveAsTable("formula1.circuits")

# COMMAND ----------

# MAGIC %sql
# MAGIC select * from formula1.circuits where country='USA' 
