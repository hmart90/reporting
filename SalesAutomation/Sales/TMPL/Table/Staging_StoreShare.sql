﻿CREATE TABLE [TMPL].[Staging_StoreShare]
(
	[Staging_StoreShareId] INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
	[StoreId] INT NOT NULL,
	[Share] FLOAT NOT NULL,
	[Stock] INT NOT NULL DEFAULT 0
)
