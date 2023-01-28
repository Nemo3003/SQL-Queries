
/*
1.
Use the data dictionary to write a query to find out when the last time all of your databases were backed up.
*/

SELECT
	bs.database_name,
	bs.backup_start_date,
	bs.backup_finish_date,
	bs.server_name,
	bs.user_name,
	bs.type,
	bm.physical_device_name
FROM msdb.dbo.backupset AS bs
INNER JOIN msdb.dbo.backupmediafamily AS bm
ON bs.media_set_id = bm.media_set_id;

-- See all databases that are not system databases
SELECT name
FROM master.dbo.sysdatabases
WHERE name NOT IN ('master','tempdb','model','msdb');

/*
2. Make new backups for ALL of your user databases (not system databases).
*/
BACKUP DATABASE [BowlingLeagueEx] TO  DISK = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER4\MSSQL\Backup\BowlingLeagueExample.bak' WITH NOFORMAT, NOINIT,  NAME = N'BowlingLeagueExample-Full Database Backup', SKIP, NOREWIND, NOUNLOAD,  STATS = 10
GO