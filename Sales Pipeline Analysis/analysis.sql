USE sales_funnel;

-- 1. Calculate the number of sales opportunities created each month using "engage_date",
-- Which month had the highest?

SELECT YEAR(engage_date), MONTH(engage_date), COUNT(*)
FROM sales_pipeline
GROUP BY YEAR(engage_date), MONTH(engage_date)
ORDER BY COUNT(*) DESC;

-- 2.Find the average time deals stayed open (from "engage_date" to "close_date"), and compare closed deals versus won deals

SELECT deal_stage, AVG(DATEDIFF(close_date, engage_date))
FROM sales_pipeline
GROUP BY deal_stage
ORDER BY 2 DESC;

-- 3. Calculate the percentage of deals in each stage, and determine what share were lost

SELECT AVG(CASE WHEN deal_stage = 'Lost' THEN 1 ELSE 0 END) * 100 AS loss_rate 
FROM sales_pipeline;

-- 4. Compute the win rate for each product, and identify which one had the highest win rate

SELECT product, AVG(CASE WHEN deal_stage = 'Won' THEN 1 ELSE 0 END) * 100 AS win_rate 
FROM sales_pipeline
GROUP BY product
ORDER BY 2 DESC;

-- 5. Calculate the win rate for each sales agent, and find the top performer

SELECT sales_agent, AVG(CASE WHEN deal_stage = 'Won' THEN 1 ELSE 0 END) * 100 AS win_rate
FROM sales_pipeline
GROUP BY sales_agent
ORDER BY 2 DESC;

-- 6. Calculate the total revenue by agent, and see who generated the most

SELECT sales_agent, SUM(close_value)
FROM sales_pipeline
GROUP BY sales_agent
ORDER BY 2 DESC;

-- 7. Calculate win rates by manager to determine which manager’s team performed best

SELECT st.manager, AVG(CASE WHEN deal_stage = 'Won' THEN 1 ELSE 0 END) * 100 AS win_rate 
FROM sales_pipeline sp
INNER JOIN sales_teams st ON sp.sales_agent = st.sales_agent
GROUP BY manager
ORDER BY 2 DESC;

-- 8. For the product GTX Plus Pro, find which regional office sold the most units

SELECT st.regional_office, COUNT(*) AS units_sold
FROM sales_pipeline sp
INNER JOIN sales_teams st ON sp.sales_agent = st.sales_agent
WHERE product = 'GTX Plus Pro' AND deal_stage = 'Won'
GROUP BY regional_office
ORDER BY 2 DESC;

-- 9. For March deals, identify the top product by revenue and compare it to the top by units sold

SELECT product, SUM(close_value) AS revenue, COUNT(*) AS units_sold
FROM sales_pipeline
WHERE MONTH(close_date) = 3 AND deal_stage = 'Won'
GROUP BY product
ORDER BY 2 DESC;


-- 10. Calculate the average difference between "sales_price" and "close_value" for each product, and note if the results suggest a data issue

SELECT sp.product, AVG(p.sales_price - sp.close_value) AS difference
FROM sales_pipeline sp
INNER JOIN products p ON  sp.product = p.product
WHERE deal_stage = 'Won'
GROUP BY product 
ORDER BY 2 DESC;

-- 11. Calculate total revenue by product series and compare their performance

SELECT p.series, SUM(sp.close_value) AS revenue
FROM sales_pipeline sp
INNER JOIN products p ON p.product = sp.product
WHERE sp.deal_stage = 'Won'
GROUP BY p.series
ORDER BY 2 DESC;

-- 12. Calculate revenue by office location, and identify the lowest performer

SELECT office_location, SUM(revenue) AS revenue
FROM accounts
GROUP BY office_location
ORDER BY 2 ASC;

-- 13. Find the gap in years between the oldest and newest customer, and name those companies

SELECT (MAX(year_established) - MIN(year_established)) AS gap
FROM accounts

SELECT account, year_established
FROM accounts
WHERE year_established in (1979, 2017)

-- 14. Which accounts that were subsidiaries had the most lost sales opportunities?

SELECT a.account, COUNT(sp.opportunity_id) AS opportunities
FROM accounts a
LEFT JOIN sales_pipeline sp ON sp.account = a.account
WHERE a.subsidiary_of != '' and sp.deal_stage = 'Lost'
GROUP BY a.account
ORDER BY 2;


-- 15. Join the companies to their subsidiaries. Which one had the highest total revenue?

WITH company_parent AS(
SELECT account, CASE WHEN subsidiary_of = '' THEN account ELSE subsidiary_of END AS parent_company
FROM accounts
)

, won_deals AS (
SELECT sp.account, sp.close_value
FROM sales_pipeline sp
WHERE sp.deal_stage = 'Won'
)

SELECT cp.parent_company, SUM(wd.close_value) AS total_revenue
FROM company_parent cp
LEFT JOIN won_deals wd ON wd.account = cp.account
GROUP BY cp.parent_company
HAVING total_revenue > 100000
ORDER BY total_revenue DESC;