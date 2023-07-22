USE master;  
GO  

-- Replace The path with the actual path where you want to store the audit logs
CREATE SERVER AUDIT PermissionChange_AUDIT  
TO FILE (FILEPATH = 'C:\Users\User\Desktop\APUfolder\Year3 Sem 2\DBS\Assignments\dev_audditing_path');   
GO  

-- Enable the server audit.   
ALTER SERVER AUDIT PermissionChange_AUDIT  
WITH (STATE = ON);
GO

USE DBS_Assignments
GO

-- Create the database audit specification for database permission changes
CREATE DATABASE AUDIT SPECIFICATION PermissionChange_Database_Specifications
FOR SERVER AUDIT PermissionChange_AUDIT
ADD (SCHEMA_OBJECT_PERMISSION_CHANGE_GROUP)
WITH (STATE = ON);
GO
