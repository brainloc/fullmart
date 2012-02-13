/****** Object:  StoredProcedure [dbo].[GetProductDetail]    Script Date: 02/13/2012 07:15:10 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GetProductDetail]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[GetProductDetail]
GO

/****** Object:  StoredProcedure [dbo].[GetProductDetail]    Script Date: 02/13/2012 07:15:10 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		BTN
-- Create date: 21 Jan 2012
-- Description:	NO
-- =============================================
CREATE PROCEDURE [dbo].[GetProductDetail]
	@ID			INT
AS
BEGIN	
	SET NOCOUNT ON;

	SELECT [FullMart].[dbo].[Product].[ID] AS [ProductID]
      ,[FullMart].[dbo].[Product].[SubCategoryID]
      ,[FullMart].[dbo].[Product].[Price]
      ,[FullMart].[dbo].[Product].[Picture]
      ,[FullMart].[dbo].[Product].[CreatedDate]
      ,[FullMart].[dbo].[Product].[PosterID]
      ,([FullMart].[dbo].[User].[fname] + ' ' + [FullMart].[dbo].[User].[lname]) AS [PosterName]
      ,[FullMart].[dbo].[User].[email]
	  ,[FullMart].[dbo].[User].[yahoo]
	  ,[FullMart].[dbo].[User].[mobile]
      ,[FullMart].[dbo].[Product].[Title]
      ,[FullMart].[dbo].[State].[StateName]
      ,[FullMart].[dbo].[ProductDetail].[ID]
      ,[FullMart].[dbo].[ProductDetail].[Content]
	FROM [FullMart].[dbo].[Product]
		,[FullMart].[dbo].[ProductDetail]
		,[FullMart].[dbo].[State]
		,[FullMart].[dbo].[User]
	WHERE [FullMart].[dbo].[Product].[ID] = @ID
			AND [FullMart].[dbo].[Product].[ID] = [FullMart].[dbo].[ProductDetail].[ProductID]
			AND [FullMart].[dbo].[State].[id] = [FullMart].[dbo].[Product].[State]
			AND [FullMart].[dbo].[User].[ID] = [FullMart].[dbo].[Product].[PosterID]
END

GO


