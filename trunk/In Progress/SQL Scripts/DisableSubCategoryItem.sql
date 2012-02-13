/****** Object:  StoredProcedure [dbo].[DisableSubCategoryItem]    Script Date: 02/14/2012 01:17:26 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DisableSubCategoryItem]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[DisableSubCategoryItem]
GO

/****** Object:  StoredProcedure [dbo].[DisableSubCategoryItem]    Script Date: 02/14/2012 01:17:26 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		BTN
-- Create date: 13 Feb 2012
-- Description:	NO
-- =============================================
CREATE PROCEDURE [dbo].[DisableSubCategoryItem]
	@SubcatID		INT
AS
BEGIN
	
	SET NOCOUNT ON;

    UPDATE [FullMart].[dbo].[SubCategory]
	SET [Order] = -99
	WHERE [ID] = @SubcatID
END

GO


