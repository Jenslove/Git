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
   [ID]				NUMERIC (18) IDENTITY (1, 1) NOT NULL PRIMARY KEY,
	[OrgName]		VARCHAR(150)	NOT NULL,
   [CreateDate]	DATETIME			NOT NULL,
	[Address1]		VARCHAR(150)	NOT NULL,
	[Address2]		VARCHAR(150)	NULL,
	[City]			VARCHAR(75)		NOT NULL,
	[State]			VARCHAR(2)		NOT NULL,
	[Zip]				VARCHAR(10)			NOT NULL,
	[Telephone]		VARCHAR(15)		NULL,
	[Email]			VARCHAR(75)		NULL
);
GO
-----------------------
CREATE TABLE [dbo].[User] (
   [ID]				NUMERIC (18) IDENTITY (1, 1) NOT NULL PRIMARY KEY,
	[Organization]	NUMERIC (18)	NULL	FOREIGN KEY REFERENCES dbo.[Organization](ID),
   [CreateDate]	DATETIME			NOT NULL,
	[UserID]			VARCHAR(25)			NOT NULL,	--LINK TO SECURITY TABLES
	--[Password]		VARCHAR(25)		NOT NULL, --NOT NEEDED AS THIS IS CARRIED IN SECURITY TABLES
	[FirstName]		VARCHAR(75)		NOT NULL,
	[MidName]		VARCHAR(75)		NOT NULL,
	[LastName]		VARCHAR(75)		NOT NULL,
	[Address1]		VARCHAR(150)	NOT NULL,
	[Address2]		VARCHAR(150)	NULL,
	[City]			VARCHAR(75)		NOT NULL,
	[State]			VARCHAR(2)		NOT NULL,
	[Zip]				VARCHAR(10)			NOT NULL,
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
	[CCCity]			VARCHAR(75)			NOT NULL,
	[CCState]		VARCHAR(2)		NOT NULL,
	[CCZip]			VARCHAR(10)		NOT NULL,
);
GO
-----------------------
CREATE TABLE [dbo].[Project] (
   [ID]				NUMERIC (18) IDENTITY (1, 1) NOT NULL PRIMARY KEY,
	[User]			NUMERIC (18)	NOT NULL	FOREIGN KEY REFERENCES dbo.[User](ID),
	[Organization]	NUMERIC (18)	NULL		FOREIGN KEY REFERENCES dbo.[Organization](ID),
   [CreateDate]	DATETIME			NOT NULL,
	[Type]			VARCHAR(25)		NOT NULL,
	[Desc]			VARCHAR(1000)	NOT NULL,
	[Comment]		VARCHAR(500)	NOT NULL,
	[Industry]		VARCHAR(500)	NOT NULL,
);
GO
-----------------------
CREATE TABLE [dbo].[Thing] (
   [ID]				NUMERIC (18) IDENTITY (1, 1) NOT NULL PRIMARY KEY,
	[Project]		NUMERIC (18)	NOT NULL FOREIGN KEY REFERENCES dbo.[Project](ID),
   [CreateDate]	DATETIME			NOT NULL,
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
   [ID]				NUMERIC (18) IDENTITY (1, 1) NOT NULL PRIMARY KEY,
   [Thing]			NUMERIC (18)	NOT NULL FOREIGN KEY REFERENCES dbo.[Thing](ID),
   [CreateDate]	DATETIME			NOT NULL,
	[DisplayName]	VARCHAR(150)	NOT NULL,
	[Name]			VARCHAR(150)	NOT NULL,
	[FullPath]		VARCHAR(150)	NOT NULL,
	[FileType]		VARCHAR(25)		NOT NULL,
	[Size]			INT				NOT NULL,
	[Desc]			VARCHAR(1000)	NOT NULL,
	[Comment]		VARCHAR(500)	NOT NULL,
	[Item]			VARBINARY(max)	NOT NULL
);
GO
-----------------------
CREATE TABLE [dbo].[Log] (

   [Id] int IDENTITY(1,1)				NOT NULL,
   [Message] nvarchar(max)				NULL,
   [MessageTemplate] nvarchar(max)	NULL,
   [Level] nvarchar(128)				NULL,
   [TimeStamp] datetimeoffset(7)		NOT NULL,  -- use datetime for SQL Server pre-2008
   [Exception] nvarchar(max)			NULL,
   [Properties] xml						NULL,
   [LogEvent] nvarchar(max)			NULL

   CONSTRAINT [PK_Logs] 
     PRIMARY KEY CLUSTERED ([Id] ASC) 
	 WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF,
	       ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) 
     ON [PRIMARY]

) ON [PRIMARY];
GO
-----------------------
-----------------------
SET IDENTITY_INSERT [dbo].[Organization] ON
INSERT INTO [dbo].[Organization] (
   [ID],
	[OrgName],
   [CreateDate],
	[Address1],
	--[Address2],
	[City],
	[State],
	[Zip]
	--[Telephone],
	--[Email]
	) VALUES (
    1,				--[ID]			NUMERIC (18) IDENTITY (1, 1) NOT NULL PRIMARY KEY,
	'TEST ORG 1',	--[OrgName]		VARCHAR(150)	NOT NULL,
    GETDATE(),		--[CreateDate]	DATETIME		NOT NULL,
	'ORG 1 ADD 1',	--[Address1]		VARCHAR(150)	NOT NULL,
	--[Address2]		VARCHAR(150)	NULL,
	'CITY 1',		--[City]			VARCHAR(75)		NOT NULL,
	'KS',				--[State]			VARCHAR(2)		NOT NULL,
	'66666'			--[Zip]			VARCHAR(10)		NOT NULL,
	--[Telephone]		VARCHAR(15)		NULL,
	--[Email]			VARCHAR(75)		NULL
);
SET IDENTITY_INSERT [dbo].[Organization] OFF
GO
-----------------------
SET IDENTITY_INSERT [dbo].[User] ON
INSERT INTO [dbo].[User] (
   [ID],
	[Organization],
   [CreateDate],
	[UserID],
	--[Password],
	[FirstName],
	[MidName],
	[LastName],
	[Address1],
	--[Address2],
	[City],
	[State],
	[Zip],
	--[Telephone],
	[Email],
	[Question1],
	[Answer1],
	[Question2],
	[Answer2],
	[Question3],
	[Answer3],
	[CCNumber],
	[CCAddress1],
	--[CCAddress2],
	[CCCity],
	[CCState],
	[CCZip]
	) VALUES (
   1,										--[ID]			NUMERIC (18) IDENTITY (1, 1) NOT NULL PRIMARY KEY,
	1,										--[Organization]	NUMERIC (18)	NULL	FOREIGN KEY REFERENCES dbo.[Organization](ID),
    GETDATE(),							--[CreateDate]	DATETIME		NOT NULL,
	'mike.keena@thekeenas.com',	--[UserID]		VARCHAR(25)		NOT NULL,
	--[Password]		VARCHAR(25)		NOT NULL,
	'MIKE',								--[FirstName]		VARCHAR(75)		NOT NULL,
	'A',									--[MidName]		VARCHAR(75)		NOT NULL,
	'KEENA',								--[LastName]		VARCHAR(75)		NOT NULL,
	'USER 1 ADD 1',					--[Address1]		VARCHAR(150)	NOT NULL,
	--[Address2]		VARCHAR(150)	NULL,
	'OVERLAND PARK',					--[City]			VARCHAR(75)		NOT NULL,
	'KS',									--[State]			VARCHAR(2)		NOT NULL,
	'66213',								--[Zip]			VARCHAR(10)		NOT NULL,
	--[Telephone]		VARCHAR(15)		NULL,
	'mike.keena@thekeenas.com',	--[Email]			VARCHAR(75)		NOT NULL,	--LINK TO SECURITY TABLES
	'FOURTH GRADE TEACHER',			--[Question1]		VARCHAR(75)		NOT NULL,
	'PARKING LOT',						--[Answer1]		VARCHAR(75)		NOT NULL,
	'GREAT AUNTS MAIDEN NAME',		--[Question2]		VARCHAR(75)		NOT NULL,
	'PARKING LOT',						--[Answer2]		VARCHAR(75)		NOT NULL,
	'FIRST CATS NAME',				--[Question3]		VARCHAR(75)		NOT NULL,
	'PARKING LOT',						--[Answer3]		VARCHAR(75)		NOT NULL,
	'4423876511223344',				--[CCNumber]		VARCHAR(75)		NOT NULL,
	'CC 1 ADD 1',						--[CCAddress1]	VARCHAR(150)	NOT NULL,
	--[CCAddress2]	VARCHAR(150)	NULL,
	'OVERLAND PARK',					--[CCCity]		VARCHAR(75)		NOT NULL,
	'KS',									--[CCState]		VARCHAR(2)		NOT NULL,
	'66213'								--[CCZip]			VARCHAR(10)		NOT NULL,
);
SET IDENTITY_INSERT [dbo].[User] OFF
GO
-----------------------
SET IDENTITY_INSERT [dbo].[Project] ON
INSERT INTO [dbo].[Project] (
   [ID],
	[User],
	[Organization],
   [CreateDate],
	[Type],
	[Desc],
	[Comment],
	[Industry]
	) VALUES (
   1,					--[ID]			NUMERIC (18) IDENTITY (1, 1) NOT NULL PRIMARY KEY,
	1,					--[User]			NUMERIC (18)	NOT NULL	FOREIGN KEY REFERENCES dbo.[User](ID),
	1,					--[Organization]	NUMERIC (18)	NULL		FOREIGN KEY REFERENCES dbo.[Organization](ID),
    GETDATE(),		--[CreateDate]	DATETIME		NOT NULL,
	'TXT',			--[Type]			VARCHAR(25)		NOT NULL,
	'DESCRIPTION',	--[Desc]			VARCHAR(1000)	NOT NULL,
	'COMMENT',		--[Comment]		VARCHAR(500)	NOT NULL,
	'INDUSTRY'		--[Industry]		VARCHAR(500)	NOT NULL,
);
SET IDENTITY_INSERT [dbo].[Project] OFF
GO