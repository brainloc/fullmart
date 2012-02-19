/****** Object:  StoredProcedure [dbo].[GetCommentStatistic]    Script Date: 02/18/2012 18:59:40 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		BTN
-- Create date: 18 Feb 2012
-- Description:	NO
-- =============================================
CREATE PROCEDURE [dbo].[GetCommentStatistic]
	@ProductID		INT
AS
BEGIN
	
	SET NOCOUNT ON;

	SELECT [FullMart].[dbo].[Comment].[ID]
			,[UserName], (
							SELECT COUNT([FullMart].[dbo].[SubComment].[ID])
							FROM [FullMart].[dbo].[SubComment]
							WHERE [CommentID] = [FullMart].[dbo].[Comment].[ID]
						) AS [COMMENTSCOUNT]
			,[FullMart].[dbo].[Comment].[CreateDate],[Content]      
	FROM [FullMart].[dbo].[Comment],[FullMart].[dbo].[User]
	WHERE [FullMart].[dbo].[Comment].[Product] = @ProductID
		  AND [FullMart].[dbo].[User].[ID] = [FullMart].[dbo].[Comment].[PosterID]
	ORDER BY [FullMart].[dbo].[Comment].[CreateDate] DESC
END



GO


