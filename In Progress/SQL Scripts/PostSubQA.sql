/****** Object:  StoredProcedure [dbo].[POSTSubQA]    Script Date: 02/17/2012 18:23:49 ******/
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
