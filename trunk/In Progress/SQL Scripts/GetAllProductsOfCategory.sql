/****** Object:  StoredProcedure [dbo].[GetAllProductsOfCategory]    Script Date: 02/13/2012 07:14:17 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GetAllProductsOfCategory]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[GetAllProductsOfCategory]
GO

/****** Object:  StoredProcedure [dbo].[GetAllProductsOfCategory]    Script Date: 02/13/2012 07:14:17 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		BTN
-- Create date: 12 Feb 2012
-- Description:	NO
-- =============================================
CREATE PROCEDURE [dbo].[GetAllProductsOfCategory]
	@CatID		INT
AS
BEGIN
	
	SET NOCOUNT ON;
	
	DECLARE @CatName		NVARCHAR(100)
	
	SELECT @CatName = [FullMart].[dbo].[Category].[Name]
	FROM [FullMart].[dbo].[Category]
	WHERE [FullMart].[dbo].[Category].[ID] = @CatID
  
	SELECT [ID],[Price],[Thumbnail],[Title],@CatName AS [CatName]
	FROM [FullMart].[dbo].[Product]
	WHERE [FullMart].[dbo].[Product].[SubCategoryID] 
		  IN (
				SELECT [FullMart].[dbo].[SubCategory].[ID]
				FROM [FullMart].[dbo].[SubCategory]
				WHERE [FullMart].[dbo].[SubCategory].[CategoryID] = @CatID
			 )
	ORDER BY [CreatedDate] DESC
END

GO


