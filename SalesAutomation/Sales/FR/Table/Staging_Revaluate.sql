﻿CREATE TABLE [FR].[Staging_Revaluate]
(
	[Staging_RevaluateId] INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
	[FileLoadId] INT NOT NULL,
	[tpn] BIGINT NOT NULL,
	[Product] NVARCHAR(500) NULL,
	[date] DATE NOT NULL,
	[Corrected by] NVARCHAR(500) NULL,
	[KészletMennyiség] INT NULL,
	[ÉrtékOnktgAron] FLOAT NULL,
	[Reason code] NVARCHAR(500) NULL,
	[site] INT NOT NULL
)

GO

CREATE INDEX [IX_FR_Staging_Revaluate_FileLoadId] ON [FR].[Staging_Revaluate] (FileLoadId)
