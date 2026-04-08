# Nashville Housing Data Cleaning (SQL)

## Project Overview

This project focuses on cleaning and preparing the Nashville Housing dataset using SQL.  
The goal is to improve data quality by handling missing values, standardizing formats, removing duplicates, and restructuring fields for analysis.

---

## Key Data Cleaning Tasks

- Standardized date format (`SaleDate`)
- Populated missing `PropertyAddress` values using self-joins
- Split `PropertyAddress` into separate `Address` and `City` fields
- Split `OwnerAddress` into `Address`, `City`, and `State`
- Converted `SoldAsVacant` values from `Y/N` to `Yes/No`
- Removed duplicate records using `ROW_NUMBER()` and CTE
- Dropped unused columns to streamline the dataset

---

## Techniques Used

- SQL Joins (self-joins)
- String functions (`SUBSTRING`, `CHARINDEX`, `PARSENAME`)
- Window functions (`ROW_NUMBER()`)
- Conditional logic (`CASE`)
- Data type conversion
- Table modification (`ALTER TABLE`, `UPDATE`, `DELETE`)

---

## Business Value

Clean and well-structured data improves:
- Accuracy of analysis and reporting  
- Decision-making for real estate trends  
- Data consistency across systems  

---

## Skills Demonstrated

- SQL data cleaning and transformation  
- Handling missing data  
- Feature engineering using SQL  
- Working with real-world messy datasets  
