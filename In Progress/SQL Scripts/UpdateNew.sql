/****** Object:  StoredProcedure [dbo].[GetNewDetail]    Script Date: 02/14/2012 16:49:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		NVN
-- Create date: 13 FEB 2012
-- Description:	NO
-- =============================================
CREATE PROCEDURE [dbo].[UpdateNew]
	@ID			INT,
	@title		nvarchar(200),
	@content	ntext,
	@preview	ntext,
	@img		nvarchar(150)
	
AS
BEGIN
	
	SET NOCOUNT ON;
	
	IF NOT EXISTS(SELECT * FROM [FullMart].[dbo].[News] WHERE ID=@ID)
		RETURN 0
	ELSE
	BEGIN	
		UPDATE [FullMart].[dbo].[News]
   SET [Title] = @title
      ,[Content] = @content
      ,[ShortContent] = @preview
      ,[ImageThumb] = @img
	WHERE ID=@ID
		RETURN 1
	END
END