USE [FullMart]
GO
/****** Object:  StoredProcedure [dbo].[UpdateUser]    Script Date: 02/15/2012 05:46:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		NVN
-- Create date: 14 Feb 2012
-- Description:	NO
-- =============================================
CREATE PROCEDURE [dbo].[UpdateCategory] 
	@ID		int,
	@CatName		NVARCHAR(100),
	@CatOrder		INT
	
AS
BEGIN
	
	SET NOCOUNT ON;
	
	IF NOT EXISTS(SELECT * FROM [FullMart].[dbo].[Category] WHERE [ID] = @ID)
		RETURN 0
	ELSE
	BEGIN	
		UPDATE [FullMart].[dbo].[Category]
	SET [Name] = @CatName
      ,[Order] = @CatOrder
	WHERE [ID] = @ID
		RETURN 1
	END
END

