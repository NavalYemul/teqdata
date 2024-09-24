# Databricks notebook source
# MAGIC  %run "/Workspace/Users/naval@thedatamaster.in/teqdata/TeqData Training/day 12/includes"

# COMMAND ----------

df=spark.read.table("teqdata.bronze.super_store_ny")

# COMMAND ----------

#df.columns

# COMMAND ----------

new_col=['row_id',
 'OrderID',
 'OrderDate',
 'ShipDate',
 'ShipMode',
 'CustomerID',
 'CustomerName',
 'Segment',
 'Country_Region',
 'City',
 'State',
 'PostalCode',
 'Region',
 'ProductID',
 'Category',
 'Sub_Category',
 'ProductName',
 'Sales',
 'Quantity',
 'Discount',
 'Profit',
 'ingestion_date']


# COMMAND ----------

df1=df.toDF(*new_col)

# COMMAND ----------

df_final=df1.select('OrderID','OrderDate','ShipDate','ShipMode','CustomerID','CustomerName','Segment','Country_Region','City','State','PostalCode','Region','ProductID','Category','Sub_Category','ProductName','Sales','Quantity','Discount','Profit')

# COMMAND ----------

df_final.write.mode("overwrite").saveAsTable("teqdata.silver.super_store_ny_silver")

# COMMAND ----------

# MAGIC %sql
# MAGIC create or replace view teqdata.gold.segment_sales_ny as select Segment, round(sum(Sales)) as total_sales from teqdata.silver.super_store_ny_silver group by Segment order by total_sales desc
