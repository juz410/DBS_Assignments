USE master;  
GO  
OPEN MASTER KEY DECRYPTION BY PASSWORD = 'QwErTy12345!@#$%';

GO 
CREATE CERTIFICATE MyServerCert 
-- Change to the full path of your 2nd instances
FROM FILE = 'C:\Program Files\Microsoft SQL Server\MSSQL16.DBS_BACKUP_DEV\MSSQL\Keys\MyServerCert.cer'
WITH PRIVATE KEY (
    FILE = 'C:\Program Files\Microsoft SQL Server\MSSQL16.DBS_BACKUP_DEV\MSSQL\Keys\MyServerCert.pvt',
    DECRYPTION BY PASSWORD = 'QwErTy12345!@#$%'
);
GO


-- OPEN MASTER KEY DECRYPTION BY PASSWORD = 'QwErTy12345!@#$%';