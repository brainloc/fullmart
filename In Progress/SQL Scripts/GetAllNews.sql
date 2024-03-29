USE [FullMart]
GO
/****** Object:  StoredProcedure [dbo].[GetAllNews]    Script Date: 02/14/2012 17:58:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		NVN
-- Create date: 13 Feb 2012
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetAllNews]
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT [FullMart].[dbo].[News].[ID] AS [ID]
      ,[Title]
      ,[Content]
      ,[FullMart].[dbo].[User].[email] AS [Poster]
      ,[ShortContent]
      ,[ImageThumb]
      ,[FullMart].[dbo].[News].[CreatedDate] AS [CREATEDATE]
  FROM [FullMart].[dbo].[News],[FullMart].[dbo].[User]
  WHERE [FullMart].[dbo].[News].[PosterID]=[FullMart].[dbo].[User].[ID]
  order by [FullMart].[dbo].[News].[CreatedDate] DESC
END
