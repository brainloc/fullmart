USE [FullMart]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		NVN
-- Create date: 13 Feb, 2012
-- Description:	NO
-- =============================================
CREATE PROCEDURE [dbo].[GetGeneralOption]	
AS
BEGIN
	
	SET NOCOUNT ON;

    SELECT *
	FROM [FullMart].[dbo].[GeneralOption]
  
END

