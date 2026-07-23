-- ==============================================================================
-- LOYIHA: Savdo Tahlili (Sales Analytics SQL)
-- BOSQICH: Biznes Savollari Tahlili (Business Analysis Queries)
-- TAHLILCHI: Senior Data Analyst Portfolio Mentor
-- TAVSIF: Kompaniya rahbariyati tomonidan berilgan asosiy biznes savollariga javoblar
-- ==============================================================================

-- 1-Biznes Savoli: Mahsulot toifalari bo'yicha jami sotuv hajmi
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


-- 2-Biznes Savoli: Mahsulot toifalari bo'yicha jami sof foyda va foyda marjasi
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


-- 3-Biznes Savoli: Hududlar (Region) bo'yicha jami sotuv va sof foyda tahlili
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


-- 4-Biznes Savoli: Chegirma darajalari bo'yicha o'rtacha sotuv va sof foyda tahlili
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


-- 5-Biznes Savoli: Savdo hajmi bo'yicha eng kuchli 5 ta mijoz (Top 5 Customers)
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


-- 6-Biznes Savoli: Oylar bo'yicha jami savdo tendensiyalari (Mavsumiylik)
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
