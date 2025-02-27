﻿CREATE TABLE [FR].[Staging_StockReturn]
(
	[Staging_StockReturnId] INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
	[FileLoadId] INT NOT NULL,
	[tpn] BIGINT NOT NULL,
	[Product] NVARCHAR(500) NOT NULL,
	[date_e] DATE NOT NULL,
	[corr] NVARCHAR(500) NOT NULL,
	[KészletMennyiség] INT NOT NULL,
	[BeszEgységár] FLOAT NOT NULL,
	[ÉrtékOnktgAron] FLOAT NOT NULL,
	[date] DATE NOT NULL,
	[site] INT NOT NULL
)

GO

CREATE INDEX [IX_FR_Staging_StockReturn_FileLoadId] ON [FR].Staging_StockReturn (FileLoadId)

