/****** Object:  StoredProcedure [dbo].[AddProductComment]    Script Date: 02/19/2012 12:11:18 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AddProductComment]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[AddProductComment]
GO

/****** Object:  StoredProcedure [dbo].[AddProductComment]    Script Date: 02/19/2012 12:11:18 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		BTN
-- Create date: 19 Feb 2012
-- Description:	NO
-- =============================================
CREATE PROCEDURE [dbo].[AddProductComment]
	@PosterID				INT,
	@ProductID				INT,
	@Content				NVARCHAR(MAX)
AS
BEGIN
	
	SET NOCOUNT ON;
    
	INSERT INTO [FullMart].[dbo].[Comment]
           ([PosterID]
           ,[Product]
           ,[CreateDate]
           ,[Content])
     VALUES
           (@PosterID
           ,@ProductID
           ,GETUTCDATE()
           ,@Content)
END

GO


