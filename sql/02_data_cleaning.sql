-- ==============================================================================
-- LOYIHA: Savdo Tahlili (Sales Analytics SQL)
-- BOSQICH: Ma'lumotlarni Tozalash va Formatlash (Data Cleaning & Transformation)
-- TAHLILCHI: Senior Data Analyst Portfolio Mentor
-- TAVSIF: Matnli (VARCHAR) ustunlarni doimiy to'g'ri ma'lumot turlariga o'tkazish
-- ==============================================================================

-- 1. Sanalar ustunidagi qiymatlarni doimiy DATE formatiga o'tkazish (Data Type Casting)
ALTER TABLE superstore 
    ALTER COLUMN order_date TYPE DATE USING order_date::DATE,
    ALTER COLUMN ship_date TYPE DATE USING ship_date::DATE;
