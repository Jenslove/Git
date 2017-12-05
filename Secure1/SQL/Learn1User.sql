--Master DB
CREATE LOGIN LoginID WITH PASSWORD = 'Password'
GO
 
CREATE USER [LoginID] FOR LOGIN [LoginID] WITH DEFAULT_SCHEMA=[dbo]
GO

--Within Database
CREATE USER [LoginID] FOR LOGIN [LoginID] WITH DEFAULT_SCHEMA=[dbo]
GO

EXEC sp_addrolemember 'db_datareader', 'LoginID';

GO

EXEC sp_addrolemember 'db_datawriter', 'LoginID';