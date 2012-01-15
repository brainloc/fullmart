/****** Object:  StoredProcedure [dbo].[GetSubCategories]    Script Date: 01/16/2012 00:17:45 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		BTN
-- Create date: 15 Jan, 2012
-- Description:	NO
-- =============================================
CREATE PROCEDURE [dbo].[GetSubCategories]	
	@catID		INT
AS
BEGIN
	
	SET NOCOUNT ON;

	SELECT [ID],[CategoryID],[Name],[Order]
	FROM [FullMart].[dbo].[SubCategory]
	WHERE [CategoryID] = @catID
	ORDER BY [Order]
	
END

GO


