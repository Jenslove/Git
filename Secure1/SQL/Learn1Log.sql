USE [IA-DB-1]
GO

SELECT	* FROM dbo.[Log]
SELECT * FROM dbo.AspNetUsers

INSERT INTO dbo.Log
(
    Message,
    MessageTemplate,
    Level,
    TimeStamp,
    Exception,
    Properties,
    LogEvent
)
VALUES
(   N'Manual',                 -- Message - nvarchar(max)
    N'Manual',                 -- MessageTemplate - nvarchar(max)
    N'1',                 -- Level - nvarchar(128)
    SYSDATETIMEOFFSET(), -- TimeStamp - datetimeoffset(7)
    N'exc',                 -- Exception - nvarchar(max)
    NULL,                -- Properties - xml
    N'event'                  -- LogEvent - nvarchar(max)
)