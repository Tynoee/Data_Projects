# Sales Pipeline Analysis
**Tools:** MySQL | **Domain:** B2B Sales, CRM Analytics

## Overview
Analyzed 8,800+ B2B sales opportunities for a computer hardware company, exploring win rates, revenue, deal lifecycle, and account performance across products, agents, managers, and customer accounts.

## Dataset
- **Tables:** `sales_pipeline`, `sales_teams`, `products`, `accounts`
- **Records:** 8,800+ opportunities | 18 fields

**Tables overview:**
- `sales_pipeline` — core opportunity data including agent, product, stage, dates, and close value
- `sales_teams` — maps agents to managers and regional offices
- `products` — product details including series and sales price
- `accounts` — customer account info including location, year established, and subsidiary relationships

---

## Key Questions Answered

### Pipeline Metrics
1. How many opportunities were created each month, and which month was the busiest?
2. How long did deals stay open on average — and does this differ for won vs. lost deals?
3. What percentage of deals were lost?
4. Which product had the highest win rate?

### Sales Agent & Manager Performance
5. Which sales agent had the highest win rate?
6. Which agent generated the most total revenue?
7. Which manager's team performed best by win rate?
8. For the product GTX Plus Pro, which regional office sold the most units?

### Product Analysis
9. In March, which product led by revenue vs. units sold?
10. Is there a discrepancy between listed sales price and actual close value by product?
11. Which product series generated the most total revenue?

### Account Analysis
12. Which office location generated the least revenue?
13. How many years separate the oldest and newest customer accounts?
14. Which subsidiary accounts had the most lost opportunities?
15. When consolidating subsidiaries under parent companies, which had the highest total revenue?

---

## Key Findings
- **July 2017** was the busiest month with **796 opportunities** created
- **36.8%** of all deals were lost; won deals averaged **51.8 days** to close vs. 41.5 days for lost deals
- **MG Special** had the highest win rate at **64.8%** — though all products ranged narrowly (62–65%), suggesting agent performance is a stronger driver than product type
- **Darcel Schlecht** generated **$1,153,214** in revenue — more than double the next highest agent
- **Cara Losch's** team led managers with a **64.4% win rate**
- **Acme Corporation** topped consolidated parent company revenue at **$519,349**

## SQL Techniques
`GROUP BY` · `CASE WHEN` · `DATEDIFF` · `JOIN` · `CTEs` · `HAVING` · `Subqueries`

## How to Run
1. Create schema: `CREATE DATABASE sales_funnel;`
2. Import CSVs from `/data` into respective tables
3. Run `analysis.sql` sequentially

## Project Structure
```
sales-pipeline-analysis/
├── README.md
├── analysis.sql
└── data/
```
