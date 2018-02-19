USE [IA-DB-2];
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
   [CreateDate]	DATETIME			NOT NULL DEFAULT GETDATE(),
	[Address1]		VARCHAR(150)	NOT NULL,
	[Address2]		VARCHAR(150)	NULL,
	[City]			VARCHAR(75)		NOT NULL,
	[State]			VARCHAR(2)		NOT NULL,
	[Zip]				VARCHAR(10)		NOT NULL,
	[Telephone]		VARCHAR(15)		NULL,
	[Email]			VARCHAR(75)		NULL
);
GO
-----------------------
CREATE TABLE [dbo].[User] (
   [ID]				NUMERIC (18) IDENTITY (1, 1) NOT NULL PRIMARY KEY,
	[Organization]	NUMERIC (18)	NULL	FOREIGN KEY REFERENCES dbo.[Organization](ID),
   [CreateDate]	DATETIME			NOT NULL DEFAULT GETDATE(),
	[UserID]			VARCHAR(25)		NOT NULL,	--LINK TO SECURITY TABLES
	--[Password]		VARCHAR(25)		NOT NULL, --NOT NEEDED AS THIS IS CARRIED IN SECURITY TABLES
	[FirstName]		VARCHAR(75)		NOT NULL,
	[MidName]		VARCHAR(75)		NOT NULL,
	[LastName]		VARCHAR(75)		NOT NULL,
	[Address1]		VARCHAR(150)	NOT NULL,
	[Address2]		VARCHAR(150)	NULL,
	[City]			VARCHAR(75)		NOT NULL,
	[State]			VARCHAR(2)		NOT NULL,
	[Zip]				VARCHAR(10)		NOT NULL,
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
	[CCCity]			VARCHAR(75)		NOT NULL,
	[CCState]		VARCHAR(2)		NOT NULL,
	[CCZip]			VARCHAR(10)		NOT NULL
);
GO
-----------------------
CREATE TABLE [dbo].[Project] (
   [ID]				NUMERIC (18) IDENTITY (1, 1) NOT NULL PRIMARY KEY,
	[Archive]		BIT				NOT NULL DEFAULT 0,
	[Name]			VARCHAR(150)	NOT NULL,
	[User]			NUMERIC (18)	NOT NULL	FOREIGN KEY REFERENCES dbo.[User](ID),
	[Organization]	NUMERIC (18)	NULL		FOREIGN KEY REFERENCES dbo.[Organization](ID),
   [CreateDate]	DATETIME			NOT NULL DEFAULT GETDATE(),
	[Type]			VARCHAR(25)		NOT NULL,
	[Desc]			VARCHAR(1000)	NOT NULL,
	[Comment]		VARCHAR(500)	NOT NULL,
	[Industry]		VARCHAR(500)	NOT NULL
);
GO
-----------------------
CREATE TABLE [dbo].[Thing] (
   [ID]				NUMERIC (18) IDENTITY (1, 1) NOT NULL PRIMARY KEY,
	[Project]		NUMERIC (18)	NOT NULL FOREIGN KEY REFERENCES dbo.[Project](ID),
	[Archive]		BIT				NOT NULL DEFAULT 0,
   [CreateDate]	DATETIME			NOT NULL DEFAULT GETDATE(),
	[Name]			VARCHAR(150)	NOT NULL,
	[Type]			VARCHAR(25)		NOT NULL,
	[Size]			INT				NOT NULL,
	[Desc]			VARCHAR(1000)	NOT NULL,
	[Comment]		VARCHAR(500)	NOT NULL,
	[Focus]			VARCHAR(500)	NOT NULL
);
GO
-----------------------
CREATE TABLE [dbo].[Version] (
   [ID]				NUMERIC (18) IDENTITY (1, 1) NOT NULL PRIMARY KEY,
   [Thing]			NUMERIC (18)	NOT NULL FOREIGN KEY REFERENCES dbo.[Thing](ID),
	[Archive]		BIT				NOT NULL DEFAULT 0,
   [CreateDate]	DATETIME			NOT NULL DEFAULT GETDATE(),
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
	[Archive],
	[Name],
	[User],
	[Organization],
   [CreateDate],
	[Type],
	[Desc],
	[Comment],
	[Industry]
	) VALUES (
   1,					--[ID]			NUMERIC (18) IDENTITY (1, 1) NOT NULL PRIMARY KEY,
	0,					--Archive	False
	'Project 1',	--Name
	1,					--[User]			NUMERIC (18)	NOT NULL	FOREIGN KEY REFERENCES dbo.[User](ID),
	1,					--[Organization]	NUMERIC (18)	NULL		FOREIGN KEY REFERENCES dbo.[Organization](ID),
    GETDATE(),		--[CreateDate]	DATETIME		NOT NULL,
	'Proj1',			--[Type]			VARCHAR(25)		NOT NULL,
	'ProjDesc1',	--[Desc]			VARCHAR(1000)	NOT NULL,
	'ProjCom1',		--[Comment]		VARCHAR(500)	NOT NULL,
	'ProjInd1'		--[Industry]		VARCHAR(500)	NOT NULL,
);
INSERT INTO [dbo].[Project] (
   [ID],
	[Archive],
	[Name],
	[User],
	[Organization],
   [CreateDate],
	[Type],
	[Desc],
	[Comment],
	[Industry]
	) VALUES (
   2,					--[ID]			NUMERIC (18) IDENTITY (1, 1) NOT NULL PRIMARY KEY,
	0,					--Archive	False
	'Project 2',	--Name
	1,					--[User]			NUMERIC (18)	NOT NULL	FOREIGN KEY REFERENCES dbo.[User](ID),
	1,					--[Organization]	NUMERIC (18)	NULL		FOREIGN KEY REFERENCES dbo.[Organization](ID),
    GETDATE(),		--[CreateDate]	DATETIME		NOT NULL,
	'Proj2',			--[Type]			VARCHAR(25)		NOT NULL,
	'ProjDesc2',	--[Desc]			VARCHAR(1000)	NOT NULL,
	'ProjCom2',		--[Comment]		VARCHAR(500)	NOT NULL,
	'ProjInd2'		--[Industry]		VARCHAR(500)	NOT NULL,
);
INSERT INTO [dbo].[Project] (
   [ID],
	[Archive],
	[Name],
	[User],
	[Organization],
   [CreateDate],
	[Type],
	[Desc],
	[Comment],
	[Industry]
	) VALUES (
   3,					--[ID]			NUMERIC (18) IDENTITY (1, 1) NOT NULL PRIMARY KEY,
	1,					--Archive	False
	'Project 3',	--Name
	1,					--[User]			NUMERIC (18)	NOT NULL	FOREIGN KEY REFERENCES dbo.[User](ID),
	1,					--[Organization]	NUMERIC (18)	NULL		FOREIGN KEY REFERENCES dbo.[Organization](ID),
    GETDATE(),		--[CreateDate]	DATETIME		NOT NULL,
	'Proj3',			--[Type]			VARCHAR(25)		NOT NULL,
	'ProjDesc3',	--[Desc]			VARCHAR(1000)	NOT NULL,
	'ProjCom3',		--[Comment]		VARCHAR(500)	NOT NULL,
	'ProjInd3'		--[Industry]		VARCHAR(500)	NOT NULL,
);
SET IDENTITY_INSERT [dbo].[Project] OFF
GO
-----------------------
SET IDENTITY_INSERT [dbo].[Thing] ON
INSERT INTO [dbo].[Thing] (
   [ID],
	[Project],
	[Archive],
   [CreateDate],
	[Name],
	[Type],
	[Size],
	[Desc],
	[Comment],
	[Focus]
	) VALUES (
   1,					--[ID],
	1,					--[Project],
	0,					--Archive
   GETDATE(),		--[CreateDate],
	'Thing 1',		--[Name],
	'png',			--[Type],
	100,				--[Size],
	'Thing 1 Desc',--[Desc],
	'Thing 1 Com',	--[Comment],
	'Thing 1 Foc'	--[Focus]
);
INSERT INTO [dbo].[Thing] (
   [ID],
	[Project],
	[Archive],
   [CreateDate],
	[Name],
	[Type],
	[Size],
	[Desc],
	[Comment],
	[Focus]
	) VALUES (
   2,					--[ID],
	2,					--[Project],
	0,					--Archive
   GETDATE(),		--[CreateDate],
	'Thing 2',		--[Name],
	'png',			--[Type],
	200,				--[Size],
	'Thing 2 Desc',--[Desc],
	'Thing 2 Com',	--[Comment],
	'Thing 2 Foc'	--[Focus]
);
INSERT INTO [dbo].[Thing] (
   [ID],
	[Project],
	[Archive],
   [CreateDate],
	[Name],
	[Type],
	[Size],
	[Desc],
	[Comment],
	[Focus]
	) VALUES (
   3,					--[ID],
	2,					--[Project],
	0,					--Archive
   GETDATE(),		--[CreateDate],
	'Thing 3',		--[Name],
	'png',			--[Type],
	300,				--[Size],
	'Thing 3 Desc',--[Desc],
	'Thing 3 Com',	--[Comment],
	'Thing 3 Foc'	--[Focus]
);
INSERT INTO [dbo].[Thing] (
   [ID],
	[Project],
	[Archive],
   [CreateDate],
	[Name],
	[Type],
	[Size],
	[Desc],
	[Comment],
	[Focus]
	) VALUES (
   4,					--[ID],
	2,					--[Project],
	1,					--Archive
   GETDATE(),		--[CreateDate],
	'Thing 4',		--[Name],
	'png',			--[Type],
	400,				--[Size],
	'Thing 4 Desc',--[Desc],
	'Thing 4 Com',	--[Comment],
	'Thing 4 Foc'	--[Focus]
);
INSERT INTO [dbo].[Thing] (
   [ID],
	[Project],
	[Archive],
   [CreateDate],
	[Name],
	[Type],
	[Size],
	[Desc],
	[Comment],
	[Focus]
	) VALUES (
   5,					--[ID],
	3,					--[Project],
	1,					--Archive
   GETDATE(),		--[CreateDate],
	'Thing 5',		--[Name],
	'png',			--[Type],
	500,				--[Size],
	'Thing 5 Desc',--[Desc],
	'Thing 5 Com',	--[Comment],
	'Thing 5 Foc'	--[Focus]
);
SET IDENTITY_INSERT [dbo].[Thing] OFF
GO
-------------------------
SET IDENTITY_INSERT [dbo].[Version] ON
INSERT INTO [dbo].[Version] (
   [ID],
   [Thing],
	[Archive],
   [CreateDate],
	[DisplayName],
	[Name],
	[FullPath],
	[FileType],
	[Size],
	[Desc],
	[Comment],
	[Item]
	) VALUES (
   1,						--[ID],
   1,						--[Thing],
	0,						--Archive
   GETDATE(),			--[CreateDate],
	'Disp1',				--[DisplayName],
	'Name1',				--[Name],
	'\\down\path1',	--[FullPath],
	'type1',				--[FileType],
	100,					--[Size],
	'Ver Disc 1',		--[Desc],
	'Ver Com 1',		--[Comment],
	CONVERT(VARBINARY(MAX), 0xabcfedf)			--[Item]
);
INSERT INTO [dbo].[Version] (
   [ID],
   [Thing],
	[Archive],			
   [CreateDate],
	[DisplayName],
	[Name],
	[FullPath],
	[FileType],
	[Size],
	[Desc],
	[Comment],
	[Item]
	) VALUES (
   2,						--[ID],
   2,						--[Thing],
	0,						--Archive
   GETDATE(),			--[CreateDate],
	'Disp2',				--[DisplayName],
	'Name2',				--[Name],
	'\\down\path2',	--[FullPath],
	'type2',				--[FileType],
	200,					--[Size],
	'Ver Disc 2',		--[Desc],
	'Ver Com 2',		--[Comment],
	CONVERT(VARBINARY(MAX), 0xabcfedf)			--[Item]
);
INSERT INTO [dbo].[Version] (
   [ID],
   [Thing],
	[Archive],
   [CreateDate],
	[DisplayName],
	[Name],
	[FullPath],
	[FileType],
	[Size],
	[Desc],
	[Comment],
	[Item]
	) VALUES (
   3,						--[ID],
   2,						--[Thing],
	0,						--Archive
   GETDATE(),			--[CreateDate],
	'Disp3',				--[DisplayName],
	'Name3',				--[Name],
	'\\down\path3',	--[FullPath],
	'type3',				--[FileType],
	300,					--[Size],
	'Ver Disc 3',		--[Desc],
	'Ver Com 3',		--[Comment],
	CONVERT(VARBINARY(MAX), 0xabcfedf)			--[Item]
);
INSERT INTO [dbo].[Version] (
   [ID],
   [Thing],
	[Archive],
   [CreateDate],
	[DisplayName],
	[Name],
	[FullPath],
	[FileType],
	[Size],
	[Desc],
	[Comment],
	[Item]
	) VALUES (
   4,						--[ID],
   3,						--[Thing],
	0,						--Archive
   GETDATE(),			--[CreateDate],
	'Disp4',				--[DisplayName],
	'Name4',				--[Name],
	'\\down\path4',	--[FullPath],
	'type4',				--[FileType],
	400,					--[Size],
	'Ver Disc 4',		--[Desc],
	'Ver Com 4',		--[Comment],
	CONVERT(VARBINARY(MAX), 0xabcfedf)			--[Item]
);
INSERT INTO [dbo].[Version] (
   [ID],
   [Thing],
	[Archive],
   [CreateDate],
	[DisplayName],
	[Name],
	[FullPath],
	[FileType],
	[Size],
	[Desc],
	[Comment],
	[Item]
	) VALUES (
   5,						--[ID],
   3,						--[Thing],
	0,						--Archive
   GETDATE(),			--[CreateDate],
	'Disp5',				--[DisplayName],
	'Name5',				--[Name],
	'\\down\path5',	--[FullPath],
	'type5',				--[FileType],
	500,					--[Size],
	'Ver Disc 5',		--[Desc],
	'Ver Com 5',		--[Comment],
	CONVERT(VARBINARY(MAX), 0xabcfedf)			--[Item]
);
INSERT INTO [dbo].[Version] (
   [ID],
   [Thing],
	[Archive],
   [CreateDate],
	[DisplayName],
	[Name],
	[FullPath],
	[FileType],
	[Size],
	[Desc],
	[Comment],
	[Item]
	) VALUES (
   6,						--[ID],
   3,						--[Thing],
	1,						--Archive
   GETDATE(),			--[CreateDate],
	'Disp6',				--[DisplayName],
	'Name6',				--[Name],
	'\\down\path6',	--[FullPath],
	'type6',				--[FileType],
	600,					--[Size],
	'Ver Disc 6',		--[Desc],
	'Ver Com 6',		--[Comment],
	CONVERT(VARBINARY(MAX), 0xabcfedf)			--[Item]
);
INSERT INTO [dbo].[Version] (
   [ID],
   [Thing],
	[Archive],
   [CreateDate],
	[DisplayName],
	[Name],
	[FullPath],
	[FileType],
	[Size],
	[Desc],
	[Comment],
	[Item]
	) VALUES (
   7,						--[ID],
   4,						--[Thing],
	1,						--Archive
   GETDATE(),			--[CreateDate],
	'Disp7',				--[DisplayName],
	'Name7',				--[Name],
	'\\down\path7',	--[FullPath],
	'type7',				--[FileType],
	700,					--[Size],
	'Ver Disc 7',		--[Desc],
	'Ver Com 7',		--[Comment],
	CONVERT(VARBINARY(MAX), 0xabcfedf)			--[Item]
);
INSERT INTO [dbo].[Version] (
   [ID],
   [Thing],
	[Archive],
   [CreateDate],
	[DisplayName],
	[Name],
	[FullPath],
	[FileType],
	[Size],
	[Desc],
	[Comment],
	[Item]
	) VALUES (
   8,						--[ID],
   5,						--[Thing],
	1,						--Archive
   GETDATE(),			--[CreateDate],
	'Disp8',				--[DisplayName],
	'Name8',				--[Name],
	'\\down\path8',	--[FullPath],
	'type7',				--[FileType],
	800,					--[Size],
	'Ver Disc 8',		--[Desc],
	'Ver Com 8',		--[Comment],
	CONVERT(VARBINARY(MAX), 0xabcfedf)			--[Item]
);
SET IDENTITY_INSERT [dbo].[Version] OFF
GO
-----------------------
-----------------------
SELECT * FROM [Organization]
SELECT * FROM [User]
SELECT * FROM [Project]
SELECT * FROM [Thing]
SELECT * FROM [Version]
