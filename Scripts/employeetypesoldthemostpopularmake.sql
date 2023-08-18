SELECT et.employee_type_name, COUNT(*) AS num_sales
FROM employees e
JOIN sales s ON e.employee_id = s.employee_id
JOIN vehicles v ON s.vehicle_id = v.vehicle_id
JOIN vehicletypes vt ON v.vehicle_type_id = vt.vehicle_type_id
JOIN employeetypes et ON e.employee_type_id = et.employee_type_id
WHERE vt.make = (
    SELECT vt.make
    FROM sales s
    JOIN vehicles v ON s.vehicle_id = v.vehicle_id
    JOIN vehicletypes vt ON v.vehicle_type_id = vt.vehicle_type_id
    WHERE s.sales_type_id = 1 -- Filter for purchases (assuming sales_type_id=1 represents purchases)
    GROUP BY vt.make
    ORDER BY COUNT(*) DESC
    LIMIT 1
)
GROUP BY et.employee_type_name
ORDER BY num_sales DESC
LIMIT 1; 