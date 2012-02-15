SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		NVN
-- Create date: 15 feb, 2012
-- Description:	NO
-- =============================================
ALTER PROCEDURE [dbo].[OutstandProduct]
	@ID				INT,
    @OS				bit
AS
BEGIN
	
	SET NOCOUNT ON;

    UPDATE [FullMart].[dbo].[Product]
    SET    [Outstanding]=@OS
    WHERE ([FullMart].[dbo].[Product].[ID]=@ID)
END