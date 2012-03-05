/****** Object:  StoredProcedure [dbo].[DisableShop]    Script Date: 03/05/2012 08:14:24 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DisableShop]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[DisableShop]
GO

/****** Object:  StoredProcedure [dbo].[DisableShop]    Script Date: 03/05/2012 08:14:24 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		BTN
-- Create date: 05 March 2012
-- Description:	NO
-- =============================================
CREATE PROCEDURE [dbo].[DisableShop]
	@username		NVARCHAR(50)
AS
BEGIN

	SET NOCOUNT ON;
	
	DECLARE @ShopID		INT
	
	SELECT @ShopID = [ShopID]
	FROM [FullMart].[dbo].[User]
	WHERE [UserName] = @username	
	
	UPDATE [FullMart].[dbo].[Shop]
	SET [isActive] = 0			  
	WHERE [ID] = @ShopID
	RETURN 1

END

GO


