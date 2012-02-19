/****** Object:  StoredProcedure [dbo].[PostSubQA]    Script Date: 02/19/2012 09:39:59 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PostSubQA]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[PostSubQA]
GO

/****** Object:  StoredProcedure [dbo].[PostSubQA]    Script Date: 02/19/2012 09:39:59 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		BTN
-- Create date: 17 Feb 2012
-- Description:	NO
-- =============================================
CREATE PROCEDURE [dbo].[PostSubQA] 
	@PosterID		INT,
	@AQID			INT,
	@Content		NVARCHAR(MAX)
AS
BEGIN
	
	SET NOCOUNT ON;

	IF EXISTS(SELECT [ID] FROM [FullMart].[dbo].[AnswerQuestion] WHERE [ID] = @AQID)
	BEGIN
		INSERT INTO [FullMart].[dbo].[SubAQ]
			   ([PosterID]
			   ,[AQID]
			   ,[Content]
			   ,[CreateDate])
		VALUES
			   (@PosterID
			   ,@AQID
			   ,@Content
			   ,GETUTCDATE())
	END
END

GO