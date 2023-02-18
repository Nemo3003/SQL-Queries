USE [msdb]
GO
DECLARE @jobId BINARY(16)
EXEC msdb.dbo.sp_add_job @job_name=N'check_for_failed_logins',
		@enabled=1,
		@notify_level_eventlog=0,
		@notify_level_email=2,
		@notify_level_page=2,
		@delete_level=0,
		@category_name=N'[Uncategorized(Local)]',
		@owner_login_name=N'DESKTOP-TI585C7\ulima', @job_id = @jobId OUTPUT
select @jobId
GO
EXEC msdb.dbo.sp_add_jobserver @job_name=N'check_for_failed_logins', @server_name=N'DESKTOP-TI585C7\MSSQLSERVER4'
GO
USE [msdb]
GO
EXEC msdb.dbo.sp_add_jobstep @job_name=N'check_for_failed_logins', @step_name=N'create_custom_table',
		@step_id=1,
		@cmdexec_success_code=0,
		@on_success_action=3,
		@on_fail_action=2,
		@retry_attempts=0,
		@retry_interval=0,
		@os_run_priority=0, @subsystem=N'TSQL',
		@command=N'DROP TABLE IF EXISTS custom_audit.failed_logins_$(ESCAPE_NONE((DATE))

	CREATE TABLE custom_audit.failed_logins_$(ESCAPE_NONE(DATE))
		(
		message_date datetime,
		message_type varchar(20) NULL,
		message varchar(150) NULL
		) ;',
			@database_name=N'msdb',
			@flags=0
GO
USE [msdb]
GO
EXEC msdb.dbo.sp_add_jobstep @job_name=N'check_for_failed_logins', @step_name=N'insert_audit_data',
		@step_id=2,
		@cmdexec_success_code=0,
		@on_success_action=1,
		@on_fail_action=2,
		@retry_attempts=0,
		@retry_interval=0,
		@os_run_priority=0, @subsystem=N'TSQL',
		@command=N'INSERT INTO custom_audit.failed_logins_$(ESCAPE_NONE(DATE))
		EXEC sp_readerrorlog 0,1, "Login failed";
		'