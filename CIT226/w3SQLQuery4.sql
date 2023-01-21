
-- Custom Server Role that only allows us to view databases but not to edit them
USE [master]
GO
CREATE SERVER ROLE [readonly]
GO
GRANT CONNECT ANY DATABASE TO [readonly]
GO
GRANT SELECT ALL USER SECURABLES TO [readonly]

-- *********************************************
-- Here we assign that server role to a user after creating it
USE [master];
GO
CREATE LOGIN [testuser] WITH PASSWORD=N'password'
GO
ALTER SERVER ROLE [readonly] ADD MEMBER [testuser]
GO
-- ***********************************************
-- Here we create a database role and give it a few authorizations
USE [RecipesExample]
GO
CREATE ROLE [edit_role]
GO
USE [RecipesExample]
GO
ALTER AUTHORIZATION ON SCHEMA::[db_datareader] TO [edit_role]
GO
USE [RecipesExample]
GO
ALTER AUTHORIZATION ON SCHEMA::[db_datawriter] TO [edit_role]
GO
-- *************************************************
-- Now we work with granting DCLS to a user
USE [RecipesExample];
GO
CREATE LOGIN [new_user] WITH PASSWORD=N'password'
GO
CREATE LOGIN [new_user1] WITH PASSWORD=N'password'
GO
CREATE USER [new_user] FOR LOGIN [new_user]
GO
CREATE USER [new_user1] FOR LOGIN [new_user1]
GO

-- My DCLS
GRANT INSERT ON dbo.Ingredients TO [new_user]
GO
GRANT SELECT ON dbo.Ingredients TO [new_user]
GO
GRANT UPDATE ON dbo.Ingredients TO [new_user]
GO
GRANT DELETE ON dbo.Ingredients TO [new_user]
GO
-- **********************************************
USE [RecipesExample]
DENY SELECT ON dbo.Recipes TO [new_user1]
GO

-- ************************************************
USE [RecipesExample];
SELECT name, create_date
FROM sys.database_principals
WHERE CONVERT(date,create_date) >= '2023-01-01';

USE [BowlingLeagueModify]
SELECT name, create_date
FROM sys.database_principals
WHERE CONVERT(date,create_date) >= '2023-01-01';

USE [master]
SELECT name,create_date,modify_date FROM sys.sql_logins
WHERE CONVERT(date,create_date) >= '2023-01-01';