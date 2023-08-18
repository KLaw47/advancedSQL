SELECT 
	d.business_name,
	SUM(s.price) AS total_sales_income
FROM sales s
JOIN dealerships d ON s.dealership_id = d.dealership_id
JOIN salestypes st ON s.sales_type_id = st.sales_type_id
WHERE EXTRACT(YEAR FROM s.purchase_date) = 2020 AND st.sales_type_name = 'Purchase'
GROUP BY d.business_name
ORDER BY total_sales_income DESC;