/****** Object:  StoredProcedure [dbo].[CreateUser]    Script Date: 01/05/2012 20:45:58 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CreateUser]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[CreateUser]
GO

USE [FullMart]
GO

/****** Object:  StoredProcedure [dbo].[CreateUser]    Script Date: 01/05/2012 20:45:58 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		BTN
-- Create date: 04 Jan, 2012
-- Description:	NO
-- =============================================
CREATE PROCEDURE [dbo].[CreateUser] 
	@username		NVARCHAR(20),
	@password		NVARCHAR(100),
	@email			NVARCHAR(70),
	@yahooID		NVARCHAR(20),
	@mobile			NVARCHAR(15),
	@roleID			INT = 3
AS
BEGIN
	
	SET NOCOUNT ON;
	
	IF EXISTS(SELECT * FROM [FullMart].[dbo].[User] WHERE [Username] = @username)
		RETURN 0
	ELSE
	BEGIN	
		INSERT INTO [FullMart].[dbo].[User]
			   ([Username]
			   ,[Password]
			   ,[RoleID]
			   ,[Email]
			   ,[Yahoo]
			   ,[Mobile]
			   ,[CreatedDate])
		 VALUES
			   (@username
			   ,@password
			   ,@roleID
			   ,@email
			   ,@yahooID
			   ,@mobile
			   ,GETUTCDATE()
			   )
		RETURN 1
	END
END

GO


