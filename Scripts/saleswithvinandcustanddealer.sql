SELECT s.*, 
       v.VIN, 
       c.first_name AS customer_first_name, c.last_name AS customer_last_name, 
       emp.first_name AS employee_first_name, emp.last_name AS employee_last_name,
       d.business_name AS dealership_name, d.city AS dealership_city, d.state AS dealership_state
FROM sales s
JOIN vehicles v ON s.vehicle_id = v.vehicle_id
JOIN customers c ON s.customer_id = c.customer_id
JOIN employees emp ON s.employee_id = emp.employee_id
JOIN dealerships d ON s.dealership_id = d.dealership_id;