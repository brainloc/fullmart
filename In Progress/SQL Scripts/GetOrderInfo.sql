SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		BTN
-- Create date: 26 Feb 2012
-- Description:	NO
-- =============================================
CREATE PROCEDURE GetOrderInfo
	@OrderID		INT
AS
BEGIN

	SET NOCOUNT ON;
	
	SELECT [RecipientsEmail]
		  ,[Title]
		  ,[ProductID]
		  ,[Amount] 
		  ,[MoreDetail]      
	FROM [FullMart].[dbo].[Cart],[FullMart].[dbo].[Product]
	WHERE [FullMart].[dbo].[Cart].[ID] = @OrderID
		  AND [FullMart].[dbo].[Cart].[ProductID] = [FullMart].[dbo].[Product].[ID]
END
GO
