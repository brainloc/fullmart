USE [master]
GO
/****** Object:  Database [FullMart]    Script Date: 09/26/2011 00:37:26 ******/
CREATE DATABASE [FullMart] ON  PRIMARY 
( NAME = N'FullMart', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL.1\MSSQL\DATA\FullMart.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'FullMart_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL.1\MSSQL\DATA\FullMart_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [FullMart] SET COMPATIBILITY_LEVEL = 90
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
/****** Object:  Table [dbo].[Product]    Script Date: 09/26/2011 00:37:28 ******/
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
/****** Object:  Table [dbo].[Category]    Script Date: 09/26/2011 00:37:28 ******/
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
/****** Object:  Table [dbo].[Role]    Script Date: 09/26/2011 00:37:28 ******/
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
/****** Object:  Table [dbo].[Comment]    Script Date: 09/26/2011 00:37:28 ******/
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
/****** Object:  Table [dbo].[ProductDetail]    Script Date: 09/26/2011 00:37:28 ******/
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
/****** Object:  Table [dbo].[SubCategory]    Script Date: 09/26/2011 00:37:28 ******/
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
/****** Object:  Table [dbo].[User]    Script Date: 09/26/2011 00:37:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](20) NOT NULL,
	[Password] [nvarchar](100) NOT NULL,
	[Alias] [nvarchar](100) NULL,
	[RoleID] [int] NOT NULL,
	[Email] [nvarchar](70) NULL,
	[Yahoo] [nvarchar](20) NULL,
	[Mobile] [nvarchar](15) NULL,
	[CreatedDate] [datetime] NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[User] ON
INSERT [dbo].[User] ([ID], [Username], [Password], [Alias], [RoleID], [Email], [Yahoo], [Mobile], [CreatedDate]) VALUES (1, N'admin', N'123admin', N'Administrator', 1, N'master@fullmart.com', N'fullmart', N'0909999000', CAST(0x00009F6900000000 AS DateTime))
SET IDENTITY_INSERT [dbo].[User] OFF
/****** Object:  ForeignKey [FK_Comment_Product]    Script Date: 09/26/2011 00:37:28 ******/
ALTER TABLE [dbo].[Comment]  WITH CHECK ADD  CONSTRAINT [FK_Comment_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Comment] CHECK CONSTRAINT [FK_Comment_Product]
GO
/****** Object:  ForeignKey [FK_Comment_User]    Script Date: 09/26/2011 00:37:28 ******/
ALTER TABLE [dbo].[Comment]  WITH CHECK ADD  CONSTRAINT [FK_Comment_User] FOREIGN KEY([PosterID])
REFERENCES [dbo].[User] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Comment] CHECK CONSTRAINT [FK_Comment_User]
GO
/****** Object:  ForeignKey [FK_ProductDetail_Product]    Script Date: 09/26/2011 00:37:28 ******/
ALTER TABLE [dbo].[ProductDetail]  WITH CHECK ADD  CONSTRAINT [FK_ProductDetail_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ProductDetail] CHECK CONSTRAINT [FK_ProductDetail_Product]
GO
/****** Object:  ForeignKey [FK_SubCategory_Category]    Script Date: 09/26/2011 00:37:28 ******/
ALTER TABLE [dbo].[SubCategory]  WITH CHECK ADD  CONSTRAINT [FK_SubCategory_Category] FOREIGN KEY([CategoryID])
REFERENCES [dbo].[Category] ([ID])
GO
ALTER TABLE [dbo].[SubCategory] CHECK CONSTRAINT [FK_SubCategory_Category]
GO
/****** Object:  ForeignKey [FK_User_Role]    Script Date: 09/26/2011 00:37:28 ******/
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_Role] FOREIGN KEY([RoleID])
REFERENCES [dbo].[Role] ([ID])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_Role]
GO
