/****** Object:  StoredProcedure [dbo].[GetAllProductsInSubCategory]    Script Date: 02/13/2012 07:14:02 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GetAllProductsInSubCategory]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[GetAllProductsInSubCategory]
GO

/****** Object:  StoredProcedure [dbo].[GetAllProductsInSubCategory]    Script Date: 02/13/2012 07:14:02 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		BTN
-- Create date: 12 Feb 2012
-- Description:	NO
-- =============================================
CREATE PROCEDURE [dbo].[GetAllProductsInSubCategory]
	@SubcatID		INT
AS
BEGIN
	
	SET NOCOUNT ON;
  
	DECLARE @SubcatName		NVARCHAR(100),
			@CatName			NVARCHAR(100)
			
	SELECT @SubcatName = [FullMart].[dbo].[SubCategory].[Name]
	FROM [FullMart].[dbo].[SubCategory]
	WHERE [ID] = @SubcatID
	
	SELECT @CatName = [FullMart].[dbo].[Category].[Name]
	FROM [FullMart].[dbo].[Category]
	WHERE [FullMart].[dbo].[Category].[ID] = (SELECT [CategoryID]
											  FROM [FullMart].[dbo].[SubCategory]
											  WHERE [FullMart].[dbo].[SubCategory].[ID] = @SubcatID)
	
	SELECT [ID],[Price],[Thumbnail],[Title]
			,@SubcatName AS [SubcatName], @CatName AS [CatName]
	FROM [FullMart].[dbo].[Product]
	WHERE [FullMart].[dbo].[Product].[SubCategoryID] = @SubcatID		  
	ORDER BY [CreatedDate] DESC
END

GO


