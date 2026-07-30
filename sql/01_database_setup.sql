/*
================================================================================
Project     : Sales Analytics SQL
Author      : Javlon Ilmurodov
Description : Database initialization and raw staging table schema setup.
Purpose     : Establishes a clean repository structure and defines source tables.
Database    : PostgreSQL
================================================================================
*/

-- SECTION 1: Drop existing table to ensure a clean slate
DROP TABLE IF EXISTS superstore CASCADE;

-- SECTION 2: Create staging table with text types to prevent data ingestion errors
CREATE TABLE superstore (
    row_id VARCHAR(50),
    order_id VARCHAR(100),
    order_date VARCHAR(100),
    ship_date VARCHAR(100),
    ship_mode VARCHAR(100),
    customer_id VARCHAR(100),
    customer_name VARCHAR(255),
    segment VARCHAR(100),
    country VARCHAR(150),
    city VARCHAR(150),
    state VARCHAR(150),
    postal_code VARCHAR(50),
    region VARCHAR(100),
    product_id VARCHAR(100),
    category VARCHAR(150),
    sub_category VARCHAR(150),
    product_name TEXT,
    sales VARCHAR(100),
    quantity VARCHAR(50),
    discount VARCHAR(100),
    profit VARCHAR(100)
);

-- SECTION 3: Verify the initial table schema structure
SELECT 
    column_name, 
    data_type 
FROM 
    information_schema.columns 
WHERE 
    table_name = 'superstore' 
ORDER BY 
    ordinal_position;
