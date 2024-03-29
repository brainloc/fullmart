/****** Object:  StoredProcedure [dbo].[UpdateCategory]    Script Date: 02/15/2012 11:25:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		NVN
-- Create date: 14 Feb 2012
-- Description:	NO
-- =============================================
CREATE PROCEDURE [dbo].[UpdateSubCategory] 
	@ID		int,
	@CatName		NVARCHAR(100),
	@CatOrder		INT
	
AS
BEGIN
	
	SET NOCOUNT ON;
	
	IF NOT EXISTS(SELECT * FROM [FullMart].[dbo].[SubCategory] WHERE [ID] = @ID)
		RETURN 0
	ELSE
	BEGIN	
		UPDATE [FullMart].[dbo].[SubCategory]
	SET [Name] = @CatName
      ,[Order] = @CatOrder
	WHERE [ID] = @ID
		RETURN 1
	END
END

