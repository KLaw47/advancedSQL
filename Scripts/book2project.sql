SELECT
    e.employee_id,
    e.first_name,
    e.last_name,
    SUM(s.price) AS total_sales_income
FROM sales s
JOIN employees e ON s.employee_id = e.employee_id
GROUP BY e.employee_id, e.first_name, e.last_name
ORDER BY total_sales_income DESC
LIMIT 5;

SELECT 
	d.dealership_id,
	d.business_name,
	SUM(s.price) AS total_sales_income
FROM sales s
JOIN dealerships d ON s.dealership_id = d.dealership_id 
GROUP BY d.dealership_id, d.business_name 
ORDER BY total_sales_income DESC 
LIMIT 5;

SELECT 
	vt.model,
	SUM(s.price) AS total_sales_income
FROM sales s
JOIN vehicles v ON s.vehicle_id = v.vehicle_id 
JOIN vehicletypes vt ON v.vehicle_type_id = vt.vehicle_type_id 
GROUP BY vt.model 
ORDER BY total_sales_income DESC 
LIMIT 1;

SELECT 
	dealership_id,
	business_name,
	employee_id,
	CONCAT(first_name, ' ', last_name) AS employee_name,
	sales_income
FROM (
	SELECT
		d.dealership_id,
		d.business_name,
		e.employee_id,
		e.first_name, 
		e.last_name,
		SUM(s.price) AS sales_income,
		RANK() OVER (PARTITION BY d.dealership_id ORDER BY SUM(s.price) DESC) AS sales_rank
	FROM sales s
	JOIN employees e ON s.employee_id = e.employee_id 
	JOIN dealerships d ON s.dealership_id = d.dealership_id
	GROUP BY d.dealership_id, d.business_name, e.employee_id, e.first_name, e.last_name 
) ranked_sales
WHERE sales_rank = 1

