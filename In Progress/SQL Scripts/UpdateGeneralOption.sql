-- ================================================
-- Template generated from Template Explorer using:
-- Create Procedure (New Menu).SQL
--
-- Use the Specify Values for Template Parameters 
-- command (Ctrl-Shift-M) to fill in the parameter 
-- values below.
--
-- This block of comments will not be included in
-- the definition of the procedure.
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		NVN
-- Create date: 13 Feb 2012
-- Description:	Update Option
-- =============================================
CREATE PROCEDURE UpdateGeneralOption
	@ID		int,
	@EN		ntext,
	@VI		ntext
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE [FullMart].[dbo].[GeneralOption]
   SET [FullMart].[dbo].[GeneralOption].[EN] = @EN,[FullMart].[dbo].[GeneralOption].[VI] = @VI
 WHERE [FullMart].[dbo].[GeneralOption].[ID]=@ID
END
GO
