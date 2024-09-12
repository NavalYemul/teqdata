# Databricks notebook source
# MAGIC %md
# MAGIC ### Getting started with notebook

# COMMAND ----------

# MAGIC %md
# MAGIC # Python code

# COMMAND ----------

print("hello")

# COMMAND ----------

# MAGIC %sql
# MAGIC select "Run SQL"

# COMMAND ----------

# MAGIC %sql
# MAGIC create database test

# COMMAND ----------

# MAGIC %sql
# MAGIC use test

# COMMAND ----------

# MAGIC %sql
# MAGIC create table demo(id int, name string, age int);
# MAGIC INSERT into demo values(1,'Naval',32),(2,'Praveen',30);

# COMMAND ----------

# MAGIC %sql
# MAGIC select * from demo

# COMMAND ----------

# MAGIC %sql
# MAGIC
