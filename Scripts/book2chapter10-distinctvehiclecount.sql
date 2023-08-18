SELECT
    d.business_name,
    COUNT(DISTINCT vt.model) AS distinct_model_count
FROM dealerships d
JOIN sales s ON d.dealership_id = s.dealership_id
JOIN vehicles v ON s.vehicle_id = v.vehicle_id
JOIN vehicletypes vt ON v.vehicle_type_id = vt.vehicle_type_id
WHERE v.is_sold = FALSE
GROUP BY d.business_name
ORDER BY distinct_model_count ASC;

--change orderby to desc to see which dealers are selling the most different types of models
--this dataset is small enough to see all in one query.