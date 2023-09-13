CREATE OR REPLACE FUNCTION InsertEmployee(
	IN first_name VARCHAR(255),
    IN last_name VARCHAR(255),
    IN email_address VARCHAR(255),
    IN phone VARCHAR(20),
    IN employee_type_id INT
)
RETURNS void AS $$
BEGIN
	 INSERT INTO employees (first_name, last_name, email_address, phone, employee_type_id)
    VALUES (first_name, last_name, email_address, phone, employee_type_id);
    
    INSERT INTO dealershipemployees (dealership_id, employee_id)
    VALUES (dealership_id, currval('employees_employee_id_seq'));
	
END;
$$ LANGUAGE plpgsql;

CALL InsertEmployee('John', 'Doe', 'john@example.com', '123-456-7890', 1);
