﻿CREATE PROCEDURE [TMPL].[GetTemplateEventDate]
	@Path as NVARCHAR(1000)
AS

DECLARE @FileLoadId INT = (SELECT FileLoadId FROM dbo.FileLoad WHERE Path = @Path AND IsLoaded = 0);
DECLARE @SQL AS NVARCHAR(MAX);
DECLARE @StartDate DATE;
DECLARE @EndDate DATE;

TRUNCATE TABLE dbo.TempFileDates

SET @SQL = '
INSERT INTO dbo.TempFileDates
           (EventDate)
SELECT 
           *

FROM OPENROWSET(
	''Microsoft.ACE.OLEDB.12.0''
	,''Excel 12.0;Database=' + @Path + ';HDR=NO''
	,''SELECT * FROM [rendelés$I1:I1]'')';

EXEC (@SQL)

SET @StartDate = (SELECT MIN(EventDate) FROM dbo.TempFileDates)
SET @EndDate = (SELECT MAX(EventDate) FROM dbo.TempFileDates)

UPDATE [dbo].[FileLoad]
   SET [StartDate] = @StartDate
      ,[EndDate] = @EndDate
 WHERE [FileLoadId] = @FileLoadId

RETURN 0
