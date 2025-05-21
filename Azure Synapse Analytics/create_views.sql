-----------------------------------
------ CREATE VIEW CALENDAR -------
-----------------------------------
CREATE VIEW serving_data.calendar
AS
SELECT * FROM
    OPENROWSET
        (
            BULK 'https://awdatalakestore.dfs.core.windows.net/transformed-silver/AdventureWorks_Calendar/',
            FORMAT = 'PARQUET'
        ) AS Cal


-----------------------------------
------ CREATE VIEW CUSTOMERS ------
-----------------------------------
CREATE VIEW serving_data.customers
AS
SELECT * FROM
    OPENROWSET
        (
            BULK 'https://awdatalakestore.dfs.core.windows.net/transformed-silver/AdventureWorks_Customers/',
            FORMAT = 'PARQUET'
        ) AS Cus


---------------------------------------------
------ CREATE VIEW PRODUCT CATEGORIES -------
---------------------------------------------
CREATE VIEW serving_data.productcategories
AS
SELECT * FROM
    OPENROWSET
        (
            BULK 'https://awdatalakestore.dfs.core.windows.net/transformed-silver/AdventureWorks_Product_Categories/',
            FORMAT = 'PARQUET'
        ) AS ProCat


------------------------------------------------
------ CREATE VIEW PRODUCT SUBCATEGORIES -------
------------------------------------------------
CREATE VIEW serving_data.prosubcategories
AS
SELECT * FROM
    OPENROWSET
        (
            BULK 'https://awdatalakestore.dfs.core.windows.net/transformed-silver/AdventureWorks_Product_Subcategories/',
            FORMAT = 'PARQUET'
        ) AS ProSubcat


-----------------------------------
------ CREATE VIEW PRODUCTS -------
-----------------------------------
CREATE VIEW serving_data.products
AS
SELECT * FROM
    OPENROWSET
        (
            BULK 'https://awdatalakestore.dfs.core.windows.net/transformed-silver/AdventureWorks_Products/',
            FORMAT = 'PARQUET'
        ) AS Pro


-----------------------------------
------ CREATE VIEW RETURNS --------
-----------------------------------
CREATE VIEW serving_data.productreturns
AS
SELECT * FROM
    OPENROWSET
        (
            BULK 'https://awdatalakestore.dfs.core.windows.net/transformed-silver/AdventureWorks_Returns/',
            FORMAT = 'PARQUET'
        ) AS Ret


-----------------------------------
------ CREATE VIEW SALES ----------
-----------------------------------
CREATE VIEW serving_data.productsales
AS
SELECT * FROM
    OPENROWSET
        (
            BULK 'https://awdatalakestore.dfs.core.windows.net/transformed-silver/AdventureWorks_Sales/',
            FORMAT = 'PARQUET'
        ) AS Sales


-----------------------------------------
------ CREATE VIEW TERRITORIES ----------
-----------------------------------------
CREATE VIEW serving_data.territories
AS
SELECT * FROM
    OPENROWSET
        (
            BULK 'https://awdatalakestore.dfs.core.windows.net/transformed-silver/AdventureWorks_Territories/',
            FORMAT = 'PARQUET'
        ) AS Ter