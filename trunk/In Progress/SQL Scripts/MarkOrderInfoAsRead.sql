SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		BTN
-- Create date: 04 March
-- Description:	NO
-- =============================================
CREATE PROCEDURE MarkOrderInfoAsRead
	@OrderInfoID	INT
AS
BEGIN

	SET NOCOUNT ON;

    UPDATE [FullMart].[dbo].[Cart]
	SET [isRead] = 1      
	WHERE [ID] = @OrderInfoID
END
GO
