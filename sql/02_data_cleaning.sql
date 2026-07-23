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

-- 2. Pul va miqdoriy ustunlarni doimiy raqamlar formatiga o'tkazish
ALTER TABLE superstore 
    ALTER COLUMN row_id TYPE INT USING row_id::INT,
    ALTER COLUMN sales TYPE NUMERIC(15,4) USING sales::NUMERIC(15,4),
    ALTER COLUMN quantity TYPE INT USING quantity::INT,
    ALTER COLUMN discount TYPE NUMERIC(15,4) USING discount::NUMERIC(15,4),
    ALTER COLUMN profit TYPE NUMERIC(15,4) USING profit::NUMERIC(15,4);
