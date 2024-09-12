# Databricks notebook source
from pyspark.sql.functions import *
from pyspark.sql.types import *
from pyspark.sql.window import *

# COMMAND ----------

input_path="dbfs:/FileStore/formula1/"

# COMMAND ----------

def add_ingestion(df):
    df1=df.withColumn("ingestion_date",current_timestamp())
    return df1

# COMMAND ----------

catalog="dev"
schema="bronze"

# COMMAND ----------

# MAGIC %sql
# MAGIC create schema if not exists bronze
