WITH UsedCarSalesByState AS (
    SELECT d.state,
           COUNT(*) AS used_car_count,
           RANK() OVER (ORDER BY COUNT(*) DESC) AS state_rank_most,
           RANK() OVER (ORDER BY COUNT(*) ASC) AS state_rank_least
    FROM sales s
    JOIN dealerships d ON s.dealership_id = d.dealership_id
    JOIN vehicles v ON s.vehicle_id = v.vehicle_id
    WHERE v.is_new = FALSE 
    GROUP BY d.state
)
SELECT state, used_car_count
FROM UsedCarSalesByState
WHERE state_rank_most = 1 OR state_rank_least = 1;
