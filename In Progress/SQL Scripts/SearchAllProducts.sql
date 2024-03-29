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
CREATE PROCEDURE [dbo].[SearchAllProducts]
	@Key		NVARCHAR(150)
AS
BEGIN
	
	SET NOCOUNT ON;
	
	SELECT [ID],[Price],[Thumbnail],[Title]
	FROM [FullMart].[dbo].[Product]
	WHERE [FullMart].[dbo].[Product].[Title] LIKE '%'+@Key+'%' 
	ORDER BY [CreatedDate] DESC
END

