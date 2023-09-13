UPDATE dealershipemployees 
SET dealership_id = 20
WHERE employee_id IN (
	SELECT employee_id 
	FROM employees 
	WHERE first_name = 'Kristopher' AND last_name = 'Blumfield'
) AND dealership_id = 9;
--this next select was to double check that my update worked as intended, by joining employees, dealerships, and dealershipemployees.
SELECT 
	e.employee_id,
	e.first_name,
	e.last_name,
	d.business_name,
	de.dealership_id
FROM employees e
JOIN dealershipemployees de ON e.employee_id = de.employee_id 
JOIN dealerships d ON de.dealership_id = d.dealership_id 
WHERE e.first_name = 'Kristopher'