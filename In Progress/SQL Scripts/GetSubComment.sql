/****** Object:  StoredProcedure [dbo].[GetSubComment]    Script Date: 02/19/2012 10:06:41 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GetSubComment]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[GetSubComment]
GO

/****** Object:  StoredProcedure [dbo].[GetSubComment]    Script Date: 02/19/2012 10:06:41 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		BTN
-- Create date: 18 Feb 2012
-- Description:	NO
-- =============================================
CREATE PROCEDURE [dbo].[GetSubComment]
	@CommentID		INT
AS
BEGIN
	
	SET NOCOUNT ON;

	SELECT [FullMart].[dbo].[SubComment].[ID]
		   ,[UserName],[CommentID]
		   ,[Content],[FullMart].[dbo].[SubComment].[CreateDate]      
	FROM [FullMart].[dbo].[SubComment]
	     ,[FullMart].[dbo].[User]
	WHERE [CommentID] = @CommentID
		  AND [FullMart].[dbo].[User].[ID] = [FullMart].[dbo].[SubComment].[PosterID]
	ORDER BY [FullMart].[dbo].[SubComment].[CreateDate] DESC
END


GO


