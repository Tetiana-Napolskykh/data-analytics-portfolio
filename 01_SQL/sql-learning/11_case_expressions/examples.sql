-- ====================================================
-- CASE EXPRESSIONS
-- ====================================================

-- CASE expression allows conditional logic in SQL queries.
-- It can be used in SELECT, WHERE, ORDER BY, GROUP BY,
-- UPDATE and DELETE statements.

-- CASE has two types:
-- 1. Simple CASE
-- 2. Searched CASE

-------------------------------------------------------
-- SIMPLE CASE
-------------------------------------------------------=

-- Calculate employee work anniversary

SELECT
    first_name,
    last_name,
    hire_date,
    CASE (2000 - EXTRACT(YEAR FROM hire_date))
        WHEN 1 THEN '1 year'
        WHEN 3 THEN '3 years'
        WHEN 5 THEN '5 years'
        WHEN 10 THEN '10 years'
        WHEN 15 THEN '15 years'
        WHEN 20 THEN '20 years'
        ELSE NULL
    END AS anniversary
FROM employees;

--------------------------------------------------------
-- SEARCHED CASE
-------------------------------------------------------

-- Employee salary classification

SELECT
    first_name,
    last_name,
    salary,
    CASE
        WHEN salary < 3000 THEN 'Low'
        WHEN salary BETWEEN 3000 AND 5000 THEN 'Average'
        WHEN salary > 5000 THEN 'High'
        ELSE 'Unknown'
    END AS salary_category
FROM employees;

--------------------------------------------------------
-- CASE WITH AGGREGATIONS
-------------------------------------------------------

-- Count employees by salary category

SELECT
    CASE
        WHEN salary < 3000 THEN 'Low'
        WHEN salary BETWEEN 3000 AND 5000 THEN 'Average'
        ELSE 'High'
    END AS salary_category,
    COUNT(*) AS employees_count
FROM employees
GROUP BY salary_category;

--------------------------------------------------------
-- CASE FOR DATA TRANSFORMATION
-------------------------------------------------------

-- Replace NULL values or transform categories

SELECT
    first_name,
    last_name,
    CASE
        WHEN commission_pct IS NULL THEN 'No commission'
        ELSE 'Has commission'
    END AS commission_status
FROM employees;
