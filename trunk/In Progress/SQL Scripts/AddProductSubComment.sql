/****** Object:  StoredProcedure [dbo].[AddProductSubComment]    Script Date: 02/19/2012 09:54:08 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AddProductSubComment]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[AddProductSubComment]
GO

/****** Object:  StoredProcedure [dbo].[AddProductSubComment]    Script Date: 02/19/2012 09:54:08 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		BTN
-- Create date: 19 Feb 2012
-- Description:	NO
-- =============================================
CREATE PROCEDURE [dbo].[AddProductSubComment]
	@PosterID			INT,
	@CommentID			INT,
	@Content			NVARCHAR(MAX)
AS
BEGIN
	
	SET NOCOUNT ON;

	IF EXISTS(SELECT [ID] FROM [FullMart].[dbo].[Comment] WHERE [ID] = @CommentID)
	BEGIN
		INSERT INTO [FullMart].[dbo].[SubComment]
			   ([PosterID]
			   ,[CommentID]
			   ,[Content]
			   ,[CreateDate])
		VALUES
			   (@PosterID
			   ,@CommentID
			   ,@Content
			   ,GETUTCDATE())
    END
END

GO


