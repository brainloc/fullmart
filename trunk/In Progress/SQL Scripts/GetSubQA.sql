/****** Object:  StoredProcedure [dbo].[GetSubQA]    Script Date: 02/18/2012 14:48:12 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GetSubQA]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[GetSubQA]
GO

/****** Object:  StoredProcedure [dbo].[GetSubQA]    Script Date: 02/18/2012 14:48:12 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		BTN
-- Create date: 18 Feb 2012
-- Description:	NO
-- =============================================
CREATE PROCEDURE [dbo].[GetSubQA]
	@QAID		INT
AS
BEGIN
	
	SET NOCOUNT ON;

    SELECT [FullMart].[dbo].[SubAQ].[ID],[UserName],[AQID],[Content]
		   ,[FullMart].[dbo].[SubAQ].[CreateDate] 
	FROM [FullMart].[dbo].[SubAQ],[FullMart].[dbo].[User] 
	WHERE [AQID] = @QAID
		  AND [FullMart].[dbo].[User].[ID] = [FullMart].[dbo].[SubAQ].[PosterID] 
	ORDER BY [FullMart].[dbo].[SubAQ].[CreateDate] DESC
END

GO


