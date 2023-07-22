USE master;
GO

CREATE LOGIN TestLogin WITH PASSWORD = 'password';
GO


USE master;
GO

DROP LOGIN TestLogin;
GO
