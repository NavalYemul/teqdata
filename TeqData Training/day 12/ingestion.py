# Databricks notebook source
# MAGIC %run "/Workspace/Users/naval@thedatamaster.in/teqdata/TeqData Training/day 12/includes"

# COMMAND ----------

df=spark.read.csv(f"{input_path}/super_store.csv",header=True,inferSchema=True)

# COMMAND ----------

df_final=add_ingestion_col(df)

# COMMAND ----------

df_final=add_ingestion_col(df)

# COMMAND ----------

df_final.write.option("delta.columnMapping.mode","name").mode("overwrite").saveAsTable("teqdata.bronze.super_store_ny")
