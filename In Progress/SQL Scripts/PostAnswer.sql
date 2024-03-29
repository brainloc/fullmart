SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		BTN
-- Create date: 16 Feb 2012
-- Description:	NO
-- =============================================
CREATE PROCEDURE [dbo].[PostAnswer]
	@QID			INT,
	@PosterID		INT,
	@Content		NVARCHAR(MAX)
AS
BEGIN
	INSERT INTO [FullMart].[dbo].[SubAQ]
           ([PosterID]
           ,[AQID]
           ,[CreateDate]
           ,[Content])
    VALUES
           (@PosterID
           ,@QID
           ,GETUTCDATE()
           ,@Content)
END

