/****** Object:  StoredProcedure [dbo].[GetManagingProductList]    Script Date: 03/03/2012 10:18:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		BTN
-- Create date: 12 Feb 2012
-- Description:	NO
-- =============================================
ALTER PROCEDURE [dbo].[GetManagingProductList]
	@ProductID				NVARCHAR(20),
	@Email					NVARCHAR(50),
	@CatID					NVARCHAR(10),
	@SubcatID				NVARCHAR(10) = NULL,
	@SortBy					NVARCHAR(30) = NULL
AS
BEGIN	
	SET NOCOUNT ON;
	
	DECLARE @intProductID		INT
	
	IF(@ProductID <> 'Search by Product ID')
		BEGIN
			SET @intProductID = CONVERT(INT, @ProductID)
		END	
	
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
		  AND ([FullMart].[dbo].[Product].[ID] = @intProductID
				OR @ProductID = 'Search by Product ID')
		  AND ([email] = @Email
				OR @Email LIKE 'Enter Email to search user%')
		  AND ([SubCategoryID] = @SubcatID
				OR @SubcatID = -9999)	
	ORDER BY CASE		 @SortBy 
					WHEN 'Title'			THEN [Title]
					WHEN 'CreatedDate'		THEN [CreatedDate]
					WHEN 'email'			THEN [email]
					WHEN 'Price'			THEN [Price]
					WHEN 'SubCategoryID'	THEN [FullMart].[dbo].[SubCategory].[Name]					
					ELSE [FullMart].[dbo].[Product].[ID]
			 END
END
