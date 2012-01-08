IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CheckLogin]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[CheckLogin]
GO

USE [FullMart]
GO

/****** Object:  StoredProcedure [dbo].[CheckLogin]    Script Date: 01/05/2012 20:45:58 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CheckLogin] 
	@email			NVARCHAR(70),
	@pass			NVARCHAR(70)
AS
BEGIN
	
	SET NOCOUNT ON;
	
	IF EXISTS(SELECT * FROM [FullMart].[dbo].[User] WHERE ([email] = @email) AND ([pass] = @pass))
		SELECT * FROM [FullMart].[dbo].[User] WHERE ([email] = @email) AND ([pass] = @pass)
	ELSE
		IF EXISTS(SELECT * FROM [FullMart].[dbo].[Shop] WHERE ([email] = @email) AND ([pass] = @pass))
			SELECT * FROM [FullMart].[dbo].[Shop] WHERE ([email] = @email) AND ([pass] = @pass)
		ELSE
			RETURN 0
END

GO