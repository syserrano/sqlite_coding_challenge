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
