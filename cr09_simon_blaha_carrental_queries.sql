-- This query returns all reservation IDs stored in the DB

SELECT reservation.Rsv_ID
FROM reservation;


-- Result:
-- Rsv_ID	
-- 1	
-- 2	


-- This query inner joins data from the agency and the invoice table

SELECT agency.Name, invoice.Invoice_Nr, invoice.Payment_Options, invoice.Total_Amount
from agency
INNER JOIN invoice ON agency.fk_inovice_ID = invoice.Invoice_ID;

-- Result:
-- Name		Invoice_Nr Payment_Options	Total_Amount
-- Rent-a-Car	1234	Cash			500	


-- This query inner joins data from the customer, reservation, vehicle and address table

SELECT customer.Name, reservation.Rsv_Number, vehicle.Name, address.Address_ID
from customer
INNER JOIN reservation ON customer.fk_Rsv_ID = reservation.Rsv_ID
INNER JOIN vehicle ON reservation.fk_Vehicle_ID = vehicle.Vehicle_ID
INNER JOIN address ON customer.fk_Address_ID = address.Address_ID;

-- Result:
-- Name	Rsv_Number	Name	Address_ID	
-- Max Bauer	12345678	Peugeot 307	6	
-- Goran Gustav	14231423	BWM M3	4	

-- This query counts all vehicles in the database

SELECT COUNT(vehicle.Vehicle_ID)
FROM vehicle;

-- Result:
-- 2	


