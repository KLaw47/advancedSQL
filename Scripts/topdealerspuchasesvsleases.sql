WITH TopDealerships AS (
    SELECT s.dealership_id, d.business_name,
           SUM(s.price) AS total_sales_amount,
           COUNT(*) AS total_transactions
    FROM sales s
    JOIN dealerships d ON s.dealership_id = d.dealership_id
    GROUP BY s.dealership_id, d.business_name
    ORDER BY total_sales_amount DESC
    LIMIT 5
),
TransactionCounts AS (
    SELECT td.dealership_id,
           SUM(CASE WHEN s.sales_type_id = 2 THEN 1 ELSE 0 END) AS lease_count,
           SUM(CASE WHEN s.sales_type_id <> 2 THEN 1 ELSE 0 END) AS purchase_count
    FROM sales s
    JOIN TopDealerships td ON s.dealership_id = td.dealership_id
    GROUP BY td.dealership_id
)
SELECT td.business_name,
       CASE WHEN tc.lease_count > tc.purchase_count THEN 'Leases'
            WHEN tc.lease_count < tc.purchase_count THEN 'Purchases'
            ELSE 'Equal' END AS more_leases_or_purchases,
       tc.lease_count, tc.purchase_count, td.total_transactions
FROM TopDealerships td
JOIN TransactionCounts tc ON td.dealership_id = tc.dealership_id;