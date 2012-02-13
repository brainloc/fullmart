/****** Object:  StoredProcedure [dbo].[CreateProduct]    Script Date: 02/13/2012 07:13:11 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CreateProduct]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[CreateProduct]
GO

/****** Object:  StoredProcedure [dbo].[CreateProduct]    Script Date: 02/13/2012 07:13:11 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		BTN
-- Create date: 15 Jan 2012
-- Description:	NO
-- =============================================
CREATE PROCEDURE [dbo].[CreateProduct]
	@SubCategoryID		INT,
    @Price				INT,
    @Picture			NVARCHAR(300),
    @Thumbnail			NVARCHAR(300),    
    @PosterID			INT,
    @Content			NVARCHAR(MAX),
    @Title				NVARCHAR(150),
    @State				INT
AS
BEGIN
	
	SET NOCOUNT ON;

    INSERT INTO [FullMart].[dbo].[Product]
           ([SubCategoryID]
           ,[Price]
           ,[Picture]
           ,[Thumbnail]
           ,[CreatedDate]
           ,[PosterID]
           ,[Outstanding]
           ,[Title]
           ,[State])
     VALUES
           (@SubCategoryID
           ,@Price
           ,@Picture
           ,@Thumbnail
           ,GETUTCDATE()
           ,@PosterID
           ,0
           ,@Title
           ,@State)
     
     IF(@@IDENTITY IS NULL)
		RETURN 0
	 ELSE
		BEGIN
			INSERT INTO [FullMart].[dbo].[ProductDetail]
				   ([ProductID]
				   ,[Content])
			VALUES
				   (@@IDENTITY
				   ,@Content)
			RETURN 1
		END
END


GO


