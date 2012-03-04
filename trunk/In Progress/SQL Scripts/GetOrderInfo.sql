/****** Object:  StoredProcedure [dbo].[GetOrderInfo]    Script Date: 03/05/2012 02:47:14 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GetOrderInfo]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[GetOrderInfo]
GO

/****** Object:  StoredProcedure [dbo].[GetOrderInfo]    Script Date: 03/05/2012 02:47:14 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		BTN
-- Create date: 26 Feb 2012
-- Description:	NO
-- =============================================
CREATE PROCEDURE [dbo].[GetOrderInfo]
	@OrderID		INT
AS
BEGIN

	SET NOCOUNT ON;
	
	DECLARE @CarridgeReturn		NVARCHAR(20)
	
	SET @CarridgeReturn = '\r\n'
	
	SELECT [RecipientsEmail]
		  ,[Title]
		  ,[ProductID]
		  ,[Amount] 
		  ,([RecipientsName] + @CarridgeReturn + [RecipientsPhone] + @CarridgeReturn + [RecipientsAddress]+ @CarridgeReturn + [MoreDetail]) AS [MoreDetail]       
	FROM [FullMart].[dbo].[Cart],[FullMart].[dbo].[Product]
	WHERE [FullMart].[dbo].[Cart].[ID] = @OrderID
		  AND [FullMart].[dbo].[Cart].[ProductID] = [FullMart].[dbo].[Product].[ID]
END






GO


