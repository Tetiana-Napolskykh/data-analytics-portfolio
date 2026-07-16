-- ============================================================
-- JSON in PostgreSQL
-- Practical examples of storing, querying, and processing
-- JSON data using PostgreSQL operators and functions.
-- ============================================================

-- Create table
CREATE TABLE orders (
    id SERIAL PRIMARY KEY,
    info JSON NOT NULL);

-- Insert data
INSERT INTO orders (info)
VALUES
('{"customer":"John Doe","items":{"product":"Beer","qty":6}}'),
('{"customer":"Lily Bush","items":{"product":"Diaper","qty":24}}'),
('{"customer":"Josh William","items":{"product":"Toy Car","qty":1}}'),
('{"customer":"Mary Clark","items":{"product":"Toy Train","qty":2}}');


-- View JSON data
SELECT *
FROM orders;

---------------------------------------------------------------
-- JSON operators
---------------------------------------------------------------

-- Get customer as JSON
SELECT
    info -> 'customer' AS customer
FROM orders;


-- Get customer as text
SELECT
    info ->> 'customer' AS customer
FROM orders;


-- Get product name
SELECT
    info -> 'items' ->> 'product' AS product
FROM orders
ORDER BY product;


----------------------------------------------------------------
-- Filtering JSON data
---------------------------------------------------------------

-- Customers who bought Diaper
SELECT
    info ->> 'customer' AS customer
FROM orders
WHERE info -> 'items' ->> 'product' = 'Diaper';


-- Orders with quantity = 2
SELECT
    info ->> 'customer' AS customer,
    info -> 'items' ->> 'product' AS product
FROM orders
WHERE CAST(info -> 'items' ->> 'qty' AS INTEGER) = 2;


---------------------------------------------------------------
-- Aggregate functions
---------------------------------------------------------------

SELECT
    MIN(CAST(info -> 'items' ->> 'qty' AS INTEGER)) AS min_qty,
    MAX(CAST(info -> 'items' ->> 'qty' AS INTEGER)) AS max_qty,
    SUM(CAST(info -> 'items' ->> 'qty' AS INTEGER)) AS total_qty,
    AVG(CAST(info -> 'items' ->> 'qty' AS INTEGER)) AS avg_qty
FROM orders;


---------------------------------------------------------------
-- JSON functions
---------------------------------------------------------------

-- Expand JSON object into key-value pairs
SELECT
    json_each(info)
FROM orders;


-- Expand JSON object into text key-value pairs
SELECT
    json_each_text(info)
FROM orders;


-- List keys from nested object
SELECT
    json_object_keys(info -> 'items')
FROM orders;
