-- Product Performance Analysis

-- 1. Total quantity sold per product
SELECT
    p.product_name,
    SUM(oi.quantity) AS total_units_sold
FROM products p
JOIN order_items oi ON p.product_id = oi.product_id
GROUP BY p.product_name
ORDER BY total_units_sold DESC;


-- 2. Top-selling product in each category (Window Function)
SELECT
    category,
    product_name,
    total_sold
FROM (
    SELECT
        p.category,
        p.product_name,
        SUM(oi.quantity) AS total_sold,
        RANK() OVER (
            PARTITION BY p.category
            ORDER BY SUM(oi.quantity) DESC
        ) AS category_rank
    FROM products p
    JOIN order_items oi ON p.product_id = oi.product_id
    GROUP BY p.category, p.product_name
) ranked_products
WHERE category_rank = 1;


-- 3. Revenue ranking of products
SELECT
    product_name,
    total_revenue,
    DENSE_RANK() OVER (ORDER BY total_revenue DESC) AS revenue_rank
FROM (
    SELECT
        p.product_name,
        SUM(p.price * oi.quantity) AS total_revenue
    FROM products p
    JOIN order_items oi ON p.product_id = oi.product_id
    GROUP BY p.product_name
) product_revenue;
