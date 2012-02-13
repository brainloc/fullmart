/****** Object:  StoredProcedure [dbo].[AddCategory]    Script Date: 02/14/2012 01:16:29 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AddCategory]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[AddCategory]
GO

/****** Object:  StoredProcedure [dbo].[AddCategory]    Script Date: 02/14/2012 01:16:29 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		BTN
-- Create date: 13 Feb 2012
-- Description:	NO
-- =============================================
CREATE PROCEDURE [dbo].[AddCategory]
	@CatName		NVARCHAR(100),
	@CatOrder		TINYINT
AS
BEGIN
	
	SET NOCOUNT ON;

    INSERT INTO [FullMart].[dbo].[Category]
           ([Name]
           ,[Order])
    VALUES
           (@CatName
           ,@CatOrder)
END

GO


