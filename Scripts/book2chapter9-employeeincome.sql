SELECT 
    e.employee_id,
    e.first_name,
    e.last_name,
    SUM(s.price) AS total_income
FROM sales s
JOIN employees e ON s.employee_id = e.employee_id
GROUP BY e.employee_id, e.first_name, e.last_name
ORDER BY total_income DESC;
