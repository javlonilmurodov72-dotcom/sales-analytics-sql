/*
===============================================================================
Project     : Sales Analytics SQL
Author      : Javlon Ilmurodov
Repository  : sales-analytics-sql

Description:
This script creates the main database schema for the Sales Analytics project.
It defines the Superstore table used for data import, cleaning, SQL analysis,
and dashboard development.

Database    : PostgreSQL
Dataset     : Superstore Sales
===============================================================================
*/

-- ============================================================================
-- Create Main Table
-- ============================================================================

CREATE TABLE superstore (
    row_id INTEGER,
    order_id VARCHAR(20),
    order_date DATE,
    ship_date DATE,
    ship_mode VARCHAR(50),
    customer_id VARCHAR(20),
    customer_name VARCHAR(255),
    segment VARCHAR(100),
    country VARCHAR(150),
    city VARCHAR(150),
    state VARCHAR(150),
    postal_code VARCHAR(50),
    region VARCHAR(100),
    product_id VARCHAR(100),
    category VARCHAR(150),
    subcategory VARCHAR(150),
    product_name VARCHAR(500),
    sales NUMERIC(10,2),
    quantity INTEGER,
    discount NUMERIC(4,2),
    profit NUMERIC(10,2)
);

-- ============================================================================
-- End of Database Setup Script
-- ============================================================================
