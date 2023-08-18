SELECT d.*, e.*
FROM dealerships d
LEFT JOIN dealershipemployees de ON d.dealership_id = de.dealership_id
LEFT JOIN employees e ON de.employee_id = e.employee_id;
