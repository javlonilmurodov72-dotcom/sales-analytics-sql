/*
================================================================================
Project     : Sales Analytics SQL
Author      : Javlon Ilmurodov
Description : Comprehensive Business Intelligence Queries.
Purpose     : Solves key analytical and operational performance questions.
Database    : PostgreSQL
================================================================================
*/

-- SECTION 1: Product Categories Performance by Revenue & Orders
SELECT 
    category,
    SUM(sales) AS total_sales,
    COUNT(order_id) AS total_orders
FROM 
    superstore
GROUP BY 
    category
ORDER BY 
    total_sales DESC;

-- SECTION 2: Product Categories by Total Profit & Gross Profit Margin
SELECT 
    category,
    SUM(profit) AS total_profit,
    ROUND((SUM(profit) / SUM(sales)) * 100, 2) AS profit_margin_percentage
FROM 
    superstore
GROUP BY 
    category
ORDER BY 
    total_profit DESC;

-- SECTION 3: Regional Sales & Profit Optimization Matrix
SELECT 
    region,
    SUM(sales) AS total_sales,
    SUM(profit) AS total_profit,
    ROUND((SUM(profit) / SUM(sales)) * 100, 2) AS profit_margin_percentage
FROM 
    superstore
GROUP BY 
    region
ORDER BY 
    total_sales DESC;

-- SECTION 4: Discount Impact Analysis on Profitability
SELECT 
    discount,
    COUNT(*) AS total_items_sold,
    ROUND(AVG(sales::NUMERIC), 2) AS avg_sales,
    ROUND(AVG(profit::NUMERIC), 2) AS avg_profit
FROM 
    superstore
GROUP BY 
    discount
ORDER BY 
    discount ASC;

-- SECTION 5: High-Value Customer Profiling (Top 5 Customers)
SELECT 
    customer_id,
    customer_name,
    COUNT(order_id) AS total_orders,
    SUM(sales::NUMERIC) AS total_spent,
    SUM(profit::NUMERIC) AS total_profit_from_customer
FROM 
    superstore
GROUP BY 
    customer_id, 
    customer_name
ORDER BY 
    total_spent DESC
LIMIT 5;

-- SECTION 6: Monthly Sales Trend Analysis (Seasonality Identification)
SELECT 
    EXTRACT(MONTH FROM order_date) AS sales_month,
    SUM(sales::NUMERIC) AS total_sales,
    COUNT(DISTINCT order_id) AS total_orders
FROM 
    superstore
GROUP BY 
    EXTRACT(MONTH FROM order_date)
ORDER BY 
    sales_month ASC;
