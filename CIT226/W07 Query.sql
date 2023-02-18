-- 1. We create the login 'Ralph' and add it to the server role sysadmin
USE [master]
GO
CREATE LOGIN [Ralph] WITH PASSWORD=N'password', DEFAULT_DATABASE=[master], CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF
GO
ALTER SERVER ROLE [sysadmin] ADD MEMBER [Ralph]
GO

-- 2. Here we check all the sysadmin members
SELECT members.name AS 'Member Name',
		roles.name AS 'Role Name',
		members.modify_date
FROM sys.server_role_members AS server_role_members
INNER JOIN sys.server_principals AS roles
	ON server_role_members.role_principal_id = roles.principal_id
INNER JOIN sys.server_principals AS members
	ON server_role_members.member_principal_id = members.principal_id
WHERE roles.principal_id = 3;

-- 

-- Ralph creates 4 new profiles and adds them to the sysadmin server role
USE [master]
GO
CREATE LOGIN [Ralph_test] WITH PASSWORD=N'password', DEFAULT_DATABASE=[master], CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF
GO
ALTER SERVER ROLE [sysadmin] ADD MEMBER [Ralph_test]
GO

USE [master]
GO
CREATE LOGIN [Ralph_adm] WITH PASSWORD=N'password', DEFAULT_DATABASE=[master], CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF
GO
ALTER SERVER ROLE [sysadmin] ADD MEMBER [Ralph_adm]
GO

USE [master]
GO
CREATE LOGIN [Ralph_cat] WITH PASSWORD=N'password', DEFAULT_DATABASE=[master], CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF
GO
ALTER SERVER ROLE [sysadmin] ADD MEMBER [Ralph_cat]
GO

USE [master]
GO
CREATE LOGIN [Ralph_dev] WITH PASSWORD=N'password', DEFAULT_DATABASE=[master], CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF
GO
ALTER SERVER ROLE [sysadmin] ADD MEMBER [Ralph_dev]
GO
