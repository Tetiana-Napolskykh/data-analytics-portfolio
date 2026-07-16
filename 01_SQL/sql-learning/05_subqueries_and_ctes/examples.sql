-- ====================================================
-- SUBQUERIES AND COMMON TABLE EXPRESSIONS (CTEs)
-- ====================================================

-- A subquery is a query nested inside another SQL query.
-- It can be used in SELECT, FROM, WHERE, and with operators
-- such as IN, NOT IN, =, >, <.
-- CTE (Common Table Expression) is a temporary named result set
-- created with the WITH statement.
-- It improves readability and simplifies complex SQL queries.


-- ====================================================
-- SUBQUERIES
-- ====================================================

--------------------------------------------------------
-- SUBQUERY WITH IN
--------------------------------------------------------

-- Find employees working in departments located in location 1700
SELECT
    employee_id,
    first_name,
    last_name
FROM employees
WHERE department_id IN (
    SELECT department_id
    FROM departments
    WHERE location_id = 1700)
ORDER BY first_name, last_name;

--------------------------------------------------------
-- SUBQUERY WITH NOT IN
--------------------------------------------------------

-- Find employees not working in departments located in location 1700
SELECT
    employee_id,
    first_name,
    last_name
FROM employees
WHERE department_id NOT IN (
    SELECT department_id
    FROM departments
    WHERE location_id = 1700)
ORDER BY first_name, last_name;

--------------------------------------------------------
-- SUBQUERY WITH COMPARISON OPERATORS
--------------------------------------------------------

-- Find employees with the highest salary
SELECT
    employee_id,
    first_name,
    last_name,
    salary
FROM employees
WHERE salary = (
    SELECT MAX(salary)
    FROM employees);

--------------------------------------------------------

-- Find employees earning above the average salary
SELECT
    employee_id,
    first_name,
    last_name,
    salary
FROM employees
WHERE salary > (
    SELECT AVG(salary)
    FROM employees)
ORDER BY salary DESC;

--------------------------------------------------------
-- SUBQUERY IN FROM
--------------------------------------------------------

-- A subquery in FROM creates a temporary table.
-- The result must have an alias.

SELECT
    ROUND(AVG(average_salary), 0) AS company_average
FROM (
    SELECT AVG(salary) AS average_salary
    FROM employees
    GROUP BY department_id) AS department_salary;

--------------------------------------------------------
-- SUBQUERY IN SELECT
--------------------------------------------------------

-- Compare each employee's salary with the company average.
SELECT
    employee_id,
    first_name,
    last_name,
    salary,
    (SELECT ROUND(AVG(salary), 0)
        FROM employees) AS average_salary,
    salary -
    (SELECT ROUND(AVG(salary), 0)
        FROM employees) AS difference

FROM employees
ORDER BY salary DESC;



-- ====================================================
-- COMMON TABLE EXPRESSIONS (CTEs)
-- ====================================================

--------------------------------------------------------
-- BASIC CTE
--------------------------------------------------------

-- Calculate total salary by department
WITH department_salary AS (
    SELECT
        department_id,
        SUM(salary) AS total_salary
    FROM employees
    GROUP BY department_id)

SELECT *
FROM department_salary;

--------------------------------------------------------

-- Calculate average department salary
WITH department_salary AS (
    SELECT
        department_id,
        AVG(salary) AS average_salary
    FROM employees
    GROUP BY department_id)

SELECT
    ROUND(AVG(average_salary), 0) AS company_average
FROM department_salary;

-- ====================================================
-- SAME TASK - DIFFERENT SQL APPROACHES
-- ====================================================

-- Task:
-- Calculate the average salary across all departments.

--------------------------------------------------------
-- Step 1: Calculate average salary by department
--------------------------------------------------------
SELECT
    department_id,
    AVG(salary) AS average_salary
FROM employees
GROUP BY department_id;

--------------------------------------------------------
-- Step 2: Use a subquery in FROM
--------------------------------------------------------

-- The inner query creates a temporary result:
-- average salary for each department.
-- The outer query calculates the average
-- of those department averages.

SELECT
    ROUND(AVG(average_salary), 0) AS company_average
FROM (SELECT
        department_id,
        AVG(salary) AS average_salary
    FROM employees
    GROUP BY department_id) AS department_salary;

--------------------------------------------------------
-- Step 3: Use CTE
--------------------------------------------------------

-- The same logic using Common Table Expression.
-- CTE improves readability by giving a name
-- to the temporary result.

WITH department_salary AS (
    SELECT
        department_id,
        AVG(salary) AS average_salary
    FROM employees
    GROUP BY department_id)

SELECT
    ROUND(AVG(average_salary), 0) AS company_average
FROM department_salary;

