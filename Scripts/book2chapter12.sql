SELECT
    c.zipcode,
    c.state,
    COUNT(DISTINCT c.customer_id) AS customer_count
FROM customers c
JOIN sales s ON c.customer_id = s.customer_id
GROUP BY c.zipcode, c.state
ORDER BY customer_count DESC
LIMIT 5;