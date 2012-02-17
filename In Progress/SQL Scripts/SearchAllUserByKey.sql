SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		NVN
-- Create date: 12 Feb 2012
-- Description:	NO
-- =============================================
CREATE PROCEDURE [dbo].[SearchAllUserByKey]
	@key		nvarchar(200)
AS
BEGIN
	
	SET NOCOUNT ON;
		
	SELECT DISTINCT [FullMart].[dbo].[User].[ID]
      ,[fname]
      ,[lname]
      ,[email]
      ,[pass]
      ,(CONVERT(NVARCHAR(2),DATEPART(DAY,[bday]))+'/'+CONVERT(NVARCHAR(2),DATEPART(MONTH,[bday]))+'/'+CONVERT(NVARCHAR(4),DATEPART(YEAR,[bday]))) AS [bday] 
      ,[state]
      ,[CU]
      ,[class]
      ,(CONVERT(NVARCHAR(2),DATEPART(DAY,[createdate]))+'/'+CONVERT(NVARCHAR(2),DATEPART(MONTH,[createdate]))+'/'+CONVERT(NVARCHAR(4),DATEPART(YEAR,[createdate]))) AS [createdate] 
      ,[FullMart].[dbo].[Role].[Name] AS [roleID]
      ,[yahoo]
      ,[mobile]
      ,[ShopID]
      ,[Shopname]
      ,[Web]
      ,[Wishlist]
      ,[isActive]
  FROM [FullMart].[dbo].[User],[FullMart].[dbo].[Role]
  Where ([FullMart].[dbo].[User].[email] like '%'+@key+'%' OR [FullMart].[dbo].[User].[fname] like '%'+@key+'%' OR [FullMart].[dbo].[User].lname like '%'+@key+'%') AND ([FullMart].[dbo].[User].[roleID]=[FullMart].[dbo].[Role].[ID])
  ORDER BY [createdate] DESC
END

