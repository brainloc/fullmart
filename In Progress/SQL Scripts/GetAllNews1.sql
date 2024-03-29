USE [FullMart]
GO
/****** Object:  StoredProcedure [dbo].[GetAllNews1]    Script Date: 02/14/2012 17:58:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		NVN
-- Create date: 13 Feb 2012
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[GetAllNews1]
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT [FullMart].[dbo].[News].[ID] AS [ID]
      ,[Title]
      ,[Content]
      ,[FullMart].[dbo].[User].[fname] + ' ' +[FullMart].[dbo].[User].[lname] AS [Poster]
      ,[ShortContent]
      ,[ImageThumb]
      ,(CONVERT(NVARCHAR(2),DATEPART(DAY,[FullMart].[dbo].[News].[CreatedDate]))+'/'+CONVERT(NVARCHAR(2),DATEPART(MONTH,[FullMart].[dbo].[News].[CreatedDate]))+'/'+CONVERT(NVARCHAR(4),DATEPART(YEAR,[FullMart].[dbo].[News].[CreatedDate]))) AS [CREATEDATE]
  FROM [FullMart].[dbo].[News],[FullMart].[dbo].[User]
  WHERE [FullMart].[dbo].[News].[PosterID]=[FullMart].[dbo].[User].[ID]
  order by [FullMart].[dbo].[News].[CreatedDate] DESC
  
END
