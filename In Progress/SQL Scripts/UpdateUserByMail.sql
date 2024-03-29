USE [FullMart]
GO
/****** Object:  StoredProcedure [dbo].[UpdateUser]    Script Date: 02/13/2012 21:50:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		NVN
-- Create date: 04 Jan, 2012
-- Description:	NO
-- =============================================
CREATE PROCEDURE [dbo].[UpdateUser] 
	@fname		NVARCHAR(50),
	@lname		NVARCHAR(50),
	@email		NVARCHAR(50),
	@pass		NVARCHAR(20),
	@bday		datetime,
	@state		NVARCHAR(100),
	@CU			NVARCHAR(100),
	@class		VARCHAR(10),
	@roleID		INT,
	@yahoo		NVARCHAR(50),
	@mobile		NVARCHAR(50),
	@ShopName	NVARCHAR(50),
	@web		NVARCHAR(50),
	@Wishlist	NVARCHAR(MAX)
	
AS
BEGIN
	
	SET NOCOUNT ON;
	
	IF NOT EXISTS(SELECT * FROM [FullMart].[dbo].[User] WHERE [email] = @email)
		RETURN 0
	ELSE
	BEGIN	
		UPDATE [FullMart].[dbo].[User]
   SET [fname] = @fname
      ,[lname] = @lname
      ,[pass] = case when @pass ='' then [pass]
						when @pass is null then [pass]
						when @pass <> '' then @pass
						end
      ,[bday] = @bday
      ,[state] = @state
      ,[CU] = @CU
      ,[class] = @class
      ,[roleID] = @roleID
      ,[yahoo] = @yahoo
      ,[mobile] = @mobile
      ,[Shopname] = @ShopName
      ,[Web] = @web
      ,[Wishlist] =case when @Wishlist ='' then [Web]
						when @Wishlist IS NULL then [Web]
						when @Wishlist <> '' then @Wishlist
						end
 WHERE [FullMart].[dbo].[User].[email]=@email
		RETURN 1
	END
END

