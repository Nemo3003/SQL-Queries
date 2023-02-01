
-- 1B

USE BowlingLeagueEx
GO
ALTER TABLE db_members.Bowlers
ADD email_address VARCHAR(50)
GO
-- 1C
UPDATE db_members.Bowlers
SET email_address = REPLACE(CONCAT(BowlerFirstName, BowlerLastName, '@example.com'),' ','');
GO
SELECT BowlerFirstName, BowlerLastName, email_address FROM db_members.Bowlers
GO

-- 2A
USE [master]
GO
CREATE LOGIN [bob_the_scorekeeper] WITH PASSWORD=N'Password', DEFAULT_DATABASE=[master], CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF
GO
USE [BowlingLeagueEx]
GO
CREATE USER [bob_the_scorekeeper] FOR LOGIN [bob_the_scorekeeper]
GO

-- 2B
CREATE VIEW db_members.junior_view
AS
SELECT BowlerID, BowlerFirstName, BowlerLastName, BowlerMiddleInit, BowlerCity, BowlerZip, BowlerState, TeamID
FROM db_members.Bowlers
GO
GRANT SELECT ON [db_members].[junior_view] TO [bob_the_scorekeeper]
GO

-- 3A
USE [master]
GO
CREATE LOGIN [carol_the_programmer] WITH PASSWORD=N'Password', DEFAULT_DATABASE=[master], CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF
GO
USE [BowlingLeagueEx]
GO
CREATE USER [carol_the_programmer] FOR LOGIN [carol_the_programmer]
GO
GRANT INSERT ON [db_members].[Bowlers] TO [carol_the_programmer]
GO
GRANT SELECT ON [db_members].[Bowlers] TO [carol_the_programmer]
GO