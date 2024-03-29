USE [FullMart]
GO
/****** Object:  StoredProcedure [dbo].[AddSubCategory]    Script Date: 02/15/2012 11:07:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		BTN
-- Create date: 13 Feb 2012
-- Description:	NO
-- =============================================
CREATE PROCEDURE [dbo].[AddSubCategory]
	@CatID			INT,
	@SubcatName		NVARCHAR(100),
	@SubcatOrder		INT
AS
BEGIN
	
	SET NOCOUNT ON;
	IF NOT EXISTS(SELECT * FROM [FullMart].[dbo].[Category] WHERE ID=@CatID)
		RETURN 0
	ELSE
    INSERT INTO [FullMart].[dbo].[SubCategory]
           ([CategoryID]
           ,[Name]
           ,[Order])
    VALUES
           (@CatID
           ,@SubcatName
           ,@SubcatOrder)
     IF(@@IDENTITY IS NULL)
		RETURN 0
	 ELSE
		RETURN @@IDENTITY
END

