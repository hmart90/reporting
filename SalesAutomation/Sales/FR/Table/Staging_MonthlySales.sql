﻿CREATE TABLE FR.[Staging_MonthlySales]
(
	[Staging_MonthlySalesId] INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
	[FileLoadId] INT NOT NULL,
	[Div] INT NOT NULL,
	[Dep] INT NOT NULL,
	[Sec] INT NOT NULL,
	[Grp] INT NOT NULL,
	[Sgrp] INT NOT NULL,
	[TPN] BIGINT NOT NULL,	
	[Description] NVARCHAR(500) NOT NULL,
	[Értékesített készlet (db)] INT NOT NULL,
	[Beszerzési Egységár] FLOAT NOT NULL,
	[Értékesített készlet (érték)] FLOAT NOT NULL,
	[Árrés] FLOAT NOT NULL,
	[Nettó Árbevétel] FLOAT NOT NULL,
	[Bruttó Árbevétel] INT NOT NULL,
	[Dátum] DATE NOT NULL,
	[Site] INT NOT NULL
)

GO

CREATE INDEX [IX_FR_Staging_MonthlySales_FileLoadId] ON [FR].Staging_MonthlySales (FileLoadId)
