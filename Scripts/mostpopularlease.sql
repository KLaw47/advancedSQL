
SELECT vt.model, COUNT(*) AS num_leases
FROM sales s
JOIN vehicles v ON s.vehicle_id = v.vehicle_id
JOIN vehicletypes vt ON v.vehicle_type_id = vt.vehicle_type_id
WHERE s.sales_type_id = 2 
GROUP BY vt.model
ORDER BY num_leases DESC
LIMIT 1;


