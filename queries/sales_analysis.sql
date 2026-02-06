-- Sales Analysis Queries

-- 1. Monthly revenue trend
SELECT
    DATE_TRUNC('month', o.order_date) AS month,
    SUM(p.price * oi.quantity) AS monthly_revenue
FROM orders o
JOIN order_items oi ON o.order_id = oi.order_id
JOIN products p ON oi.product_id = p.product_id
GROUP BY month
ORDER BY month;


-- 2. Revenue by city
SELECT
    c.city,
    SUM(p.price * oi.quantity) AS total_revenue
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN order_items oi ON o.order_id = oi.order_id
JOIN products p ON oi.product_id = p.product_id
GROUP BY c.city
ORDER BY total_revenue DESC;


-- 3. Revenue contribution using CTE
WITH revenue_by_customer AS (
    SELECT
        c.customer_id,
        SUM(p.price * oi.quantity) AS revenue
    FROM customers c
    JOIN orders o ON c.customer_id = o.customer_id
    JOIN order_items oi ON o.order_id = oi.order_id
    JOIN products p ON oi.product_id = p.product_id
    GROUP BY c.customer_id
)
SELECT
    customer_id,
    revenue,
    ROUND(
        revenue * 100.0 / SUM(revenue) OVER (),
        2
    ) AS revenue_percentage
FROM revenue_by_customer
ORDER BY revenue_percentage DESC;
