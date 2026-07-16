-- ====================================================
-- FUNCTIONS AND PROCEDURES
-- ====================================================

-- SQL functions and procedures allow creating reusable
-- blocks of logic inside a database.

-- Functions return a value and can be used inside queries.
-- Procedures perform actions and are called separately.

-------------------------------------------------------
-- FUNCTIONS
-------------------------------------------------------

-- Function returns total number of employees

CREATE OR REPLACE FUNCTION total_records()
RETURNS integer
LANGUAGE plpgsql
AS $$
DECLARE
    total integer;
BEGIN

    SELECT COUNT(*)
    INTO total
    FROM employees;

    RETURN total;

END;
$$;

-- Calling function

SELECT total_records();

--------------------------------------------------------
-- FUNCTION WITH PARAMETERS
-------------------------------------------------------

-- Calculate annual salary

CREATE OR REPLACE FUNCTION annual_salary(month_salary numeric)
RETURNS numeric
LANGUAGE plpgsql
AS $$
BEGIN

    RETURN month_salary * 12;

END;
$$;

SELECT
    first_name,
    last_name,
    salary,
    annual_salary(salary) AS yearly_salary
FROM employees;

--------------------------------------------------------
-- PROCEDURES
-------------------------------------------------------

-- Procedures perform actions and do not return values.

CREATE OR REPLACE PROCEDURE add_employee(
    p_first_name varchar,
    p_last_name varchar,
    p_salary numeric)

LANGUAGE plpgsql AS $$
BEGIN

INSERT INTO employees(
    first_name,
    last_name,
    salary)

VALUES(
    p_first_name,
    p_last_name,
    p_salary);

END;
$$;

-- Calling procedure

CALL add_employee(
    'John',
    'Doe',
    5000);
