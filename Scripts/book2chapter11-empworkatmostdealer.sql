SELECT 
	e.first_name,
	e.last_name,
	COUNT(de.dealership_id) AS dealership_count
FROM employees e 
JOIN dealershipemployees de ON e.employee_id = de.employee_id 
GROUP BY e.employee_id, e.first_name, e.last_name 
ORDER BY dealership_count DESC 
LIMIT 3;