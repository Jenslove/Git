USE [IA-DB-1];
GO
-----------------------
SET ANSI_NULLS ON;
GO
SET QUOTED_IDENTIFIER ON;
GO
-----------------------
DROP TABLE [dbo].[Log];
GO
DROP TABLE [dbo].[Version];
GO
DROP TABLE [dbo].[Thing];
GO
DROP TABLE [dbo].[Project];
GO
DROP TABLE [dbo].[User];
GO
DROP TABLE [dbo].[Organization];
GO
-----------------------
CREATE TABLE [dbo].[Organization] (
    [ID]			NUMERIC (18) IDENTITY (1, 1) NOT NULL PRIMARY KEY,
	[OrgName]		VARCHAR(150)	NOT NULL,
    [CreateDate]	DATETIME		NOT NULL,
	[Address1]		VARCHAR(150)	NOT NULL,
	[Address2]		VARCHAR(150)	NULL,
	[City]			VARCHAR(75)		NOT NULL,
	[State]			VARCHAR(2)		NOT NULL,
	[Zip]			VARCHAR(10)		NOT NULL,
	[Telephone]		VARCHAR(15)		NULL,
	[Email]			VARCHAR(75)		NULL
);
GO
-----------------------
CREATE TABLE [dbo].[User] (
    [ID]			NUMERIC (18) IDENTITY (1, 1) NOT NULL PRIMARY KEY,
	[Organization]	NUMERIC (18)	NULL	FOREIGN KEY REFERENCES dbo.[Organization](ID),
    [CreateDate]	DATETIME		NOT NULL,
	[UserID]		VARCHAR(25)		NOT NULL,
	[Password]		VARCHAR(25)		NOT NULL,
	[FirstName]		VARCHAR(75)		NOT NULL,
	[MidName]		VARCHAR(75)		NOT NULL,
	[LastName]		VARCHAR(75)		NOT NULL,
	[Address1]		VARCHAR(150)	NOT NULL,
	[Address2]		VARCHAR(150)	NULL,
	[City]			VARCHAR(75)		NOT NULL,
	[State]			VARCHAR(2)		NOT NULL,
	[Zip]			VARCHAR(10)		NOT NULL,
	[Telephone]		VARCHAR(15)		NULL,
	[Email]			VARCHAR(75)		NOT NULL,
	[Question1]		VARCHAR(75)		NOT NULL,
	[Answer1]		VARCHAR(75)		NOT NULL,
	[Question2]		VARCHAR(75)		NOT NULL,
	[Answer2]		VARCHAR(75)		NOT NULL,
	[Question3]		VARCHAR(75)		NOT NULL,
	[Answer3]		VARCHAR(75)		NOT NULL,
	[CCNumber]		VARCHAR(75)		NOT NULL,
	[CCAddress1]	VARCHAR(150)	NOT NULL,
	[CCAddress2]	VARCHAR(150)	NULL,
	[CCCity]		VARCHAR(75)		NOT NULL,
	[CCState]		VARCHAR(2)		NOT NULL,
	[CCZip]			VARCHAR(10)		NOT NULL,
);
GO
-----------------------
CREATE TABLE [dbo].[Project] (
    [ID]			NUMERIC (18) IDENTITY (1, 1) NOT NULL PRIMARY KEY,
	[User]			NUMERIC (18)	NOT NULL	FOREIGN KEY REFERENCES dbo.[User](ID),
	[Organization]	NUMERIC (18)	NULL		FOREIGN KEY REFERENCES dbo.[Organization](ID),
    [CreateDate]	DATETIME		NOT NULL,
	[Type]			VARCHAR(25)		NOT NULL,
	[Desc]			VARCHAR(1000)	NOT NULL,
	[Comment]		VARCHAR(500)	NOT NULL,
	[Industry]		VARCHAR(500)	NOT NULL,
);
GO
-----------------------
CREATE TABLE [dbo].[Thing] (
    [ID]			NUMERIC (18) IDENTITY (1, 1) NOT NULL PRIMARY KEY,
	[Project]		NUMERIC (18)	NOT NULL FOREIGN KEY REFERENCES dbo.[Project](ID),
    [CreateDate]	DATETIME		NOT NULL,
	[Name]			VARCHAR(150)	NOT NULL,
	[Type]			VARCHAR(25)		NOT NULL,
	[Size]			INT				NOT NULL,
	[Desc]			VARCHAR(1000)	NOT NULL,
	[Comment]		VARCHAR(500)	NOT NULL,
	[Focus]			VARCHAR(500)	NOT NULL,
);
GO
-----------------------
CREATE TABLE [dbo].[Version] (
    [ID]			NUMERIC (18) IDENTITY (1, 1) NOT NULL PRIMARY KEY,
    [Thing]			NUMERIC (18)	NOT NULL FOREIGN KEY REFERENCES dbo.[Thing](ID),
    [CreateDate]	DATETIME		NOT NULL,
	[Name]			VARCHAR(150)	NOT NULL,
	[Type]			VARCHAR(25)		NOT NULL,
	[Size]			INT				NOT NULL,
	[Desc]			VARCHAR(1000)	NOT NULL,
	[Comment]		VARCHAR(500)	NOT NULL,
	[Item]			VARBINARY(max)	NOT NULL
);
GO
-----------------------
CREATE TABLE [dbo].[Log] (

   [Id] int IDENTITY(1,1) NOT NULL,
   [Message] nvarchar(max) NULL,
   [MessageTemplate] nvarchar(max) NULL,
   [Level] nvarchar(128) NULL,
   [TimeStamp] datetimeoffset(7) NOT NULL,  -- use datetime for SQL Server pre-2008
   [Exception] nvarchar(max) NULL,
   [Properties] xml NULL,
   [LogEvent] nvarchar(max) NULL

   CONSTRAINT [PK_Logs] 
     PRIMARY KEY CLUSTERED ([Id] ASC) 
	 WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF,
	       ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) 
     ON [PRIMARY]

) ON [PRIMARY];
-----------------------
