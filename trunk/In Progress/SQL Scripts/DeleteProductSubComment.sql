/****** Object:  StoredProcedure [dbo].[DeleteProductSubComment]    Script Date: 02/19/2012 10:06:12 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DeleteProductSubComment]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[DeleteProductSubComment]
GO

/****** Object:  StoredProcedure [dbo].[DeleteProductSubComment]    Script Date: 02/19/2012 10:06:12 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		BTN
-- Create date: 19 Feb 2012
-- Description:	NO
-- =============================================
CREATE PROCEDURE [dbo].[DeleteProductSubComment]
	@SubCommentID			INT
AS
BEGIN
	
	SET NOCOUNT ON;

	DELETE FROM [FullMart].[dbo].[SubComment]
    WHERE [ID] = @SubCommentID
END

GO


