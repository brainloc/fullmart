USE [FullMart]
GO
/****** Object:  StoredProcedure [dbo].[CheckLogin]    Script Date: 02/17/2012 15:39:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[CheckLogin] 
	@email			NVARCHAR(70),
	@pass			NVARCHAR(70)
AS
BEGIN
	
	SET NOCOUNT ON;
	
		SELECT * FROM [FullMart].[dbo].[User] WHERE ([email] = @email) AND ([pass] = @pass)OR ([UserName] = @email) AND ([pass] = @pass)
		
END