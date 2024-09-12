-- Databricks notebook source
optimize 
compact small files into large file ( 1gb)

-- COMMAND ----------

select * from teq_emp where id= 3

-- COMMAND ----------

optimize teq_emp
zorder by (id)

-- COMMAND ----------

select * from teq_emp

-- COMMAND ----------

-- MAGIC %fs head
-- MAGIC dbfs:/FileStore/teqdata/delta/emp/_delta_log/00000000000000000009.json

-- COMMAND ----------

describe history teq_emp

-- COMMAND ----------

NO TIme travel.
delete unused parquet files 

-- COMMAND ----------

vacuum 
removes stale files( unused files )

Default Rentention period for vacuum is 7 days= 168 hours

-- COMMAND ----------

vacuum teq_emp

-- COMMAND ----------

vacuum teq_emp retain 0 hours

-- COMMAND ----------

SET spark.databricks.delta.retentionDurationCheck.enabled = false

-- COMMAND ----------

vacuum teq_emp retain 0 hours

-- COMMAND ----------



-- COMMAND ----------

select * from teq_emp version as of 2

-- COMMAND ----------

describe history teq_emp

-- COMMAND ----------

delete from teq_emp

-- COMMAND ----------

Restore table teq_emp to version as of 9

-- COMMAND ----------

describe history teq_emp
