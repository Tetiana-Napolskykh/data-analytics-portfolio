-- ====================================================
-- GROUP BY
-- ====================================================

-- GROUP BY groups rows with the same values.
-- It is commonly used together with aggregate functions
-- to calculate metrics for each group.

--------------------------------------------------------

-- Return unique department IDs

SELECT
    department_id
FROM employees
GROUP BY department_id;

--------------------------------------------------------

-- Count employees in each department

SELECT
    department_id,
    COUNT(employee_id) AS headcount
FROM employees
GROUP BY department_id;

-- ====================================================
-- AGGREGATIONS
-- ====================================================

-- Aggregate functions perform calculations on multiple rows
-- and return a single result.
-- GROUP BY groups rows before aggregation.

--------------------------------------------------------
-- AVG() returns the average value of a numeric column.
--------------------------------------------------------

-- Calculate the average salary of all employees

SELECT
    AVG(salary) AS average_salary
FROM employees;

--------------------------------------------------------

-- Calculate the average salary in each department

SELECT
    department_id,
    AVG(salary) AS average_salary
FROM employees
GROUP BY department_id;

--------------------------------------------------------
--SUM ()
--------------------------------------------------------

-- Calculate the total salary in each department

SELECT
    department_id,
    SUM(salary) AS total_salary
FROM employees
GROUP BY department_id;

--------------------------------------------------------
-- MAX() and MIN()
--------------------------------------------------------

-- MAX returns the highest value.
-- MIN returns the lowest value.
-- NULL values are ignored.

--------------------------------------------------------

-- Find the highest salary

SELECT
    MAX(salary) AS highest_salary
FROM employees;

--------------------------------------------------------

-- Find the lowest salary

SELECT
    MIN(salary) AS lowest_salary
FROM employees;

--------------------------------------------------------

-- Find the highest salary in each department

SELECT
    department_id,
    MAX(salary) AS highest_salary
FROM employees
GROUP BY department_id;

--------------------------------------------------------

-- Find the lowest salary in each department

SELECT
    department_id,
    MIN(salary) AS lowest_salary
FROM employees
GROUP BY department_id;

--------------------------------------------------------
-- COUNT()
--------------------------------------------------------

-- COUNT returns the number of rows or non-null values.
-- COUNT(*) counts all rows.
-- COUNT(column) counts only non-null values.
-- COUNT(DISTINCT column) counts only unique values.

--------------------------------------------------------

-- Count all employees

SELECT
    COUNT(*) AS employee_count
FROM employees;

--------------------------------------------------------

-- Count employee IDs

SELECT
    COUNT(employee_id) AS employee_count
FROM employees;

--------------------------------------------------------

-- Count employees in each department
SELECT
    department_id,
    COUNT(employee_id) AS employee_count
FROM employees
GROUP BY department_id;

--------------------------------------------------------

-- Count unique managers

SELECT
    COUNT(DISTINCT manager_id) AS managers_count
FROM employees;

--------------------------------------------------------
-- HAVING
--------------------------------------------------------

-- HAVING filters grouped data after aggregation.
-- WHERE filters individual rows before grouping.
-- HAVING is evaluated after GROUP BY.

--------------------------------------------------------

-- Find departments with total salary greater than 5000
SELECT
    department_id,
    SUM(salary) AS total_salary
FROM employees
GROUP BY department_id
HAVING SUM(salary) > 5000;

--------------------------------------------------------

-- Find departments with more than five employees
SELECT
    department_id,
    COUNT(employee_id) AS employee_count
FROM employees
GROUP BY department_id
HAVING COUNT(employee_id) > 5;

--------------------------------------------------------

-- Filter rows before grouping and groups after aggregation
SELECT
    department_id,
    AVG(salary) AS average_salary
FROM employees
WHERE salary > 5000
GROUP BY department_id
HAVING AVG(salary) > 7000
ORDER BY average_salary DESC;
