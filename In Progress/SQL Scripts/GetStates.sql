/****** Object:  StoredProcedure [dbo].[GetStates]    Script Date: 02/13/2012 07:15:30 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GetStates]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[GetStates]
GO

/****** Object:  StoredProcedure [dbo].[GetStates]    Script Date: 02/13/2012 07:15:30 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		BTN
-- Create date: 17 Jan 2012
-- Description:	NO
-- =============================================
CREATE PROCEDURE [dbo].[GetStates]
AS
BEGIN
	
	SET NOCOUNT ON;
	SELECT [id]
      ,[StateName]
      ,[Order]
	FROM [FullMart].[dbo].[State]
	ORDER BY [Order]
    
END

GO


