-- ====================================================
-- DATA MANIPULATION LANGUAGE (DML)
-- ====================================================

-- DML is used to manage data stored inside database tables.
-- It allows adding, modifying, and deleting records.

-- Main DML commands:
--
-- INSERT  - adds new records
-- UPDATE  - modifies existing records
-- DELETE  - removes records
--
-- Important:
-- Always check conditions before UPDATE and DELETE
-- to avoid unintended changes.

-------------------------------------------------------
-- INSERT
------------------------------------------------------

-- INSERT adds new rows into a table.
-- The number and order of columns should match the provided values.

------------------------------------------------------

-- Insert one employee
INSERT INTO employees (
    employee_id,
    first_name,
    last_name)
VALUES (
    101,
    'John',
    'Smith');

------------------------------------------------------

-- Insert multiple employees
INSERT INTO employees (
    employee_id,
    first_name,
    last_name)
VALUES
(102, 'Anna', 'Brown'),
(103, 'Mark', 'Wilson');
02_update.sql


------------------------------------------------------
-- UPDATE
------------------------------------------------------

-- UPDATE modifies existing records.
-- WHERE defines which rows should be changed.

------------------------------------------------------

-- Update employee last name
UPDATE employees
SET last_name = 'Smith'
WHERE employee_id = 101;
03_delete.sql

------------------------------------------------------
-- DELETE
------------------------------------------------------

-- DELETE removes records from a table.
-- Without WHERE condition all rows will be deleted.

------------------------------------------------------

-- Delete employee by ID
DELETE FROM employees
WHERE employee_id = 101;
