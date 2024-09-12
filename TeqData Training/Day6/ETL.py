# Databricks notebook source
# MAGIC %run "/Users/naval@thedatamaster.in/TeqData Training/includes"

# COMMAND ----------

df=spark.read.csv(f"{input_path}circuits.csv",header=True,inferSchema=True)

# COMMAND ----------

df_final=add_ingestion(df)

# COMMAND ----------

df_final.write.mode("overwrite").saveAsTable(f"{schema}.circuits")
