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
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE GetNameCatSubCatByIDSub
	-- Add the parameters for the stored procedure here
	@ID		int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT [FullMart].[dbo].[Category].[ID] AS CATID,
			[FullMart].[dbo].[Category].[Name] AS NAMECAT,
			[FullMart].[dbo].[SubCategory].[ID] AS SUBID,
			[FullMart].[dbo].[SubCategory].[Name] AS NAMESUB
	FROM [FullMart].[dbo].[Category], [FullMart].[dbo].[SubCategory]
	WHERE [FullMart].[dbo].[Category].[ID]=[FullMart].[dbo].[SubCategory].[CategoryID]
			AND [FullMart].[dbo].[SubCategory].[ID]=@ID
END
GO
