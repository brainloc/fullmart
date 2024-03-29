/****** Object:  StoredProcedure [dbo].[GetAllUserByRole]    Script Date: 03/04/2012 18:58:26 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GetAllUserByRole]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[GetAllUserByRole]
GO

USE [FullMart]
GO

/****** Object:  StoredProcedure [dbo].[GetAllUserByRole]    Script Date: 03/04/2012 18:58:26 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		NVN
-- Create date: 12 Feb 2012
-- Description:	NO
-- =============================================
CREATE PROCEDURE [dbo].[GetAllUserByRole]
	@roleID		INT
AS
BEGIN
	SET NOCOUNT ON;
		
	SELECT [dbo].[User].[ID] AS [ID]
      ,[fname]
      ,[lname]
      ,[email]
      ,[pass]
      ,(CONVERT(NVARCHAR(2),DATEPART(DAY,[bday]))+'/'+CONVERT(NVARCHAR(2),DATEPART(MONTH,[bday]))+'/'+CONVERT(NVARCHAR(4),DATEPART(YEAR,[bday]))) AS [bday] 
      ,[state]
      ,[CU]
      ,[class]
      ,(CONVERT(NVARCHAR(2),DATEPART(DAY,[dbo].[User].[createdate]))+'/'+CONVERT(NVARCHAR(2),DATEPART(MONTH,[dbo].[User].[createdate]))+'/'+CONVERT(NVARCHAR(4),DATEPART(YEAR,[dbo].[User].[createdate]))) AS [createdate] 
      ,[roleID]
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
								ON [FullMart].[dbo].[Shop].[ID] = [FullMart].[dbo].[User].[ShopID]
  Where ([FullMart].[dbo].[User].[roleID]=@roleID)
		AND ([FullMart].[dbo].[User].[isActive]<>0)
		AND ([dbo].[User].[isBanned]=0)
  ORDER BY [createdate] DESC
END

GO


