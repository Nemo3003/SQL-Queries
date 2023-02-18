
INSERT INTO custom_audit.failed_logins
EXEC sp_readerrorlog 0,1, 'Login failed';


DROP TABLE IF EXISTS custom_audit.failed_logins_$(ESCAPE_NONE(DATE))
CREATE TABLE custom_audit.failed_logins
	(
		message_date datetime,
		message_type varchar(20) NULL,
		message varchar(150) NULL
	);