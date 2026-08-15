CREATE TABLE customers (
    customer_id   INT PRIMARY KEY,
    first_name    VARCHAR(50),
    last_name     VARCHAR(50),
    email         VARCHAR(100),
    city          VARCHAR(50),
    state         VARCHAR(50),
    signup_date   DATE,
    referred_by   INT NULL
);

SELECT * FROM customers;

CREATE TABLE orders (
    order_id          INT PRIMARY KEY,
    customer_id       INT,
    order_date        DATE,
    product_category  VARCHAR(50),
    quantity          INT,
    unit_price        NUMERIC(10,2),
    status            VARCHAR(20)
);

SELECT * FROM orders;

-- ============================================================
-- CUSTOMER & ORDER RELATIONAL DATABASE ANALYSIS
-- SQL JOIN PROJECT
-- ============================================================

-- 3.1 INNER JOIN
-- Get order details along with customer name, only for orders
-- that have a matching customer.
SELECT
    o.order_id,
    c.first_name || ' ' || c.last_name AS customer_name,
    o.product_category,
    o.quantity,
    o.unit_price,
    (o.quantity * o.unit_price) AS order_total,
    o.status
FROM orders o
INNER JOIN customers c
    ON o.customer_id = c.customer_id
ORDER BY o.order_id;

-- 3.2 LEFT JOIN
-- Show ALL orders, including orders whose customer_id has no match.
SELECT
    o.order_id,
    o.customer_id,
    c.first_name,
    c.last_name,
    c.city,
    o.product_category,
    o.status
FROM orders o
LEFT JOIN customers c
    ON o.customer_id = c.customer_id
ORDER BY o.order_id;

-- 3.3 LEFT JOIN + NULL FILTERING (ANTI-JOIN)
-- Find orders referencing a customer_id that does not exist.
SELECT
    o.order_id,
    o.customer_id AS invalid_customer_id,
    o.product_category,
    o.order_date
FROM orders o
LEFT JOIN customers c
    ON o.customer_id = c.customer_id
WHERE c.customer_id IS NULL
ORDER BY o.order_id;

-- 3.4 LEFT JOIN / ANTI-JOIN
-- Find customers who have no orders at all.
SELECT
    c.customer_id,
    c.first_name,
    c.last_name,
    c.signup_date
FROM customers c
LEFT JOIN orders o
    ON c.customer_id = o.customer_id
WHERE o.order_id IS NULL
ORDER BY c.customer_id;

-- 3.5 JOIN + GROUP BY / AGGREGATION
-- Total revenue and order count per customer,
-- excluding cancelled orders.
SELECT
    c.customer_id,
    c.first_name || ' ' || c.last_name AS customer_name,
    c.city,
    COUNT(o.order_id) AS num_orders,
    ROUND(SUM(o.quantity * o.unit_price), 2) AS total_spent
FROM customers c
INNER JOIN orders o
    ON c.customer_id = o.customer_id
WHERE o.status <> 'Cancelled'
GROUP BY c.customer_id, c.first_name, c.last_name, c.city
ORDER BY total_spent DESC
LIMIT 10;

-- 3.6 SELF JOIN
-- Match each customer to the customer who referred them.
SELECT
    referred.customer_id AS customer_id,
    referred.first_name || ' ' || referred.last_name AS customer_name,
    referrer.customer_id AS referrer_id,
    referrer.first_name || ' ' || referrer.last_name AS referred_by_name
FROM customers referred
INNER JOIN customers referrer
    ON referred.referred_by = referrer.customer_id
ORDER BY referred.customer_id;

-- Revenue by product category (JOIN + GROUP BY)
SELECT
    o.product_category,
    COUNT(o.order_id) AS total_orders,
    ROUND(SUM(o.quantity * o.unit_price), 2) AS category_revenue
FROM orders o
INNER JOIN customers c
    ON o.customer_id = c.customer_id
WHERE o.status <> 'Cancelled'
GROUP BY o.product_category
ORDER BY category_revenue DESC;
