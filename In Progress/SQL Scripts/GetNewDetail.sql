USE [FullMart]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		NVN
-- Create date: 13 FEB 2012
-- Description:	NO
-- =============================================
CREATE PROCEDURE [dbo].[GetNewDetail]
	@ID			INT
AS
BEGIN	
	SET NOCOUNT ON;
SELECT [Title]
      ,[Content]
      ,[PosterID]
      ,([FullMart].[dbo].[User].[fname] + ' ' + [FullMart].[dbo].[User].[lname]) AS [PosterName]
      ,[ShortContent]
      ,[ImageThumb]
      ,[CreatedDate]
  FROM [FullMart].[dbo].[News],[FullMart].[dbo].[User]
	WHERE [FullMart].[dbo].[News].[ID] = @ID
			AND [FullMart].[dbo].[User].[ID] = [FullMart].[dbo].[News].[PosterID]
END

