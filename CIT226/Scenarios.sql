-- FIRST SCENARIO 

USE WideWorldImporters;

	SELECT name, create_date, modify_date
	FROM sys.tables
	WHERE type='U';

USE BowlingLeagueExample;

	SELECT name, create_date, modify_date
	FROM sys.tables
	WHERE type='U';

USE SalesOrdersExample;

	SELECT name, create_date, modify_date
	FROM sys.tables
	WHERE type='U';

-- SECOND SCENARIO
USE WideWorldImporters;

	SELECT ts.name, cs.name, max_length
	FROM sys.columns AS cs
	JOIN sys.tables AS ts
	ON ts.object_id = cs.object_id
	WHERE cs.name LIKE '%name%';

USE BowlingLeagueExample;

	SELECT ts.name, cs.name, max_length
	FROM sys.columns AS cs
	JOIN sys.tables AS ts
	ON ts.object_id = cs.object_id
	WHERE cs.name LIKE '%name%';

USE SalesOrdersExample;

	SELECT ts.name, cs.name, max_length
	FROM sys.columns AS cs
	JOIN sys.tables AS ts
	ON ts.object_id = cs.object_id
	WHERE cs.name LIKE '%name%';

-- THIRD SCENARIO

USE WideWorldImporters;

	SELECT name, physical_name, size
	FROM sys.database_files
	WHERE size > 1024;

	SELECT SUM(size)*8/1024 AS 'sum in MB'
	FROM sys.database_files
	WHERE size > 1024;

USE BowlingLeagueExample;

	SELECT name, physical_name, size
	FROM sys.database_files
	WHERE size > 1024;

	SELECT SUM(size)*8/1024 AS 'sum in MB'
	FROM sys.database_files
	WHERE size > 1024;

USE SalesOrdersExample;

	SELECT name, physical_name, size
	FROM sys.database_files
	WHERE size > 1024;

	SELECT SUM(size)*8/1024 AS 'sum in MB'
	FROM sys.database_files
	WHERE size > 1024;