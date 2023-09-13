DELETE FROM sales  WHERE sales.invoice_number = '2436217483'
--select statement to verify sales record deleted.
SELECT *
FROM sales s 
WHERE invoice_number = '2436217483';

UPDATE sales 
SET employee_id = NULL
WHERE employee_id = 35;

UPDATE dealershipemployees 
SET employee_id = NULL 
WHERE employee_id = 35;

DELETE FROM employees WHERE employees.employee_id = 35;

SELECT e.employee_id, e.first_name, e.last_name
FROM employees e
WHERE e.employee_id = 35;
--using this method, four sales records are associated with an employee_id value that is NULL.
SELECT *
FROM sales 
WHERE employee_id IS NULL;
