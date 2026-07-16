-- ====================================================
-- BASIC SQL QUERIES
-- ====================================================

-- SELECT and FROM

-- SELECT specifies the columns that we want to retrieve from a table.
-- FROM specifies the table where the data is stored.
-- SELECT * returns all columns from the table.

-- Retrieve all columns from employees table
SELECT *
FROM employees;

--------------------------------------------------------

-- Return selected columns
SELECT
    employee_id,
    first_name,
    last_name
FROM employees;

--------------------------------------------------------

-- ALIAS (AS)

-- Alias gives a temporary name to a column or calculation result.
-- It improves readability of query output.
-- AS keyword is optional in most SQL databases.

-- Calculate a 5% salary increase and display it as new_salary

SELECT
    first_name,
    last_name,
    salary,
    salary * 1.05 AS new_salary
FROM employees;

--------------------------------------------------------

-- ORDER BY

-- ORDER BY sorts the query results by one or more columns.
-- DESC = descending order (highest to lowest, Z to A).
-- ASC = ascending order (lowest to highest, A to Z).
-- ASC is the default sorting order if not specified.

-- Sort by first name ascending and last name descending
SELECT
    employee_id,
    first_name,
    last_name,
    hire_date,
    salary
FROM employees
ORDER BY first_name ASC, last_name DESC;

--------------------------------------------------------

-- Sort employees by salary from highest to lowest
SELECT
    employee_id,
    first_name,
    last_name,
    hire_date,
    salary
FROM employees
ORDER BY salary DESC;

--------------------------------------------------------

-- Sort employees by salary from lowest to highest
SELECT
    employee_id,
    first_name,
    last_name,
    hire_date,
    salary
FROM employees
ORDER BY salary ASC;

--------------------------------------------------------

-- Sort employees by hire date from oldest to newest
SELECT
    employee_id,
    first_name,
    last_name,
    hire_date,
    salary
FROM employees
ORDER BY hire_date ASC;

--------------------------------------------------------

-- Sort employees by most recent hire date
SELECT
    employee_id,
    first_name,
    last_name,
    hire_date,
    salary
FROM employees
ORDER BY hire_date DESC;

--------------------------------------------------------

-- WHERE

-- WHERE filters rows based on a specified condition.
-- It returns only records that meet the given criteria.

-- Return employees with salary greater than 14000
SELECT employee_id,
    first_name,
    last_name,
    salary
FROM employees
WHERE salary > 14000
ORDER BY salary DESC;

--------------------------------------------------------

-- Filter employees by last name
SELECT
employee_id,
    first_name,
    last_name
FROM employees
WHERE last_name = 'Chen';

--------------------------------------------------------

-- Find employees hired after 1999 and sort by newest hire date
SELECT
    employee_id,
    first_name,
    last_name,
    hire_date
FROM employees
WHERE hire_date >= '1999-01-01'
ORDER BY hire_date DESC;

--------------------------------------------------------

-- LIMIT and OFFSET

-- LIMIT restricts the number of rows returned by a query.
-- OFFSET skips a specified number of rows before returning results.
-- LIMIT and OFFSET are often used together for pagination
-- or retrieving specific rows from sorted results.

-- Return the most recently hired employee
SELECT employee_id,
    first_name,
    last_name,
    hire_date
FROM employees
ORDER BY hire_date DESC
LIMIT 1;

-- Find the second most recently hired employee
-- OFFSET 1 skips the newest employee and returns the next one.

SELECT
    employee_id,
    first_name,
    last_name,
    hire_date
FROM employees
ORDER BY hire_date DESC
LIMIT 1
OFFSET 1;
