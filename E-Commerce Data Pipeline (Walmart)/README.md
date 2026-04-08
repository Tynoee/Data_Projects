# Walmart Holiday Sales Data Pipeline

## Project Overview

This project implements an end-to-end data pipeline to analyze Walmart’s e-commerce sales patterns around public holidays.

The pipeline integrates data from a PostgreSQL database and a Parquet file, performs data cleaning and transformation, and generates aggregated sales data for analysis and decision-making.

## Tech Stack

- Python 3.8+
- SQL (PostgreSQL)
- Pandas
- Parquet

## Data Sources

### grocery_sales (PostgreSQL)
- Store_ID, Date, Weekly_Sales, etc.

### extra_data.parquet
- IsHoliday, Temperature, CPI, Unemployment, etc.

## Key Transformations

- Handled missing values using mean imputation  
- Converted date fields and extracted time features (Month)  
- Filtered sales records to remove low-value noise  
- Dropped unnecessary features to improve data quality  

## Output

### clean_data.csv
Cleaned dataset ready for analysis

### agg_data.csv
Monthly aggregated sales for trend analysis

## Business Value

This pipeline enables:
- Better inventory planning during holiday periods  
- Improved staffing allocation based on demand  
- Analysis of promotional effectiveness  
- Enhanced supply chain coordination  
