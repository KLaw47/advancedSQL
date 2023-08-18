WITH TopDealerships AS (
    SELECT s.dealership_id, d.business_name,
           SUM(s.price) AS total_sales_amount
    FROM sales s
    JOIN dealerships d ON s.dealership_id = d.dealership_id
    GROUP BY s.dealership_id, d.business_name
    ORDER BY total_sales_amount DESC
    LIMIT 5
),
TopModels AS (
    SELECT td.dealership_id, vt.model,
           RANK() OVER (PARTITION BY td.dealership_id ORDER BY COUNT(*) DESC) AS model_rank,
           COUNT(*) AS models_sold
    FROM sales s
    JOIN vehicles v ON s.vehicle_id = v.vehicle_id
    JOIN vehicletypes vt ON v.vehicle_type_id = vt.vehicle_type_id
    JOIN TopDealerships td ON s.dealership_id = td.dealership_id
    GROUP BY td.dealership_id, vt.model
)
SELECT td.business_name, tm.model, tm.models_sold
FROM TopDealerships td
JOIN TopModels tm ON td.dealership_id = tm.dealership_id AND tm.model_rank = 1
ORDER BY td.total_sales_amount DESC;
