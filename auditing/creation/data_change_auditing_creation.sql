USE master ;  
GO  

-- Replace The path with the actual path where you want to store the audit logs
CREATE SERVER AUDIT AllTables_DML_AUDIT  TO FILE ( FILEPATH = 'C:\Users\User\Desktop\APUfolder\Year3 Sem 2\DBS\Assignments\audditing_path' );   
GO  

-- Enable the server audit.   
ALTER SERVER AUDIT AllTables_DML_AUDIT  WITH (STATE = ON);
GO

USE DBS_Assignments
GO

-- Create the database audit specification
CREATE DATABASE AUDIT SPECIFICATION AllTables_DML_Specifications
FOR SERVER AUDIT AllTables_DML_AUDIT
ADD (INSERT, UPDATE, DELETE, SELECT ON DATABASE::DBS_Assignments BY public)   
WITH (STATE = ON);
GO
