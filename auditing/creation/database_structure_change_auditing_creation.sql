USE master;  
GO  

-- Replace the path with the actual path where you want to store the audit logs
CREATE SERVER AUDIT AllTables_StructureChange_AUDIT  
TO FILE (FILEPATH = 'C:\Users\User\Desktop\APUfolder\Year3 Sem 2\DBS\Assignments\audditing_path');   
GO  

-- Enable the server audit.   
ALTER SERVER AUDIT AllTables_StructureChange_AUDIT  
WITH (STATE = ON);
GO

USE DBS_Assignments
GO

-- Create the database audit specification
CREATE DATABASE AUDIT SPECIFICATION AllTables_StructureChange_Specification
FOR SERVER AUDIT AllTables_StructureChange_AUDIT
ADD (SCHEMA_OBJECT_CHANGE_GROUP)   
WITH (STATE = ON);
GO

