# Databricks notebook source
# MAGIC %fs ls dbfs:/FileStore/formula1

# COMMAND ----------

# MAGIC %sql
# MAGIC -- CTAS
# MAGIC select *, name.forename, name.surname from json.`dbfs:/FileStore/formula1/drivers.json`

# COMMAND ----------

# DBTITLE 1,Read/Extract
df=spark.read.json("dbfs:/FileStore/formula1/drivers.json")

# COMMAND ----------

# DBTITLE 1,Transformation
Dataframe Functions( Manipulate) (camel case)
.select
.alias
.withColumnRenamed
.withColumnsRenamed
.withColumn (Replace existing col or create new col)


Functions(Built in String, date time, number, math) from pyspark.sql.functions import col
col
current_date

# COMMAND ----------

from pyspark.sql.functions import *

# COMMAND ----------

# df.select("*").display()
#df.select("code","dob")
# df.select(col("code").alias("driver_code")).display()
df.select("code",col("dob"),df.driverId,df["driverRef"]).display()

# COMMAND ----------

#df.select(col("code").alias("driver_code")).display()
#df.withColumnRenamed("code","driver_code").display()
df.withColumnsRenamed({"code":"driver_code","dob":"drive_dob","driverId":"driver_id"}).display()

# COMMAND ----------

# new col
df.withColumn("ingestion_date",current_date()).display()
# replace url col
df.withColumn("url",current_date()).display()

# COMMAND ----------

# replace url col
df.withColumn("url",current_date()).display()

# COMMAND ----------

df1=df.withColumn("forename",col("name.forename"))\
.withColumn("surname",col("name.surname"))\
.drop("name")

# COMMAND ----------

Hyderbad-- Mumbai

logical plan-- bus, train, air, road
road-- route 

start my car--- action

# COMMAND ----------

Task:
    1. rename code to drivers coe
    2. get new col ingestion date
    3. get new col fore and surname and concat it
    4. drop name , url col
    5. save it to table

# COMMAND ----------

df_final=df\
.withColumnRenamed("code","driver_code")\
.withColumn("forename",df.name.forename)\
.withColumn("surname",df.name.surname)\
.withColumn("full_name",concat("forename",lit(" "), "surname"))\
.withColumn("ingestion_date",current_timestamp())\
.drop("name","url","forename","surname")

# COMMAND ----------

df_final.write.mode("overwrite").saveAsTable("driver")
