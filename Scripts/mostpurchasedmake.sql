SELECT vt.make, COUNT(*) AS num_purchases
FROM sales s
JOIN vehicles v ON s.vehicle_id = v.vehicle_id
JOIN vehicletypes vt ON v.vehicle_type_id = vt.vehicle_type_id
WHERE s.sales_type_id = 1
GROUP BY vt.make
ORDER BY num_purchases DESC
LIMIT 1;