--SELECT 
--	d.business_name,
--	SUM(s.price) AS total_lease_income
--FROM sales s
--JOIN dealerships d ON s.dealership_id = d.dealership_id
--JOIN salestypes st ON s.sales_type_id = st.sales_type_id
--WHERE s.purchase_date >= '2020-01-01' AND s.purchase_date < '2020-02-01' AND st.sales_type_name = 'Lease'
--GROUP BY d.business_name
--ORDER BY total_lease_income DESC;

SELECT 
	d.business_name,
	SUM(s.price) AS total_lease_income
FROM sales s
JOIN dealerships d ON s.dealership_id = d.dealership_id
JOIN salestypes st ON s.sales_type_id = st.sales_type_id
WHERE EXTRACT(YEAR FROM s.purchase_date) = 2019 AND st.sales_type_name = 'Lease'
GROUP BY d.business_name
ORDER BY total_lease_income DESC;