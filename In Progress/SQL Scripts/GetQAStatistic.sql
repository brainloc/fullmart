/****** Object:  StoredProcedure [dbo].[GetQAStatistic]    Script Date: 02/18/2012 15:13:42 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		BTN
-- Create date: 18 Feb 2012
-- Description:	NO
-- =============================================
CREATE PROCEDURE [dbo].[GetQAStatistic]
	
AS
BEGIN
	
	SET NOCOUNT ON;

    SELECT [FullMart].[dbo].[AnswerQuestion].[ID],[UserName],
		   (
			   SELECT COUNT([FullMart].[dbo].[SubAQ].[ID])
			   FROM [FullMart].[dbo].[SubAQ]
			   WHERE [FullMart].[dbo].[SubAQ].[AQID] = [FullMart].[dbo].[AnswerQuestion].[ID]
		   ) AS [COMMENTSCOUNT],
	       [FullMart].[dbo].[AnswerQuestion].[CreateDate],
	       [FullMart].[dbo].[AnswerQuestion].[Content] 
	FROM [FullMart].[dbo].[AnswerQuestion],
		 [FullMart].[dbo].[User]
	WHERE [FullMart].[dbo].[User].[ID] = [FullMart].[dbo].[AnswerQuestion].[PosterID]
	ORDER BY [FullMart].[dbo].[AnswerQuestion].[CreateDate] DESC

END

GO


