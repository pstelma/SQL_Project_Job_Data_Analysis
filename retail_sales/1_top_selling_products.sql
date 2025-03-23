SELECT
    ROUND (AVG(base_price),2) as avg_base_price,
    products.product_id,
    SUM(quantity) as quantity_sold,
    ROUND (AVG(cost),2) as avg_cost,
    ROUND (SUM(revenue),2) as avg_revenue,
    AVG(margin) as avg_margin
FROM products
JOIN sales on products.product_id = sales.product_id
GROUP BY product_name, products.product_id
ORDER BY quantity_sold DESC
LIMIT 10
