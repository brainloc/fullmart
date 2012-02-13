/****** Object:  StoredProcedure [dbo].[GetManagingProductList]    Script Date: 02/13/2012 07:14:54 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GetManagingProductList]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[GetManagingProductList]
GO

/****** Object:  StoredProcedure [dbo].[GetManagingProductList]    Script Date: 02/13/2012 07:14:54 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		BTN
-- Create date: 12 Feb 2012
-- Description:	NO
-- =============================================
CREATE PROCEDURE [dbo].[GetManagingProductList]
	@ProductID				NVARCHAR(20),
	@Email					NVARCHAR(50),
	@CatID					NVARCHAR(10),
	@SubcatID				NVARCHAR(10) = NULL
AS
BEGIN	
	SET NOCOUNT ON;
	
    SELECT [FullMart].[dbo].[Product].[ID]
	  ,[Title]
	  ,(CONVERT(NVARCHAR(2),DATEPART(DAY,[CreatedDate]))+'/'+CONVERT(NVARCHAR(2),DATEPART(MONTH,[CreatedDate]))+'/'+CONVERT(NVARCHAR(4),DATEPART(YEAR,[CreatedDate]))) AS [CreatedDate] 
	  ,[email]     
      ,[Price]
      ,[SubCategoryID]
      ,[FullMart].[dbo].[SubCategory].[Name]
      ,[Outstanding]
	FROM [FullMart].[dbo].[Product], [FullMart].[dbo].[User],[FullMart].[dbo].[SubCategory]
	WHERE [FullMart].[dbo].[Product].[PosterID]=[FullMart].[dbo].[User].[ID]
		  AND [FullMart].[dbo].[SubCategory].[ID] = [SubCategoryID]
		  /*AND ([FullMart].[dbo].[Product].[ID] = @intProductID
				OR @ProductID IS NULL)
		  AND ([email] = @Email
				OR @Email LIKE '%Enter Email%')
		  AND (@SubcatID = ''
				OR [SubCategoryID] = @intSubcatID)*/
END

GO


