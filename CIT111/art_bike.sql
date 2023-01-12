USE v_art;
SELECT * FROM artist;
-- The manager wants to add the artist Johannes Vermeer as an artist in the database.

-- 1st query
INSERT INTO artist(fname,mname,lname,dob,dod,country,local)
VALUES('Johannes', NULL, 'Vermeer',1632,1674,'Netherlands','n');

-- the manager lists all the artists with 'List all Artist Records' 
-- the following screen renders sorted by the last name of the artist

-- 2nd query
SELECT * FROM artist
ORDER BY lname;

-- update information on Vermeer

-- 3rd query
UPDATE artist
SET dod = 1675
WHERE lname='Vermeer';

-- delete Vermeer

-- 4th query
DELETE FROM artist 
WHERE lname='Vermeer';

-- Beginning Bike DB

USE bike;
SELECT * FROM customer;

-- a list of their first and last names and phone numbers.

-- 5th query
SELECT first_name, last_name, phone FROM customer 
WHERE state = 'TX' AND city = 'Houston'
AND phone IS NOT NULL;
-- You need to sell more of your high-end bikes. 
-- You want to take $500 off all bikes that have a list price of $5,000.00 or more.

-- 6th query
SELECT * FROM product;
SELECT product_name, list_price, list_price -500 AS discount
FROM product
WHERE list_price >= 5000.0 
ORDER BY list_price DESC;

-- Get a list of the staff's emails that are not from your store(store1)

-- 7th query
SELECT * FROM staff;
SELECT first_name, last_name, email
FROM staff
WHERE store_id <> 1;

-- A customer needs more information about a specific bike,
-- but all they know is that is has the word 'spider' in the name.

-- 8th query 
SELECT product_name, model_year, list_price
FROM product
WHERE product_name 
LIKE '%spider%';

-- You need to list all bikes names that have a range
-- of prices from $500–$550 sorted with the lowest price first.

-- 9th query
SELECT product_name, list_price 
FROM product
WHERE list_price BETWEEN 500 AND 550 
ORDER BY list_price;

-- Show the customer's first_name, last_name, phone, street, city, state, zip_code who:
-- have a phone number listed
-- and whose city has the letters 'ach' or 'och' somewhere in their name of the city
-- or whose last name is William. 

-- 10th query
SELECT first_name, last_name, phone, street, city, state, zip_code
FROM customer 
WHERE phone IS NOT NULL AND (city LIKE '%ach%' OR '%och%') OR last_name= 'William'	
LIMIT 5;