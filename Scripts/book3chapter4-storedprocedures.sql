CREATE OR REPLACE PROCEDURE  UpdateVehicleInventory(
p_vehicle_id INT
)
LANGUAGE plpgsql
AS $$

BEGIN 
	UPDATE vehicles
	SET is_sold = TRUE 
	WHERE vehicle_id = p_vehicle_id;
END
$$;

CALL updatevehicleinventory(2)

CREATE OR REPLACE PROCEDURE ReturnVehicleToInventory(
	p_vehicle_id INT
)
LANGUAGE plpgsql
AS $$
BEGIN
	UPDATE vehicles 
	SET is_sold = FALSE
	WHERE vehicle_id = p_vehicle_id;

	UPDATE sales 
	SET sale_returned = TRUE 
	WHERE vehicle_id = p_vehicle_id;

	INSERT INTO oilchangelogs (date_occured, vehicle_id) VALUES (CURRENT_DATE, p_vehicle_id);
END
$$;

CALL returnvehicletoinventory(3)

SELECT v.*, s.*
FROM vehicles v
JOIN sales s ON v.vehicle_id = s.vehicle_id
WHERE v.vehicle_id = 3;


SELECT * FROM oilchangelogs o 
