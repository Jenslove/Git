INSERT INTO dbo.Organization
(
    OrgName,
    CreateDate,
    Address1,
    Address2,
    City,
    State,
    Zip,
    Telephone,
    Email
)
VALUES
(   'ORG TEST 1',      -- OrgName - numeric(18, 0)
    GETDATE(), -- CreateDate - datetime
    'ADD1 One St',        -- Address1 - varchar(150)
    '',        -- Address2 - varchar(150)
    'City 1',        -- City - varchar(75)
    'S1',        -- State - varchar(2)
    '11111',        -- Zip - varchar(10)
    '',        -- Telephone - varchar(15)
    ''         -- Email - varchar(75)
);
INSERT INTO dbo.[User]
(
    Organization,
    CreateDate,
    UserID,
    Password,
    FirstName,
    MidName,
    LastName,
    Address1,
    Address2,
    City,
    State,
    Zip,
    Telephone,
    Email,
    Question1,
    Answer1,
    Question2,
    Answer2,
    Question3,
    Answer3,
    CCNumber,
    CCAddress1,
    CCAddress2,
    CCCity,
    CCState,
    CCZip
)
VALUES
(   1,      -- Organization - numeric(18, 0)
    GETDATE(), -- CreateDate - datetime
    'User1',        -- UserID - varchar(25)
    'NotPW',        -- Password - varchar(25)
    'FName 1',        -- FirstName - varchar(75)
    'M',        -- MidName - varchar(75)
    'LName 1',        -- LastName - varchar(75)
    'Add1',        -- Address1 - varchar(150)
    '',        -- Address2 - varchar(150)
    'City1',        -- City - varchar(75)
    'S1',        -- State - varchar(2)
    '11111',        -- Zip - varchar(10)
    '1111111111',        -- Telephone - varchar(15)
    'user1@one.com',        -- Email - varchar(75)
    'First son''s name',        -- Question1 - varchar(75)
    'AOne',        -- Answer1 - varchar(75)
    'Wife''s name',        -- Question2 - varchar(75)
    'Wife1',        -- Answer2 - varchar(75)
    'Dog',        -- Question3 - varchar(75)
    'Spot1',        -- Answer3 - varchar(75)
    '1234123412341234',        -- CCNumber - varchar(75)
    'Add1',        -- CCAddress1 - varchar(150)
    '',        -- CCAddress2 - varchar(150)
    'City1',        -- CCCity - varchar(75)
    'S1',        -- CCState - varchar(2)
    '11111'         -- CCZip - varchar(10)
);
INSERT INTO dbo.Project
(
    [User],
    Organization,
    CreateDate,
    Type,
    [Desc],
    Comment,
    Industry
)
VALUES
(   1,      -- User - numeric(18, 0)
    1,      -- Organization - numeric(18, 0)
    GETDATE(), -- CreateDate - datetime
    'Solar',        -- Type - varchar(25)
    'A new solar panel invention',        -- Desc - varchar(1000)
    'If panel lives up to expectation it should be 400% more efficient then anything sold today.',        -- Comment - varchar(500)
    'Utilities, Energy'         -- Industry - varchar(500)
);
INSERT INTO dbo.Thing
(
    [Project],
    [CreateDate],
	[Name],
    [Type],
    [Desc],
	[Size],
    [Comment],
    [Focus]
)
VALUES
(   1,      -- Project - numeric(18, 0)
    GETDATE(), -- CreateDate - datetime
	'Thing1.txt',
    'txt',        -- Type - varchar(25)
    'Text1',        -- Desc - varchar(1000)
	25,
    'Text Comment 1',        -- Comment - varchar(500)
    'Focus 1'         -- Focus - varchar(500)
);
INSERT INTO dbo.Version
(
    Thing,
    [CreateDate],
	[Name],
    [Type],
    [Desc],
	[Size],
    Comment,
    Item
)
VALUES
(   1,      -- Thing - numeric(18, 0)
    GETDATE(), -- CreateDate - datetime
	'TextVersion1.txt',
    'txt',        -- Type - varchar(25)
    'Version 1.0',        -- Desc - varchar(1000)
	7200834,
    'Whatever',        -- Comment - varchar(500)
    CAST('Well this should work, but who knows for sure?' AS VARBINARY(MAX))
);