/****** Object:  StoredProcedure [dbo].[CreateUser]    Script Date: 01/05/2012 20:45:58 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CreateShop]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[CreateShop]
GO

USE [FullMart]
GO

/****** Object:  StoredProcedure [dbo].[CreateShop]    Script Date: 01/05/2012 20:45:58 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[CreateShop] 
	@Shopname	NVARCHAR(100),
	@Fname		NVARCHAR(50),
	@Lname		NVARCHAR(50),
	@Email		VARCHAR(50),
	@Pass		NVARCHAR(50),
	@Web		NVARCHAR(50),
	@state		NVARCHAR(100),
	@roleID		INT
AS
BEGIN
	
	SET NOCOUNT ON;
	
	IF EXISTS(SELECT * FROM [FullMart].[dbo].[Shop] WHERE [email] = @email)
		RETURN 0
	ELSE
	BEGIN	
		INSERT INTO [FullMart].[dbo].[Shop]
			   ([Shopname],[Fname],[Lname],[Pass],[Email],[Web],[State],[Createdate],[roleID])
		 VALUES	
			   (@Shopname,@Fname,@Lname,@Pass,@Email,@Web,@state,GETUTCDATE(),@roleID)
		RETURN 1
	END
END

GO


