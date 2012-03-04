/****** Object:  StoredProcedure [dbo].[RemoveOrderMailInfo]    Script Date: 03/05/2012 06:38:17 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[RemoveOrderMailInfo]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[RemoveOrderMailInfo]
GO

/****** Object:  StoredProcedure [dbo].[RemoveOrderMailInfo]    Script Date: 03/05/2012 06:38:17 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		BTN
-- Create date: 05 March
-- Description:	NO
-- =============================================
CREATE PROCEDURE [dbo].[RemoveOrderMailInfo]
	@ID		INT
AS
BEGIN

	SET NOCOUNT ON;

	DELETE FROM [FullMart].[dbo].[Cart]
    WHERE [ID] = @ID
END

GO


