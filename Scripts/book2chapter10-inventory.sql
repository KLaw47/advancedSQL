SELECT
    vt.model,
    vt.make,
    COUNT(v.vehicle_id) AS inventory_count
FROM vehicles v
JOIN vehicletypes vt ON v.vehicle_type_id = vt.vehicle_type_id
WHERE v.is_sold = FALSE
GROUP BY vt.model, vt.make
ORDER BY inventory_count ASC  
LIMIT 1;

SELECT
	vt.make,
    vt.model,
    COUNT(v.vehicle_id) AS inventory_count
FROM vehicles v
JOIN vehicletypes vt ON v.vehicle_type_id = vt.vehicle_type_id
WHERE v.is_sold = FALSE
GROUP BY vt.make, vt.model
ORDER BY inventory_count DESC  
LIMIT 1;