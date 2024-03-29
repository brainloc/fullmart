/****** Object:  StoredProcedure [dbo].[SearchAllUserByKey]    Script Date: 03/04/2012 18:58:10 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SearchAllUserByKey]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SearchAllUserByKey]
GO

USE [FullMart]
GO

/****** Object:  StoredProcedure [dbo].[SearchAllUserByKey]    Script Date: 03/04/2012 18:58:10 ******/
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
		
	SELECT DISTINCT [dbo].[User].[ID] AS [ID]
      ,[fname]
      ,[lname]
      ,[email]
      ,[pass]
      ,(CONVERT(NVARCHAR(2),DATEPART(DAY,[bday]))+'/'+CONVERT(NVARCHAR(2),DATEPART(MONTH,[bday]))+'/'+CONVERT(NVARCHAR(4),DATEPART(YEAR,[bday]))) AS [bday] 
      ,[state]
      ,[CU]
      ,[class]
      ,(CONVERT(NVARCHAR(2),DATEPART(DAY,[dbo].[User].[createdate]))+'/'+CONVERT(NVARCHAR(2),DATEPART(MONTH,[dbo].[User].[createdate]))+'/'+CONVERT(NVARCHAR(4),DATEPART(YEAR,[dbo].[User].[createdate]))) AS [createdate] 
      ,[FullMart].[dbo].[Role].[Name] AS [roleID]
      ,[yahoo]
      ,[mobile]
      ,[User].[ShopID]
      ,[dbo].[Shop].[ShopName]
      ,[Web]
      ,[Wishlist]
      ,[dbo].[User].[isActive]
      ,[User].[UserName]
      ,[User].[isBanned]
  FROM [FullMart].[dbo].[Shop] RIGHT JOIN [FullMart].[dbo].[User] 
								ON [FullMart].[dbo].[Shop].[ID] = [FullMart].[dbo].[User].[ShopID],[FullMart].[dbo].[Role]
  Where ([FullMart].[dbo].[User].[email] like '%'+@key+'%' OR [FullMart].[dbo].[User].[fname] like '%'+@key+'%' OR [FullMart].[dbo].[User].lname like '%'+@key+'%') AND ([FullMart].[dbo].[User].[roleID]=[FullMart].[dbo].[Role].[ID])
  ORDER BY [createdate] DESC
END

GO


