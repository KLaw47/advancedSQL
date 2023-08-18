SELECT
    d.business_name,
    COUNT(DISTINCT c.customer_id) AS customer_count
FROM customers c
JOIN sales s ON c.customer_id = s.customer_id
JOIN dealerships d ON s.dealership_id = d.dealership_id
GROUP BY d.business_name
ORDER BY customer_count DESC
LIMIT 5;