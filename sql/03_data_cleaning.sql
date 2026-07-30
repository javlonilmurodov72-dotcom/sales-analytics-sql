/*
================================================================================
Project     : Sales Analytics SQL
Author      : Javlon Ilmurodov
Description : Data Cleaning and Explicit Type Transformation script.
Purpose     : Converts staging text fields into appropriate numerical/date formats.
Database    : PostgreSQL
================================================================================
*/

-- SECTION 1: Standardizing and Casting Data Types Permanentely
ALTER TABLE superstore 
    ALTER COLUMN row_id TYPE INT USING row_id::INT,
    ALTER COLUMN order_date TYPE DATE USING order_date::DATE,
    ALTER COLUMN ship_date TYPE DATE USING ship_date::DATE,
    ALTER COLUMN sales TYPE NUMERIC(15,4) USING sales::NUMERIC(15,4),
    ALTER COLUMN quantity TYPE INT USING quantity::INT,
    ALTER COLUMN discount TYPE NUMERIC(15,4) USING discount::NUMERIC(15,4),
    ALTER COLUMN profit TYPE NUMERIC(15,4) USING profit::NUMERIC(15,4);

-- SECTION 2: Final Schema Structural Validation
SELECT 
    column_name, 
    data_type 
FROM 
    information_schema.columns 
WHERE 
    table_name = 'superstore' 
ORDER BY 
    ordinal_position;
