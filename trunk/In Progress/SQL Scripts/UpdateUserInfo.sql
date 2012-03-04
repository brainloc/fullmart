/****** Object:  StoredProcedure [dbo].[UpdateUserInfo]    Script Date: 03/04/2012 08:53:07 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UpdateUserInfo]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[UpdateUserInfo]
GO

/****** Object:  StoredProcedure [dbo].[UpdateUserInfo]    Script Date: 03/04/2012 08:53:07 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		BTN
-- Create date: 03 March
-- Description:	NO
-- =============================================
CREATE PROCEDURE [dbo].[UpdateUserInfo]
	@ID			INT,	
	@fname		NVARCHAR(50),
	@lname		NVARCHAR(50),
	@email		NVARCHAR(50),
	@pass		NVARCHAR(20),
	@bday		datetime,
	@state		NVARCHAR(100),
	@CU			NVARCHAR(100),
	@class		VARCHAR(10),	
	@yahoo		NVARCHAR(50),
	@mobile		NVARCHAR(50),
	@web		NVARCHAR(50),
	@Wishlist	NVARCHAR(MAX)
AS
BEGIN
	
	SET NOCOUNT ON;

	IF (EXISTS(SELECT * FROM [FullMart].[dbo].[User] WHERE [email] = @email AND [ID] <> @ID))
		RETURN 0
	ELSE
	BEGIN
		UPDATE [FullMart].[dbo].[User]
		SET [fname] = @fname
		  ,[lname] = @lname
		  ,[email] = @email
		  ,[pass] = @pass
		  ,[bday] = @bday
		  ,[state] = @state
		  ,[CU] = @CU	
		  ,[class] = @class
		  ,[yahoo] = @yahoo
		  ,[mobile] = @mobile
		  ,[Web] = @web
		  ,[Wishlist] = @Wishlist      
		WHERE [ID] = @ID
		RETURN 1
	END
END

GO


