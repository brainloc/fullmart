SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		NVN
-- Create date: 16 Feb 2012
-- Description:	NO
-- =============================================
CREATE PROCEDURE [dbo].[DelAnswer]
	@ID			INT
AS
BEGIN
	DELETE FROM [FullMart].[dbo].[SubAQ]
      WHERE [FullMart].[dbo].[SubAQ].[ID]=@ID
END

