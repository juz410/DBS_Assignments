USE master;  
GO  

-- Replace the path with the actual path where you want to store the audit logs
CREATE SERVER AUDIT LoginLogout_AUDIT  
TO FILE (FILEPATH = 'C:\Users\User\Desktop\APUfolder\Year3 Sem 2\DBS\Assignments\dev_audditing_path');   
GO  

-- Enable the server audit.   
ALTER SERVER AUDIT LoginLogout_AUDIT  
WITH (STATE = ON);
GO

-- Create the server audit specification for successful and failed logins
CREATE SERVER AUDIT SPECIFICATION LoginLogout_AUDIT_Specification
FOR SERVER AUDIT LoginLogout_AUDIT
ADD (SUCCESSFUL_LOGIN_GROUP),
ADD (FAILED_LOGIN_GROUP)
WITH (STATE = ON);
GO
