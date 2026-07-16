-- ====================================================
-- LOGICAL OPERATORS
-- ====================================================

-- AND

-- AND returns TRUE when both conditions are true.
-- Used to filter records that meet multiple requirements.

-- Find employees with salary between 5000 and 7000
SELECT
    first_name,
    last_name,
    salary
FROM employees
WHERE salary > 5000
  AND salary < 7000
ORDER BY salary;

--------------------------------------------------------

-- OR

-- OR returns TRUE when at least one condition is true.
-- Used to filter records matching one of several conditions.

-- Find employees with salary equal to 7000 or 8000
SELECT
    first_name,
    last_name,
    salary
FROM employees
WHERE salary = 7000
   OR salary = 8000
ORDER BY salary;

--------------------------------------------------------

-- IS NULL

-- IS NULL checks for missing values.
-- It returns TRUE when a column has no value.

-- Find employees without a phone number
SELECT
    first_name,
    last_name,
    phone_number
FROM employees
WHERE phone_number IS NULL
ORDER BY first_name, last_name;

--------------------------------------------------------

-- BETWEEN

-- BETWEEN filters values within a specified range.
-- The minimum and maximum values are included.

-- Find employees with salary between 9000 and 12000
SELECT
    first_name,
    last_name,
    salary
FROM employees
WHERE salary BETWEEN 9000 AND 12000
ORDER BY salary;

--------------------------------------------------------

-- IN

-- IN checks whether a value matches any value from a list.
-- It is a shorter alternative to multiple OR conditions.

-- Find employees from departments 8 or 9
SELECT
    first_name,
    last_name,
    department_id
FROM employees
WHERE department_id IN (8, 9)
ORDER BY department_id;

--------------------------------------------------------

-- LIKE

-- LIKE searches for patterns in text values.
-- % represents zero or more characters.
-- _ represents exactly one character.

-- Find employees whose first name starts with "Jo"
SELECT
    employee_id,
    first_name,
    last_name
FROM employees
WHERE first_name LIKE 'Jo%'
ORDER BY first_name;

--------------------------------------------------------
