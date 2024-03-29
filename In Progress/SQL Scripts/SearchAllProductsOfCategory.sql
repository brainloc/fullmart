USE [FullMart]
GO
/****** Object:  StoredProcedure [dbo].[GetAllProductsOfCategory]    Script Date: 02/13/2012 12:12:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		NVN
-- Create date: 13 Feb 2012
-- Description:	NO
-- =============================================
CREATE PROCEDURE [dbo].[SearchAllProductsOfCategory]
	@CatID		INT,
	@Key		NVARCHAR(150)
AS
BEGIN
	
	SET NOCOUNT ON;
	
	DECLARE @CatName		NVARCHAR(100)
	
	SELECT @CatName = [FullMart].[dbo].[Category].[Name]
	FROM [FullMart].[dbo].[Category]
	WHERE [FullMart].[dbo].[Category].[ID] = @CatID
  
	SELECT [ID],[Price],[Thumbnail],[Title],@CatName AS [CatName]
	FROM [FullMart].[dbo].[Product]
	WHERE ([FullMart].[dbo].[Product].[SubCategoryID] 
		  IN (
				SELECT [FullMart].[dbo].[SubCategory].[ID]
				FROM [FullMart].[dbo].[SubCategory]
				WHERE [FullMart].[dbo].[SubCategory].[CategoryID] = @CatID
			 )
		  ) AND
		  ([FullMart].[dbo].[Product].[Title] LIKE '%'+@Key+'%' )
	ORDER BY [CreatedDate] DESC
END

