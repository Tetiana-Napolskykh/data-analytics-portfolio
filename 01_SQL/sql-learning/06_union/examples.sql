-- ====================================================
-- UNION AND UNION ALL
-- ====================================================

-- UNION combines the result sets of two or more SELECT statements.
-- It removes duplicate rows from the final result.

-- Requirements:
-- - SELECT statements must return the same number of columns.
-- - Columns must have compatible data types.
-- - Columns must be in the same order.


--------------------------------------------------------
-- UNION
--------------------------------------------------------

-- Combine employee and dependent names.
-- Duplicate records are removed.

SELECT
    first_name,
    last_name
FROM employees

UNION

SELECT
    first_name,
    last_name
FROM dependents

ORDER BY last_name;

--------------------------------------------------------
-- UNION ALL
--------------------------------------------------------

-- Combine employee and dependent names.
-- Duplicate records are preserved.

SELECT
    first_name,
    last_name
FROM employees

UNION ALL

SELECT
    first_name,
    last_name
FROM dependents

ORDER BY last_name;
