-- ==============================================================================
-- LOYIHA: Savdo Tahlili (Sales Analytics SQL)
-- BOSQICH: Ma'lumotlar Profilingi va Audit (Data Profiling & Quality Audit)
-- TAHLILCHI: Senior Data Analyst Portfolio Mentor
-- TAVSIF: Dataset yuklangandan keyin uning yaxlitligi, hajmi va sifatini tekshirish
-- ==============================================================================

-- 1. Jami qatorlar sonini tekshirish (Kutilayotgan natija: 9994)
SELECT 
    COUNT(*) AS total_records 
FROM 
    superstore;


-- 2. Ustunlar bo'yicha NULL (bo'sh) qiymatlarni tekshirish
SELECT 
    COUNT(*) - COUNT(row_id) AS row_id_nulls,
    COUNT(*) - COUNT(order_id) AS order_id_nulls,
    COUNT(*) - COUNT(order_date) AS order_date_nulls,
    COUNT(*) - COUNT(customer_name) AS customer_name_nulls,
    COUNT(*) - COUNT(sales) AS sales_nulls,
    COUNT(*) - COUNT(profit) AS profit_nulls
FROM 
    superstore;


-- 3. To'liq takrorlangan (dublikat) qatorlar borligini tekshirish
SELECT 
    row_id, 
    order_id, 
    product_id, 
    customer_id, 
    COUNT(*) AS duplicate_count
FROM 
    superstore
GROUP BY 
    row_id, 
    order_id, 
    product_id, 
    customer_id
HAVING 
    COUNT(*) > 1;


-- 4. Ma'lumot turlarini konvertatsiya (Cast) qilib testdan o'tkazish
SELECT 
    row_id::INT AS tested_row_id,
    order_date::DATE AS tested_order_date,
    ship_date::DATE AS tested_ship_date,
    sales::NUMERIC(15,4) AS tested_sales,
    quantity::INT AS tested_quantity,
    profit::NUMERIC(15,4) AS tested_profit
FROM 
    superstore
LIMIT 10;
