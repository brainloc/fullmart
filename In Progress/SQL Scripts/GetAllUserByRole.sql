USE [FullMart]
GO
/****** Object:  StoredProcedure [dbo].[GetAllUserByRole]    Script Date: 02/13/2012 20:11:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		NVN
-- Create date: 12 Feb 2012
-- Description:	NO
-- =============================================
CREATE PROCEDURE [dbo].[SearchAllUserByRole]
	@roleID		INT
AS
BEGIN
	
	SET NOCOUNT ON;
		
	SELECT [ID]
      ,[fname]
      ,[lname]
      ,[email]
      ,[pass]
      ,(CONVERT(NVARCHAR(2),DATEPART(DAY,[bday]))+'/'+CONVERT(NVARCHAR(2),DATEPART(MONTH,[bday]))+'/'+CONVERT(NVARCHAR(4),DATEPART(YEAR,[bday]))) AS [bday] 
      ,[state]
      ,[CU]
      ,[class]
      ,(CONVERT(NVARCHAR(2),DATEPART(DAY,[createdate]))+'/'+CONVERT(NVARCHAR(2),DATEPART(MONTH,[createdate]))+'/'+CONVERT(NVARCHAR(4),DATEPART(YEAR,[createdate]))) AS [createdate] 
      ,[roleID]
      ,[yahoo]
      ,[mobile]
      ,[ShopID]
      ,[Shopname]
      ,[Web]
      ,[Wishlist]
      ,[isActive]
  FROM [FullMart].[dbo].[User]
  Where [FullMart].[dbo].[User].[roleID]=@roleID
  ORDER BY [createdate] DESC
END

