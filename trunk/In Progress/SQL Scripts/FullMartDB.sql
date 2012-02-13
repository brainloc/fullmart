USE [master]
GO
/****** Object:  Database [FullMart]    Script Date: 02/13/2012 16:28:36 ******/
CREATE DATABASE [FullMart] ON  PRIMARY 
( NAME = N'FullMart', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.VN\MSSQL\DATA\FullMart.mdf' , SIZE = 2304KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'FullMart_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.VN\MSSQL\DATA\FullMart_log.LDF' , SIZE = 832KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
EXEC dbo.sp_dbcmptlevel @dbname=N'FullMart', @new_cmptlevel=90
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [FullMart].[dbo].[sp_fulltext_database] @action = 'disable'
end
GO
ALTER DATABASE [FullMart] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [FullMart] SET ANSI_NULLS OFF
GO
ALTER DATABASE [FullMart] SET ANSI_PADDING OFF
GO
ALTER DATABASE [FullMart] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [FullMart] SET ARITHABORT OFF
GO
ALTER DATABASE [FullMart] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [FullMart] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [FullMart] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [FullMart] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [FullMart] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [FullMart] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [FullMart] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [FullMart] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [FullMart] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [FullMart] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [FullMart] SET  DISABLE_BROKER
GO
ALTER DATABASE [FullMart] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [FullMart] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [FullMart] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [FullMart] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [FullMart] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [FullMart] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [FullMart] SET  READ_WRITE
GO
ALTER DATABASE [FullMart] SET RECOVERY FULL
GO
ALTER DATABASE [FullMart] SET  MULTI_USER
GO
ALTER DATABASE [FullMart] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [FullMart] SET DB_CHAINING OFF
GO
USE [FullMart]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 02/13/2012 16:28:40 ******/
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
SET IDENTITY_INSERT [dbo].[Category] ON
INSERT [dbo].[Category] ([ID], [Name], [Order]) VALUES (1, N'Thời Trang, Trang Sức', 1)
INSERT [dbo].[Category] ([ID], [Name], [Order]) VALUES (2, N'Làm Đẹp, Sức Khỏe', 2)
INSERT [dbo].[Category] ([ID], [Name], [Order]) VALUES (3, N'Điện Thoại', 3)
INSERT [dbo].[Category] ([ID], [Name], [Order]) VALUES (4, N'Máy Tính Và Mạng', 4)
INSERT [dbo].[Category] ([ID], [Name], [Order]) VALUES (5, N'Máy Ảnh Máy Quay', 5)
INSERT [dbo].[Category] ([ID], [Name], [Order]) VALUES (6, N'Điện Tử Nghe Nhìn', 6)
SET IDENTITY_INSERT [dbo].[Category] OFF
/****** Object:  Table [dbo].[GeneralOption]    Script Date: 02/13/2012 16:28:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GeneralOption](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Option] [nvarchar](150) NOT NULL,
	[EN] [ntext] NULL,
	[VI] [ntext] NULL,
 CONSTRAINT [PK_GeneralOption] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[GeneralOption] ON
INSERT [dbo].[GeneralOption] ([ID], [Option], [EN], [VI]) VALUES (1, N'Term Condition', N'<p>
	nothing in here please</p>
', N'<p>
	chẳng có gì ở đây</p>
')
INSERT [dbo].[GeneralOption] ([ID], [Option], [EN], [VI]) VALUES (2, N'Footer', N'<p>
	out company</p>
', N'<p>
	công ty của chúng tui</p>
')
SET IDENTITY_INSERT [dbo].[GeneralOption] OFF
/****** Object:  Table [dbo].[Role]    Script Date: 02/13/2012 16:28:40 ******/
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
SET IDENTITY_INSERT [dbo].[Role] ON
INSERT [dbo].[Role] ([ID], [Name]) VALUES (1, N'Administrator')
INSERT [dbo].[Role] ([ID], [Name]) VALUES (2, N'Shop')
INSERT [dbo].[Role] ([ID], [Name]) VALUES (3, N'Member')
SET IDENTITY_INSERT [dbo].[Role] OFF
/****** Object:  Table [dbo].[State]    Script Date: 02/13/2012 16:28:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[State](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[StateName] [nvarchar](100) NULL,
	[Order] [smallint] NULL,
 CONSTRAINT [PK_State] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[State] ON
INSERT [dbo].[State] ([id], [StateName], [Order]) VALUES (1, N'Brazil', 1)
INSERT [dbo].[State] ([id], [StateName], [Order]) VALUES (2, N'France', 2)
INSERT [dbo].[State] ([id], [StateName], [Order]) VALUES (3, N' Germany', 3)
INSERT [dbo].[State] ([id], [StateName], [Order]) VALUES (4, N'India', 4)
INSERT [dbo].[State] ([id], [StateName], [Order]) VALUES (5, N'Japan', 5)
INSERT [dbo].[State] ([id], [StateName], [Order]) VALUES (6, N' Serbia', 6)
INSERT [dbo].[State] ([id], [StateName], [Order]) VALUES (7, N'United Kingdom', 7)
INSERT [dbo].[State] ([id], [StateName], [Order]) VALUES (8, N'United States', 8)
SET IDENTITY_INSERT [dbo].[State] OFF
/****** Object:  StoredProcedure [dbo].[CreateShop]    Script Date: 02/13/2012 16:28:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
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
		RETURN 1
	END
END
GO
/****** Object:  Table [dbo].[Advertise]    Script Date: 02/13/2012 16:28:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Advertise](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ZoneName] [nvarchar](150) NOT NULL,
	[Content] [nvarchar](500) NULL,
 CONSTRAINT [PK_Advertise] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 02/13/2012 16:28:43 ******/
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
	[yahoo] [nvarchar](50) NULL,
	[mobile] [nvarchar](50) NULL,
	[ShopID] [int] NULL,
	[Shopname] [nvarchar](50) NULL,
	[Web] [nvarchar](50) NULL,
	[Wishlist] [nvarchar](max) NULL,
	[isActive] [bit] NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[User] ON
INSERT [dbo].[User] ([ID], [fname], [lname], [email], [pass], [bday], [state], [CU], [class], [createdate], [roleID], [yahoo], [mobile], [ShopID], [Shopname], [Web], [Wishlist], [isActive]) VALUES (1, N'Nguyễn', N'nam nguyễn', N'sa22dman289@gmail.com', N'qweqwe1', CAST(0x00009FD001052FBC AS DateTime), N'Select your current states', N'Chose your College/ University', N'Select you', CAST(0x00009FD001052FBC AS DateTime), 3, NULL, NULL, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[User] ([ID], [fname], [lname], [email], [pass], [bday], [state], [CU], [class], [createdate], [roleID], [yahoo], [mobile], [ShopID], [Shopname], [Web], [Wishlist], [isActive]) VALUES (2, N'Nguyễn', N'nam nguyễn', N'sa2dman289@gmail.com', N'qweqwe1', CAST(0x00009FD0011195F8 AS DateTime), N'Select your current states', N'Chose your College/ University', N'Select you', CAST(0x00009FD0011195F8 AS DateTime), 3, NULL, NULL, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[User] ([ID], [fname], [lname], [email], [pass], [bday], [state], [CU], [class], [createdate], [roleID], [yahoo], [mobile], [ShopID], [Shopname], [Web], [Wishlist], [isActive]) VALUES (3, N'Nguyễn', N'nam nguyễn', N'sadman289@gmail.com', N'qweqwe1', CAST(0x00009FD00113912B AS DateTime), N'Select your current states', N'Chose your College/ University', N'Select you', CAST(0x00009FD00113912B AS DateTime), 2, N'vunam', NULL, 3, NULL, NULL, NULL, 1)
INSERT [dbo].[User] ([ID], [fname], [lname], [email], [pass], [bday], [state], [CU], [class], [createdate], [roleID], [yahoo], [mobile], [ShopID], [Shopname], [Web], [Wishlist], [isActive]) VALUES (4, N'Nguyễn', N'nam nguyễn', N'sadmanz289@gmail.com', N'qweqwe1', CAST(0x00009FD001156239 AS DateTime), N'Select your current states', N'Chose your College/ University', N'Select you', CAST(0x00009FD001156239 AS DateTime), 3, NULL, NULL, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[User] ([ID], [fname], [lname], [email], [pass], [bday], [state], [CU], [class], [createdate], [roleID], [yahoo], [mobile], [ShopID], [Shopname], [Web], [Wishlist], [isActive]) VALUES (5, N'Namnguyen', N'vunam', N'sam@gmail.com', N'qweqwe1', CAST(0x00007E7E00000000 AS DateTime), N'Viet Nam', N'Chose your College/ University', N'2006', CAST(0x00009FD20032E6FC AS DateTime), 3, NULL, NULL, NULL, NULL, NULL, NULL, 1)
SET IDENTITY_INSERT [dbo].[User] OFF
/****** Object:  StoredProcedure [dbo].[UpdateGeneralOption]    Script Date: 02/13/2012 16:28:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		NVN
-- Create date: 13 Feb 2012
-- Description:	Update Option
-- =============================================
CREATE PROCEDURE [dbo].[UpdateGeneralOption]
	@ID		int,
	@EN		ntext,
	@VI		ntext
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE [FullMart].[dbo].[GeneralOption]
   SET [FullMart].[dbo].[GeneralOption].[EN] = @EN,[FullMart].[dbo].[GeneralOption].[VI] = @VI
 WHERE [FullMart].[dbo].[GeneralOption].[ID]=@ID
END
GO
/****** Object:  StoredProcedure [dbo].[GetStates]    Script Date: 02/13/2012 16:28:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		BTN
-- Create date: 17 Jan 2012
-- Description:	NO
-- =============================================
CREATE PROCEDURE [dbo].[GetStates]
AS
BEGIN
	
	SET NOCOUNT ON;
	SELECT [id]
      ,[StateName]
      ,[Order]
	FROM [FullMart].[dbo].[State]
	ORDER BY [Order]
    
END
GO
/****** Object:  Table [dbo].[SubCategory]    Script Date: 02/13/2012 16:28:43 ******/
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
/****** Object:  StoredProcedure [dbo].[GetGeneralOption]    Script Date: 02/13/2012 16:28:43 ******/
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
GO
/****** Object:  StoredProcedure [dbo].[GetCategories]    Script Date: 02/13/2012 16:28:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		BTN
-- Create date: 15 Jan, 2012
-- Description:	NO
-- =============================================
CREATE PROCEDURE [dbo].[GetCategories]	
AS
BEGIN
	
	SET NOCOUNT ON;

    SELECT [ID],[Name],[Order]
	FROM [FullMart].[dbo].[Category]
	ORDER BY [Order]
  
END
GO
/****** Object:  Table [dbo].[Product]    Script Date: 02/13/2012 16:28:43 ******/
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
	[Title] [nvarchar](150) NOT NULL,
	[State] [int] NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Product] ON
INSERT [dbo].[Product] ([ID], [SubCategoryID], [Price], [Picture], [Thumbnail], [CreatedDate], [PosterID], [Outstanding], [Title], [State]) VALUES (2, 1, 100000, N'product1.jpg', N'product1.jpg', CAST(0x00009FD400000000 AS DateTime), 1, 0, N'1010192', 1)
INSERT [dbo].[Product] ([ID], [SubCategoryID], [Price], [Picture], [Thumbnail], [CreatedDate], [PosterID], [Outstanding], [Title], [State]) VALUES (5, 2, 500000, N'product2.jpg', N'product2.jpg', CAST(0x00009F9800000000 AS DateTime), 2, 1, N'1010192', 2)
INSERT [dbo].[Product] ([ID], [SubCategoryID], [Price], [Picture], [Thumbnail], [CreatedDate], [PosterID], [Outstanding], [Title], [State]) VALUES (7, 3, 2000000, N'product4.jpg', N'product4.jpg', CAST(0x00009FC100000000 AS DateTime), 3, 1, N'1010192', 3)
INSERT [dbo].[Product] ([ID], [SubCategoryID], [Price], [Picture], [Thumbnail], [CreatedDate], [PosterID], [Outstanding], [Title], [State]) VALUES (8, 4, 200000, N'product4.jpg', N'product4.jpg', CAST(0x00009FA300000000 AS DateTime), 3, 1, N'1010192', 4)
INSERT [dbo].[Product] ([ID], [SubCategoryID], [Price], [Picture], [Thumbnail], [CreatedDate], [PosterID], [Outstanding], [Title], [State]) VALUES (9, 5, 1000000, N'product5.jpg', N'product5.jpg', CAST(0x00009FCC00000000 AS DateTime), 2, 1, N'1010192', 5)
SET IDENTITY_INSERT [dbo].[Product] OFF
/****** Object:  Table [dbo].[News]    Script Date: 02/13/2012 16:28:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[News](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](200) NOT NULL,
	[Content] [ntext] NULL,
	[PosterID] [int] NOT NULL,
	[ShortContent] [nvarchar](500) NULL,
	[ImageThumb] [nvarchar](150) NULL,
	[CreatedDate] [datetime] NULL,
 CONSTRAINT [PK_News] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[News] ON
INSERT [dbo].[News] ([ID], [Title], [Content], [PosterID], [ShortContent], [ImageThumb], [CreatedDate]) VALUES (1, N'tieu de bai viet ', N'<div class="contentn"><p>&nbsp;</p><p style="margin-top: 0px; margin-right: 0px; margin-bottom: 1em; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; border-top-width: 0px; border-right-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-style: initial; border-color: initial; border-image: initial; font-size: 12px; font-family: Arial, Helvetica, sans-serif; vertical-align: baseline; border-style: initial; border-color: initial; color: rgb(68, 68, 68); background-color: rgb(247, 239, 203); ">	<span style="margin-top: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; border-top-width: 0px; border-right-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-style: initial; border-color: initial; border-image: initial; font-style: inherit; font-size: small; vertical-align: baseline; border-style: initial; border-color: initial; ">Giá trên không bao ;VAT</span></p><p style="margin-top: 0px; margin-right: 0px; margin-bottom: 1em; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; border-top-width: 0px; border-right-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-style: initial; border-color: initial; border-image: initial; font-size: 12px; font-family: Arial, Helvetica, sans-serif; vertical-align: baseline; border-style: initial; border-color: initial; color: rgb(68, 68, 68); background-color: rgb(247, 239, 203); ">	<img alt="" src="http://static80.ichodientuvn.com/data/UserData/user_image/ps.tunglt/ffcd97d918b3bd1de0640bb60923d38e.JPG" style="margin-top: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; border-top-width: 0px; border-right-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-style: initial; border-color: initial; border-image: initial; font-style: inherit; vertical-alig aseline; border-style: initial; border-color: initial; "></p><p style="margin-top: 0px; margin-right: 0px; margin-bottom: 1em; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; border-top-width: 0px; border-right-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-style: initial; border-color: initial; border-image: initial; font-size: 12px; font-family: Arial, Helvetica, sans-serif; vertical-align: baseline; border-style: initial; border-color: initial; color: rgb(68, 68, 68); background-color: rgb(247, 239, 203); ">	<span style="margin-top: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; border-top-width: 0px; border-right-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-style: initial; border-color: initial; border-image: initial; font-style: inherit; font-size: small; vertical-align: baseline; border-style: initial; border-color: inil; ">Giỏ quà gồm</span>:</p><p style="margin-top: 0px; margin-right: 0px; margin-bottom: 1em; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; border-top-width: 0px; border-right-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-style: initial; border-color: initial; border-image: initial; font-size: 12px; font-family: Arial, Helvetica, sans-serif; vertical-align: baseline; border-style: initial; border-color: initial; color: rgb(68, 68, 68); background-color: rgb(247, 239, 203); ">	<span style="margin-top: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; border-top-width: 0px; border-right-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-style: initial; border-color: initial; border-image: initial; font-style: inherit; font-size: small; vertical-align: baseline; border-style: initial; border-color: initial; ">1. R<span style="margin-top: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; border-top-width: 0px; border-right-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-style: initial; border-color: initial; border-image: initial; font-style: inherit; font-size: 13px; vertical-align: baseline; border-style: initial; border-color: initial; ">ượ</span>u Curner Sione: Th<span style="margin-top: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; border-top-width: 0px; border-right-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-style: initial; border-color: initial; border-image: initial; font-style: inherit; font-size: 13px; vertical-align: baseline; border-style: initial; border-color: initial; ">ể</span>&nbsp;tích: 750ml;&nbsp; Xu<span style="margin-top: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-op: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; border-top-width: 0px; border-right-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-style: initial; border-color: initial; border-image: initial; font-style: inherit; font-size: 13px; vertical-align: baseline; border-style: initial; border-color: initial; ">ấ</span>t x<span style="margin-top: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; border-top-width: 0px; border-right-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-style: initial; border-color: initial; border-image: initial; font-style: inherit; font-size: 13px; vertical-align: baseline; border-style: initial; border-color: initial; ">ứ</span>: Chile</span></p><p style="margin-top: 0px; margin-right: 0px; margin-bottom: 1em; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; border-top-width: 0px; border-right-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-style: initial; border-color: initial; border-image: initial; font-size: 12px; font-family: Arial, Helvetica, sans-serif; vertical-align: baseline; border-style: initial; border-color: initial; color: rgb(68, 68, 68); background-color: rgb(247, 239, 203); ">	<span style="margin-top: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; border-top-width: 0px; border-right-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-style: initial; border-color: initial; border-image: initial; font-style: inherit; font-size: small; vertical-align: baseline; border-style: initial; border-color: initial; ">2. Bánh Classe : Trọng lượng: 400g; Xuất xứ: Việt Nam</span></p><p style="margin-top: 0px; margin-right: 0px; margin-bottom: 1em; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; border-top-width: 0px; border-right-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-style: initial; border-color: initial; border-image: initial; font-size: 12px; font-family: Arial, Helvetica, sans-serif; vertical-align: baseline; border-style: initial; border-color: initial; color: rgb(68, 68, 68); background-color: rgb(247, 239, 203); ">	<span style="margin-top: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; border-top-width: 0px; border-right-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-style: initial; border-color: initial; border-image: initial; font-style: inherit; font-size: small; vertical-align: baseline; border-style: initial; border-color: initial; ">3.&nbsp;</span><span style="margin-top: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; border-top-width: 0px; border-right-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-style: initial; border-color: initial; border-image: initial; font-style: inherit; font-size: 11pt; vertical-align: baseline; border-style: initial; border-color: initial; line-height: 17px; ">Hộp Cafe G7 Cappuccino: 1 hộp 12 gói; Xuất xứ: Việt Nam</span></p><p style="margin-top: 0px; margin-right: 0px; margin-bottom: 1em; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; border-top-width: 0px; border-right-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-style: initial; border-color: initial; border-image: initial; font-size: 12px; font-family: Arial, Helvetica, sans-serif; vertical-align: baseline; border-style: initial; border-color: initial; color: rgb(68, 68, 68); background-color: rgb(247, 239, 203); ">	<span style="margin-top: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; border-top-width: 0px; border-right-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-style: initial; border-color: initial; border-image: initial; font-style: inherit; font-size: small; vertical-align: baseline; border-style: initial; border-color: initial; ">4. Hộp Lipton tea 25 túi; Xuất xứ Việt Nam</span></p><p style="margin-top: 0px; margin-right: 0px; margin-bottom: 1em; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; border-top-width: 0px; border-right-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-style: initial; border-color: initial; border-image: initial; font-size: 12px; font-family: Arial, Helvetica, sans-serif; vertical-align: baseline; border-style: initial; border-color: initial; color: rgb(68, 68, 68); background-color: rgb(247, 239, 203); ">	<span style="margin-top: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; border-top-width: 0px; border-right-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-style: initial; border-color: initial; border-image: initial; font-style: inherit; font-size: small; vertical-align: baseline; border-style: initial; border-color: initial; ">5. Gói Oreo Trọng lượng: 137g Xuất xứ: Indonexia</span></p><p style="margin-top: 0px; margin-right: 0px; margin-bottom: 1em; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; border-top-width: 0px; border-right-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-style: initial; border-color: initial; border-image: initial; font-size: 12px; font-family: Arial, Helvetica, sans-serif; vertical-align: baseline; border-style: initial; border-color: initial; color: rgb(68, 68, 68); background-color: rgb(247, 239, 203); ">	<span style="margin-top: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; border-top-width: 0px; border-right-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-style: initial; border-color: initial; border-image: initial; font-style: inherit; font-size: small; vertical-align: baseline; border-style: initial; border-color: initial; ">6. Hộp sugas Trọng lượng: 140g Xuất xứ: Việt Nam</span></p><p style="margin-top: 0px; margin-right: 0px; margin-bottom: 1em; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; border-top-width: 0px; border-right-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-style: initial; border-color: initial; border-image: initial; font-size: 12px; font-family: Arial, Helvetica, sans-serif; vertical-align: baseline; border-style: initial; border-color: initial; color: rgb(68, 68, 68); background-color: rgb(247, 239, 203); ">	<span style="margin-top: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; border-top-width: 0px; border-right-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-style: initial; border-color: initial; border-image: initial; font-style: inherit; font-size: small; vertical-align: baseline; border-style: initial; border-color: initial; ">7. Hộp Hello panda Trọng lượng: 50g Xuất xứ Singapore</span></p><p style="margin-top: 0px; margin-right: 0px; margin-bottom: 1em; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; border-top-width: 0px; border-right-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-style: initial; border-color: initial; border-image: initial; font-size: 12px; font-family: Arial, Helvetica, sans-serif; vertical-align: baseline; border-style: initial; border-color: initial; color: rgb(68, 68, 68); background-color: rgb(247, 239, 203); ">	<span style="margin-top: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; border-top-width: 0px; border-right-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-style: initial; border-color: initial; border-image: initial; font-style: inherit; font-size: small; vertical-align: baseline; border-style: initial; border-color: initial; ">8. Giỏ mây và trang trí</span></p><p style="margin-top: 0px; margin-right: 0px; margin-bottom: 1em; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; border-top-width: 1px; border-right-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-style: initial; border-color: initial; border-image: initial; font-size: 12px; font-family: Arial, Helvetica, sans-serif; vertical-align: baseline; border-style: initial; border-color: initial; color: rgb(68, 68, 68); background-color: rgb(247, 239, 203); width: 690px; border-top-color: rgb(204, 204, 204); border-top-style: dotted; ">	&nbsp;</p><p style="margin-top: 0px; margin-right: 0px; margin-bottom: 1em; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; border-top-width: 0px; border-right-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-style: initial; border-color: initial; border-image: initial; font-size: 12px; font-family: Arial, Helvetica, sans-serif; vertical-align: baseline; border-style: initial; border-color: initial; color: rgb(68, 68, 68); background-color: rgb(247, 239, 203); text-align: center; ">	<span style="margin-top: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; border-top-width: 0px; border-right-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-style: initial; border-color: initial; border-image: initial; font-style: inherit; vertical-align: baseline; border-style: initial; border-color: initial; "><em style="margin-top: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; border-top-width: 0px; border-right-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-style: initial; border-color: initial; border-image: initial; font-style: inherit; vertical-align: baseline; border-style: initial; border-color: initial; "><strong style="font-weight: bold; "><span style="margin-top: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; border-top-width: 0px; border-right-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-style: initial; border-color: initial; border-image: initial; font-weight: inherit; font-style: inherit; font-size: medium; vertical-align: baseline; border-style: initial; border-color: initial; ">Shop Zippo Vạn An</span></strong></em></span></p><p style="margin-top: 0px; margin-right: 0px; margin-bottom: 1em; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; border-top-width: 0px; border-right-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-style: initial; border-color: initial; border-image: initial; font-size: 12px; font-family: Arial, Helvetica, sans-serif; vertical-align: baseline; border-style: initial; border-color: initial; color: rgb(68, 68, 68); background-color: rgb(247, 239, 203); text-align: center; ">	<span style="margin-top: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; border-top-width: 0px; border-right-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-style: initial; border-color: initial; border-image: initial; font-style: inherit; vertical-align: baseline; border-style: initial; border-color: initial; "><em style="margin-top: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; border-top-width: 0px; border-right-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-style: initial; border-color: initial; border-image: initial; font-style: inherit; vertical-align: baseline; border-style: initial; border-color: initial; ">Chuyên cung cấp các sản phẩm zippo như: Zippo vintage, zippo Set, zippo la mã, zippo catalogue, zippo L, zippo B, zippo V, zippo M, zippo C, zippo đã sử dụng, phụ kiện zippo, giữ ấm tay zippo, bao da zippo, xăng zippo, đá zippo, bấc zippo, zippo la tinh, zippo slim...</em></span></p><p style="margin-top: 0px; margin-right: 0px; margin-bottom: 1em; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; border-top-width: 0px; border-right-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-style: initial; border-color: initial; border-image: initial; font-size: 12px; font-family: Arial, Helvetica, sans-serif; vertical-align: baseline; border-style: initial; border-color: initial; color: rgb(68, 68, 68); background-color: rgb(247, 239, 203); text-align: center; ">Địa chỉ: Số 404 Nhà G1 - Chung Cư Thành Công - Ba Đình - Hà Nội.</p><p style="margin-top: 0px; margin-right: 0px; margin-bottom: 1em; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; border-top-width: 0px; border-right-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-style: initial; border-color: initial; border-image: initial; font-size: 12px; font-family: Arial, Helvetica, sans-serif; vertical-align: baseline; border-style: initial; border-color: initial; color: rgb(68, 68, 68); background-color: rgb(247, 239, 203); text-align: center; ">	(Ngõ 10 Đường Nguyên Hồng - Gần hồ Thành Công)</p><p style="margin-top: 0px; margin-right: 0px; margin-bottom: 1em; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; border-top-width: 0px; border-right-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-style: initial; border-color: initial; border-image: initial; font-size: 12px; font-family: Arial, Helvetica, s-serif; vertical-align: baseline; border-style: initial; border-color: initial; color: rgb(68, 68, 68); background-color: rgb(247, 239, 203); text-align: center; ">	Hotline: 090 3 268885</p><p style="margin-top: 0px; margin-right: 0px; margin-bottom: 1em; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; border-top-width: 0px; border-right-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-style: initial; border-color: initial; border-image: initial; font-size: 12px; font-family: Arial, Helvetica, sans-serif; vertical-align: baseline; border-style: initial; border-color: initial; color: rgb(68, 68, 68); background-color: rgb(247, 239, 203); text-align: center; ">	ĐT:&nbsp; 04 3773 9688</p><p style="margin-top: 0px; margin-right: 0px; margin-bottom: 1em; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; border-top-width: 0px; border-right-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-style: initial; border-color: initial; border-image: initial; font-size: 12px; font-family: Arial, Helvetica, sans-serif; vertical-align: baseline; border-style: initial; border-color: initial; color: rgb(68, 68, 68); background-color: rgb(247, 239, 203); text-align: center; ">	Fax: 04 3773 3858</p><p style="margin-top: 0px; margin-right: 0px; margin-bottom: 1em; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; border-top-width: 0px; border-right-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-style: initial; border-color: initial; border-image: initial; font-size: 12px; font-family: Arial, Helvetica, sans-serif; vertical-align: baseline; border-style: initial; border-color: initial; color: rgb(68, 68, 68); background-color: rgb(247, 239, 203); text-align: center; ">	Website: http://van-an.net</p><p style="margin-top: 0px; margin-right: 0px; margin-bottom: 1em; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; border-top-width: 0px; border-right-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-style: initial; border-color: initial; border-image: initial; font-size: 12px; font-family: Arial, Helvetica, sans-serif; vertical-align: baseline; border-style: initial; border-color: initial; color: rgb(68, 68, 68); background-color: rgb(247, 239, 203); text-align: center; ">	Email: van-an@live.com</p><p>	&nbsp;</p>                     </div>', 2, N'khong co gi', N'media/upload/product1.jpg', CAST(0x00009FF600000000 AS DateTime))
SET IDENTITY_INSERT [dbo].[News] OFF
/****** Object:  StoredProcedure [dbo].[GetSubCategories]    Script Date: 02/13/2012 16:28:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		BTN
-- Create date: 15 Jan, 2012
-- Description:	NO
-- =============================================
CREATE PROCEDURE [dbo].[GetSubCategories]	
	@catID		INT
AS
BEGIN
	
	SET NOCOUNT ON;

	SELECT [ID],[CategoryID],[Name],[Order]
	FROM [FullMart].[dbo].[SubCategory]
	WHERE [CategoryID] = @catID
	ORDER BY [Order]
	
END
GO
/****** Object:  Table [dbo].[AnswerQuestion]    Script Date: 02/13/2012 16:28:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
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
GO
SET IDENTITY_INSERT [dbo].[AnswerQuestion] ON
INSERT [dbo].[AnswerQuestion] ([ID], [PosterID], [CreateDate], [type], [Content], [isActive]) VALUES (1, 1, CAST(0x00009E7300000000 AS DateTime), N'Other', N'khong co gi de hoi ca', 1)
INSERT [dbo].[AnswerQuestion] ([ID], [PosterID], [CreateDate], [type], [Content], [isActive]) VALUES (2, 2, CAST(0x00009FA200000000 AS DateTime), N'Share', N'share cái gì vậy', 0)
SET IDENTITY_INSERT [dbo].[AnswerQuestion] OFF
/****** Object:  StoredProcedure [dbo].[CheckUser]    Script Date: 02/13/2012 16:28:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CheckUser] 
	@email			NVARCHAR(70)
AS
BEGIN
	
	SET NOCOUNT ON;
	
	SELECT * FROM [FullMart].[dbo].[User] WHERE [email] = @email
END
GO
/****** Object:  StoredProcedure [dbo].[CheckLogin]    Script Date: 02/13/2012 16:28:43 ******/
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
/****** Object:  StoredProcedure [dbo].[CreateUser]    Script Date: 02/13/2012 16:28:43 ******/
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
	@roleID		INT,
	@yahoo		NVARCHAR(50),
	@mobile		NVARCHAR(50),
	@ShopName	NVARCHAR(50),
	@web		NVARCHAR(50),
	@Wishlist	NVARCHAR(MAX),
	@isActive	bit
	
AS
BEGIN
	
	SET NOCOUNT ON;
	
	IF EXISTS(SELECT * FROM [FullMart].[dbo].[User] WHERE [email] = @email)
		RETURN 0
	ELSE
	BEGIN	
		INSERT INTO [FullMart].[dbo].[User]
			   ([fname]
           ,[lname]
           ,[email]
           ,[pass]
           ,[bday]
           ,[state]
           ,[CU]
           ,[class]
           ,[createdate]
           ,[roleID]
           ,[yahoo]
           ,[mobile]
           ,[Shopname]
           ,[Web]
           ,[Wishlist]
           ,[isActive])
		 VALUES
			   (@fname,@lname,@email,@pass,@bday,@state,@CU,@class,GETUTCDATE(),@roleID,@yahoo,@mobile,@ShopName,@web,@Wishlist,@isActive)
		RETURN 1
	END
END
GO
/****** Object:  StoredProcedure [dbo].[GetAllProductsOfCategoryBySubCatID]    Script Date: 02/13/2012 16:28:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		BTN
-- Create date: 22 Jan 2012
-- Description:	NO
-- =============================================
CREATE PROCEDURE [dbo].[GetAllProductsOfCategoryBySubCatID]
	@SubCatID		INT
AS
BEGIN
	SET NOCOUNT ON;
	
	DECLARE @CatID	INT
  
	SELECT @CatID = [FullMart].[dbo].[SubCategory].[CategoryID]
	FROM [FullMart].[dbo].[SubCategory]
	WHERE [FullMart].[dbo].[SubCategory].[ID] = @SubCatID
  
	SELECT [ID],[Price],[Thumbnail],[Title]
	FROM [FullMart].[dbo].[Product]
	WHERE [FullMart].[dbo].[Product].[SubCategoryID] 
		  IN (
				SELECT [FullMart].[dbo].[SubCategory].[ID]
				FROM [FullMart].[dbo].[SubCategory]
				WHERE [FullMart].[dbo].[SubCategory].[CategoryID] = @CatID
			 )
	ORDER BY [CreatedDate] DESC
END
GO
/****** Object:  StoredProcedure [dbo].[GetAllProductsOfCategory]    Script Date: 02/13/2012 16:28:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		BTN
-- Create date: 12 Feb 2012
-- Description:	NO
-- =============================================
CREATE PROCEDURE [dbo].[GetAllProductsOfCategory]
	@CatID		INT
AS
BEGIN
	
	SET NOCOUNT ON;
	
	DECLARE @CatName		NVARCHAR(100)
	
	SELECT @CatName = [FullMart].[dbo].[Category].[Name]
	FROM [FullMart].[dbo].[Category]
	WHERE [FullMart].[dbo].[Category].[ID] = @CatID
  
	SELECT [ID],[Price],[Thumbnail],[Title],@CatName AS [CatName]
	FROM [FullMart].[dbo].[Product]
	WHERE [FullMart].[dbo].[Product].[SubCategoryID] 
		  IN (
				SELECT [FullMart].[dbo].[SubCategory].[ID]
				FROM [FullMart].[dbo].[SubCategory]
				WHERE [FullMart].[dbo].[SubCategory].[CategoryID] = @CatID
			 )
	ORDER BY [CreatedDate] DESC
END
GO
/****** Object:  StoredProcedure [dbo].[GetAllProductsInSubCategory]    Script Date: 02/13/2012 16:28:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		BTN
-- Create date: 12 Feb 2012
-- Description:	NO
-- =============================================
CREATE PROCEDURE [dbo].[GetAllProductsInSubCategory]
	@SubcatID		INT
AS
BEGIN
	
	SET NOCOUNT ON;
  
	DECLARE @SubcatName		NVARCHAR(100),
			@CatName			NVARCHAR(100)
			
	SELECT @SubcatName = [FullMart].[dbo].[SubCategory].[Name]
	FROM [FullMart].[dbo].[SubCategory]
	WHERE [ID] = @SubcatID
	
	SELECT @CatName = [FullMart].[dbo].[Category].[Name]
	FROM [FullMart].[dbo].[Category]
	WHERE [FullMart].[dbo].[Category].[ID] = (SELECT [CategoryID]
											  FROM [FullMart].[dbo].[SubCategory]
											  WHERE [FullMart].[dbo].[SubCategory].[ID] = @SubcatID)
	
	SELECT [ID],[Price],[Thumbnail],[Title]
			,@SubcatName AS [SubcatName], @CatName AS [CatName]
	FROM [FullMart].[dbo].[Product]
	WHERE [FullMart].[dbo].[Product].[SubCategoryID] = @SubcatID		  
	ORDER BY [CreatedDate] DESC
END
GO
/****** Object:  StoredProcedure [dbo].[GetAllProductsByPoster]    Script Date: 02/13/2012 16:28:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		BTN
-- Create date: 22 Jan 2012
-- Description:	NO
-- =============================================
CREATE PROCEDURE [dbo].[GetAllProductsByPoster]
	@PosterID		INT
AS
BEGIN
	
	SET NOCOUNT ON;

	SELECT [ID],[Price],[Thumbnail],[Title]
	FROM [FullMart].[dbo].[Product]
	WHERE [PosterID] = @PosterID
	ORDER BY [CreatedDate] DESC
END
GO
/****** Object:  Table [dbo].[Comment]    Script Date: 02/13/2012 16:28:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
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
GO
SET IDENTITY_INSERT [dbo].[Comment] ON
INSERT [dbo].[Comment] ([ID], [PosterID], [Product], [CreateDate], [Content]) VALUES (1, 1, 2, CAST(0x00009FC100000000 AS DateTime), N'priceStopBracketPos')
INSERT [dbo].[Comment] ([ID], [PosterID], [Product], [CreateDate], [Content]) VALUES (2, 2, 2, CAST(0x00009FC200000000 AS DateTime), N'priceStopBracketPos')
INSERT [dbo].[Comment] ([ID], [PosterID], [Product], [CreateDate], [Content]) VALUES (3, 2, 5, CAST(0x00009F9900000000 AS DateTime), N'2	2	2011-12-23 00:00:00.000	priceStopBracketPos')
SET IDENTITY_INSERT [dbo].[Comment] OFF
/****** Object:  Table [dbo].[Cart]    Script Date: 02/13/2012 16:28:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cart](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ProductID] [int] NOT NULL,
	[Amount] [int] NOT NULL,
	[Buyer] [int] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[MoreDetail] [nvarchar](500) NULL,
	[isRead] [bit] NULL,
 CONSTRAINT [PK_Cart] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Cart] ON
INSERT [dbo].[Cart] ([ID], [ProductID], [Amount], [Buyer], [CreateDate], [MoreDetail], [isRead]) VALUES (1, 2, 10, 1, CAST(0x00009FC100000000 AS DateTime), N'chưa có nội dung chi tiết', NULL)
INSERT [dbo].[Cart] ([ID], [ProductID], [Amount], [Buyer], [CreateDate], [MoreDetail], [isRead]) VALUES (2, 7, 1, 3, CAST(0x00009FDE00000000 AS DateTime), N'chưa có nội dung chi tiết', NULL)
SET IDENTITY_INSERT [dbo].[Cart] OFF
/****** Object:  Table [dbo].[SubAQ]    Script Date: 02/13/2012 16:28:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
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
GO
SET IDENTITY_INSERT [dbo].[SubAQ] ON
INSERT [dbo].[SubAQ] ([ID], [PosterID], [AQID], [Content], [CreateDate]) VALUES (1, 3, 1, N'không có luôn', CAST(0x00009FE000000000 AS DateTime))
INSERT [dbo].[SubAQ] ([ID], [PosterID], [AQID], [Content], [CreateDate]) VALUES (2, 4, 2, N'gì cũng được ', CAST(0x00009FFF00000000 AS DateTime))
SET IDENTITY_INSERT [dbo].[SubAQ] OFF
/****** Object:  Table [dbo].[ProductDetail]    Script Date: 02/13/2012 16:28:43 ******/
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
SET IDENTITY_INSERT [dbo].[ProductDetail] ON
INSERT [dbo].[ProductDetail] ([ID], [ProductID], [Content]) VALUES (1, 2, N'chưa có nội dung chi tiết')
INSERT [dbo].[ProductDetail] ([ID], [ProductID], [Content]) VALUES (2, 5, N'chưa có nội dung chi tiết')
INSERT [dbo].[ProductDetail] ([ID], [ProductID], [Content]) VALUES (3, 7, N'chưa có nội dung chi tiết')
INSERT [dbo].[ProductDetail] ([ID], [ProductID], [Content]) VALUES (4, 8, N'chưa có nội dung chi tiết')
INSERT [dbo].[ProductDetail] ([ID], [ProductID], [Content]) VALUES (5, 9, N'chưa có nội dung chi tiết')
SET IDENTITY_INSERT [dbo].[ProductDetail] OFF
/****** Object:  StoredProcedure [dbo].[GetNewDetail]    Script Date: 02/13/2012 16:28:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		NVN
-- Create date: 13 FEB 2012
-- Description:	NO
-- =============================================
CREATE PROCEDURE [dbo].[GetNewDetail]
	@ID			INT
AS
BEGIN	
	SET NOCOUNT ON;
SELECT [Title]
      ,[Content]
      ,[PosterID]
      ,([FullMart].[dbo].[User].[fname] + ' ' + [FullMart].[dbo].[User].[lname]) AS [PosterName]
      ,[ShortContent]
      ,[ImageThumb]
      ,[CreatedDate]
  FROM [FullMart].[dbo].[News],[FullMart].[dbo].[User]
	WHERE [FullMart].[dbo].[News].[ID] = @ID
			AND [FullMart].[dbo].[User].[ID] = [FullMart].[dbo].[News].[PosterID]
END
GO
/****** Object:  StoredProcedure [dbo].[GetManagingProductList]    Script Date: 02/13/2012 16:28:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		BTN
-- Create date: 12 Feb 2012
-- Description:	NO
-- =============================================
CREATE PROCEDURE [dbo].[GetManagingProductList]
	@ProductID				NVARCHAR(20),
	@Email					NVARCHAR(50),
	@CatID					NVARCHAR(10),
	@SubcatID				NVARCHAR(10) = NULL
AS
BEGIN	
	SET NOCOUNT ON;
	
    SELECT [FullMart].[dbo].[Product].[ID]
	  ,[Title]
	  ,(CONVERT(NVARCHAR(2),DATEPART(DAY,[CreatedDate]))+'/'+CONVERT(NVARCHAR(2),DATEPART(MONTH,[CreatedDate]))+'/'+CONVERT(NVARCHAR(4),DATEPART(YEAR,[CreatedDate]))) AS [CreatedDate] 
	  ,[email]     
      ,[Price]
      ,[SubCategoryID]
      ,[FullMart].[dbo].[SubCategory].[Name]
      ,[Outstanding]
	FROM [FullMart].[dbo].[Product], [FullMart].[dbo].[User],[FullMart].[dbo].[SubCategory]
	WHERE [FullMart].[dbo].[Product].[PosterID]=[FullMart].[dbo].[User].[ID]
		  AND [FullMart].[dbo].[SubCategory].[ID] = [SubCategoryID]
		  /*AND ([FullMart].[dbo].[Product].[ID] = @intProductID
				OR @ProductID IS NULL)
		  AND ([email] = @Email
				OR @Email LIKE '%Enter Email%')
		  AND (@SubcatID = ''
				OR [SubCategoryID] = @intSubcatID)*/
END
GO
/****** Object:  StoredProcedure [dbo].[SearchAllProductsOfCategory]    Script Date: 02/13/2012 16:28:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		NVN
-- Create date: 13 Feb 2012
-- Description:	NO
-- =============================================
CREATE PROCEDURE [dbo].[SearchAllProductsOfCategory]
	@CatID		INT,
	@Key		NVARCHAR(150)
AS
BEGIN
	
	SET NOCOUNT ON;
	
	DECLARE @CatName		NVARCHAR(100)
	
	SELECT @CatName = [FullMart].[dbo].[Category].[Name]
	FROM [FullMart].[dbo].[Category]
	WHERE [FullMart].[dbo].[Category].[ID] = @CatID
  
	SELECT [ID],[Price],[Thumbnail],[Title],@CatName AS [CatName]
	FROM [FullMart].[dbo].[Product]
	WHERE ([FullMart].[dbo].[Product].[SubCategoryID] 
		  IN (
				SELECT [FullMart].[dbo].[SubCategory].[ID]
				FROM [FullMart].[dbo].[SubCategory]
				WHERE [FullMart].[dbo].[SubCategory].[CategoryID] = @CatID
			 )
		  ) AND
		  ([FullMart].[dbo].[Product].[Title] LIKE '%'+@Key+'%' )
	ORDER BY [CreatedDate] DESC
END
GO
/****** Object:  StoredProcedure [dbo].[SearchAllProducts]    Script Date: 02/13/2012 16:28:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		NVN
-- Create date: 13 Feb 2012
-- Description:	NO
-- =============================================
CREATE PROCEDURE [dbo].[SearchAllProducts]
	@Key		NVARCHAR(150)
AS
BEGIN
	
	SET NOCOUNT ON;
	
	SELECT [ID],[Price],[Thumbnail],[Title]
	FROM [FullMart].[dbo].[Product]
	WHERE [FullMart].[dbo].[Product].[Title] LIKE '%'+@Key+'%' 
	ORDER BY [CreatedDate] DESC
END
GO
/****** Object:  StoredProcedure [dbo].[GetProductDetail]    Script Date: 02/13/2012 16:28:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		BTN
-- Create date: 21 Jan 2012
-- Description:	NO
-- =============================================
CREATE PROCEDURE [dbo].[GetProductDetail]
	@ID			INT
AS
BEGIN	
	SET NOCOUNT ON;

	SELECT [FullMart].[dbo].[Product].[ID] AS [ProductID]
      ,[FullMart].[dbo].[Product].[SubCategoryID]
      ,[FullMart].[dbo].[Product].[Price]
      ,[FullMart].[dbo].[Product].[Picture]
      ,[FullMart].[dbo].[Product].[CreatedDate]
      ,[FullMart].[dbo].[Product].[PosterID]
      ,([FullMart].[dbo].[User].[fname] + ' ' + [FullMart].[dbo].[User].[lname]) AS [PosterName]
      ,[FullMart].[dbo].[User].[email]
	  ,[FullMart].[dbo].[User].[yahoo]
	  ,[FullMart].[dbo].[User].[mobile]
      ,[FullMart].[dbo].[Product].[Title]
      ,[FullMart].[dbo].[State].[StateName]
      ,[FullMart].[dbo].[ProductDetail].[ID]
      ,[FullMart].[dbo].[ProductDetail].[Content]
	FROM [FullMart].[dbo].[Product]
		,[FullMart].[dbo].[ProductDetail]
		,[FullMart].[dbo].[State]
		,[FullMart].[dbo].[User]
	WHERE [FullMart].[dbo].[Product].[ID] = @ID
			AND [FullMart].[dbo].[Product].[ID] = [FullMart].[dbo].[ProductDetail].[ProductID]
			AND [FullMart].[dbo].[State].[id] = [FullMart].[dbo].[Product].[State]
			AND [FullMart].[dbo].[User].[ID] = [FullMart].[dbo].[Product].[PosterID]
END
GO
/****** Object:  Table [dbo].[SubComment]    Script Date: 02/13/2012 16:28:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
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
GO
SET IDENTITY_INSERT [dbo].[SubComment] ON
INSERT [dbo].[SubComment] ([ID], [PosterID], [CommentID], [Content], [CreateDate]) VALUES (1, 1, 1, N'priceStartBracketPos = question.indexOf(''('');', CAST(0x00009FA300000000 AS DateTime))
INSERT [dbo].[SubComment] ([ID], [PosterID], [CommentID], [Content], [CreateDate]) VALUES (2, 3, 2, N'sssssssss', CAST(0x00009FEB00000000 AS DateTime))
SET IDENTITY_INSERT [dbo].[SubComment] OFF
/****** Object:  StoredProcedure [dbo].[CreateProduct]    Script Date: 02/13/2012 16:28:43 ******/
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
/****** Object:  Default [DF_Cart_Amount]    Script Date: 02/13/2012 16:28:43 ******/
ALTER TABLE [dbo].[Cart] ADD  CONSTRAINT [DF_Cart_Amount]  DEFAULT ((0)) FOR [Amount]
GO
/****** Object:  ForeignKey [FK_User_Role]    Script Date: 02/13/2012 16:28:43 ******/
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_Role] FOREIGN KEY([roleID])
REFERENCES [dbo].[Role] ([ID])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_Role]
GO
/****** Object:  ForeignKey [FK_SubCategory_Category]    Script Date: 02/13/2012 16:28:43 ******/
ALTER TABLE [dbo].[SubCategory]  WITH CHECK ADD  CONSTRAINT [FK_SubCategory_Category] FOREIGN KEY([CategoryID])
REFERENCES [dbo].[Category] ([ID])
GO
ALTER TABLE [dbo].[SubCategory] CHECK CONSTRAINT [FK_SubCategory_Category]
GO
/****** Object:  ForeignKey [FK_Product_SubCategory]    Script Date: 02/13/2012 16:28:43 ******/
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_SubCategory] FOREIGN KEY([SubCategoryID])
REFERENCES [dbo].[SubCategory] ([ID])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_SubCategory]
GO
/****** Object:  ForeignKey [FK_News_User]    Script Date: 02/13/2012 16:28:43 ******/
ALTER TABLE [dbo].[News]  WITH CHECK ADD  CONSTRAINT [FK_News_User] FOREIGN KEY([PosterID])
REFERENCES [dbo].[User] ([ID])
GO
ALTER TABLE [dbo].[News] CHECK CONSTRAINT [FK_News_User]
GO
/****** Object:  ForeignKey [FK_AnswerQuestion_User]    Script Date: 02/13/2012 16:28:43 ******/
ALTER TABLE [dbo].[AnswerQuestion]  WITH CHECK ADD  CONSTRAINT [FK_AnswerQuestion_User] FOREIGN KEY([PosterID])
REFERENCES [dbo].[User] ([ID])
GO
ALTER TABLE [dbo].[AnswerQuestion] CHECK CONSTRAINT [FK_AnswerQuestion_User]
GO
/****** Object:  ForeignKey [FK_Comment_Product]    Script Date: 02/13/2012 16:28:43 ******/
ALTER TABLE [dbo].[Comment]  WITH CHECK ADD  CONSTRAINT [FK_Comment_Product] FOREIGN KEY([Product])
REFERENCES [dbo].[Product] ([ID])
GO
ALTER TABLE [dbo].[Comment] CHECK CONSTRAINT [FK_Comment_Product]
GO
/****** Object:  ForeignKey [FK_Comment_User]    Script Date: 02/13/2012 16:28:43 ******/
ALTER TABLE [dbo].[Comment]  WITH CHECK ADD  CONSTRAINT [FK_Comment_User] FOREIGN KEY([PosterID])
REFERENCES [dbo].[User] ([ID])
GO
ALTER TABLE [dbo].[Comment] CHECK CONSTRAINT [FK_Comment_User]
GO
/****** Object:  ForeignKey [FK_Cart_Product]    Script Date: 02/13/2012 16:28:43 ******/
ALTER TABLE [dbo].[Cart]  WITH CHECK ADD  CONSTRAINT [FK_Cart_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ID])
GO
ALTER TABLE [dbo].[Cart] CHECK CONSTRAINT [FK_Cart_Product]
GO
/****** Object:  ForeignKey [FK_SubAQ_AnswerQuestion]    Script Date: 02/13/2012 16:28:43 ******/
ALTER TABLE [dbo].[SubAQ]  WITH CHECK ADD  CONSTRAINT [FK_SubAQ_AnswerQuestion] FOREIGN KEY([AQID])
REFERENCES [dbo].[AnswerQuestion] ([ID])
GO
ALTER TABLE [dbo].[SubAQ] CHECK CONSTRAINT [FK_SubAQ_AnswerQuestion]
GO
/****** Object:  ForeignKey [FK_SubAQ_User]    Script Date: 02/13/2012 16:28:43 ******/
ALTER TABLE [dbo].[SubAQ]  WITH CHECK ADD  CONSTRAINT [FK_SubAQ_User] FOREIGN KEY([PosterID])
REFERENCES [dbo].[User] ([ID])
GO
ALTER TABLE [dbo].[SubAQ] CHECK CONSTRAINT [FK_SubAQ_User]
GO
/****** Object:  ForeignKey [FK_ProductDetail_Product]    Script Date: 02/13/2012 16:28:43 ******/
ALTER TABLE [dbo].[ProductDetail]  WITH CHECK ADD  CONSTRAINT [FK_ProductDetail_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ProductDetail] CHECK CONSTRAINT [FK_ProductDetail_Product]
GO
/****** Object:  ForeignKey [FK_SubComment_Comment]    Script Date: 02/13/2012 16:28:43 ******/
ALTER TABLE [dbo].[SubComment]  WITH CHECK ADD  CONSTRAINT [FK_SubComment_Comment] FOREIGN KEY([CommentID])
REFERENCES [dbo].[Comment] ([ID])
GO
ALTER TABLE [dbo].[SubComment] CHECK CONSTRAINT [FK_SubComment_Comment]
GO
/****** Object:  ForeignKey [FK_SubComment_User]    Script Date: 02/13/2012 16:28:43 ******/
ALTER TABLE [dbo].[SubComment]  WITH CHECK ADD  CONSTRAINT [FK_SubComment_User] FOREIGN KEY([PosterID])
REFERENCES [dbo].[User] ([ID])
GO
ALTER TABLE [dbo].[SubComment] CHECK CONSTRAINT [FK_SubComment_User]
GO
