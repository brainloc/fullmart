USE [FullMart]
GO
/****** Object:  StoredProcedure [dbo].[CheckUser]    Script Date: 02/18/2012 13:02:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create PROCEDURE [dbo].[CheckUser1] 
	@email			NVARCHAR(70),
	@username		NVARCHAR(70)
AS
BEGIN
	
	SET NOCOUNT ON;
	
	SELECT * FROM [FullMart].[dbo].[User] WHERE ([email] = @email) OR ([UserName]=@username)
END

