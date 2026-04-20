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
    e.first_name || ' ' || e.last_name
    d.name AS department,
    e.salary AS employee_salary,
    ROUND(department_avg.avg_salary, 2) AS department_avg_salary
FROM
    employees e
JOIN
    departments d ON e.department_id = d.department_id
JOIN
    (SELECT 
        department_id, 
        AVG(salary) AS avg_salary 
        FROM employees 
        GROUP BY department_id) 
    department_avg ON department_avg.department_id = e.department_id
WHERE
    e.salary > department_avg.avg_salary
ORDER BY
    d.name ASC, e.salary DESC;


SELECT
    city,
    COUNT(*) AS gold_customer_count
FROM
    customers
WHERE
    loyalty_status = 'gold'
GROUP BY
    city
ORDER BY
    gold_customer_count DESC;

SELECT
    city,
    SUM(CASE WHEN loyalty_status = 'gold' THEN 1 ELSE 0 END) AS gold_customer_count,
    SUM(CASE WHEN loyalty_status = 'silver' THEN 1 ELSE 0 END) AS silver_customer_count,
    SUM(CASE WHEN loyalty_status = 'bronze' THEN 1 ELSE 0 END) AS bronze_customer_count
    COUNT(*) AS total_customers
FROM
    customers
GROUP BY
    city
ORDER BY
    gold_customer_count DESC, silver_customer_count DESC, bronze_customer_count DESC;