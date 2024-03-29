USE [FullMart]
GO
/****** Object:  StoredProcedure [dbo].[CreateUser]    Script Date: 02/18/2012 15:17:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		NVN
-- Create date: 04 Jan, 2012
-- Description:	NO
-- =============================================
CREATE PROCEDURE [dbo].[CreateUser] 
	@username	NVARCHAR(70),
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
	@web		NVARCHAR(50),
	@Wishlist	NVARCHAR(MAX)
	
AS
BEGIN
	
	SET NOCOUNT ON;
	
	IF EXISTS(SELECT * FROM [FullMart].[dbo].[User] WHERE [email] = @email OR [UserName]=@username )
		RETURN 0
	ELSE
	BEGIN	
		INSERT INTO [FullMart].[dbo].[User]
			   (
			[UserName]
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
           ,[Web]
           ,[Wishlist]
           ,[isActive])
		 VALUES
			   (@username,@fname,@lname,@email,@pass,@bday,@state,@CU,@class,GETUTCDATE(),@roleID,@yahoo,@mobile,@web,@Wishlist,1)
		RETURN 1
	END
END

