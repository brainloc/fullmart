USE [FullMart]
GO
/****** Object:  StoredProcedure [dbo].[UpdateProduct]    Script Date: 02/15/2012 18:38:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		NVN
-- Create date: 15 feb, 2012
-- Description:	NO
-- =============================================
ALTER PROCEDURE [dbo].[UpdateProduct]
	@ID					INT,
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

    UPDATE [FullMart].[dbo].[Product]
    SET    [SubCategoryID]=@SubCategoryID
           ,[Price]=@Price
           ,[Picture]=case	when @Picture ='' then [Picture]
							when @Picture IS NULL then [Picture]
							when @Picture <> '' then @Picture
							end
           ,[Thumbnail]=case	when @Thumbnail ='' then [Thumbnail]
								when @Thumbnail IS NULL then [Thumbnail]
								when @Thumbnail <> '' then @Thumbnail
								end
           ,[Title]=@Title
           ,[State]=@State
     WHERE ([FullMart].[dbo].[Product].[ID]=@ID)
     UPDATE [FullMart].[dbo].[ProductDetail]
     SET [FullMart].[dbo].[ProductDetail].[Content]=@Content
     WHERE [FullMart].[dbo].[ProductDetail].[ProductID]=@ID
     
    
END


