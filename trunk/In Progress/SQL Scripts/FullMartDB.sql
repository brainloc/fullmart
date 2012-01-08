USE [FullMart]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 01/08/2012 18:27:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[SubCategoryID] [int] NOT NULL,
	[Price] [int] NOT NULL,
	[Picture] [nvarchar](70) NULL,
	[Thumbnail] [nvarchar](70) NULL,
	[CreatedDate] [datetime] NOT NULL,
	[PosterID] [int] NOT NULL,
	[Outstanding] [bit] NOT NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 01/08/2012 18:27:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Order] [tinyint] NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Shop]    Script Date: 01/08/2012 18:27:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Shop](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Shopname] [nvarchar](100) NULL,
	[Fname] [nvarchar](50) NULL,
	[Lname] [nvarchar](50) NULL,
	[Pass] [nvarchar](50) NOT NULL,
	[Email] [varchar](50) NOT NULL,
	[Web] [nvarchar](50) NULL,
	[State] [nvarchar](100) NULL,
	[Createdate] [datetime] NOT NULL,
	[roleID] [int] NOT NULL,
 CONSTRAINT [PK_Shop] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Role]    Script Date: 01/08/2012 18:27:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 01/08/2012 18:27:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[User](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[fname] [nvarchar](50) NULL,
	[lname] [nvarchar](50) NULL,
	[email] [varchar](50) NULL,
	[pass] [varchar](50) NULL,
	[bday] [datetime] NULL,
	[state] [nvarchar](100) NULL,
	[CU] [nvarchar](100) NULL,
	[class] [varchar](10) NULL,
	[createdate] [datetime] NOT NULL,
	[roleID] [int] NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SubCategory]    Script Date: 01/08/2012 18:27:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SubCategory](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CategoryID] [int] NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Order] [tinyint] NULL,
 CONSTRAINT [PK_SubCategory] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductDetail]    Script Date: 01/08/2012 18:27:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductDetail](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ProductID] [int] NOT NULL,
	[Content] [nvarchar](max) NULL,
 CONSTRAINT [PK_ProductDetail] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[CreateShop]    Script Date: 01/08/2012 18:27:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		BTN
-- Create date: 04 Jan, 2012
-- Description:	NO
-- =============================================
CREATE PROCEDURE [dbo].[CreateShop] 
	@Shopname	NVARCHAR(100),
	@Fname		NVARCHAR(50),
	@Lname		NVARCHAR(50),
	@Email		VARCHAR(50),
	@Pass		NVARCHAR(50),
	@Web		NVARCHAR(50),
	@state		NVARCHAR(100),
	@roleID		INT
AS
BEGIN
	
	SET NOCOUNT ON;
	
	IF EXISTS(SELECT * FROM [FullMart].[dbo].[Shop] WHERE [email] = @email)
		RETURN 0
	ELSE
	BEGIN	
		INSERT INTO [FullMart].[dbo].[Shop]
			   ([Shopname],[Fname],[Lname],[Pass],[Email],[Web],[State],[Createdate],[roleID])
		 VALUES	
			   (@Shopname,@Fname,@Lname,@Pass,@Email,@Web,@state,GETUTCDATE(),@roleID)
	END
END
GO
/****** Object:  StoredProcedure [dbo].[CheckUser]    Script Date: 01/08/2012 18:27:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		BTN
-- Create date: 04 Jan, 2012
-- Description:	NO
-- =============================================
CREATE PROCEDURE [dbo].[CheckUser] 
	@email			NVARCHAR(70)
AS
BEGIN
	
	SET NOCOUNT ON;
	
	SELECT * FROM [FullMart].[dbo].[User] WHERE ([email] = @email)
END
GO
/****** Object:  StoredProcedure [dbo].[CheckLogin]    Script Date: 01/08/2012 18:27:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CheckLogin] 
	@email			NVARCHAR(70),
	@pass			NVARCHAR(70)
AS
BEGIN
	
	SET NOCOUNT ON;
	
	IF EXISTS(SELECT * FROM [FullMart].[dbo].[User] WHERE ([email] = @email) AND ([pass] = @pass))
		SELECT * FROM [FullMart].[dbo].[User] WHERE ([email] = @email) AND ([pass] = @pass)
	ELSE
		IF EXISTS(SELECT * FROM [FullMart].[dbo].[Shop] WHERE ([email] = @email) AND ([pass] = @pass))
			SELECT * FROM [FullMart].[dbo].[Shop] WHERE ([email] = @email) AND ([pass] = @pass)
		ELSE
			RETURN 0
END
GO
/****** Object:  StoredProcedure [dbo].[CreateUser]    Script Date: 01/08/2012 18:27:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		BTN
-- Create date: 04 Jan, 2012
-- Description:	NO
-- =============================================
CREATE PROCEDURE [dbo].[CreateUser] 
	@fname		NVARCHAR(50),
	@lname		NVARCHAR(50),
	@email		NVARCHAR(50),
	@pass		NVARCHAR(20),
	@bday		datetime,
	@state		NVARCHAR(100),
	@CU			NVARCHAR(100),
	@class		VARCHAR(10),
	@roleID		INT
AS
BEGIN
	
	SET NOCOUNT ON;
	
	IF EXISTS(SELECT * FROM [FullMart].[dbo].[User] WHERE [email] = @email)
		RETURN 0
	ELSE
	BEGIN	
		INSERT INTO [FullMart].[dbo].[User]
			   ([fname],[lname],[email],[pass],[bday],[state],[CU],[class],[createdate],[roleID])
		 VALUES
			   (@fname,@lname,@email,@pass,@bday,@state,@CU,@class,GETUTCDATE(),@roleID)
		RETURN 1
	END
END
GO
/****** Object:  Table [dbo].[Comment]    Script Date: 01/08/2012 18:27:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comment](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ProductID] [int] NOT NULL,
	[PosterID] [int] NULL,
	[Content] [nvarchar](max) NULL,
 CONSTRAINT [PK_Comment] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  ForeignKey [FK_Comment_User]    Script Date: 01/08/2012 18:27:11 ******/
ALTER TABLE [dbo].[Comment]  WITH CHECK ADD  CONSTRAINT [FK_Comment_User] FOREIGN KEY([PosterID])
REFERENCES [dbo].[User] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Comment] CHECK CONSTRAINT [FK_Comment_User]
GO
/****** Object:  ForeignKey [FK_ProductDetail_Product]    Script Date: 01/08/2012 18:27:11 ******/
ALTER TABLE [dbo].[ProductDetail]  WITH CHECK ADD  CONSTRAINT [FK_ProductDetail_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ProductDetail] CHECK CONSTRAINT [FK_ProductDetail_Product]
GO
/****** Object:  ForeignKey [FK_SubCategory_Category]    Script Date: 01/08/2012 18:27:11 ******/
ALTER TABLE [dbo].[SubCategory]  WITH CHECK ADD  CONSTRAINT [FK_SubCategory_Category] FOREIGN KEY([CategoryID])
REFERENCES [dbo].[Category] ([ID])
GO
ALTER TABLE [dbo].[SubCategory] CHECK CONSTRAINT [FK_SubCategory_Category]
GO
/****** Object:  ForeignKey [FK_User_Role]    Script Date: 01/08/2012 18:27:11 ******/
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_Role] FOREIGN KEY([roleID])
REFERENCES [dbo].[Role] ([ID])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_Role]
GO
