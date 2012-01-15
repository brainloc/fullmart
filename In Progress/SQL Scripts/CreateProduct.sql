/****** Object:  StoredProcedure [dbo].[CreateProduct]    Script Date: 01/16/2012 00:18:10 ******/
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
    @Picture			NVARCHAR(70),
    @Thumbnail			NVARCHAR(70),    
    @PosterID			INT,
    @Content			NVARCHAR(MAX) 
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
           ,[Outstanding])
     VALUES
           (@SubCategoryID
           ,@Price
           ,@Picture
           ,@Thumbnail
           ,GETUTCDATE()
           ,@PosterID
           ,0)
     
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


