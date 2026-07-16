-- ====================================================
-- STRING FUNCTIONS AND PATTERN MATCHING
-- ====================================================

-- Working with text data:
-- LIKE, REGEXP, CONCAT, LENGTH, TRIM,
-- UPPER, LOWER, SUBSTRING

------------------------------------------------------
-- LIKE OPERATOR
------------------------------------------------------

-- LIKE is used for simple pattern matching.
-- % represents any sequence of characters.
-- _ represents exactly one character.

------------------------------------------------------

-- Employees whose last name ends with "son"

SELECT *
FROM employees
WHERE last_name LIKE '%son';

------------------------------------------------------

-- First name starts with J and ends with n

SELECT *
FROM employees
WHERE first_name LIKE 'J%n';

------------------------------------------------------

-- Names with exactly three characters

SELECT *
FROM employees
WHERE first_name LIKE '___';

------------------------------------------------------
-- CONCAT
------------------------------------------------------

-- Combine first name and last name

SELECT
    CONCAT(first_name, ' ', last_name) AS full_name
FROM employees
ORDER BY full_name;

------------------------------------------------------
-- LENGTH
------------------------------------------------------

-- Find employees with the longest names

SELECT
    employee_id,
    CONCAT(first_name, ' ', last_name) AS full_name,
    LENGTH(CONCAT(first_name, ' ', last_name)) AS name_length
FROM employees
ORDER BY name_length DESC
LIMIT 5;

------------------------------------------------------
-- TRIM
------------------------------------------------------

-- Remove unnecessary spaces

SELECT
    TRIM('  SQL  ') AS cleaned_text;

------------------------------------------------------

-- Data cleaning example

UPDATE employees
SET
    first_name = TRIM(first_name),
    last_name = TRIM(last_name);


------------------------------------------------------
-- UPPER / LOWER
------------------------------------------------------

-- Convert text to uppercase

SELECT
    UPPER(last_name)
FROM employees;

------------------------------------------------------

-- Case-insensitive search

SELECT
    employee_id,
    first_name
FROM employees
WHERE UPPER(first_name) = 'BRUCE';


------------------------------------------------------
-- SUBSTRING
------------------------------------------------------

-- Extract initials

SELECT
    SUBSTRING(first_name,1,1) AS initial,
    COUNT(employee_id)
FROM employees
GROUP BY initial;

-- ====================================================
-- REGULAR EXPRESSIONS
-- ====================================================

-- PostgreSQL regexp operators:
-- ~  case-sensitive match
-- ~* case-insensitive match

------------------------------------------------------

-- Email validation example

SELECT *
FROM employees
WHERE email ~ '.*@example\.com';

------------------------------------------------------

-- Phone number pattern

SELECT *
FROM employees
WHERE phone_number ~ '^\+1\d{8}$';
