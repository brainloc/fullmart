/****** Object:  StoredProcedure [dbo].[GetUserInforbyID]    Script Date: 03/03/2012 18:06:16 ******/
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
	  SELECT [fname]
		  ,[lname]
		  ,[email]
		  ,[pass]
		  ,[bday]
		  ,[state]
		  ,[CU]
		  ,[class]
		  ,[createdate]
		  ,[yahoo]
		  ,[mobile]
		  ,[Web]
		  ,[Wishlist]
		  ,[UserName]
	  FROM [FullMart].[dbo].[User]
	  WHERE [ID] = @ID
END

GO


