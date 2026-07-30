/*
================================================================================
Project     : Sales Analytics SQL
Author      : Javlon Ilmurodov
Description : Analytics Semantic Views Layer.
Purpose     : Simplifies data schema and prepares views for BI dashboards.
Database    : PostgreSQL
================================================================================
*/

-- SECTION 1: Executive Dashboard KPI Master View
CREATE OR REPLACE VIEW v_executive_summary AS
SELECT 
    order_id,
    order_date,
    ship_date,
    ship_mode,
    customer_name,
    segment,
    city,
    state,
    region,
    category,
    sub_category,
    product_name,
    sales,
    quantity,
    discount,
    profit,
    EXTRACT(YEAR FROM order_date) AS order_year,
    EXTRACT(MONTH FROM order_date) AS order_month
FROM 
    superstore;

-- SECTION 2: Monthly Rolling Financial Performance Summary View
CREATE OR REPLACE VIEW v_monthly_performance AS
SELECT 
    DATE_TRUNC('month', order_date)::DATE AS financial_month,
    ROUND(SUM(sales::NUMERIC), 2) AS total_revenue,
    ROUND(SUM(profit::NUMERIC), 2) AS total_profit,
    COUNT(DISTINCT order_id) AS total_orders
FROM 
    superstore
GROUP BY 
    DATE_TRUNC('month', order_date);
