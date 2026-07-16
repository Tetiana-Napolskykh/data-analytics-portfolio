-- ====================================================
-- DATA TYPES
-- ====================================================

## Common PostgreSQL data types

### Boolean
- BOOLEAN

### Character
- CHAR
- VARCHAR
- TEXT

### Numeric
- INTEGER
- FLOAT
- NUMERIC

### Date and Time
- DATE
- TIME
- TIMESTAMP

### Identifier
- UUID


  
-- ====================================================
-- Type Conversion Operator (::)
-- ====================================================

-- PostgreSQL allows a shorter syntax for type conversion.
-- Syntax:
-- expression::type
-- Convert text to integer and date

--------------------------------------------------------

SELECT
    '100'::INTEGER,
    '01-OCT-2015'::DATE;

--------------------------------------------------------

-- Convert text to timestamp

SELECT
    '2019-06-15 14:30:20'::TIMESTAMP;



-- ====================================================
-- CAST
-- ====================================================

-- CAST converts a value from one data type to another.
-- It is useful when we need to perform calculations,
-- comparisons, or format data correctly.
  -- Convert text value to integer

--------------------------------------------------------
  
SELECT
    CAST('100' AS INTEGER);
  
--------------------------------------------------------

-- Convert text value to date

SELECT
    CAST('2015-01-01' AS DATE),
    CAST('01-OCT-2015' AS DATE);

--------------------------------------------------------

-- Convert text values to boolean

SELECT
    CAST('true' AS BOOLEAN),
    CAST('false' AS BOOLEAN),
    CAST('T' AS BOOLEAN),
    CAST('F' AS BOOLEAN);

