# Azure Data Engineering Project – AdventureWorks Dataset

## 📌 Project Overview

This end-to-end data engineering project demonstrates how to build a scalable data pipeline using the **Medallion Architecture** (Bronze, Silver, Gold layers) in Microsoft Azure. It uses the **AdventureWorks** dataset from Kaggle, integrated into a data lake via **ADF**, transformed using **Azure Databricks**, and served through **Azure Synapse Analytics**.

---

## 🧩 Architecture

[![Data Architecture](https://raw.githubusercontent.com/Venne12/Azure_Data_Engineering_Project/main/Architecture/Data%20Architecture.jpeg)](https://raw.githubusercontent.com/Venne12/Azure_Data_Engineering_Project/main/Architecture/Data%20Architecture.jpeg)

> The data travels through three layers:
- **Bronze (Raw Layer)**: Raw ingestion from GitHub API using ADF.
- **Silver (Transformed Layer)**: Data transformation using PySpark in Azure Databricks.
- **Gold (Serving Layer)**: Data modeling and querying using Synapse SQL Views.

---

## 🗂️ Dataset Details

Pulled from GitHub (originating from Kaggle AdventureWorks data), consisting of the following files:

| Filename | Description |
|----------|-------------|
| `AdventureWorks_Calendar.csv` | Calendar dates |
| `AdventureWorks_Customers.csv` | Customer profiles |
| `AdventureWorks_Product_Categories.csv` | Product categories |
| `AdventureWorks_Product_Subcategories.csv` | Product subcategories |
| `AdventureWorks_Products.csv` | Product information |
| `AdventureWorks_Returns.csv` | Product returns |
| `AdventureWorks_Sales_2015.csv` | Sales for 2015 |
| `AdventureWorks_Sales_2016.csv` | Sales for 2016 |
| `AdventureWorks_Sales_2017.csv` | Sales for 2017 |
| `AdventureWorks_Territories.csv` | Sales territories |

---

## 🛠️ Tools & Technologies

- **Azure Data Factory (ADF)** – Data orchestration
- **Azure Data Lake Storage Gen2** – Data storage
- **Azure Databricks** – Data transformation with PySpark
- **Azure Synapse Analytics** – Data querying and serving
- **GitHub API** – Source for data ingestion
- **Apache Spark** – Big data processing engine

---

## 🚀 Project Phases

### 🔹 Phase 01 – Raw Data Ingestion (Bronze Layer)
- Created Azure resources: Resource Group, ADF, Data Lake Gen2
- Configured 3 containers: `raw-bronze`, `transformed-silver`, `serving-gold`
- Used a **dynamic parameterized pipeline** in ADF with:
  - HTTP source (GitHub)
  - JSON-driven parameters (lookup + ForEach)
  - Output to Bronze container (CSV format)

### 🔹 Phase 02 – Data Transformation (Silver Layer)
- Created Azure Databricks and configured access via **Service Principal**
- Performed data cleaning, joins, casting, and formatting in **PySpark**
- Saved transformed data in **Parquet** format in the Silver container
- Conducted basic data analysis and visualization

### 🔹 Phase 03 – Data Serving (Gold Layer)
- Created **Azure Synapse Analytics** workspace
- Configured **Managed Identity** to access ADLS Gen2
- Used **OPENROWSET()** to create **external Views**
- Served the final cleaned data through **Synapse SQL Serverless Pool**

---

## 🔍 Key Learnings

- Implemented Medallion Architecture in Azure
- Automated data ingestion with ADF using parameterized pipelines
- Used Spark and Databricks for distributed transformations
- Built metadata-driven views using Synapse serverless SQL

---

