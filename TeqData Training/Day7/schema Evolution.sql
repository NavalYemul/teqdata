-- Databricks notebook source
-- MAGIC %python
-- MAGIC data=([(1,'Sachin'),(2,'Dhoni')])
-- MAGIC schema="id int, name string"
-- MAGIC df=spark.createDataFrame(data,schema)
-- MAGIC df.write.saveAsTable("cricket2")

-- COMMAND ----------

-- MAGIC %python
-- MAGIC data=([(3,'Rohit'),(4,'Rahul')])
-- MAGIC schema="id int, name string"
-- MAGIC df=spark.createDataFrame(data,schema)
-- MAGIC df.write.mode("append").saveAsTable("cricket2")

-- COMMAND ----------

select * from cricket2

-- COMMAND ----------

-- MAGIC %python
-- MAGIC data=([(5,'Dinesh',"Batsman"),(6,'Bumra',"Blower")])
-- MAGIC schema="id int, name string, dept string"
-- MAGIC df=spark.createDataFrame(data,schema)
-- MAGIC df.write.mode("append").saveAsTable("cricket2")

-- COMMAND ----------

-- MAGIC %python
-- MAGIC data=([(5,'Dinesh',"Batsman"),(6,'Bumra',"Blower")])
-- MAGIC schema="id int, name string, dept string"
-- MAGIC df=spark.createDataFrame(data,schema)
-- MAGIC df.write.mode("append").option("mergeSchema", "true").saveAsTable("cricket2")

-- COMMAND ----------

select * from cricket2
