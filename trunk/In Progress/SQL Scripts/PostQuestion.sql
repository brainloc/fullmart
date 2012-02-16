/****** Object:  StoredProcedure [dbo].[PostQuestion]    Script Date: 02/16/2012 23:49:04 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PostQuestion]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[PostQuestion]
GO

/****** Object:  StoredProcedure [dbo].[PostQuestion]    Script Date: 02/16/2012 23:49:04 ******/
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
           ,[Content]
           ,[isActive])
    VALUES
           (@PosterID
           ,GETUTCDATE()
           ,@Type
           ,@Content
           ,1)
END

GO


