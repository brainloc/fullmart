/****** Object:  StoredProcedure [dbo].[GetAllProductsOfCategoryBySubCatID]    Script Date: 02/13/2012 07:14:34 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GetAllProductsOfCategoryBySubCatID]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[GetAllProductsOfCategoryBySubCatID]
GO

/****** Object:  StoredProcedure [dbo].[GetAllProductsOfCategoryBySubCatID]    Script Date: 02/13/2012 07:14:34 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		BTN
-- Create date: 22 Jan 2012
-- Description:	NO
-- =============================================
CREATE PROCEDURE [dbo].[GetAllProductsOfCategoryBySubCatID]
	@SubCatID		INT
AS
BEGIN
	SET NOCOUNT ON;
	
	DECLARE @CatID	INT
  
	SELECT @CatID = [FullMart].[dbo].[SubCategory].[CategoryID]
	FROM [FullMart].[dbo].[SubCategory]
	WHERE [FullMart].[dbo].[SubCategory].[ID] = @SubCatID
  
	SELECT [ID],[Price],[Thumbnail],[Title]
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


