/****** Object:  StoredProcedure [dbo].[AddSubCategory]    Script Date: 02/14/2012 01:16:50 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AddSubCategory]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[AddSubCategory]
GO

/****** Object:  StoredProcedure [dbo].[AddSubCategory]    Script Date: 02/14/2012 01:16:50 ******/
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
	@SubcatOrder		TINYINT
AS
BEGIN
	
	SET NOCOUNT ON;

    INSERT INTO [FullMart].[dbo].[SubCategory]
           ([CategoryID]
           ,[Name]
           ,[Order])
    VALUES
           (@CatID
           ,@SubcatName
           ,@SubcatOrder)
END

GO


