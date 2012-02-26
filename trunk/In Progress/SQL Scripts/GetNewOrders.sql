/****** Object:  StoredProcedure [dbo].[GetNewOrders]    Script Date: 02/26/2012 23:59:02 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GetNewOrders]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[GetNewOrders]
GO

/****** Object:  StoredProcedure [dbo].[GetNewOrders]    Script Date: 02/26/2012 23:59:02 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		BTN
-- Create date: 26 Feb 2012
-- Description:	NO
-- =============================================
CREATE PROCEDURE [dbo].[GetNewOrders]
	@UserID			INT
AS
BEGIN

	SET NOCOUNT ON;
	
	WITH CartInfo AS
	(
	  SELECT [FullMart].[dbo].[Cart].[ID]
			  ,[ProductID]
			  ,[email]
			  ,[Amount]
			  ,[Buyer]
			  ,[FullMart].[dbo].[Cart].[CreateDate]
			  ,[MoreDetail]
			  ,[isRead]
			  ,[RecipientsName]
			  ,[RecipientsPhone]
			  ,[RecipientsAddress]
			  ,[RecipientsEmail]
			  ,[isSubmited]
	  FROM	  [FullMart].[dbo].[Cart] JOIN [FullMart].[dbo].[Product]
			  ON /*[isRead] = 0
				 AND */[isSubmited] = 1
				 AND [type] = 1 /*Sell*/
				 AND [FullMart].[dbo].[Cart].[ProductID] = [FullMart].[dbo].[Product].[ID]
				 AND [PosterID] = @UserID
				 JOIN [FullMart].[dbo].[User]
				 ON [FullMart].[dbo].[Cart].[Buyer] = [FullMart].[dbo].[User].[ID]
	)
	SELECT * FROM CartInfo	
END

GO


