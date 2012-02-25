/****** Object:  StoredProcedure [dbo].[AddPurchaseBooking]    Script Date: 02/25/2012 21:32:17 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AddPurchaseBooking]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[AddPurchaseBooking]
GO

/****** Object:  StoredProcedure [dbo].[AddPurchaseBooking]    Script Date: 02/25/2012 21:32:17 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		BTN
-- Create date: 26 Feb 2012
-- Description:	NO
-- =============================================
CREATE PROCEDURE [dbo].[AddPurchaseBooking]
	@ProductID					INT,
    @Amount						INT,
    @BuyerID					INT,
    @MoreDetail					NVARCHAR(500),
    @RecipientName				NVARCHAR(300),
    @RecipientPhone				NVARCHAR(14),
    @RecipientAddress			NVARCHAR(400),
    @RecipientEmail				NVARCHAR(100)
AS
BEGIN

	SET NOCOUNT ON;
	  
	IF(EXISTS(SELECT [ID] 
			FROM [FullMart].[dbo].[Cart]
			WHERE [isSubmited] = 0 
			      AND [ProductID] = @ProductID 
			      AND [Buyer] = @BuyerID))
		/*Update existed order: Amount field*/
		BEGIN
			UPDATE [FullMart].[dbo].[Cart]
		    SET [Amount] = [Amount] + @Amount
		    WHERE [isSubmited] = 0 
			      AND [ProductID] = @ProductID 
			      AND [Buyer] = @BuyerID
		END
	ELSE
		/*Insert new order*/
		BEGIN
			INSERT INTO [FullMart].[dbo].[Cart]
			   ([ProductID]
			   ,[Amount]
			   ,[Buyer]
			   ,[CreateDate]
			   ,[MoreDetail]
			   ,[isRead]
			   ,[RecipientsName]
			   ,[RecipientsPhone]
			   ,[RecipientsAddress]
			   ,[RecipientsEmail]
			   ,[isSubmited])
		    VALUES
			   (@ProductID
			   ,@Amount
			   ,@BuyerID
			   ,GETUTCDATE()
			   ,@MoreDetail
			   ,0
			   ,@RecipientName
			   ,@RecipientPhone
			   ,@RecipientAddress
			   ,@RecipientEmail
			   ,0)
		END	    
END


GO


