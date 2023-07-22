USE master;
GO

CREATE LOGIN UserTest WITH PASSWORD = 'abcd1234';
GO


USE master;
GO

DROP LOGIN UserTest;
GO
