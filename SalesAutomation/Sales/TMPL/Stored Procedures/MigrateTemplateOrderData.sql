﻿CREATE PROCEDURE [TMPL].[MigrateTemplateOrderData]
	@Path as NVARCHAR(1000),
	@OrderId AS INT

AS
DECLARE @FileLoadId INT = (SELECT FileLoadId FROM dbo.FileLoad WHERE [Path] = @Path AND IsLoaded = 0);

INSERT INTO TMPL.OrderProductCount
		(ProductId,
		OrderId,
		Number,
		[Min],
		[Max],
		Staging_OrderProductCountId)

SELECT p.ProductId
		,@OrderId
		,[Quantity] AS Number
		,[Min]
		,[Max]
		,sto.Staging_OrderProductCountId
FROM TMPL.[Staging_OrderProductCount] as sto
INNER JOIN dbo.Product as p ON p.TPN = sto.TPN
WHERE [FileLoadId] = @FileLoadId

RETURN 0
