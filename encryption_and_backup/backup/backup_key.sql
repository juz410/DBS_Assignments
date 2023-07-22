USE master;
GO
BACKUP CERTIFICATE MyServerCert
TO FILE = N'C:\DBS_Keys\MyServerCert.cer'
WITH PRIVATE KEY (
    FILE = N'C:\DBS_Keys\MyServerCert.pvk',
    ENCRYPTION BY PASSWORD = 'QwErTy12345!@#$%'
);
GO
