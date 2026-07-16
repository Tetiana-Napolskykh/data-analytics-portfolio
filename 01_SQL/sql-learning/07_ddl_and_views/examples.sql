-- ====================================================
-- DATA DEFINITION LANGUAGE (DDL)
-- ====================================================

-- DDL commands are used to create, modify and delete
-- database structures.

-- Main DDL commands:
-- CREATE
-- ALTER
-- DROP
-- TRUNCATE
-- RENAME

-------------------------------------------------------
-- CREATE TABLE
-------------------------------------------------------

-- CREATE TABLE creates a new table in database.

CREATE TABLE courses (
    course_id INT PRIMARY KEY,
    course_name VARCHAR(50) NOT NULL);


-------------------------------------------------------
-- VIEWS
-------------------------------------------------------

-- A VIEW is a virtual table based on a SELECT query.
-- It does not store data physically.
-- The query definition is stored instead.

-- Create view with employee details

CREATE VIEW employee_details AS

SELECT
    employee_id,
    first_name,
    last_name,
    department_id
FROM employees;

-- Using view

SELECT *
FROM employee_details;

-------------------------------------------------------
-- MATERIALIZED VIEWS
-------------------------------------------------------

-- A MATERIALIZED VIEW stores query results physically.
-- It improves performance for complex analytical queries.

-- Create materialized view with department statistics

CREATE MATERIALIZED VIEW department_statistics AS
SELECT
    department_id,
    COUNT(employee_id) AS employee_count
FROM employees
GROUP BY department_id;
