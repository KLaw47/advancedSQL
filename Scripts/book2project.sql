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

--CREATE VIEW InventoryCount AS 
--SELECT
--	vt.model,
--	vt.make,
--	vt.body_type,
--	COUNT(*) AS stock
--FROM vehicles v 
--JOIN vehicletypes vt ON v.vehicle_type_id = vt.vehicle_type_id 
--WHERE v.is_sold = FALSE 
--GROUP BY vt.model, vt.make, vt.body_type;
--
--SELECT model, stock
--FROM inventorycount 
--ORDER BY stock DESC;
--
--SELECT make, model, stock
--FROM inventorycount 
--ORDER BY stock DESC;
--
--SELECT body_type, stock
--FROM inventorycount 
--ORDER BY stock DESC;
--
--SELECT * 
--FROM inventorycount 
-- putting COUNT in the view made the data less readable when queries were run, counting in each query leads to more readable data.

create view VehiclesInStock as
select
	v.vehicle_id,
	vt.body_type,
	vt.make,
	vt.model,
	v.is_sold
from vehicles v
left join vehicletypes vt	
	on v.vehicle_type_id = vt.vehicle_type_id
where v.is_sold = false
-- count of each model in stock
select
	distinct model,
	COUNT(model) over (partition by model) as ModelCount
from vehiclesinstock
order by modelcount desc
-- count of each make in stock
select
	distinct make,
	COUNT(make) over (partition by make) as MakeCount
from vehiclesinstock
order by makecount desc
-- count of each body type in stock
select
	distinct body_type,
	COUNT(body_type) over (partition by body_type) as BodyTypeCount
from vehiclesinstock
order by bodytypecount DESC

SELECT 
	c.state,
	ROUND(AVG(s.price), 2) AS average_purchase_price
FROM sales s 
JOIN customers c ON s.customer_id = c.customer_id 
GROUP BY c.state 
ORDER BY average_purchase_price DESC 
LIMIT 5;