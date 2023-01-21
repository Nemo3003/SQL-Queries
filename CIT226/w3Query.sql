
-- BowlingLeagueExample
USE BowlingLeagueModify;

CREATE SCHEMA db_members;
CREATE SCHEMA db_match;

SELECT 'ALTER SCHEMA db_members TRANSFER '+name +';' FROM sys.tables;

ALTER SCHEMA db_members TRANSFER Bowler_Scores;
ALTER SCHEMA db_members TRANSFER Bowlers;
ALTER SCHEMA db_members TRANSFER Teams;

ALTER SCHEMA db_match TRANSFER db_members.Match_Games;
ALTER SCHEMA db_match TRANSFER Match_Games_Archive;
ALTER SCHEMA db_match TRANSFER db_members.Tournaments;
ALTER SCHEMA db_match TRANSFER db_members.ournaments_Archive;
ALTER SCHEMA db_match TRANSFER db_members.Tourney_Matches;
ALTER SCHEMA db_match TRANSFER db_members.Tourney_Matches_Archive;
ALTER SCHEMA db_match TRANSFER db_members.WAZips;

-- Here I grant SELECT privileges to some users on certain schemas
GO
GRANT SELECT ON SCHEMA::[db_members] TO [bowling1]
GO
GRANT SELECT ON SCHEMA::[db_match] TO [bowling2]
GO

-- SalesOrdersExample
USE SalesOrdersModify;

CREATE SCHEMA db_customer;
CREATE SCHEMA db_product;

SELECT 'ALTER SCHEMA db_product TRANSFER '+name +';' FROM sys.tables;
ALTER SCHEMA db_customer TRANSFER Customers;
ALTER SCHEMA db_customer TRANSFER Order_Details;
ALTER SCHEMA db_customer TRANSFER Order_Details_Archive;
ALTER SCHEMA db_customer TRANSFER Employees;

ALTER SCHEMA db_product TRANSFER Vendors;
ALTER SCHEMA db_product TRANSFER Product_Vendors;
ALTER SCHEMA db_product TRANSFER Products;
ALTER SCHEMA db_product TRANSFER Categories;
ALTER SCHEMA db_product TRANSFER Orders;
ALTER SCHEMA db_product TRANSFER Orders_Archive;

-- Here I grant SELECT privileges to some users on certain schemas

GO 
GRANT SELECT ON SCHEMA::[db_customer] TO [sales1]
GO
GRANT SELECT ON SCHEMA::[db_product] TO [sales2]
GO