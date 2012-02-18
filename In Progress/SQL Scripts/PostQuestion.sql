/****** Object:  StoredProcedure [dbo].[PostQuestion]    Script Date: 02/18/2012 14:48:34 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		BTN
-- Create date: 16 Feb 2012
-- Description:	NO
-- =============================================
CREATE PROCEDURE [dbo].[PostQuestion]
	@PosterID		INT,
	@Content		NVARCHAR(MAX),
	@Type			NVARCHAR(100)
AS
BEGIN
	INSERT INTO [FullMart].[dbo].[AnswerQuestion]
           ([PosterID]
           ,[CreateDate]
           ,[type]
           ,[Content])
    VALUES
           (@PosterID
           ,GETUTCDATE()
           ,@Type
           ,@Content)
END

GO


