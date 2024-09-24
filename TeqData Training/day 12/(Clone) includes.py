# Databricks notebook source
from pyspark.sql.functions import *
from pyspark.sql.types import *
from pyspark.sql.window import *

# COMMAND ----------

input_path="/Volumes/teqdata/naval_schema/raw_data"

# COMMAND ----------

def add_ingestion_col(df):
    df1= df.withColumn("ingestion_date",current_timestamp())
    return df1

# COMMAND ----------

spark.conf.set("spark.databricks.delta.columnMapping.enabled", "true")

# COMMAND ----------

# MAGIC %sql
# MAGIC create schema if not exists teqdata.bronze 

# COMMAND ----------

# MAGIC %sql
# MAGIC create schema if not exists teqdata.silver

# COMMAND ----------

# MAGIC %sql
# MAGIC create schema if not exists teqdata.gold
