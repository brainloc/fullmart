/****** Object:  StoredProcedure [dbo].[GetZoneByStateID]    Script Date: 02/23/2012 00:28:24 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GetZoneByStateID]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[GetZoneByStateID]
GO

/****** Object:  StoredProcedure [dbo].[GetZoneByStateID]    Script Date: 02/23/2012 00:28:24 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		BTN
-- Create date: 22 Feb 2012
-- Description:	NO
-- =============================================
CREATE PROCEDURE [dbo].[GetZoneByStateID]
	@StateID		INT
AS
BEGIN

	SET NOCOUNT ON;

	SELECT [ID]
		   ,[Name]		   		   
	FROM [FullMart].[dbo].[Zone]
	WHERE [state] = @StateID
	ORDER BY [Order]
END

GO


