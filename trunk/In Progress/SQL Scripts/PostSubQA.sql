/****** Object:  StoredProcedure [dbo].[PostSubQA]    Script Date: 02/18/2012 14:49:14 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		BTN
-- Create date: 17 Feb 2012
-- Description:	NO
-- =============================================
CREATE PROCEDURE [dbo].[PostSubQA] 
	@PosterID		INT,
	@AQID			INT,
	@Content		NVARCHAR(MAX)
AS
BEGIN
	
	SET NOCOUNT ON;

    INSERT INTO [FullMart].[dbo].[SubAQ]
           ([PosterID]
           ,[AQID]
           ,[Content]
           ,[CreateDate])
    VALUES
           (@PosterID
           ,@AQID
           ,@Content
           ,GETUTCDATE())
END

GO


