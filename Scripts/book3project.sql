CREATE OR REPLACE PROCEDURE hire_new_employee(
    p_first_name TEXT, 
    p_last_name TEXT, 
    p_email_address TEXT, 
    p_phone TEXT, 
    p_employee_type_id INT, 
    p_dealership_id1 INT, 
    p_dealership_id2 INT)
LANGUAGE plpgsql
AS $$
DECLARE
    v_new_employee_id INT;
BEGIN
        -- Insert the new employee and retrieve their ID
        INSERT INTO employees (first_name, last_name, email_address, phone, employee_type_id)
        VALUES (p_first_name, p_last_name, p_email_address, p_phone, p_employee_type_id)
        RETURNING employee_id INTO v_new_employee_id;

        -- Insert records for the new employee in the dealershipemployees table for both dealerships
        INSERT INTO dealershipemployees (dealership_id, employee_id)
        VALUES (p_dealership_id1, v_new_employee_id),
               (p_dealership_id2, v_new_employee_id);
EXCEPTION
    WHEN OTHERS THEN
        --  rollback the transaction if it donked up
        ROLLBACK;
        RAISE;
END;
$$;

CALL hire_new_employee('Ghost', 'Ghosterson', 'ghost@pizza.butt', '000-000-0000', 5, 15, 16)
--select statement to see if everything went smoothly
SELECT 
    e.employee_id, 
    e.first_name, 
    e.last_name, 
    e.email_address,
    e.phone,
    d.business_name, 
    d.phone AS dealership_phone, 
    d.state, 
    d.website
FROM 
    employees e
JOIN 
    dealershipemployees de ON e.employee_id = de.employee_id
JOIN 
    dealerships d ON de.dealership_id = d.dealership_id
WHERE 
    e.email_address = 'beanz@bean.beans';
    
----------------------------------------------------------------------------
   
CREATE OR REPLACE PROCEDURE terminate_employee(p_employee_id INT)
LANGUAGE plpgsql
AS $$
BEGIN
    -- Delete the employee's association with dealerships
    DELETE FROM dealershipemployees 
    WHERE employee_id = p_employee_id;

    -- Delete the employee's record
    DELETE FROM employees 
    WHERE employee_id = p_employee_id;

EXCEPTION
    WHEN OTHERS THEN
        -- If its busted
        RAISE;
END;
$$;

CALL terminate_employee(1003);

