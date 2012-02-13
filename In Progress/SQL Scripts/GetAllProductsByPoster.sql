/****** Object:  StoredProcedure [dbo].[GetAllProductsByPoster]    Script Date: 02/13/2012 07:13:47 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GetAllProductsByPoster]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[GetAllProductsByPoster]
GO

/****** Object:  StoredProcedure [dbo].[GetAllProductsByPoster]    Script Date: 02/13/2012 07:13:47 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		BTN
-- Create date: 22 Jan 2012
-- Description:	NO
-- =============================================
CREATE PROCEDURE [dbo].[GetAllProductsByPoster]
	@PosterID		INT
AS
BEGIN
	
	SET NOCOUNT ON;

	SELECT [ID],[Price],[Thumbnail],[Title]
	FROM [FullMart].[dbo].[Product]
	WHERE [PosterID] = @PosterID
	ORDER BY [CreatedDate] DESC
END

GO


