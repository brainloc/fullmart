/****** Object:  StoredProcedure [dbo].[GetUserInforbyID]    Script Date: 03/03/2012 18:14:43 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GetUserInforbyID]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[GetUserInforbyID]
GO

/****** Object:  StoredProcedure [dbo].[GetUserInforbyID]    Script Date: 03/03/2012 18:14:43 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		NVN
-- Create date: 12 Feb 2012
-- Description:	NO
-- =============================================
CREATE PROCEDURE [dbo].[GetUserInforbyID]
	@ID		INT
AS
BEGIN
	
	  SET NOCOUNT ON;	  
	  SELECT [ID]
      ,[fname]
      ,[lname]
      ,[email]
      ,[pass]
      ,[bday]
      ,[state]
      ,[CU]
      ,[class]
      ,[createdate]
      ,[roleID]
      ,[yahoo]
      ,[mobile]
      ,[ShopID]
      ,[Web]
      ,[Wishlist]
      ,[isActive]
      ,[UserName]
      ,[isBanned]
    FROM [FullMart].[dbo].[User]
	WHERE [ID] = @ID
END


GO


