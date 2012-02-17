SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		NVN
-- Create date: 16 Feb 2012
-- Description:	NO
-- =============================================
CREATE PROCEDURE [dbo].[DelQuetion]
	@ID			INT
AS
BEGIN
	DELETE FROM [FullMart].[dbo].[SubAQ]
	  WHERE [FullMart].[dbo].[SubAQ].[AQID]=@ID
	  DELETE FROM [FullMart].[dbo].[AnswerQuestion]
	  WHERE [FullMart].[dbo].[AnswerQuestion].[ID]=@ID
END

