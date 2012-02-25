SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		BTN
-- Create date: 26 Feb 2012
-- Description:	NO
-- =============================================
CREATE PROCEDURE SubmitOrder
	@IDList				NVARCHAR(400)
AS
BEGIN

	SET NOCOUNT ON;

    DECLARE @SQL		NVARCHAR(600)
    
    SET @SQL = 'UPDATE [FullMart].[dbo].[Cart]
				SET [isSubmited] = 1
				WHERE [ID] IN ' + @IDList
				
	EXECUTE(@SQL)
END
GO
