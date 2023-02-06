
SELECT * FROM sys.database_files;

ALTER TABLE dbo.employee DROP COLUMN new ;

-- ***************************************************
DECLARE @i int
SET @i = 1

WHILE @i<50000
    BEGIN
        INSERT INTO dbo.employee
        VALUES (@i,'brand', 'now','d1')
        SET @i=@i+1
    END;

SELECT COUNT(*) FROM dbo.employee;
