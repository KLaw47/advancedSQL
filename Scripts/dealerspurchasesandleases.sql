SELECT
    d.business_name AS dealership_name,
	COUNT(CASE WHEN s.sales_type_id = '1' THEN 1 END) AS number_of_purchases,
	count(CASE WHEN s.sales_type_id = '2' THEN 1 END) AS number_of_leases
FROM
    dealerships d
LEFT JOIN
    sales s ON d.dealership_id = s.dealership_id
LEFT JOIN
    salestypes st ON s.sales_type_id = st.sales_type_id
GROUP BY
    d.business_name;