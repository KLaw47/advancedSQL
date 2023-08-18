SELECT
    e.first_name,
    e.last_name,
    COUNT(*) AS lease_sales_count
FROM employees e
JOIN sales s ON e.employee_id = s.employee_id
JOIN salestypes st ON s.sales_type_id = st.sales_type_id
WHERE st.sales_type_name = 'Lease'
GROUP BY e.employee_id, e.first_name, e.last_name
ORDER BY lease_sales_count DESC
LIMIT 2;

SELECT
    e.first_name,
    e.last_name,
    SUM(s.price) AS total_lease_sales_amount
FROM employees e
JOIN sales s ON e.employee_id = s.employee_id
JOIN salestypes st ON s.sales_type_id = st.sales_type_id
WHERE st.sales_type_name = 'Lease'
GROUP BY e.employee_id, e.first_name, e.last_name
ORDER BY total_lease_sales_amount DESC
LIMIT 2;

