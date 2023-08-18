WITH TopDealerships AS (
    SELECT s.dealership_id,
    	   d.business_name,
           SUM(s.price) AS total_sales_amount
    FROM sales s
    JOIN dealerships d ON s.dealership_id = d.dealership_id
    GROUP BY s.dealership_id, d.business_name
    ORDER BY total_sales_amount DESC
    LIMIT 5
),
TopSalesEmployees AS (
    SELECT td.dealership_id, 
           FIRST_VALUE(s.employee_id) OVER (PARTITION BY td.dealership_id ORDER BY COUNT(*) DESC) AS top_employee_id
    FROM sales s
    JOIN TopDealerships td ON s.dealership_id = td.dealership_id
    GROUP BY td.dealership_id, s.employee_id
)
SELECT td.business_name, e.first_name, e.last_name
FROM TopDealerships td
JOIN TopSalesEmployees tse ON td.dealership_id = tse.dealership_id
JOIN employees e ON tse.top_employee_id = e.employee_id
GROUP BY td.business_name, e.first_name, e.last_name;

