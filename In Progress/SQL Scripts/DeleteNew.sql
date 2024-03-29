SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		NVN
-- Create date: 13 Feb, 2012
-- Description:	NO
-- =============================================
CREATE PROCEDURE [dbo].[DeleteNew] 
	@ID		int
AS
BEGIN
	
	SET NOCOUNT ON;
	
	IF NOT EXISTS(SELECT * FROM [FullMart].[dbo].[News] WHERE [ID] = @ID)
		RETURN 1
	ELSE
	BEGIN	
		DELETE FROM [FullMart].[dbo].[News]
	WHERE [FullMart].[dbo].[News].[ID] = @ID
		RETURN 1
	END
END

