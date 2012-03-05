/****** Object:  StoredProcedure [dbo].[ChangeUserRole]    Script Date: 03/05/2012 08:03:26 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ChangeUserRole]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ChangeUserRole]
GO

/****** Object:  StoredProcedure [dbo].[ChangeUserRole]    Script Date: 03/05/2012 08:03:26 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		BTN
-- Create date: 05 March 2012
-- Description:	NO
-- =============================================
CREATE PROCEDURE [dbo].[ChangeUserRole]
	@username		NVARCHAR(50),
	@newRole		INT
AS
BEGIN

	SET NOCOUNT ON;

    UPDATE [FullMart].[dbo].[User]
	SET [roleID] = @newRole      
	WHERE [UserName] = @username
	RETURN 1
	
END

GO


