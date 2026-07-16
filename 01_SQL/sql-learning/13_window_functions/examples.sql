-- ==========================================================
-- WINDOW FUNCTIONS
-- ==========================================================
-- Practical exercises for PostgreSQL window functions.
-- Covers OVER(), PARTITION BY, ranking functions,
-- FIRST_VALUE(), LAST_VALUE(), LAG(), LEAD(),
-- and comparison with aggregate functions.

-------------------------------------------------------------
-- CREATE SAMPLE TABLES
-------------------------------------------------------------

CREATE TABLE product_groups (
    group_id serial PRIMARY KEY,
    group_name VARCHAR(255) NOT NULL);

CREATE TABLE products (
    product_id serial PRIMARY KEY,
    product_name VARCHAR(255) NOT NULL,
    price DECIMAL(11,2),
    group_id INT NOT NULL,
    FOREIGN KEY (group_id)
        REFERENCES product_groups(group_id));

-------------------------------------------------------------
-- INSERT SAMPLE DATA
-------------------------------------------------------------

INSERT INTO product_groups (group_name)
VALUES
('Smartphone'),
('Laptop'),
('Tablet');

INSERT INTO products (product_name, group_id, price)
VALUES
('Microsoft Lumia',1,200),
('HTC One',1,400),
('Nexus',1,500),
('iPhone',1,900),
('HP Elite',2,1200),
('Lenovo Thinkpad',2,700),
('Sone VAIO',2,700),
('Dell Vostro',2,800),
('iPad',3,700),
('Kindle Fire',3,150),
('Samsung Galaxy Tab',3,200);

-------------------------------------------------------------
-- AGGREGATE FUNCTION
-------------------------------------------------------------

-- Average price of all products

SELECT AVG(price)
FROM products;
-------------------------------------------------------------

-- Average price by product group

SELECT
    group_name,
    AVG(price)
FROM products
INNER JOIN product_groups USING (group_id)
GROUP BY group_name;

-------------------------------------------------------------
-- WINDOW FUNCTION
-------------------------------------------------------------

-- Average price within each product group

SELECT
    product_name,
    price,
    group_name,
    AVG(price) OVER (PARTITION BY group_name) AS avg_price
FROM products
INNER JOIN product_groups USING (group_id);


-------------------------------------------------------------
-- ROW_NUMBER()
-------------------------------------------------------------

-- Sequential numbering within each product group

SELECT
    product_name,
    group_name,
    price,
    ROW_NUMBER() OVER (
        PARTITION BY group_name
        ORDER BY price
    ) AS row_num
FROM products
INNER JOIN product_groups USING (group_id);


-------------------------------------------------------------
-- RANK()
-------------------------------------------------------------

-- Ranking with gaps for duplicate values

SELECT
    product_name,
    group_name,
    price,
    RANK() OVER (
        PARTITION BY group_name
        ORDER BY price
    ) AS price_rank
FROM products
INNER JOIN product_groups USING (group_id);

-------------------------------------------------------------
-- DENSE_RANK()
-------------------------------------------------------------

-- Ranking without gaps

SELECT
    product_name,
    group_name,
    price,
    DENSE_RANK() OVER (
        PARTITION BY group_name
        ORDER BY price
    ) AS dense_rank
FROM products
INNER JOIN product_groups USING (group_id);


-------------------------------------------------------------
-- FIRST_VALUE()
-------------------------------------------------------------

-- Lowest price within each product group

SELECT
    product_name,
    group_name,
    price,
    FIRST_VALUE(price) OVER (
        PARTITION BY group_name
        ORDER BY price
    ) AS lowest_price
FROM products
INNER JOIN product_groups USING (group_id);


-------------------------------------------------------------
-- LAST_VALUE()
-------------------------------------------------------------

-- Highest price within each product group

SELECT
    product_name,
    group_name,
    price,
    LAST_VALUE(price) OVER (
        PARTITION BY group_name
        ORDER BY price
        RANGE BETWEEN UNBOUNDED PRECEDING
        AND UNBOUNDED FOLLOWING
    ) AS highest_price
FROM products
INNER JOIN product_groups USING (group_id);


-------------------------------------------------------------
-- LAG()
-------------------------------------------------------------

-- Previous product price and price difference

SELECT
    product_name,
    group_name,
    price,
    LAG(price,1) OVER (
        PARTITION BY group_name
        ORDER BY price
    ) AS previous_price,
    price -
    LAG(price,1) OVER (
        PARTITION BY group_name
        ORDER BY price
    ) AS difference
FROM products
INNER JOIN product_groups USING (group_id);


-------------------------------------------------------------
-- LEAD()
-------------------------------------------------------------

-- Next product price and price difference

SELECT
    product_name,
    group_name,
    price,
    LEAD(price,1) OVER (
        PARTITION BY group_name
        ORDER BY price
    ) AS next_price,
    price -
    LEAD(price,1) OVER (
        PARTITION BY group_name
        ORDER BY price
    ) AS difference
FROM products
INNER JOIN product_groups USING (group_id);
