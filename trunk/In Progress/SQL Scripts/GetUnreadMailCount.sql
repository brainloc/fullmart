/****** Object:  StoredProcedure [dbo].[GetUnreadMailCount]    Script Date: 03/05/2012 01:59:23 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GetUnreadMailCount]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[GetUnreadMailCount]
GO

/****** Object:  StoredProcedure [dbo].[GetUnreadMailCount]    Script Date: 03/05/2012 01:59:23 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		BTN
-- Create date: 05 March
-- Description:	NO
-- =============================================
CREATE PROCEDURE [dbo].[GetUnreadMailCount]
	@UserID		INT
AS
BEGIN

	SET NOCOUNT ON;
	
	DECLARE @Count		INT

	SELECT @Count = COUNT([FullMart].[dbo].[Cart].[ID])			  
	FROM	  [FullMart].[dbo].[Cart] JOIN [FullMart].[dbo].[Product]
			  ON [isRead] = 0
				 AND [isSubmited] = 1
				 AND [type] = 1 /*Sell*/
				 AND [FullMart].[dbo].[Cart].[ProductID] = [FullMart].[dbo].[Product].[ID]
				 AND [PosterID] = @UserID
				 JOIN [FullMart].[dbo].[User]
				 ON [FullMart].[dbo].[Cart].[Buyer] = [FullMart].[dbo].[User].[ID]
	
	RETURN @Count
END

GO


