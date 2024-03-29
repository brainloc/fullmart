CREATE DATABASE [FullMart]
GO
USE [FullMart]
GO
/****** Object:  ForeignKey [FK_User_Role]    Script Date: 01/10/2012 17:00:57 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_User_Role]') AND parent_object_id = OBJECT_ID(N'[dbo].[User]'))
ALTER TABLE [dbo].[User] DROP CONSTRAINT [FK_User_Role]
GO
/****** Object:  ForeignKey [FK_User_Shop]    Script Date: 01/10/2012 17:00:57 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_User_Shop]') AND parent_object_id = OBJECT_ID(N'[dbo].[User]'))
ALTER TABLE [dbo].[User] DROP CONSTRAINT [FK_User_Shop]
GO
/****** Object:  ForeignKey [FK_SubCategory_Category]    Script Date: 01/10/2012 17:01:02 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_SubCategory_Category]') AND parent_object_id = OBJECT_ID(N'[dbo].[SubCategory]'))
ALTER TABLE [dbo].[SubCategory] DROP CONSTRAINT [FK_SubCategory_Category]
GO
/****** Object:  ForeignKey [FK_Product_SubCategory]    Script Date: 01/10/2012 17:01:02 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Product_SubCategory]') AND parent_object_id = OBJECT_ID(N'[dbo].[Product]'))
ALTER TABLE [dbo].[Product] DROP CONSTRAINT [FK_Product_SubCategory]
GO
/****** Object:  ForeignKey [FK_News_User]    Script Date: 01/10/2012 17:01:02 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_News_User]') AND parent_object_id = OBJECT_ID(N'[dbo].[News]'))
ALTER TABLE [dbo].[News] DROP CONSTRAINT [FK_News_User]
GO
/****** Object:  ForeignKey [FK_AnswerQuestion_User]    Script Date: 01/10/2012 17:01:02 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_AnswerQuestion_User]') AND parent_object_id = OBJECT_ID(N'[dbo].[AnswerQuestion]'))
ALTER TABLE [dbo].[AnswerQuestion] DROP CONSTRAINT [FK_AnswerQuestion_User]
GO
/****** Object:  ForeignKey [FK_ProductDetail_Product]    Script Date: 01/10/2012 17:01:03 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ProductDetail_Product]') AND parent_object_id = OBJECT_ID(N'[dbo].[ProductDetail]'))
ALTER TABLE [dbo].[ProductDetail] DROP CONSTRAINT [FK_ProductDetail_Product]
GO
/****** Object:  ForeignKey [FK_Cart_Product]    Script Date: 01/10/2012 17:01:03 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Cart_Product]') AND parent_object_id = OBJECT_ID(N'[dbo].[Cart]'))
ALTER TABLE [dbo].[Cart] DROP CONSTRAINT [FK_Cart_Product]
GO
/****** Object:  ForeignKey [FK_SubAQ_AnswerQuestion]    Script Date: 01/10/2012 17:01:03 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_SubAQ_AnswerQuestion]') AND parent_object_id = OBJECT_ID(N'[dbo].[SubAQ]'))
ALTER TABLE [dbo].[SubAQ] DROP CONSTRAINT [FK_SubAQ_AnswerQuestion]
GO
/****** Object:  ForeignKey [FK_SubAQ_User]    Script Date: 01/10/2012 17:01:03 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_SubAQ_User]') AND parent_object_id = OBJECT_ID(N'[dbo].[SubAQ]'))
ALTER TABLE [dbo].[SubAQ] DROP CONSTRAINT [FK_SubAQ_User]
GO
/****** Object:  ForeignKey [FK_Comment_Product]    Script Date: 01/10/2012 17:01:03 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Comment_Product]') AND parent_object_id = OBJECT_ID(N'[dbo].[Comment]'))
ALTER TABLE [dbo].[Comment] DROP CONSTRAINT [FK_Comment_Product]
GO
/****** Object:  ForeignKey [FK_Comment_User]    Script Date: 01/10/2012 17:01:03 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Comment_User]') AND parent_object_id = OBJECT_ID(N'[dbo].[Comment]'))
ALTER TABLE [dbo].[Comment] DROP CONSTRAINT [FK_Comment_User]
GO
/****** Object:  ForeignKey [FK_SubComment_Comment]    Script Date: 01/10/2012 17:01:04 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_SubComment_Comment]') AND parent_object_id = OBJECT_ID(N'[dbo].[SubComment]'))
ALTER TABLE [dbo].[SubComment] DROP CONSTRAINT [FK_SubComment_Comment]
GO
/****** Object:  ForeignKey [FK_SubComment_User]    Script Date: 01/10/2012 17:01:04 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_SubComment_User]') AND parent_object_id = OBJECT_ID(N'[dbo].[SubComment]'))
ALTER TABLE [dbo].[SubComment] DROP CONSTRAINT [FK_SubComment_User]
GO
/****** Object:  Table [dbo].[SubComment]    Script Date: 01/10/2012 17:01:04 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_SubComment_Comment]') AND parent_object_id = OBJECT_ID(N'[dbo].[SubComment]'))
ALTER TABLE [dbo].[SubComment] DROP CONSTRAINT [FK_SubComment_Comment]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_SubComment_User]') AND parent_object_id = OBJECT_ID(N'[dbo].[SubComment]'))
ALTER TABLE [dbo].[SubComment] DROP CONSTRAINT [FK_SubComment_User]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SubComment]') AND type in (N'U'))
DROP TABLE [dbo].[SubComment]
GO
/****** Object:  Table [dbo].[Comment]    Script Date: 01/10/2012 17:01:03 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Comment_Product]') AND parent_object_id = OBJECT_ID(N'[dbo].[Comment]'))
ALTER TABLE [dbo].[Comment] DROP CONSTRAINT [FK_Comment_Product]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Comment_User]') AND parent_object_id = OBJECT_ID(N'[dbo].[Comment]'))
ALTER TABLE [dbo].[Comment] DROP CONSTRAINT [FK_Comment_User]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Comment]') AND type in (N'U'))
DROP TABLE [dbo].[Comment]
GO
/****** Object:  Table [dbo].[SubAQ]    Script Date: 01/10/2012 17:01:03 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_SubAQ_AnswerQuestion]') AND parent_object_id = OBJECT_ID(N'[dbo].[SubAQ]'))
ALTER TABLE [dbo].[SubAQ] DROP CONSTRAINT [FK_SubAQ_AnswerQuestion]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_SubAQ_User]') AND parent_object_id = OBJECT_ID(N'[dbo].[SubAQ]'))
ALTER TABLE [dbo].[SubAQ] DROP CONSTRAINT [FK_SubAQ_User]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SubAQ]') AND type in (N'U'))
DROP TABLE [dbo].[SubAQ]
GO
/****** Object:  Table [dbo].[Cart]    Script Date: 01/10/2012 17:01:03 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Cart_Product]') AND parent_object_id = OBJECT_ID(N'[dbo].[Cart]'))
ALTER TABLE [dbo].[Cart] DROP CONSTRAINT [FK_Cart_Product]
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Cart_Amount]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Cart] DROP CONSTRAINT [DF_Cart_Amount]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Cart]') AND type in (N'U'))
DROP TABLE [dbo].[Cart]
GO
/****** Object:  Table [dbo].[ProductDetail]    Script Date: 01/10/2012 17:01:03 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ProductDetail_Product]') AND parent_object_id = OBJECT_ID(N'[dbo].[ProductDetail]'))
ALTER TABLE [dbo].[ProductDetail] DROP CONSTRAINT [FK_ProductDetail_Product]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ProductDetail]') AND type in (N'U'))
DROP TABLE [dbo].[ProductDetail]
GO
/****** Object:  Table [dbo].[AnswerQuestion]    Script Date: 01/10/2012 17:01:02 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_AnswerQuestion_User]') AND parent_object_id = OBJECT_ID(N'[dbo].[AnswerQuestion]'))
ALTER TABLE [dbo].[AnswerQuestion] DROP CONSTRAINT [FK_AnswerQuestion_User]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AnswerQuestion]') AND type in (N'U'))
DROP TABLE [dbo].[AnswerQuestion]
GO
/****** Object:  StoredProcedure [dbo].[CreateUser]    Script Date: 01/10/2012 17:01:02 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CreateUser]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[CreateUser]
GO
/****** Object:  StoredProcedure [dbo].[CheckLogin]    Script Date: 01/10/2012 17:01:02 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CheckLogin]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[CheckLogin]
GO
/****** Object:  StoredProcedure [dbo].[CheckUser]    Script Date: 01/10/2012 17:01:02 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CheckUser]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[CheckUser]
GO
/****** Object:  Table [dbo].[News]    Script Date: 01/10/2012 17:01:02 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_News_User]') AND parent_object_id = OBJECT_ID(N'[dbo].[News]'))
ALTER TABLE [dbo].[News] DROP CONSTRAINT [FK_News_User]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[News]') AND type in (N'U'))
DROP TABLE [dbo].[News]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 01/10/2012 17:01:02 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Product_SubCategory]') AND parent_object_id = OBJECT_ID(N'[dbo].[Product]'))
ALTER TABLE [dbo].[Product] DROP CONSTRAINT [FK_Product_SubCategory]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Product]') AND type in (N'U'))
DROP TABLE [dbo].[Product]
GO
/****** Object:  Table [dbo].[SubCategory]    Script Date: 01/10/2012 17:01:02 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_SubCategory_Category]') AND parent_object_id = OBJECT_ID(N'[dbo].[SubCategory]'))
ALTER TABLE [dbo].[SubCategory] DROP CONSTRAINT [FK_SubCategory_Category]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SubCategory]') AND type in (N'U'))
DROP TABLE [dbo].[SubCategory]
GO
/****** Object:  StoredProcedure [dbo].[CreateShop]    Script Date: 01/10/2012 17:01:02 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CreateShop]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[CreateShop]
GO
/****** Object:  Table [dbo].[User]    Script Date: 01/10/2012 17:00:57 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_User_Role]') AND parent_object_id = OBJECT_ID(N'[dbo].[User]'))
ALTER TABLE [dbo].[User] DROP CONSTRAINT [FK_User_Role]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_User_Shop]') AND parent_object_id = OBJECT_ID(N'[dbo].[User]'))
ALTER TABLE [dbo].[User] DROP CONSTRAINT [FK_User_Shop]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[User]') AND type in (N'U'))
DROP TABLE [dbo].[User]
GO
/****** Object:  Table [dbo].[Advertise]    Script Date: 01/10/2012 17:00:57 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Advertise]') AND type in (N'U'))
DROP TABLE [dbo].[Advertise]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 01/10/2012 17:00:56 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Category]') AND type in (N'U'))
DROP TABLE [dbo].[Category]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 01/10/2012 17:00:56 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Role]') AND type in (N'U'))
DROP TABLE [dbo].[Role]
GO
/****** Object:  Table [dbo].[Shop]    Script Date: 01/10/2012 17:00:56 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Shop]') AND type in (N'U'))
DROP TABLE [dbo].[Shop]
GO
/****** Object:  Table [dbo].[Shop]    Script Date: 01/10/2012 17:00:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Shop]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Shop](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Shopname] [nvarchar](100) NULL,
	[Email] [varchar](50) NOT NULL,
	[Web] [nvarchar](50) NULL,
	[State] [nvarchar](100) NULL,
	[Createdate] [datetime] NOT NULL,
 CONSTRAINT [PK_Shop] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Shop] ON
INSERT [dbo].[Shop] ([ID], [Shopname], [Email], [Web], [State], [Createdate]) VALUES (3, N'sadman289@gmail.com', N'sadman289@gmail.com', N'http://a.a.a', N'Germany', CAST(0x00009FD200265F9F AS DateTime))
SET IDENTITY_INSERT [dbo].[Shop] OFF
/****** Object:  Table [dbo].[Role]    Script Date: 01/10/2012 17:00:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Role]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Role](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET IDENTITY_INSERT [dbo].[Role] ON
INSERT [dbo].[Role] ([ID], [Name]) VALUES (1, N'Administrator')
INSERT [dbo].[Role] ([ID], [Name]) VALUES (2, N'Shop')
INSERT [dbo].[Role] ([ID], [Name]) VALUES (3, N'Member')
SET IDENTITY_INSERT [dbo].[Role] OFF
/****** Object:  Table [dbo].[Category]    Script Date: 01/10/2012 17:00:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Category]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Category](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Order] [tinyint] NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET IDENTITY_INSERT [dbo].[Category] ON
INSERT [dbo].[Category] ([ID], [Name], [Order]) VALUES (1, N'Thời Trang, Trang Sức', 1)
INSERT [dbo].[Category] ([ID], [Name], [Order]) VALUES (2, N'Làm Đẹp, Sức Khỏe', 2)
INSERT [dbo].[Category] ([ID], [Name], [Order]) VALUES (3, N'Điện Thoại', 3)
INSERT [dbo].[Category] ([ID], [Name], [Order]) VALUES (4, N'Máy Tính Và Mạng', 4)
INSERT [dbo].[Category] ([ID], [Name], [Order]) VALUES (5, N'Máy Ảnh Máy Quay', 5)
INSERT [dbo].[Category] ([ID], [Name], [Order]) VALUES (6, N'Điện Tử Nghe Nhìn', 6)
SET IDENTITY_INSERT [dbo].[Category] OFF
/****** Object:  Table [dbo].[Advertise]    Script Date: 01/10/2012 17:00:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Advertise]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Advertise](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ZoneName] [nvarchar](150) NOT NULL,
	[Content] [nvarchar](500) NULL,
 CONSTRAINT [PK_Advertise] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[User]    Script Date: 01/10/2012 17:00:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[User]') AND type in (N'U'))
BEGIN
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
	[yahoo] [nvarchar](50) NULL,
	[mobile] [nvarchar](50) NULL,
	[ShopID] [int] NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[User] ON
INSERT [dbo].[User] ([ID], [fname], [lname], [email], [pass], [bday], [state], [CU], [class], [createdate], [roleID], [yahoo], [mobile], [ShopID]) VALUES (1, N'Nguyễn', N'nam nguyễn', N'sa22dman289@gmail.com', N'qweqwe1', CAST(0x00009FD001052FBC AS DateTime), N'Select your current states', N'Chose your College/ University', N'Select you', CAST(0x00009FD001052FBC AS DateTime), 3, NULL, NULL, NULL)
INSERT [dbo].[User] ([ID], [fname], [lname], [email], [pass], [bday], [state], [CU], [class], [createdate], [roleID], [yahoo], [mobile], [ShopID]) VALUES (2, N'Nguyễn', N'nam nguyễn', N'sa2dman289@gmail.com', N'qweqwe1', CAST(0x00009FD0011195F8 AS DateTime), N'Select your current states', N'Chose your College/ University', N'Select you', CAST(0x00009FD0011195F8 AS DateTime), 3, NULL, NULL, NULL)
INSERT [dbo].[User] ([ID], [fname], [lname], [email], [pass], [bday], [state], [CU], [class], [createdate], [roleID], [yahoo], [mobile], [ShopID]) VALUES (3, N'Nguyễn', N'nam nguyễn', N'sadman289@gmail.com', N'qweqwe1', CAST(0x00009FD00113912B AS DateTime), N'Select your current states', N'Chose your College/ University', N'Select you', CAST(0x00009FD00113912B AS DateTime), 2, N'vunam', NULL, 3)
INSERT [dbo].[User] ([ID], [fname], [lname], [email], [pass], [bday], [state], [CU], [class], [createdate], [roleID], [yahoo], [mobile], [ShopID]) VALUES (4, N'Nguyễn', N'nam nguyễn', N'sadmanz289@gmail.com', N'qweqwe1', CAST(0x00009FD001156239 AS DateTime), N'Select your current states', N'Chose your College/ University', N'Select you', CAST(0x00009FD001156239 AS DateTime), 3, NULL, NULL, NULL)
INSERT [dbo].[User] ([ID], [fname], [lname], [email], [pass], [bday], [state], [CU], [class], [createdate], [roleID], [yahoo], [mobile], [ShopID]) VALUES (5, N'Namnguyen', N'vunam', N'sam@gmail.com', N'qweqwe1', CAST(0x00007E7E00000000 AS DateTime), N'Viet Nam', N'Chose your College/ University', N'2006', CAST(0x00009FD20032E6FC AS DateTime), 3, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[User] OFF
/****** Object:  StoredProcedure [dbo].[CreateShop]    Script Date: 01/10/2012 17:01:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CreateShop]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
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

' 
END
GO
/****** Object:  Table [dbo].[SubCategory]    Script Date: 01/10/2012 17:01:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SubCategory]') AND type in (N'U'))
BEGIN
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
END
GO
SET IDENTITY_INSERT [dbo].[SubCategory] ON
INSERT [dbo].[SubCategory] ([ID], [CategoryID], [Name], [Order]) VALUES (1, 1, N'Quần Áo Nữ', NULL)
INSERT [dbo].[SubCategory] ([ID], [CategoryID], [Name], [Order]) VALUES (2, 1, N'Quần Áo Nam', NULL)
INSERT [dbo].[SubCategory] ([ID], [CategoryID], [Name], [Order]) VALUES (3, 1, N'Giày Dép Nữ', NULL)
INSERT [dbo].[SubCategory] ([ID], [CategoryID], [Name], [Order]) VALUES (4, 1, N'Giày Dép Nam', NULL)
INSERT [dbo].[SubCategory] ([ID], [CategoryID], [Name], [Order]) VALUES (5, 2, N'Mỹ Phẩm Trang Điểm', NULL)
INSERT [dbo].[SubCategory] ([ID], [CategoryID], [Name], [Order]) VALUES (6, 2, N'Nước Hoa', NULL)
INSERT [dbo].[SubCategory] ([ID], [CategoryID], [Name], [Order]) VALUES (7, 2, N'Xoa Bóp, Mát Xa', NULL)
INSERT [dbo].[SubCategory] ([ID], [CategoryID], [Name], [Order]) VALUES (8, 5, N'Máy Ảnh', NULL)
INSERT [dbo].[SubCategory] ([ID], [CategoryID], [Name], [Order]) VALUES (9, 5, N'Máy Quay', NULL)
INSERT [dbo].[SubCategory] ([ID], [CategoryID], [Name], [Order]) VALUES (10, 5, N'Đèn Flash', NULL)
SET IDENTITY_INSERT [dbo].[SubCategory] OFF
/****** Object:  Table [dbo].[Product]    Script Date: 01/10/2012 17:01:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Product]') AND type in (N'U'))
BEGIN
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
END
GO
SET IDENTITY_INSERT [dbo].[Product] ON
INSERT [dbo].[Product] ([ID], [SubCategoryID], [Price], [Picture], [Thumbnail], [CreatedDate], [PosterID], [Outstanding]) VALUES (2, 1, 100000, N'media/upload/product1.jpg', N'media/upload/product1.jpg', CAST(0x00009FD400000000 AS DateTime), 1, 0)
INSERT [dbo].[Product] ([ID], [SubCategoryID], [Price], [Picture], [Thumbnail], [CreatedDate], [PosterID], [Outstanding]) VALUES (5, 2, 500000, N'media/upload/product2.jpg', N'media/upload/product2.jpg', CAST(0x00009F9800000000 AS DateTime), 2, 1)
INSERT [dbo].[Product] ([ID], [SubCategoryID], [Price], [Picture], [Thumbnail], [CreatedDate], [PosterID], [Outstanding]) VALUES (7, 3, 2000000, N'media/upload/product4.jpg', N'media/upload/product4.jpg', CAST(0x00009FC100000000 AS DateTime), 3, 1)
INSERT [dbo].[Product] ([ID], [SubCategoryID], [Price], [Picture], [Thumbnail], [CreatedDate], [PosterID], [Outstanding]) VALUES (8, 4, 200000, N'media/upload/product4.jpg', N'media/upload/product4.jpg', CAST(0x00009FA300000000 AS DateTime), 3, 1)
INSERT [dbo].[Product] ([ID], [SubCategoryID], [Price], [Picture], [Thumbnail], [CreatedDate], [PosterID], [Outstanding]) VALUES (9, 5, 1000000, N'media/upload/product5.jpg', N'media/upload/product5.jpg', CAST(0x00009FCC00000000 AS DateTime), 2, 1)
SET IDENTITY_INSERT [dbo].[Product] OFF
/****** Object:  Table [dbo].[News]    Script Date: 01/10/2012 17:01:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[News]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[News](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](200) NOT NULL,
	[Content] [ntext] NULL,
	[PosterID] [int] NOT NULL,
 CONSTRAINT [PK_News] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  StoredProcedure [dbo].[CheckUser]    Script Date: 01/10/2012 17:01:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CheckUser]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
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

' 
END
GO
/****** Object:  StoredProcedure [dbo].[CheckLogin]    Script Date: 01/10/2012 17:01:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CheckLogin]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[CheckLogin] 
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

' 
END
GO
/****** Object:  StoredProcedure [dbo].[CreateUser]    Script Date: 01/10/2012 17:01:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CreateUser]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
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

' 
END
GO
/****** Object:  Table [dbo].[AnswerQuestion]    Script Date: 01/10/2012 17:01:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AnswerQuestion]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AnswerQuestion](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[PosterID] [int] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[type] [nvarchar](100) NULL,
	[Content] [nvarchar](max) NULL,
	[isActive] [bit] NOT NULL,
 CONSTRAINT [PK_AnswerQuestion] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET IDENTITY_INSERT [dbo].[AnswerQuestion] ON
INSERT [dbo].[AnswerQuestion] ([ID], [PosterID], [CreateDate], [type], [Content], [isActive]) VALUES (1, 1, CAST(0x00009E7300000000 AS DateTime), N'Other', N'khong co gi de hoi ca', 1)
INSERT [dbo].[AnswerQuestion] ([ID], [PosterID], [CreateDate], [type], [Content], [isActive]) VALUES (2, 2, CAST(0x00009FA200000000 AS DateTime), N'Share', N'share cái gì vậy', 0)
SET IDENTITY_INSERT [dbo].[AnswerQuestion] OFF
/****** Object:  Table [dbo].[ProductDetail]    Script Date: 01/10/2012 17:01:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ProductDetail]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ProductDetail](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ProductID] [int] NOT NULL,
	[Content] [nvarchar](max) NULL,
 CONSTRAINT [PK_ProductDetail] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET IDENTITY_INSERT [dbo].[ProductDetail] ON
INSERT [dbo].[ProductDetail] ([ID], [ProductID], [Content]) VALUES (1, 2, N'chưa có nội dung chi tiết')
INSERT [dbo].[ProductDetail] ([ID], [ProductID], [Content]) VALUES (2, 5, N'chưa có nội dung chi tiết')
INSERT [dbo].[ProductDetail] ([ID], [ProductID], [Content]) VALUES (3, 7, N'chưa có nội dung chi tiết')
INSERT [dbo].[ProductDetail] ([ID], [ProductID], [Content]) VALUES (4, 8, N'chưa có nội dung chi tiết')
INSERT [dbo].[ProductDetail] ([ID], [ProductID], [Content]) VALUES (5, 9, N'chưa có nội dung chi tiết')
SET IDENTITY_INSERT [dbo].[ProductDetail] OFF
/****** Object:  Table [dbo].[Cart]    Script Date: 01/10/2012 17:01:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Cart]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Cart](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ProductID] [int] NOT NULL,
	[Amount] [int] NOT NULL CONSTRAINT [DF_Cart_Amount]  DEFAULT ((0)),
	[Buyer] [int] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[MoreDetail] [nvarchar](500) NULL,
 CONSTRAINT [PK_Cart] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET IDENTITY_INSERT [dbo].[Cart] ON
INSERT [dbo].[Cart] ([ID], [ProductID], [Amount], [Buyer], [CreateDate], [MoreDetail]) VALUES (1, 2, 10, 1, CAST(0x00009FC100000000 AS DateTime), N'chưa có nội dung chi tiết')
INSERT [dbo].[Cart] ([ID], [ProductID], [Amount], [Buyer], [CreateDate], [MoreDetail]) VALUES (2, 7, 1, 3, CAST(0x00009FDE00000000 AS DateTime), N'chưa có nội dung chi tiết')
SET IDENTITY_INSERT [dbo].[Cart] OFF
/****** Object:  Table [dbo].[SubAQ]    Script Date: 01/10/2012 17:01:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SubAQ]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[SubAQ](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[PosterID] [int] NOT NULL,
	[AQID] [int] NOT NULL,
	[Content] [nvarchar](max) NULL,
	[CreateDate] [datetime] NOT NULL,
 CONSTRAINT [PK_SubAQ] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET IDENTITY_INSERT [dbo].[SubAQ] ON
INSERT [dbo].[SubAQ] ([ID], [PosterID], [AQID], [Content], [CreateDate]) VALUES (1, 3, 1, N'không có luôn', CAST(0x00009FE000000000 AS DateTime))
INSERT [dbo].[SubAQ] ([ID], [PosterID], [AQID], [Content], [CreateDate]) VALUES (2, 4, 2, N'gì cũng được ', CAST(0x00009FFF00000000 AS DateTime))
SET IDENTITY_INSERT [dbo].[SubAQ] OFF
/****** Object:  Table [dbo].[Comment]    Script Date: 01/10/2012 17:01:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Comment]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Comment](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[PosterID] [int] NOT NULL,
	[Product] [int] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[Content] [nvarchar](max) NULL,
 CONSTRAINT [PK_Comment] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET IDENTITY_INSERT [dbo].[Comment] ON
INSERT [dbo].[Comment] ([ID], [PosterID], [Product], [CreateDate], [Content]) VALUES (1, 1, 2, CAST(0x00009FC100000000 AS DateTime), N'priceStopBracketPos')
INSERT [dbo].[Comment] ([ID], [PosterID], [Product], [CreateDate], [Content]) VALUES (2, 2, 2, CAST(0x00009FC200000000 AS DateTime), N'priceStopBracketPos')
INSERT [dbo].[Comment] ([ID], [PosterID], [Product], [CreateDate], [Content]) VALUES (3, 2, 5, CAST(0x00009F9900000000 AS DateTime), N'2	2	2011-12-23 00:00:00.000	priceStopBracketPos')
SET IDENTITY_INSERT [dbo].[Comment] OFF
/****** Object:  Table [dbo].[SubComment]    Script Date: 01/10/2012 17:01:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SubComment]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[SubComment](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[PosterID] [int] NOT NULL,
	[CommentID] [int] NOT NULL,
	[Content] [nvarchar](max) NULL,
	[CreateDate] [datetime] NULL,
 CONSTRAINT [PK_SubComment] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET IDENTITY_INSERT [dbo].[SubComment] ON
INSERT [dbo].[SubComment] ([ID], [PosterID], [CommentID], [Content], [CreateDate]) VALUES (1, 1, 1, N'priceStartBracketPos = question.indexOf(''('');', CAST(0x00009FA300000000 AS DateTime))
INSERT [dbo].[SubComment] ([ID], [PosterID], [CommentID], [Content], [CreateDate]) VALUES (2, 3, 2, N'sssssssss', CAST(0x00009FEB00000000 AS DateTime))
SET IDENTITY_INSERT [dbo].[SubComment] OFF
/****** Object:  ForeignKey [FK_User_Role]    Script Date: 01/10/2012 17:00:57 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_User_Role]') AND parent_object_id = OBJECT_ID(N'[dbo].[User]'))
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_Role] FOREIGN KEY([roleID])
REFERENCES [dbo].[Role] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_User_Role]') AND parent_object_id = OBJECT_ID(N'[dbo].[User]'))
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_Role]
GO
/****** Object:  ForeignKey [FK_User_Shop]    Script Date: 01/10/2012 17:00:57 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_User_Shop]') AND parent_object_id = OBJECT_ID(N'[dbo].[User]'))
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_Shop] FOREIGN KEY([ShopID])
REFERENCES [dbo].[Shop] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_User_Shop]') AND parent_object_id = OBJECT_ID(N'[dbo].[User]'))
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_Shop]
GO
/****** Object:  ForeignKey [FK_SubCategory_Category]    Script Date: 01/10/2012 17:01:02 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_SubCategory_Category]') AND parent_object_id = OBJECT_ID(N'[dbo].[SubCategory]'))
ALTER TABLE [dbo].[SubCategory]  WITH CHECK ADD  CONSTRAINT [FK_SubCategory_Category] FOREIGN KEY([CategoryID])
REFERENCES [dbo].[Category] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_SubCategory_Category]') AND parent_object_id = OBJECT_ID(N'[dbo].[SubCategory]'))
ALTER TABLE [dbo].[SubCategory] CHECK CONSTRAINT [FK_SubCategory_Category]
GO
/****** Object:  ForeignKey [FK_Product_SubCategory]    Script Date: 01/10/2012 17:01:02 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Product_SubCategory]') AND parent_object_id = OBJECT_ID(N'[dbo].[Product]'))
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_SubCategory] FOREIGN KEY([SubCategoryID])
REFERENCES [dbo].[SubCategory] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Product_SubCategory]') AND parent_object_id = OBJECT_ID(N'[dbo].[Product]'))
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_SubCategory]
GO
/****** Object:  ForeignKey [FK_News_User]    Script Date: 01/10/2012 17:01:02 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_News_User]') AND parent_object_id = OBJECT_ID(N'[dbo].[News]'))
ALTER TABLE [dbo].[News]  WITH CHECK ADD  CONSTRAINT [FK_News_User] FOREIGN KEY([PosterID])
REFERENCES [dbo].[User] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_News_User]') AND parent_object_id = OBJECT_ID(N'[dbo].[News]'))
ALTER TABLE [dbo].[News] CHECK CONSTRAINT [FK_News_User]
GO
/****** Object:  ForeignKey [FK_AnswerQuestion_User]    Script Date: 01/10/2012 17:01:02 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_AnswerQuestion_User]') AND parent_object_id = OBJECT_ID(N'[dbo].[AnswerQuestion]'))
ALTER TABLE [dbo].[AnswerQuestion]  WITH CHECK ADD  CONSTRAINT [FK_AnswerQuestion_User] FOREIGN KEY([PosterID])
REFERENCES [dbo].[User] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_AnswerQuestion_User]') AND parent_object_id = OBJECT_ID(N'[dbo].[AnswerQuestion]'))
ALTER TABLE [dbo].[AnswerQuestion] CHECK CONSTRAINT [FK_AnswerQuestion_User]
GO
/****** Object:  ForeignKey [FK_ProductDetail_Product]    Script Date: 01/10/2012 17:01:03 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ProductDetail_Product]') AND parent_object_id = OBJECT_ID(N'[dbo].[ProductDetail]'))
ALTER TABLE [dbo].[ProductDetail]  WITH CHECK ADD  CONSTRAINT [FK_ProductDetail_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ID])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ProductDetail_Product]') AND parent_object_id = OBJECT_ID(N'[dbo].[ProductDetail]'))
ALTER TABLE [dbo].[ProductDetail] CHECK CONSTRAINT [FK_ProductDetail_Product]
GO
/****** Object:  ForeignKey [FK_Cart_Product]    Script Date: 01/10/2012 17:01:03 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Cart_Product]') AND parent_object_id = OBJECT_ID(N'[dbo].[Cart]'))
ALTER TABLE [dbo].[Cart]  WITH CHECK ADD  CONSTRAINT [FK_Cart_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Cart_Product]') AND parent_object_id = OBJECT_ID(N'[dbo].[Cart]'))
ALTER TABLE [dbo].[Cart] CHECK CONSTRAINT [FK_Cart_Product]
GO
/****** Object:  ForeignKey [FK_SubAQ_AnswerQuestion]    Script Date: 01/10/2012 17:01:03 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_SubAQ_AnswerQuestion]') AND parent_object_id = OBJECT_ID(N'[dbo].[SubAQ]'))
ALTER TABLE [dbo].[SubAQ]  WITH CHECK ADD  CONSTRAINT [FK_SubAQ_AnswerQuestion] FOREIGN KEY([AQID])
REFERENCES [dbo].[AnswerQuestion] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_SubAQ_AnswerQuestion]') AND parent_object_id = OBJECT_ID(N'[dbo].[SubAQ]'))
ALTER TABLE [dbo].[SubAQ] CHECK CONSTRAINT [FK_SubAQ_AnswerQuestion]
GO
/****** Object:  ForeignKey [FK_SubAQ_User]    Script Date: 01/10/2012 17:01:03 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_SubAQ_User]') AND parent_object_id = OBJECT_ID(N'[dbo].[SubAQ]'))
ALTER TABLE [dbo].[SubAQ]  WITH CHECK ADD  CONSTRAINT [FK_SubAQ_User] FOREIGN KEY([PosterID])
REFERENCES [dbo].[User] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_SubAQ_User]') AND parent_object_id = OBJECT_ID(N'[dbo].[SubAQ]'))
ALTER TABLE [dbo].[SubAQ] CHECK CONSTRAINT [FK_SubAQ_User]
GO
/****** Object:  ForeignKey [FK_Comment_Product]    Script Date: 01/10/2012 17:01:03 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Comment_Product]') AND parent_object_id = OBJECT_ID(N'[dbo].[Comment]'))
ALTER TABLE [dbo].[Comment]  WITH CHECK ADD  CONSTRAINT [FK_Comment_Product] FOREIGN KEY([Product])
REFERENCES [dbo].[Product] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Comment_Product]') AND parent_object_id = OBJECT_ID(N'[dbo].[Comment]'))
ALTER TABLE [dbo].[Comment] CHECK CONSTRAINT [FK_Comment_Product]
GO
/****** Object:  ForeignKey [FK_Comment_User]    Script Date: 01/10/2012 17:01:03 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Comment_User]') AND parent_object_id = OBJECT_ID(N'[dbo].[Comment]'))
ALTER TABLE [dbo].[Comment]  WITH CHECK ADD  CONSTRAINT [FK_Comment_User] FOREIGN KEY([PosterID])
REFERENCES [dbo].[User] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Comment_User]') AND parent_object_id = OBJECT_ID(N'[dbo].[Comment]'))
ALTER TABLE [dbo].[Comment] CHECK CONSTRAINT [FK_Comment_User]
GO
/****** Object:  ForeignKey [FK_SubComment_Comment]    Script Date: 01/10/2012 17:01:04 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_SubComment_Comment]') AND parent_object_id = OBJECT_ID(N'[dbo].[SubComment]'))
ALTER TABLE [dbo].[SubComment]  WITH CHECK ADD  CONSTRAINT [FK_SubComment_Comment] FOREIGN KEY([CommentID])
REFERENCES [dbo].[Comment] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_SubComment_Comment]') AND parent_object_id = OBJECT_ID(N'[dbo].[SubComment]'))
ALTER TABLE [dbo].[SubComment] CHECK CONSTRAINT [FK_SubComment_Comment]
GO
/****** Object:  ForeignKey [FK_SubComment_User]    Script Date: 01/10/2012 17:01:04 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_SubComment_User]') AND parent_object_id = OBJECT_ID(N'[dbo].[SubComment]'))
ALTER TABLE [dbo].[SubComment]  WITH CHECK ADD  CONSTRAINT [FK_SubComment_User] FOREIGN KEY([PosterID])
REFERENCES [dbo].[User] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_SubComment_User]') AND parent_object_id = OBJECT_ID(N'[dbo].[SubComment]'))
ALTER TABLE [dbo].[SubComment] CHECK CONSTRAINT [FK_SubComment_User]
GO
