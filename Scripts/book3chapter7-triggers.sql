--CREATE FUNCTION set_pickup_date()
--	RETURNS TRIGGER
--	LANGUAGE plpgsql
--AS $$
--BEGIN
--	UPDATE sales 
--	SET pickup_date = NEW.purchase_date + integer '3'
--	WHERE sales.sale_id = NEW.sale_id;
--
--	RETURN NULL;
--END;
--$$
--
--CREATE TRIGGER new_sale
--	AFTER INSERT 
--	ON sales
--	FOR EACH ROW 
--	EXECUTE PROCEDURE set_pickup_date();

----------------------------------------

CREATE OR REPLACE FUNCTION SetPurchaseDate()
    RETURNS TRIGGER
    LANGUAGE plpgsql
AS $$
BEGIN
	UPDATE sales
    SET purchase_date = current_date + integer '3'
   	WHERE sales.sale_id = NEW.sale_id;
    RETURN Null;
END;
$$;

CREATE OR REPLACE TRIGGER SetPurchaseDateTrigger
AFTER INSERT ON sales
FOR EACH ROW
EXECUTE FUNCTION SetPurchaseDate();

INSERT INTO sales (dealership_id, employee_id, vehicle_id, customer_id, price, payment_method)
VALUES (1, 1, 1, 1, 25000, 'Credit');

--------------------------------------------------------------

 

UPDATE sales
SET purchase_date = '2016-06-13'
WHERE sales.sale_id = 4466

-------------------------------------------------

CREATE OR REPLACE FUNCTION UpdateWebsiteURL()
RETURNS TRIGGER
LANGUAGE plpgsql
AS $$
BEGIN
    IF TG_OP = 'INSERT' THEN
        NEW.website := NEW.website || '_' || REPLACE(NEW.business_name, ' ', '_');
    ELSIF TG_OP = 'UPDATE' THEN
        NEW.website := NEW.website || '_' || REPLACE(NEW.business_name, ' ', '_');
    END IF;
    RETURN NULL;
END;
$$;

CREATE TRIGGER UpdateWebsiteURLTrigger
BEFORE INSERT OR UPDATE ON dealerships
FOR EACH ROW
EXECUTE FUNCTION UpdateWebsiteURL();

UPDATE dealerships 
SET business_name = 'Cain Autos of Missouri',
	website = 'http://www.cainautosofmissouri.com'
WHERE dealership_id = 3;


