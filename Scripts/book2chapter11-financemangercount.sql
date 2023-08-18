SELECT 
	d.business_name,
	COUNT(*) AS finance_manager_count
FROM employees e 
JOIN employeetypes et ON e.employee_type_id = et.employee_type_id 
JOIN dealershipemployees de ON e.employee_id = de.employee_id 
JOIN dealerships d ON de.dealership_id = d.dealership_id 
WHERE et.employee_type_name = 'Finance Manager'
GROUP BY d.business_name 
ORDER BY finance_manager_count DESC;