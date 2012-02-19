USE [FullMart]
GO

/****** Object:  StoredProcedure [dbo].[DeleteProductComment]    Script Date: 02/19/2012 10:06:08 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DeleteProductComment]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[DeleteProductComment]
GO

USE [FullMart]
GO

/****** Object:  StoredProcedure [dbo].[DeleteProductComment]    Script Date: 02/19/2012 10:06:08 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		BTN
-- Create date: 19 Feb 2012
-- Description:	NO
-- =============================================
CREATE PROCEDURE [dbo].[DeleteProductComment]
	@CommentID		INT
AS
BEGIN

	SET NOCOUNT ON;

    DELETE FROM [FullMart].[dbo].[SubComment]
    WHERE [CommentID] = @CommentID
    
    DELETE FROM [FullMart].[dbo].[Comment]
    WHERE [ID] = @CommentID
END

GO


