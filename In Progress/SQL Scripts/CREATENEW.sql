USE [FullMart]
GO
/****** Object:  StoredProcedure [dbo].[CreateProduct]    Script Date: 02/14/2012 17:38:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		NVN
-- Create date: 14 Feb 2012
-- Description:	NO
-- =============================================
CREATE PROCEDURE [dbo].[CreateNew]

	@posterID	int,
	@title		nvarchar(200),
	@content	ntext,
	@preview	ntext,
	@img		nvarchar(150)
AS
BEGIN
	
	SET NOCOUNT ON;

    INSERT INTO [FullMart].[dbo].[News]
           ([Title]
           ,[Content]
           ,[PosterID]
           ,[ShortContent]
           ,[ImageThumb]
           ,[CreatedDate])
     VALUES
			(@title,
			@content,
			@posterID,
			@preview,
			@img,
			GETUTCDATE()
			)
END


