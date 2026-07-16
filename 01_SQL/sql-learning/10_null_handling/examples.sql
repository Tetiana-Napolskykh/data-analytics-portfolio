-- ====================================================
-- NULL HANDLING AND COALESCE
-- ====================================================

-- NULL represents missing or unknown values.
-- NULL is different from an empty string.
-- Comparisons with NULL require IS NULL or IS NOT NULL.

-------------------------------------------------------
-- BASIC COALESCE
-------------------------------------------------------

-- COALESCE returns the first non-null value.

SELECT
    COALESCE(NULL, 'Unknown') AS result;

SELECT
    COALESCE(NULL, NULL, 'Available') AS result;


-------------------------------------------------------
-- REPLACE NULL VALUES
-------------------------------------------------------

-- Replace missing discount with zero

SELECT
    id,
    product_name,
    price,
    discount,
    COALESCE(discount, 0) AS discount_value
FROM products;

-------------------------------------------------------
-- CALCULATIONS WITH NULL VALUES
-------------------------------------------------------

-- Without COALESCE:
-- price - NULL returns NULL


SELECT
    id,
    product_name,
    price,
    (price - discount) AS net_price
FROM products;

-------------------------------------------------------

-- Correct calculation

SELECT
    id,
    product_name,
    price,
    (price - COALESCE(discount, 0)) AS net_price
FROM products;

-------------------------------------------------------
-- COALESCE WITH TEXT DATA
-------------------------------------------------------

-- Use short description if available,
-- otherwise take part of full description

SELECT
    id,
    product_name,
    COALESCE(product_summary,
        LEFT(product_description, 50)) AS excerpt
FROM products;

-------------------------------------------------------

-- Add text indicator for shortened description

SELECT
    id,
    product_name,
    COALESCE(product_summary,
        CONCAT(LEFT(product_description, 50),
            '...')) AS excerpt
FROM products;
