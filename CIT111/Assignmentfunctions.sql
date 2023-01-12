USE magazine;
-- 1. List the magazine name and then take 3% off the magazine price and round to 2 decimal places. 
SELECT magazineName AS Magazine, FORMAT(magazinePrice - magazinePrice*0.03,2) AS '3% off'
FROM magazine;

-- 2. Show the primary key of id from the subscriber table and using the date of 2020-12-20 as if it were today's date

SELECT subscriberKey, 
CEIL(DATEDIFF( subscriptionStartDate, '2020-12-20')/-365) 
AS 'Years since subscription'
FROM subscription;

-- 3. Show the subscriptionStartDate and subscriptionLength and add the  subscriptionLength to the subscriptionStartDate 
-- to see the date of how long their subscription will go
SELECT subscriptionStartDate,subscriptionLength ,
CONCAT(DATE_FORMAT(subscriptionStartDate, '%M %D'),', ', 
FORMAT(subscriptionLength/12,-1)+ DATE_FORMAT(subscriptionStartDate, '%Y'))
FROM subscription;

-- Bike Database:
USE bike;

-- 4. We need a list of all the products without the year at the end of the product_name string. 
SELECT 
REPLACE(
REPLACE(
REPLACE(
REPLACE(
REPLACE(
REPLACE(product_name, '2017', ''),'2016', ''), '2015', '' ), '2018', ''),'/', ''),'-','') 
AS 'Product Name without year'
FROM product
ORDER BY product_id
LIMIT 14;

-- 5. List the product name and then take the 2019 model year bikes and divide the price into 3 equal payments.

SELECT product_name, 
CONCAT('$',FORMAT(list_price / 3,2)) as 'one of 3 payments' 
FROM product WHERE product_name LIKE '%2019%';


