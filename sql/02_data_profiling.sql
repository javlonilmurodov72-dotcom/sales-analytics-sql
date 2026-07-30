/*
================================================================================
Project     : Sales Analytics SQL
Author      : Javlon Ilmurodov
Description : Comprehensive data profiling and source quality assessment.
Purpose     : Identifies data volume, missing values, duplicates, and ranges.
Database    : PostgreSQL
================================================================================
*/

-- SECTION 1: Total Row Count Validation
SELECT 
    COUNT(*) AS total_records 
FROM 
    superstore;

-- SECTION 2: Completeness & Missing Value (NULL) Summary
SELECT 
    COUNT(*) - COUNT(row_id) AS row_id_nulls,
    COUNT(*) - COUNT(order_id) AS order_id_nulls,
    COUNT(*) - COUNT(order_date) AS order_date_nulls,
    COUNT(*) - COUNT(customer_name) AS customer_name_nulls,
    COUNT(*) - COUNT(sales) AS sales_nulls,
    COUNT(*) - COUNT(profit) AS profit_nulls
FROM 
    superstore;

-- SECTION 3: Duplicate Record Identification
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
