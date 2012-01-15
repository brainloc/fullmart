/****** Object:  StoredProcedure [dbo].[GetCategories]    Script Date: 01/16/2012 00:17:11 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		BTN
-- Create date: 15 Jan, 2012
-- Description:	NO
-- =============================================
CREATE PROCEDURE [dbo].[GetCategories]	
AS
BEGIN
	
	SET NOCOUNT ON;

    SELECT [ID],[Name],[Order]
	FROM [FullMart].[dbo].[Category]
	ORDER BY [Order]
  
END

GO


