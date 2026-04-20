SELECT
    c.first_name || ' ' || c.last_name AS full_name,
    ROUND(SUM(oi.quantity * oi.unit_price), 2) AS total_spent
FROM
    customers c
JOIN
    orders o ON c.customer_id = o.customer_id
JOIN
    order_items oi ON o.order_id = oi.order_id
GROUP BY
    c.customer_id
ORDER BY
    total_spent DESC
LIMIT 5;


SELECT
    p.category,
    ROUND(SUM(oi.quantity * oi.unit_price), 2) AS total_revenue
FROM
    order_items oi
JOIN
    products p ON oi.product_id = p.product_id
GROUP BY
    p.category
ORDER BY
    total_revenue DESC


SELECT
    p.category,
    ROUND(SUM(oi.quantity * oi.unit_price), 2) AS delivered_revenue
FROM
    order_items oi
JOIN
    orders o ON oi.order_id = o.order_id
JOIN
    products p ON oi.product_id = p.product_id
WHERE
    o.status = 'delivered'
GROUP BY
    p.category
ORDER BY
    delivered_revenue DESC


SELECT