USE [FullMart]
GO
/****** Object:  StoredProcedure [dbo].[CheckUser]    Script Date: 02/13/2012 11:50:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[CheckUser] 
	@email			NVARCHAR(70)
AS
BEGIN
	
	SET NOCOUNT ON;
	
	SELECT * FROM [FullMart].[dbo].[User] WHERE [email] = @email
END

