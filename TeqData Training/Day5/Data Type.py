# Databricks notebook source
# MAGIC %fs ls dbfs:/databricks-datasets/asa/airlines/

# COMMAND ----------

df=spark.read.csv("dbfs:/databricks-datasets/asa/airlines/")

# COMMAND ----------

df=spark.read.csv("dbfs:/databricks-datasets/asa/airlines/",header=True)

# COMMAND ----------

df=spark.read.csv("dbfs:/databricks-datasets/asa/airlines/",header=True,inferSchema=True)

# COMMAND ----------

DataType
Creating your own schema(tbl schema)
1. str
2. List []
3. pyspark datatypes

# COMMAND ----------

schema_airlines= "id int, firstname string, "

# COMMAND ----------

# Spark Jobs =0 
df=spark.read.option("header",True).schema(schema_airlines).csv("path")

# COMMAND ----------

# MAGIC %fs ls dbfs:/FileStore/formula1/

# COMMAND ----------

df=spark.read.csv("dbfs:/FileStore/formula1/circuits.csv",header=True)

# COMMAND ----------

df=spark.read.csv("dbfs:/FileStore/formula1/circuits.csv",header=True,inferSchema=True)

# COMMAND ----------

circuit_Schema="circuitid int, circuitref string, name string, location string, country string, lat double, lng double, alt double, url string"

# COMMAND ----------

df=spark.read.schema(circuit_Schema).csv("dbfs:/FileStore/formula1/circuits.csv",header=True)
