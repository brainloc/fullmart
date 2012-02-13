/****** Object:  StoredProcedure [dbo].[DisableCategoryItem]    Script Date: 02/14/2012 01:17:10 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DisableCategoryItem]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[DisableCategoryItem]
GO

/****** Object:  StoredProcedure [dbo].[DisableCategoryItem]    Script Date: 02/14/2012 01:17:10 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		BTN
-- Create date: 13 Feb 2012
-- Description:	NO
-- =============================================
CREATE PROCEDURE [dbo].[DisableCategoryItem]
	@CatID		INT
AS
BEGIN
	
	SET NOCOUNT ON;

    UPDATE [FullMart].[dbo].[Category]
	SET [Order] = -99
	WHERE [ID] = @CatID
END

GO


