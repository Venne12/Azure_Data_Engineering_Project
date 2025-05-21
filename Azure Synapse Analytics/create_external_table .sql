---------------------------------------------------------------------
---- STEP 1 : CREATE MASTER KEY FOR YOUR DATABASE
--- Here, I'm trying to show how to create one. Set your own Password
---------------------------------------------------------------------
CREATE MASTER KEY ENCRYPTION BY PASSWORD ='abcd@123'


-----------------------------------------------------------------
---- STEP 2 : CREATE CREDENTIAL 
---- give credential name of your choice, this is just an example
-----------------------------------------------------------------
CREATE DATABASE SCOPED CREDENTIAL credential_name
WITH IDENTITY = 'Managed Identity'


------------------------------------------------------------------
---- STEP 3.1 : CREATE EXTERNAL DATA SOURCE FOR SILVER -----------
------------------------------------------------------------------
CREATE EXTERNAL DATA SOURCE silver
WITH
    (
        LOCATION = 'https://awdatalakestore.dfs.core.windows.net/transformed-silver',
        CREDENTIAL = credential_name
    )


------------------------------------------------------------------
---- STEP 3.2 : CREATE EXTERNAL DATA SOURCE FOR GOLD -------------
------------------------------------------------------------------
CREATE EXTERNAL DATA SOURCE gold
WITH
    (
        LOCATION = 'https://awdatalakestore.dfs.core.windows.net/serving-gold',
        CREDENTIAL = credential_name
    )


-----------------------------------------------------
---- STEP 4 : CREATE EXTERNAL FILE FORMAT -----------
-----------------------------------------------------
CREATE EXTERNAL FILE FORMAT parquet_format
WITH
    (
        FORMAT_TYPE = PARQUET,
        DATA_COMPRESSION = 'org.apache.hadoop.io.compress.SnappyCodec'
    )


-----------------------------------------------------------------
----- STEP 5: CREATE EXTERNAL TABLES
----- Here we create only few external tables
----- Objective: To learn how to create an external tables
-----------------------------------------------------------------
CREATE EXTERNAL TABLE serving_data.extcustomers
WITH
    (
        LOCATION = 'extcustomers',
        DATA_SOURCE = gold,
        FILE_FORMAT = parquet_format
    )
AS
SELECT * FROM serving_data.customers


CREATE EXTERNAL TABLE serving_data.extproducts
WITH
    (
        LOCATION = 'extproducts',
        DATA_SOURCE = gold,
        FILE_FORMAT = parquet_format
    )
AS
SELECT * FROM serving_data.products

CREATE EXTERNAL TABLE serving_data.extsales
WITH
    (
        LOCATION = 'extsales',
        DATA_SOURCE = gold,
        FILE_FORMAT = parquet_format
    )
AS
SELECT * FROM serving_data.productsales