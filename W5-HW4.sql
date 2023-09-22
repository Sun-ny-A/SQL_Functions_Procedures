

--create one function and one procedure--


CREATE OR REPLACE PROCEDURE updatePaymentAndRental(
_payment_id INTEGER, 
_customer_id INTEGER, 
_rental_id INTEGER
) LANGUAGE plpgsql AS $$
BEGIN
    UPDATE payment
    SET payment_date = NOW()
    WHERE payment_id = _payment_id AND customer_id = _customer_id;
    UPDATE rental
    SET last_update = NOW()
    WHERE rental_id = _rental_id;

    COMMIT;
END;
$$;

SELECT *
FROM payment
WHERE customer_id = '27';


CALL updatePaymentAndRental(18601, 27, 1310); 

SELECT *
FROM staff;



CREATE OR REPLACE FUNCTION addNewStaff(
	staff_id INTEGER,
	first_name VARCHAR(45),
	last_name VARCHAR(45),
	address_id INTEGER,
	email VARCHAR(50), 
	store_id INTEGER,
	active BOOLEAN,
	username VARCHAR(16)
) RETURNS INTEGER AS $$
BEGIN
	INSERT INTO staff(
		staff_id,
		first_name,
		last_name,
		address_id,
		email,
		store_id,
		active,
		username
	)	VALUES (
				staff_id,
		first_name,
		last_name,
		address_id,
		email,
		store_id,
		active,
		username
	);
	RETURN staff_id;
END
$$ LANGUAGE plpgsql;


SELECT addNewStaff(3, 'John', 'Wayne', 605, 'cowboywayne@ranch.com', '3', TRUE, 'jwayne');


SELECT *
FROM staff;






