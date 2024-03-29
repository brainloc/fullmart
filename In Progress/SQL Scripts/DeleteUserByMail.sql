/****** Object:  StoredProcedure [dbo].[CreateUser]    Script Date: 02/13/2012 21:19:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		BTN
-- Create date: 04 Jan, 2012
-- Description:	NO
-- =============================================
Create PROCEDURE [dbo].[DeleteUser] 
	@email		NVARCHAR(50)
AS
BEGIN
	
	SET NOCOUNT ON;
	
	IF NOT EXISTS(SELECT * FROM [FullMart].[dbo].[User] WHERE [email] = @email)
		RETURN 0
	ELSE
	BEGIN	
		UPDATE [FullMart].[dbo].[User]
   SET [isActive] = 0
 WHERE [FullMart].[dbo].[User].[email]=@email
		RETURN 1
	END
END

