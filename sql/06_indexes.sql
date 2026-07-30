/*
================================================================================
Project     : Sales Analytics SQL
Author      : Javlon Ilmurodov
Description : Database Performance Optimization and Index Strategy.
Purpose     : Minimizes query execution times on heavily filtered columns.
Database    : PostgreSQL
================================================================================
*/

-- SECTION 1: Chronological Time-Series Performance Optimization
-- Accelerates date-truncation, monthly aggregation, and time-range filtering
CREATE INDEX idx_superstore_order_date ON superstore (order_date);

-- SECTION 2: Categorization & Dimensional Query Optimization
-- Enhances reporting speeds when filtering or grouping by product categorization
CREATE INDEX idx_superstore_category_subcategory ON superstore (category, sub_category);

-- SECTION 3: Geographic Analytics Optimization
-- Speeds up regional dashboards and state-level localized queries
CREATE INDEX idx_superstore_region_state ON superstore (region, state);
