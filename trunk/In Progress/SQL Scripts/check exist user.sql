IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CheckUser]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[CheckUser]
GO

USE [FullMart]
GO

/****** Object:  StoredProcedure [dbo].[CheckUser]    Script Date: 01/05/2012 20:45:58 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[CheckUser] 
	@email			NVARCHAR(70)
AS
BEGIN
	
	SET NOCOUNT ON;
	
	IF EXISTS(SELECT * FROM [FullMart].[dbo].[Users] WHERE [email] = @email)
		RETURN 0
	ELSE
		RETURN 1
END

GO