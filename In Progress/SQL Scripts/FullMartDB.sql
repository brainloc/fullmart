USE [master]
GO
/****** Object:  Database [FullMart]    Script Date: 02/15/2012 21:05:21 ******/
CREATE DATABASE [FullMart] 
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
/****** Object:  Table [dbo].[State]    Script Date: 02/15/2012 21:05:25 ******/
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
/****** Object:  Table [dbo].[Role]    Script Date: 02/15/2012 21:05:25 ******/
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
/****** Object:  Table [dbo].[Category]    Script Date: 02/15/2012 21:05:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Order] [int] NULL,
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
INSERT [dbo].[Category] ([ID], [Name], [Order]) VALUES (7, N'computer', 7)
INSERT [dbo].[Category] ([ID], [Name], [Order]) VALUES (8, N'khong ro', 8)
INSERT [dbo].[Category] ([ID], [Name], [Order]) VALUES (9, N'chua biet', 9)
INSERT [dbo].[Category] ([ID], [Name], [Order]) VALUES (10, N'Dang Lam', 10)
SET IDENTITY_INSERT [dbo].[Category] OFF
/****** Object:  StoredProcedure [dbo].[CreateShop]    Script Date: 02/15/2012 21:05:29 ******/
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
/****** Object:  Table [dbo].[Advertise]    Script Date: 02/15/2012 21:05:29 ******/
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
/****** Object:  Table [dbo].[GeneralOption]    Script Date: 02/15/2012 21:05:29 ******/
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
/****** Object:  StoredProcedure [dbo].[GetGeneralOption]    Script Date: 02/15/2012 21:05:29 ******/
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
/****** Object:  StoredProcedure [dbo].[GetCategories]    Script Date: 02/15/2012 21:05:29 ******/
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
	WHERE [Order]<> -99
	ORDER BY [Order]
  
END
GO
/****** Object:  StoredProcedure [dbo].[DisableCategoryItem]    Script Date: 02/15/2012 21:05:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		BTN
-- Create date: 13 Feb 2012
-- Description:	NO
-- =============================================
CREATE PROCEDURE [dbo].[DisableCategoryItem]
	@CatID		INT
AS
BEGIN
	
	SET NOCOUNT ON;

    UPDATE [FullMart].[dbo].[Category]
	SET [Order] = -99
	WHERE [ID] = @CatID
END
GO
/****** Object:  Table [dbo].[SubCategory]    Script Date: 02/15/2012 21:05:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SubCategory](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CategoryID] [int] NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Order] [int] NULL,
 CONSTRAINT [PK_SubCategory] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[SubCategory] ON
INSERT [dbo].[SubCategory] ([ID], [CategoryID], [Name], [Order]) VALUES (1, 1, N'Quần Áo Nữ', 1)
INSERT [dbo].[SubCategory] ([ID], [CategoryID], [Name], [Order]) VALUES (2, 1, N'Quần Áo Nam', 2)
INSERT [dbo].[SubCategory] ([ID], [CategoryID], [Name], [Order]) VALUES (3, 1, N'Giày Dép Nữ', 3)
INSERT [dbo].[SubCategory] ([ID], [CategoryID], [Name], [Order]) VALUES (4, 1, N'Giày Dép Nam', 4)
INSERT [dbo].[SubCategory] ([ID], [CategoryID], [Name], [Order]) VALUES (5, 2, N'Mỹ Phẩm Trang Điểm', 5)
INSERT [dbo].[SubCategory] ([ID], [CategoryID], [Name], [Order]) VALUES (6, 2, N'Nước Hoa', 6)
INSERT [dbo].[SubCategory] ([ID], [CategoryID], [Name], [Order]) VALUES (7, 2, N'Xoa Bóp, Mát Xa', 7)
INSERT [dbo].[SubCategory] ([ID], [CategoryID], [Name], [Order]) VALUES (8, 5, N'Máy Ảnh', 8)
INSERT [dbo].[SubCategory] ([ID], [CategoryID], [Name], [Order]) VALUES (9, 5, N'Máy Quay', 9)
INSERT [dbo].[SubCategory] ([ID], [CategoryID], [Name], [Order]) VALUES (10, 5, N'Đèn Flash', 0)
INSERT [dbo].[SubCategory] ([ID], [CategoryID], [Name], [Order]) VALUES (12, 2, N'Xông hơi', 4)
INSERT [dbo].[SubCategory] ([ID], [CategoryID], [Name], [Order]) VALUES (13, 2, N'Spa', 6)
INSERT [dbo].[SubCategory] ([ID], [CategoryID], [Name], [Order]) VALUES (14, 3, N'Nokia', 6)
INSERT [dbo].[SubCategory] ([ID], [CategoryID], [Name], [Order]) VALUES (15, 5, N'CACdfgdgd', 4)
INSERT [dbo].[SubCategory] ([ID], [CategoryID], [Name], [Order]) VALUES (16, 7, N'CACdfgdgd', 5)
INSERT [dbo].[SubCategory] ([ID], [CategoryID], [Name], [Order]) VALUES (17, 3, N'BlackBerry', 2)
INSERT [dbo].[SubCategory] ([ID], [CategoryID], [Name], [Order]) VALUES (18, 3, N'SamSung', 8)
INSERT [dbo].[SubCategory] ([ID], [CategoryID], [Name], [Order]) VALUES (19, 3, N'O2', 4)
SET IDENTITY_INSERT [dbo].[SubCategory] OFF
/****** Object:  Table [dbo].[User]    Script Date: 02/15/2012 21:05:29 ******/
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
INSERT [dbo].[User] ([ID], [fname], [lname], [email], [pass], [bday], [state], [CU], [class], [createdate], [roleID], [yahoo], [mobile], [ShopID], [Shopname], [Web], [Wishlist], [isActive]) VALUES (1, N'nam', N'nguyễn', N'sa22dman289@gmail.com', N'qweqwe1', CAST(0x00009FD000000000 AS DateTime), N'Select your current states', N'Chose your College', N'Select you', CAST(0x00009FD001052FBC AS DateTime), 3, N'', N'', NULL, N'', N'anasjdsgd', N'anasjdsgd', 1)
INSERT [dbo].[User] ([ID], [fname], [lname], [email], [pass], [bday], [state], [CU], [class], [createdate], [roleID], [yahoo], [mobile], [ShopID], [Shopname], [Web], [Wishlist], [isActive]) VALUES (2, N'Nguyễn', N'nam', N'sa2dman289@gmail.com', N'qweqwe1', CAST(0x00009FD000000000 AS DateTime), N'Select your current states', N'Chose your College', N'Select you', CAST(0x00009FD0011195F8 AS DateTime), 3, N'', N'12312313', NULL, N'', N'123', N'123', 1)
INSERT [dbo].[User] ([ID], [fname], [lname], [email], [pass], [bday], [state], [CU], [class], [createdate], [roleID], [yahoo], [mobile], [ShopID], [Shopname], [Web], [Wishlist], [isActive]) VALUES (3, N'Nguyễn', N'nam nguyễn', N'sadman289@gmail.com', N'qweqwe1', CAST(0x00009FD00113912B AS DateTime), N'Select your current states', N'Chose your College', N'Select you', CAST(0x00009FD00113912B AS DateTime), 2, N'vunam', NULL, 3, NULL, NULL, NULL, 1)
INSERT [dbo].[User] ([ID], [fname], [lname], [email], [pass], [bday], [state], [CU], [class], [createdate], [roleID], [yahoo], [mobile], [ShopID], [Shopname], [Web], [Wishlist], [isActive]) VALUES (4, N'Nguyễn', N'nam nguyễn', N'sadmanz289@gmail.com', N'qweqwe1', CAST(0x00009FD000000000 AS DateTime), N'Select your current states', N'Chose your College', N'Select you', CAST(0x00009FD001156239 AS DateTime), 3, N'', N'', NULL, N'', N'', N'', 0)
INSERT [dbo].[User] ([ID], [fname], [lname], [email], [pass], [bday], [state], [CU], [class], [createdate], [roleID], [yahoo], [mobile], [ShopID], [Shopname], [Web], [Wishlist], [isActive]) VALUES (5, N'Namnguyen', N'vunam', N'sam@gmail.com', N'qweqwe1', CAST(0x00007E7E00000000 AS DateTime), N'Viet Nam', N'Chose your College', N'2006', CAST(0x00009FD20032E6FC AS DateTime), 1, NULL, NULL, NULL, NULL, NULL, NULL, 1)
SET IDENTITY_INSERT [dbo].[User] OFF
/****** Object:  StoredProcedure [dbo].[GetStates]    Script Date: 02/15/2012 21:05:29 ******/
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
/****** Object:  StoredProcedure [dbo].[UpdateGeneralOption]    Script Date: 02/15/2012 21:05:29 ******/
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
/****** Object:  StoredProcedure [dbo].[UpdateCategory]    Script Date: 02/15/2012 21:05:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		NVN
-- Create date: 14 Feb 2012
-- Description:	NO
-- =============================================
CREATE PROCEDURE [dbo].[UpdateCategory] 
	@ID		int,
	@CatName		NVARCHAR(100),
	@CatOrder		INT
	
AS
BEGIN
	
	SET NOCOUNT ON;
	
	IF NOT EXISTS(SELECT * FROM [FullMart].[dbo].[Category] WHERE [ID] = @ID)
		RETURN 0
	ELSE
	BEGIN	
		UPDATE [FullMart].[dbo].[Category]
	SET [Name] = @CatName
      ,[Order] = @CatOrder
	WHERE [ID] = @ID
		RETURN 1
	END
END
GO
/****** Object:  StoredProcedure [dbo].[AddCategory]    Script Date: 02/15/2012 21:05:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		NVN
-- Create date: 13 Feb 2012
-- Description:	NO
-- =============================================
CREATE PROCEDURE [dbo].[AddCategory]
	@CatName		NVARCHAR(100),
	@CatOrder		INT
AS
BEGIN
	
	SET NOCOUNT ON;

    INSERT INTO [FullMart].[dbo].[Category]
           ([Name]
           ,[Order])
    VALUES
           (@CatName
           ,@CatOrder)
     IF(@@IDENTITY IS NULL)
		RETURN 0
	 ELSE
		RETURN @@IDENTITY
END
GO
/****** Object:  StoredProcedure [dbo].[GetListSubSameCat]    Script Date: 02/15/2012 21:05:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetListSubSameCat]
	-- Add the parameters for the stored procedure here
	@ID		int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT [A].[ID] AS SUBID,
			[A].[Name] AS NAMESUB
	FROM [FullMart].[dbo].[SubCategory] AS A
	WHERE [A].[CategoryID]=(SELECT [A].[CategoryID] FROM [FullMart].[dbo].[SubCategory] AS A WHERE [A].[ID]=@ID)
END
GO
/****** Object:  StoredProcedure [dbo].[GetNameCatSubCatByIDSub]    Script Date: 02/15/2012 21:05:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetNameCatSubCatByIDSub]
	-- Add the parameters for the stored procedure here
	@ID		int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT [FullMart].[dbo].[Category].[ID] AS CATID,
			[FullMart].[dbo].[Category].[Name] AS NAMECAT,
			[FullMart].[dbo].[SubCategory].[ID] AS SUBID,
			[FullMart].[dbo].[SubCategory].[Name] AS NAMESUB
	FROM [FullMart].[dbo].[Category], [FullMart].[dbo].[SubCategory]
	WHERE [FullMart].[dbo].[Category].[ID]=[FullMart].[dbo].[SubCategory].[CategoryID]
			AND [FullMart].[dbo].[SubCategory].[ID]=@ID
END
GO
/****** Object:  StoredProcedure [dbo].[UpdateUser]    Script Date: 02/15/2012 21:05:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		BTN
-- Create date: 04 Jan, 2012
-- Description:	NO
-- =============================================
CREATE PROCEDURE [dbo].[UpdateUser] 
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
	@Wishlist	NVARCHAR(MAX)
	
AS
BEGIN
	
	SET NOCOUNT ON;
	
	IF NOT EXISTS(SELECT * FROM [FullMart].[dbo].[User] WHERE [email] = @email)
		RETURN 0
	ELSE
	BEGIN	
		UPDATE [FullMart].[dbo].[User]
   SET [fname] = @fname
      ,[lname] = @lname
      ,[pass] = case when @pass ='' then [pass]
						when @pass is null then [pass]
						when @pass <> '' then @pass
						end
      ,[bday] = @bday
      ,[state] = @state
      ,[CU] = @CU
      ,[class] = @class
      ,[roleID] = @roleID
      ,[yahoo] = @yahoo
      ,[mobile] = @mobile
      ,[Shopname] = @ShopName
      ,[Web] = @web
      ,[Wishlist] =case when @Wishlist ='' then [Web]
						when @Wishlist IS NULL then [Web]
						when @Wishlist <> '' then @Wishlist
						end
 WHERE [FullMart].[dbo].[User].[email]=@email
		RETURN 1
	END
END
GO
/****** Object:  StoredProcedure [dbo].[UpdateSubCategory]    Script Date: 02/15/2012 21:05:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		NVN
-- Create date: 14 Feb 2012
-- Description:	NO
-- =============================================
CREATE PROCEDURE [dbo].[UpdateSubCategory] 
	@ID		int,
	@CatName		NVARCHAR(100),
	@CatOrder		INT
	
AS
BEGIN
	
	SET NOCOUNT ON;
	
	IF NOT EXISTS(SELECT * FROM [FullMart].[dbo].[SubCategory] WHERE [ID] = @ID)
		RETURN 0
	ELSE
	BEGIN	
		UPDATE [FullMart].[dbo].[SubCategory]
	SET [Name] = @CatName
      ,[Order] = @CatOrder
	WHERE [ID] = @ID
		RETURN 1
	END
END
GO
/****** Object:  StoredProcedure [dbo].[SearchAllUserByKey]    Script Date: 02/15/2012 21:05:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		NVN
-- Create date: 12 Feb 2012
-- Description:	NO
-- =============================================
CREATE PROCEDURE [dbo].[SearchAllUserByKey]
	@key		nvarchar(200)
AS
BEGIN
	
	SET NOCOUNT ON;
		
	SELECT [FullMart].[dbo].[User].[ID]
      ,[fname]
      ,[lname]
      ,[email]
      ,[pass]
      ,(CONVERT(NVARCHAR(2),DATEPART(DAY,[bday]))+'/'+CONVERT(NVARCHAR(2),DATEPART(MONTH,[bday]))+'/'+CONVERT(NVARCHAR(4),DATEPART(YEAR,[bday]))) AS [bday] 
      ,[state]
      ,[CU]
      ,[class]
      ,(CONVERT(NVARCHAR(2),DATEPART(DAY,[createdate]))+'/'+CONVERT(NVARCHAR(2),DATEPART(MONTH,[createdate]))+'/'+CONVERT(NVARCHAR(4),DATEPART(YEAR,[createdate]))) AS [createdate] 
      ,[FullMart].[dbo].[Role].[Name] AS [roleID]
      ,[yahoo]
      ,[mobile]
      ,[ShopID]
      ,[Shopname]
      ,[Web]
      ,[Wishlist]
      ,[isActive]
  FROM [FullMart].[dbo].[User],[FullMart].[dbo].[Role]
  Where ([FullMart].[dbo].[User].[email] like '%'+@key+'%' ) AND ([FullMart].[dbo].[User].[roleID]=[FullMart].[dbo].[Role].[ID])
  ORDER BY [createdate] DESC
END
GO
/****** Object:  Table [dbo].[AnswerQuestion]    Script Date: 02/15/2012 21:05:29 ******/
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
/****** Object:  StoredProcedure [dbo].[AddSubCategory]    Script Date: 02/15/2012 21:05:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		BTN
-- Create date: 13 Feb 2012
-- Description:	NO
-- =============================================
CREATE PROCEDURE [dbo].[AddSubCategory]
	@CatID			INT,
	@SubcatName		NVARCHAR(100),
	@SubcatOrder		INT
AS
BEGIN
	
	SET NOCOUNT ON;
	IF NOT EXISTS(SELECT * FROM [FullMart].[dbo].[Category] WHERE ID=@CatID)
		RETURN 0
	ELSE
    INSERT INTO [FullMart].[dbo].[SubCategory]
           ([CategoryID]
           ,[Name]
           ,[Order])
    VALUES
           (@CatID
           ,@SubcatName
           ,@SubcatOrder)
     IF(@@IDENTITY IS NULL)
		RETURN 0
	 ELSE
		RETURN @@IDENTITY
END
GO
/****** Object:  StoredProcedure [dbo].[DisableSubCategoryItem]    Script Date: 02/15/2012 21:05:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		BTN
-- Create date: 13 Feb 2012
-- Description:	NO
-- =============================================
CREATE PROCEDURE [dbo].[DisableSubCategoryItem]
	@SubcatID		INT
AS
BEGIN
	
	SET NOCOUNT ON;

    UPDATE [FullMart].[dbo].[SubCategory]
	SET [Order] = -99
	WHERE [ID] = @SubcatID
END
GO
/****** Object:  StoredProcedure [dbo].[CheckUser]    Script Date: 02/15/2012 21:05:29 ******/
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
/****** Object:  StoredProcedure [dbo].[CheckLogin]    Script Date: 02/15/2012 21:05:29 ******/
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
/****** Object:  StoredProcedure [dbo].[CreateUser]    Script Date: 02/15/2012 21:05:29 ******/
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
/****** Object:  StoredProcedure [dbo].[DeleteUser]    Script Date: 02/15/2012 21:05:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		BTN
-- Create date: 04 Jan, 2012
-- Description:	NO
-- =============================================
Create PROCEDURE [dbo].[DeleteUser] 
	@email		NVARCHAR(50)
AS
BEGIN
	
	SET NOCOUNT ON;
	
	IF NOT EXISTS(SELECT * FROM [FullMart].[dbo].[User] WHERE [email] = @email)
		RETURN 0
	ELSE
	BEGIN	
		UPDATE [FullMart].[dbo].[User]
   SET [isActive] = 0
 WHERE [FullMart].[dbo].[User].[email]=@email
		RETURN 1
	END
END
GO
/****** Object:  StoredProcedure [dbo].[GetAllUserByRole]    Script Date: 02/15/2012 21:05:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		NVN
-- Create date: 12 Feb 2012
-- Description:	NO
-- =============================================
CREATE PROCEDURE [dbo].[GetAllUserByRole]
	@roleID		INT
AS
BEGIN
	
	SET NOCOUNT ON;
		
	SELECT [ID]
      ,[fname]
      ,[lname]
      ,[email]
      ,[pass]
      ,(CONVERT(NVARCHAR(2),DATEPART(DAY,[bday]))+'/'+CONVERT(NVARCHAR(2),DATEPART(MONTH,[bday]))+'/'+CONVERT(NVARCHAR(4),DATEPART(YEAR,[bday]))) AS [bday] 
      ,[state]
      ,[CU]
      ,[class]
      ,(CONVERT(NVARCHAR(2),DATEPART(DAY,[createdate]))+'/'+CONVERT(NVARCHAR(2),DATEPART(MONTH,[createdate]))+'/'+CONVERT(NVARCHAR(4),DATEPART(YEAR,[createdate]))) AS [createdate] 
      ,[roleID]
      ,[yahoo]
      ,[mobile]
      ,[ShopID]
      ,[Shopname]
      ,[Web]
      ,[Wishlist]
      ,[isActive]
  FROM [FullMart].[dbo].[User]
  Where ([FullMart].[dbo].[User].[roleID]=@roleID)
		AND ([FullMart].[dbo].[User].[isActive]<>0)
  ORDER BY [createdate] DESC
END
GO
/****** Object:  Table [dbo].[Product]    Script Date: 02/15/2012 21:05:29 ******/
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
INSERT [dbo].[Product] ([ID], [SubCategoryID], [Price], [Picture], [Thumbnail], [CreatedDate], [PosterID], [Outstanding], [Title], [State]) VALUES (2, 2, 100000, N'150212064810.jpg', N'150212064810_thumb.jpg', CAST(0x00009FD400000000 AS DateTime), 1, 1, N'nokia N9', 1)
INSERT [dbo].[Product] ([ID], [SubCategoryID], [Price], [Picture], [Thumbnail], [CreatedDate], [PosterID], [Outstanding], [Title], [State]) VALUES (5, 5, 500000, N'product2.jpg', N'product2.jpg', CAST(0x00009F9800000000 AS DateTime), 2, 1, N'1010192', 2)
INSERT [dbo].[Product] ([ID], [SubCategoryID], [Price], [Picture], [Thumbnail], [CreatedDate], [PosterID], [Outstanding], [Title], [State]) VALUES (7, 7, 2000000, N'product4.jpg', N'product4.jpg', CAST(0x00009FC100000000 AS DateTime), 3, 1, N'1010192', 3)
INSERT [dbo].[Product] ([ID], [SubCategoryID], [Price], [Picture], [Thumbnail], [CreatedDate], [PosterID], [Outstanding], [Title], [State]) VALUES (8, 8, 200000, N'product4.jpg', N'product4.jpg', CAST(0x00009FA300000000 AS DateTime), 3, 1, N'1010192', 4)
INSERT [dbo].[Product] ([ID], [SubCategoryID], [Price], [Picture], [Thumbnail], [CreatedDate], [PosterID], [Outstanding], [Title], [State]) VALUES (9, 9, 1000000, N'product5.jpg', N'product5.jpg', CAST(0x00009FCC00000000 AS DateTime), 2, 1, N'1010192', 5)
INSERT [dbo].[Product] ([ID], [SubCategoryID], [Price], [Picture], [Thumbnail], [CreatedDate], [PosterID], [Outstanding], [Title], [State]) VALUES (10, 10, 10000000, N'150212081752.jpg', N'150212081752_thumb.jpg', CAST(0x00009FF800DB248F AS DateTime), 1, 1, N'nokia N9', 1)
INSERT [dbo].[Product] ([ID], [SubCategoryID], [Price], [Picture], [Thumbnail], [CreatedDate], [PosterID], [Outstanding], [Title], [State]) VALUES (11, 17, 10000000, N'150212081813.jpg', N'150212081813_thumb.jpg', CAST(0x00009FF800DB3CCC AS DateTime), 1, 1, N'nokia N9', 1)
INSERT [dbo].[Product] ([ID], [SubCategoryID], [Price], [Picture], [Thumbnail], [CreatedDate], [PosterID], [Outstanding], [Title], [State]) VALUES (12, 12, 10000000, N'150212081830.jpg', N'150212081830_thumb.jpg', CAST(0x00009FF800DB50E7 AS DateTime), 1, 1, N'nokia N9', 1)
SET IDENTITY_INSERT [dbo].[Product] OFF
/****** Object:  Table [dbo].[News]    Script Date: 02/15/2012 21:05:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[News](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](200) NOT NULL,
	[Content] [ntext] NULL,
	[PosterID] [int] NOT NULL,
	[ShortContent] [ntext] NULL,
	[ImageThumb] [nvarchar](150) NULL,
	[CreatedDate] [datetime] NULL,
 CONSTRAINT [PK_News] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[News] ON
INSERT [dbo].[News] ([ID], [Title], [Content], [PosterID], [ShortContent], [ImageThumb], [CreatedDate]) VALUES (1, N'tiêu đề bài viết', N'<div class="contentn">
	<p>
		 </p>
	<p style="margin-top: 0px; margin-right: 0px; margin-bottom: 1em; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; border-top-width: 0px; border-right-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-style: initial; border-color: initial; border-image: initial; font-size: 12px; font-family: Arial, Helvetica, sans-serif; vertical-align: baseline; border-style: initial; border-color: initial; color: rgb(68, 68, 68); background-color: rgb(247, 239, 203); ">
		<span style="margin-top: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; border-top-width: 0px; border-right-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-style: initial; border-color: initial; border-image: initial; font-style: inherit; font-size: small; vertical-align: baseline; border-style: initial; border-color: initial; ">Giá trên không bao ;VAT</span></p>
	<p style="margin-top: 0px; margin-right: 0px; margin-bottom: 1em; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; border-top-width: 0px; border-right-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-style: initial; border-color: initial; border-image: initial; font-size: 12px; font-family: Arial, Helvetica, sans-serif; vertical-align: baseline; border-style: initial; border-color: initial; color: rgb(68, 68, 68); background-color: rgb(247, 239, 203); ">
		<img alt="" src="http://static80.ichodientuvn.com/data/UserData/user_image/ps.tunglt/ffcd97d918b3bd1de0640bb60923d38e.JPG" style="margin-top: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; border-top-width: 0px; border-right-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-style: initial; border-color: initial; border-image: initial; font-style: inherit; vertical-alig aseline; border-style: initial; border-color: initial; " /></p>
	<p style="margin-top: 0px; margin-right: 0px; margin-bottom: 1em; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; border-top-width: 0px; border-right-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-style: initial; border-color: initial; border-image: initial; font-size: 12px; font-family: Arial, Helvetica, sans-serif; vertical-align: baseline; border-style: initial; border-color: initial; color: rgb(68, 68, 68); background-color: rgb(247, 239, 203); ">
		<span style="margin-top: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; border-top-width: 0px; border-right-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-style: initial; border-color: initial; border-image: initial; font-style: inherit; font-size: small; vertical-align: baseline; border-style: initial; border-color: inil; ">Giỏ quà gồm</span>:</p>
	<p style="margin-top: 0px; margin-right: 0px; margin-bottom: 1em; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; border-top-width: 0px; border-right-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-style: initial; border-color: initial; border-image: initial; font-size: 12px; font-family: Arial, Helvetica, sans-serif; vertical-align: baseline; border-style: initial; border-color: initial; color: rgb(68, 68, 68); background-color: rgb(247, 239, 203); ">
		<span style="margin-top: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; border-top-width: 0px; border-right-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-style: initial; border-color: initial; border-image: initial; font-style: inherit; font-size: small; vertical-align: baseline; border-style: initial; border-color: initial; ">1. R<span style="margin-top: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; border-top-width: 0px; border-right-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-style: initial; border-color: initial; border-image: initial; font-style: inherit; font-size: 13px; vertical-align: baseline; border-style: initial; border-color: initial; ">ượ</span>u Curner Sione: Th<span style="margin-top: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; border-top-width: 0px; border-right-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-style: initial; border-color: initial; border-image: initial; font-style: inherit; font-size: 13px; vertical-align: baseline; border-style: initial; border-color: initial; ">ể</span> tích: 750ml;  Xu<span style="margin-top: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-op: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; border-top-width: 0px; border-right-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-style: initial; border-color: initial; border-image: initial; font-style: inherit; font-size: 13px; vertical-align: baseline; border-style: initial; border-color: initial; ">ấ</span>t x<span style="margin-top: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; border-top-width: 0px; border-right-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-style: initial; border-color: initial; border-image: initial; font-style: inherit; font-size: 13px; vertical-align: baseline; border-style: initial; border-color: initial; ">ứ</span>: Chile</span></p>
	<p style="margin-top: 0px; margin-right: 0px; margin-bottom: 1em; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; border-top-width: 0px; border-right-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-style: initial; border-color: initial; border-image: initial; font-size: 12px; font-family: Arial, Helvetica, sans-serif; vertical-align: baseline; border-style: initial; border-color: initial; color: rgb(68, 68, 68); background-color: rgb(247, 239, 203); ">
		<span style="margin-top: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; border-top-width: 0px; border-right-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-style: initial; border-color: initial; border-image: initial; font-style: inherit; font-size: small; vertical-align: baseline; border-style: initial; border-color: initial; ">2. Bánh Classe : Trọng lượng: 400g; Xuất xứ: Việt Nam</span></p>
	<p style="margin-top: 0px; margin-right: 0px; margin-bottom: 1em; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; border-top-width: 0px; border-right-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-style: initial; border-color: initial; border-image: initial; font-size: 12px; font-family: Arial, Helvetica, sans-serif; vertical-align: baseline; border-style: initial; border-color: initial; color: rgb(68, 68, 68); background-color: rgb(247, 239, 203); ">
		<span style="margin-top: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; border-top-width: 0px; border-right-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-style: initial; border-color: initial; border-image: initial; font-style: inherit; font-size: small; vertical-align: baseline; border-style: initial; border-color: initial; ">3. </span><span style="margin-top: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; border-top-width: 0px; border-right-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-style: initial; border-color: initial; border-image: initial; font-style: inherit; font-size: 11pt; vertical-align: baseline; border-style: initial; border-color: initial; line-height: 17px; ">Hộp Cafe G7 Cappuccino: 1 hộp 12 gói; Xuất xứ: Việt Nam</span></p>
	<p style="margin-top: 0px; margin-right: 0px; margin-bottom: 1em; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; border-top-width: 0px; border-right-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-style: initial; border-color: initial; border-image: initial; font-size: 12px; font-family: Arial, Helvetica, sans-serif; vertical-align: baseline; border-style: initial; border-color: initial; color: rgb(68, 68, 68); background-color: rgb(247, 239, 203); ">
		<span style="margin-top: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; border-top-width: 0px; border-right-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-style: initial; border-color: initial; border-image: initial; font-style: inherit; font-size: small; vertical-align: baseline; border-style: initial; border-color: initial; ">4. Hộp Lipton tea 25 túi; Xuất xứ Việt Nam</span></p>
	<p style="margin-top: 0px; margin-right: 0px; margin-bottom: 1em; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; border-top-width: 0px; border-right-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-style: initial; border-color: initial; border-image: initial; font-size: 12px; font-family: Arial, Helvetica, sans-serif; vertical-align: baseline; border-style: initial; border-color: initial; color: rgb(68, 68, 68); background-color: rgb(247, 239, 203); ">
		<span style="margin-top: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; border-top-width: 0px; border-right-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-style: initial; border-color: initial; border-image: initial; font-style: inherit; font-size: small; vertical-align: baseline; border-style: initial; border-color: initial; ">5. Gói Oreo Trọng lượng: 137g Xuất xứ: Indonexia</span></p>
	<p style="margin-top: 0px; margin-right: 0px; margin-bottom: 1em; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; border-top-width: 0px; border-right-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-style: initial; border-color: initial; border-image: initial; font-size: 12px; font-family: Arial, Helvetica, sans-serif; vertical-align: baseline; border-style: initial; border-color: initial; color: rgb(68, 68, 68); background-color: rgb(247, 239, 203); ">
		<span style="margin-top: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; border-top-width: 0px; border-right-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-style: initial; border-color: initial; border-image: initial; font-style: inherit; font-size: small; vertical-align: baseline; border-style: initial; border-color: initial; ">6. Hộp sugas Trọng lượng: 140g Xuất xứ: Việt Nam</span></p>
	<p style="margin-top: 0px; margin-right: 0px; margin-bottom: 1em; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; border-top-width: 0px; border-right-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-style: initial; border-color: initial; border-image: initial; font-size: 12px; font-family: Arial, Helvetica, sans-serif; vertical-align: baseline; border-style: initial; border-color: initial; color: rgb(68, 68, 68); background-color: rgb(247, 239, 203); ">
		<span style="margin-top: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; border-top-width: 0px; border-right-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-style: initial; border-color: initial; border-image: initial; font-style: inherit; font-size: small; vertical-align: baseline; border-style: initial; border-color: initial; ">7. Hộp Hello panda Trọng lượng: 50g Xuất xứ Singapore</span></p>
	<p style="margin-top: 0px; margin-right: 0px; margin-bottom: 1em; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; border-top-width: 0px; border-right-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-style: initial; border-color: initial; border-image: initial; font-size: 12px; font-family: Arial, Helvetica, sans-serif; vertical-align: baseline; border-style: initial; border-color: initial; color: rgb(68, 68, 68); background-color: rgb(247, 239, 203); ">
		<span style="margin-top: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; border-top-width: 0px; border-right-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-style: initial; border-color: initial; border-image: initial; font-style: inherit; font-size: small; vertical-align: baseline; border-style: initial; border-color: initial; ">8. Giỏ mây và trang trí</span></p>
	<p style="margin-top: 0px; margin-right: 0px; margin-bottom: 1em; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; border-top-width: 1px; border-right-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-style: initial; border-color: initial; border-image: initial; font-size: 12px; font-family: Arial, Helvetica, sans-serif; vertical-align: baseline; border-style: initial; border-color: initial; color: rgb(68, 68, 68); background-color: rgb(247, 239, 203); width: 690px; border-top-color: rgb(204, 204, 204); border-top-style: dotted; ">
		 </p>
	<p style="margin-top: 0px; margin-right: 0px; margin-bottom: 1em; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; border-top-width: 0px; border-right-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-style: initial; border-color: initial; border-image: initial; font-size: 12px; font-family: Arial, Helvetica, sans-serif; vertical-align: baseline; border-style: initial; border-color: initial; color: rgb(68, 68, 68); background-color: rgb(247, 239, 203); text-align: center; ">
		<span style="margin-top: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; border-top-width: 0px; border-right-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-style: initial; border-color: initial; border-image: initial; font-style: inherit; vertical-align: baseline; border-style: initial; border-color: initial; "><em style="margin-top: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; border-top-width: 0px; border-right-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-style: initial; border-color: initial; border-image: initial; font-style: inherit; vertical-align: baseline; border-style: initial; border-color: initial; "><strong style="font-weight: bold; "><span style="margin-top: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; border-top-width: 0px; border-right-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-style: initial; border-color: initial; border-image: initial; font-weight: inherit; font-style: inherit; font-size: medium; vertical-align: baseline; border-style: initial; border-color: initial; ">Shop Zippo Vạn An</span></strong></em></span></p>
	<p style="margin-top: 0px; margin-right: 0px; margin-bottom: 1em; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; border-top-width: 0px; border-right-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-style: initial; border-color: initial; border-image: initial; font-size: 12px; font-family: Arial, Helvetica, sans-serif; vertical-align: baseline; border-style: initial; border-color: initial; color: rgb(68, 68, 68); background-color: rgb(247, 239, 203); text-align: center; ">
		<span style="margin-top: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; border-top-width: 0px; border-right-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-style: initial; border-color: initial; border-image: initial; font-style: inherit; vertical-align: baseline; border-style: initial; border-color: initial; "><em style="margin-top: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; border-top-width: 0px; border-right-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-style: initial; border-color: initial; border-image: initial; font-style: inherit; vertical-align: baseline; border-style: initial; border-color: initial; ">Chuyên cung cấp các sản phẩm zippo như: Zippo vintage, zippo Set, zippo la mã, zippo catalogue, zippo L, zippo B, zippo V, zippo M, zippo C, zippo đã sử dụng, phụ kiện zippo, giữ ấm tay zippo, bao da zippo, xăng zippo, đá zippo, bấc zippo, zippo la tinh, zippo slim...</em></span></p>
	<p style="margin-top: 0px; margin-right: 0px; margin-bottom: 1em; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; border-top-width: 0px; border-right-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-style: initial; border-color: initial; border-image: initial; font-size: 12px; font-family: Arial, Helvetica, sans-serif; vertical-align: baseline; border-style: initial; border-color: initial; color: rgb(68, 68, 68); background-color: rgb(247, 239, 203); text-align: center; ">
		Địa chỉ: Số 404 Nhà G1 - Chung Cư Thành Công - Ba Đình - Hà Nội.</p>
	<p style="margin-top: 0px; margin-right: 0px; margin-bottom: 1em; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; border-top-width: 0px; border-right-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-style: initial; border-color: initial; border-image: initial; font-size: 12px; font-family: Arial, Helvetica, sans-serif; vertical-align: baseline; border-style: initial; border-color: initial; color: rgb(68, 68, 68); background-color: rgb(247, 239, 203); text-align: center; ">
		(Ngõ 10 Đường Nguyên Hồng - Gần hồ Thành Công)</p>
	<p style="margin-top: 0px; margin-right: 0px; margin-bottom: 1em; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; border-top-width: 0px; border-right-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-style: initial; border-color: initial; border-image: initial; font-size: 12px; font-family: Arial, Helvetica, s-serif; vertical-align: baseline; border-style: initial; border-color: initial; color: rgb(68, 68, 68); background-color: rgb(247, 239, 203); text-align: center; ">
		Hotline: 090 3 268885</p>
	<p style="margin-top: 0px; margin-right: 0px; margin-bottom: 1em; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; border-top-width: 0px; border-right-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-style: initial; border-color: initial; border-image: initial; font-size: 12px; font-family: Arial, Helvetica, sans-serif; vertical-align: baseline; border-style: initial; border-color: initial; color: rgb(68, 68, 68); background-color: rgb(247, 239, 203); text-align: center; ">
		ĐT:  04 3773 9688</p>
	<p style="margin-top: 0px; margin-right: 0px; margin-bottom: 1em; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; border-top-width: 0px; border-right-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-style: initial; border-color: initial; border-image: initial; font-size: 12px; font-family: Arial, Helvetica, sans-serif; vertical-align: baseline; border-style: initial; border-color: initial; color: rgb(68, 68, 68); background-color: rgb(247, 239, 203); text-align: center; ">
		Fax: 04 3773 3858</p>
	<p style="margin-top: 0px; margin-right: 0px; margin-bottom: 1em; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; border-top-width: 0px; border-right-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-style: initial; border-color: initial; border-image: initial; font-size: 12px; font-family: Arial, Helvetica, sans-serif; vertical-align: baseline; border-style: initial; border-color: initial; color: rgb(68, 68, 68); background-color: rgb(247, 239, 203); text-align: center; ">
		Website: http://van-an.net</p>
	<p style="margin-top: 0px; margin-right: 0px; margin-bottom: 1em; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; border-top-width: 0px; border-right-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-style: initial; border-color: initial; border-image: initial; font-size: 12px; font-family: Arial, Helvetica, sans-serif; vertical-align: baseline; border-style: initial; border-color: initial; color: rgb(68, 68, 68); background-color: rgb(247, 239, 203); text-align: center; ">
		Email: van-an@live.com</p>
	<p>
		 </p>
</div>
<p>
	 </p>
', 2, N'<p>
	 </p>
<p style="margin-top: 0px; margin-right: 0px; margin-bottom: 1em; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; border-top-width: 0px; border-right-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-style: initial; border-color: initial; border-image: initial; font-size: 12px; font-family: Arial, Helvetica, sans-serif; vertical-align: baseline; border-style: initial; border-color: initial; color: rgb(68, 68, 68); background-color: rgb(247, 239, 203); ">
	<span style="margin-top: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; border-top-width: 0px; border-right-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-style: initial; border-color: initial; border-image: initial; font-style: inherit; font-size: small; vertical-align: baseline; border-style: initial; border-color: initial; ">1. R<span style="margin-top: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; border-top-width: 0px; border-right-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-style: initial; border-color: initial; border-image: initial; font-style: inherit; font-size: 13px; vertical-align: baseline; border-style: initial; border-color: initial; ">ượ</span>u Curner Sione: Th<span style="margin-top: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; border-top-width: 0px; border-right-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-style: initial; border-color: initial; border-image: initial; font-style: inherit; font-size: 13px; vertical-align: baseline; border-style: initial; border-color: initial; ">ể</span> tích: 750ml;  Xu<span style="margin-top: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; border-top-width: 0px; border-right-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-style: initial; border-color: initial; border-image: initial; font-style: inherit; font-size: 13px; vertical-align: baseline; border-style: initial; border-color: initial; ">ấ</span>t x<span style="margin-top: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; border-top-width: 0px; border-right-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-style: initial; border-color: initial; border-image: initial; font-style: inherit; font-size: 13px; vertical-align: baseline; border-style: initial; border-color: initial; ">ứ</span>: Chile</span></p>
<p style="margin-top: 0px; margin-right: 0px; margin-bottom: 1em; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; border-top-width: 0px; border-right-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-style: initial; border-color: initial; border-image: initial; font-size: 12px; font-family: Arial, Helvetica, sans-serif; vertical-align: baseline; border-style: initial; border-color: initial; color: rgb(68, 68, 68); background-color: rgb(247, 239, 203); ">
	<span style="margin-top: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; border-top-width: 0px; border-right-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-style: initial; border-color: initial; border-image: initial; font-style: inherit; font-size: small; vertical-align: baseline; border-style: initial; border-color: initial; ">2. Bánh Classe : Trọng lượng: 400g; Xuất xứ: Việt Nam</span></p>
<p style="margin-top: 0px; margin-right: 0px; margin-bottom: 1em; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; border-top-width: 0px; border-right-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-style: initial; border-color: initial; border-image: initial; font-size: 12px; font-family: Arial, Helvetica, sans-serif; vertical-align: baseline; border-style: initial; border-color: initial; color: rgb(68, 68, 68); background-color: rgb(247, 239, 203); ">
	<span style="margin-top: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; border-top-width: 0px; border-right-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-style: initial; border-color: initial; border-image: initial; font-style: inherit; font-size: small; vertical-align: baseline; border-style: initial; border-color: initial; ">3. </span><span style="margin-top: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; border-top-width: 0px; border-right-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-style: initial; border-color: initial; border-image: initial; font-style: inherit; font-size: 11pt; vertical-align: baseline; border-style: initial; border-color: initial; line-height: 17px; ">Hộp Cafe G7 Cappuccino: 1 hộp 12 gói; Xuất xứ: Việt Nam</span></p>
', N'/media/upload/images/1b4c48f5613d86232fbee5ef56be1b662.jpg', CAST(0x00009FF600000000 AS DateTime))
INSERT [dbo].[News] ([ID], [Title], [Content], [PosterID], [ShortContent], [ImageThumb], [CreatedDate]) VALUES (4, N'tieu de bai viet tieu de bai viet tieu de bai viet tieu de bai viet ', N'<div class="contentn">
	<p>
		 </p>
	<p style="margin-top: 0px; margin-right: 0px; margin-bottom: 1em; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; border-top-width: 0px; border-right-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-style: initial; border-color: initial; border-image: initial; font-size: 12px; font-family: Arial, Helvetica, sans-serif; vertical-align: baseline; border-style: initial; border-color: initial; color: rgb(68, 68, 68); background-color: rgb(247, 239, 203); ">
		<span style="margin-top: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; border-top-width: 0px; border-right-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-style: initial; border-color: initial; border-image: initial; font-style: inherit; font-size: small; vertical-align: baseline; border-style: initial; border-color: initial; ">Giá trên không bao ;VAT</span></p>
	<p style="margin-top: 0px; margin-right: 0px; margin-bottom: 1em; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; border-top-width: 0px; border-right-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-style: initial; border-color: initial; border-image: initial; font-size: 12px; font-family: Arial, Helvetica, sans-serif; vertical-align: baseline; border-style: initial; border-color: initial; color: rgb(68, 68, 68); background-color: rgb(247, 239, 203); ">
		<img alt="" src="http://static80.ichodientuvn.com/data/UserData/user_image/ps.tunglt/ffcd97d918b3bd1de0640bb60923d38e.JPG" style="margin-top: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; border-top-width: 0px; border-right-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-style: initial; border-color: initial; border-image: initial; font-style: inherit; vertical-alig aseline; border-style: initial; border-color: initial; " /></p>
	<p style="margin-top: 0px; margin-right: 0px; margin-bottom: 1em; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; border-top-width: 0px; border-right-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-style: initial; border-color: initial; border-image: initial; font-size: 12px; font-family: Arial, Helvetica, sans-serif; vertical-align: baseline; border-style: initial; border-color: initial; color: rgb(68, 68, 68); background-color: rgb(247, 239, 203); ">
		<span style="margin-top: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; border-top-width: 0px; border-right-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-style: initial; border-color: initial; border-image: initial; font-style: inherit; font-size: small; vertical-align: baseline; border-style: initial; border-color: inil; ">Giỏ quà gồm</span>:</p>
	<p style="margin-top: 0px; margin-right: 0px; margin-bottom: 1em; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; border-top-width: 0px; border-right-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-style: initial; border-color: initial; border-image: initial; font-size: 12px; font-family: Arial, Helvetica, sans-serif; vertical-align: baseline; border-style: initial; border-color: initial; color: rgb(68, 68, 68); background-color: rgb(247, 239, 203); ">
		<span style="margin-top: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; border-top-width: 0px; border-right-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-style: initial; border-color: initial; border-image: initial; font-style: inherit; font-size: small; vertical-align: baseline; border-style: initial; border-color: initial; ">1. R<span style="margin-top: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; border-top-width: 0px; border-right-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-style: initial; border-color: initial; border-image: initial; font-style: inherit; font-size: 13px; vertical-align: baseline; border-style: initial; border-color: initial; ">ượ</span>u Curner Sione: Th<span style="margin-top: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; border-top-width: 0px; border-right-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-style: initial; border-color: initial; border-image: initial; font-style: inherit; font-size: 13px; vertical-align: baseline; border-style: initial; border-color: initial; ">ể</span> tích: 750ml;  Xu<span style="margin-top: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-op: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; border-top-width: 0px; border-right-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-style: initial; border-color: initial; border-image: initial; font-style: inherit; font-size: 13px; vertical-align: baseline; border-style: initial; border-color: initial; ">ấ</span>t x<span style="margin-top: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; border-top-width: 0px; border-right-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-style: initial; border-color: initial; border-image: initial; font-style: inherit; font-size: 13px; vertical-align: baseline; border-style: initial; border-color: initial; ">ứ</span>: Chile</span></p>
	<p style="margin-top: 0px; margin-right: 0px; margin-bottom: 1em; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; border-top-width: 0px; border-right-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-style: initial; border-color: initial; border-image: initial; font-size: 12px; font-family: Arial, Helvetica, sans-serif; vertical-align: baseline; border-style: initial; border-color: initial; color: rgb(68, 68, 68); background-color: rgb(247, 239, 203); ">
		<span style="margin-top: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; border-top-width: 0px; border-right-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-style: initial; border-color: initial; border-image: initial; font-style: inherit; font-size: small; vertical-align: baseline; border-style: initial; border-color: initial; ">2. Bánh Classe : Trọng lượng: 400g; Xuất xứ: Việt Nam</span></p>
	<p style="margin-top: 0px; margin-right: 0px; margin-bottom: 1em; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; border-top-width: 0px; border-right-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-style: initial; border-color: initial; border-image: initial; font-size: 12px; font-family: Arial, Helvetica, sans-serif; vertical-align: baseline; border-style: initial; border-color: initial; color: rgb(68, 68, 68); background-color: rgb(247, 239, 203); ">
		<span style="margin-top: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; border-top-width: 0px; border-right-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-style: initial; border-color: initial; border-image: initial; font-style: inherit; font-size: small; vertical-align: baseline; border-style: initial; border-color: initial; ">3. </span><span style="margin-top: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; border-top-width: 0px; border-right-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-style: initial; border-color: initial; border-image: initial; font-style: inherit; font-size: 11pt; vertical-align: baseline; border-style: initial; border-color: initial; line-height: 17px; ">Hộp Cafe G7 Cappuccino: 1 hộp 12 gói; Xuất xứ: Việt Nam</span></p>
	<p style="margin-top: 0px; margin-right: 0px; margin-bottom: 1em; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; border-top-width: 0px; border-right-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-style: initial; border-color: initial; border-image: initial; font-size: 12px; font-family: Arial, Helvetica, sans-serif; vertical-align: baseline; border-style: initial; border-color: initial; color: rgb(68, 68, 68); background-color: rgb(247, 239, 203); ">
		<span style="margin-top: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; border-top-width: 0px; border-right-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-style: initial; border-color: initial; border-image: initial; font-style: inherit; font-size: small; vertical-align: baseline; border-style: initial; border-color: initial; ">4. Hộp Lipton tea 25 túi; Xuất xứ Việt Nam</span></p>
	<p style="margin-top: 0px; margin-right: 0px; margin-bottom: 1em; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; border-top-width: 0px; border-right-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-style: initial; border-color: initial; border-image: initial; font-size: 12px; font-family: Arial, Helvetica, sans-serif; vertical-align: baseline; border-style: initial; border-color: initial; color: rgb(68, 68, 68); background-color: rgb(247, 239, 203); ">
		<span style="margin-top: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; border-top-width: 0px; border-right-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-style: initial; border-color: initial; border-image: initial; font-style: inherit; font-size: small; vertical-align: baseline; border-style: initial; border-color: initial; ">5. Gói Oreo Trọng lượng: 137g Xuất xứ: Indonexia</span></p>
	<p style="margin-top: 0px; margin-right: 0px; margin-bottom: 1em; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; border-top-width: 0px; border-right-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-style: initial; border-color: initial; border-image: initial; font-size: 12px; font-family: Arial, Helvetica, sans-serif; vertical-align: baseline; border-style: initial; border-color: initial; color: rgb(68, 68, 68); background-color: rgb(247, 239, 203); ">
		<span style="margin-top: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; border-top-width: 0px; border-right-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-style: initial; border-color: initial; border-image: initial; font-style: inherit; font-size: small; vertical-align: baseline; border-style: initial; border-color: initial; ">6. Hộp sugas Trọng lượng: 140g Xuất xứ: Việt Nam</span></p>
	<p style="margin-top: 0px; margin-right: 0px; margin-bottom: 1em; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; border-top-width: 0px; border-right-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-style: initial; border-color: initial; border-image: initial; font-size: 12px; font-family: Arial, Helvetica, sans-serif; vertical-align: baseline; border-style: initial; border-color: initial; color: rgb(68, 68, 68); background-color: rgb(247, 239, 203); ">
		<span style="margin-top: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; border-top-width: 0px; border-right-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-style: initial; border-color: initial; border-image: initial; font-style: inherit; font-size: small; vertical-align: baseline; border-style: initial; border-color: initial; ">7. Hộp Hello panda Trọng lượng: 50g Xuất xứ Singapore</span></p>
	<p style="margin-top: 0px; margin-right: 0px; margin-bottom: 1em; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; border-top-width: 0px; border-right-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-style: initial; border-color: initial; border-image: initial; font-size: 12px; font-family: Arial, Helvetica, sans-serif; vertical-align: baseline; border-style: initial; border-color: initial; color: rgb(68, 68, 68); background-color: rgb(247, 239, 203); ">
		<span style="margin-top: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; border-top-width: 0px; border-right-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-style: initial; border-color: initial; border-image: initial; font-style: inherit; font-size: small; vertical-align: baseline; border-style: initial; border-color: initial; ">8. Giỏ mây và trang trí</span></p>
	<p style="margin-top: 0px; margin-right: 0px; margin-bottom: 1em; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; border-top-width: 1px; border-right-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-style: initial; border-color: initial; border-image: initial; font-size: 12px; font-family: Arial, Helvetica, sans-serif; vertical-align: baseline; border-style: initial; border-color: initial; color: rgb(68, 68, 68); background-color: rgb(247, 239, 203); width: 690px; border-top-color: rgb(204, 204, 204); border-top-style: dotted; ">
		 </p>
	<p style="margin-top: 0px; margin-right: 0px; margin-bottom: 1em; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; border-top-width: 0px; border-right-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-style: initial; border-color: initial; border-image: initial; font-size: 12px; font-family: Arial, Helvetica, sans-serif; vertical-align: baseline; border-style: initial; border-color: initial; color: rgb(68, 68, 68); background-color: rgb(247, 239, 203); text-align: center; ">
		<span style="margin-top: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; border-top-width: 0px; border-right-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-style: initial; border-color: initial; border-image: initial; font-style: inherit; vertical-align: baseline; border-style: initial; border-color: initial; "><em style="margin-top: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; border-top-width: 0px; border-right-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-style: initial; border-color: initial; border-image: initial; font-style: inherit; vertical-align: baseline; border-style: initial; border-color: initial; "><strong style="font-weight: bold; "><span style="margin-top: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; border-top-width: 0px; border-right-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-style: initial; border-color: initial; border-image: initial; font-weight: inherit; font-style: inherit; font-size: medium; vertical-align: baseline; border-style: initial; border-color: initial; ">Shop Zippo Vạn An</span></strong></em></span></p>
	<p style="margin-top: 0px; margin-right: 0px; margin-bottom: 1em; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; border-top-width: 0px; border-right-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-style: initial; border-color: initial; border-image: initial; font-size: 12px; font-family: Arial, Helvetica, sans-serif; vertical-align: baseline; border-style: initial; border-color: initial; color: rgb(68, 68, 68); background-color: rgb(247, 239, 203); text-align: center; ">
		<span style="margin-top: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; border-top-width: 0px; border-right-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-style: initial; border-color: initial; border-image: initial; font-style: inherit; vertical-align: baseline; border-style: initial; border-color: initial; "><em style="margin-top: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; border-top-width: 0px; border-right-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-style: initial; border-color: initial; border-image: initial; font-style: inherit; vertical-align: baseline; border-style: initial; border-color: initial; ">Chuyên cung cấp các sản phẩm zippo như: Zippo vintage, zippo Set, zippo la mã, zippo catalogue, zippo L, zippo B, zippo V, zippo M, zippo C, zippo đã sử dụng, phụ kiện zippo, giữ ấm tay zippo, bao da zippo, xăng zippo, đá zippo, bấc zippo, zippo la tinh, zippo slim...</em></span></p>
	<p style="margin-top: 0px; margin-right: 0px; margin-bottom: 1em; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; border-top-width: 0px; border-right-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-style: initial; border-color: initial; border-image: initial; font-size: 12px; font-family: Arial, Helvetica, sans-serif; vertical-align: baseline; border-style: initial; border-color: initial; color: rgb(68, 68, 68); background-color: rgb(247, 239, 203); text-align: center; ">
		Địa chỉ: Số 404 Nhà G1 - Chung Cư Thành Công - Ba Đình - Hà Nội.</p>
	<p style="margin-top: 0px; margin-right: 0px; margin-bottom: 1em; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; border-top-width: 0px; border-right-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-style: initial; border-color: initial; border-image: initial; font-size: 12px; font-family: Arial, Helvetica, sans-serif; vertical-align: baseline; border-style: initial; border-color: initial; color: rgb(68, 68, 68); background-color: rgb(247, 239, 203); text-align: center; ">
		(Ngõ 10 Đường Nguyên Hồng - Gần hồ Thành Công)</p>
	<p style="margin-top: 0px; margin-right: 0px; margin-bottom: 1em; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; border-top-width: 0px; border-right-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-style: initial; border-color: initial; border-image: initial; font-size: 12px; font-family: Arial, Helvetica, s-serif; vertical-align: baseline; border-style: initial; border-color: initial; color: rgb(68, 68, 68); background-color: rgb(247, 239, 203); text-align: center; ">
		Hotline: 090 3 268885</p>
	<p style="margin-top: 0px; margin-right: 0px; margin-bottom: 1em; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; border-top-width: 0px; border-right-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-style: initial; border-color: initial; border-image: initial; font-size: 12px; font-family: Arial, Helvetica, sans-serif; vertical-align: baseline; border-style: initial; border-color: initial; color: rgb(68, 68, 68); background-color: rgb(247, 239, 203); text-align: center; ">
		ĐT:  04 3773 9688</p>
	<p style="margin-top: 0px; margin-right: 0px; margin-bottom: 1em; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; border-top-width: 0px; border-right-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-style: initial; border-color: initial; border-image: initial; font-size: 12px; font-family: Arial, Helvetica, sans-serif; vertical-align: baseline; border-style: initial; border-color: initial; color: rgb(68, 68, 68); background-color: rgb(247, 239, 203); text-align: center; ">
		Fax: 04 3773 3858</p>
	<p style="margin-top: 0px; margin-right: 0px; margin-bottom: 1em; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; border-top-width: 0px; border-right-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-style: initial; border-color: initial; border-image: initial; font-size: 12px; font-family: Arial, Helvetica, sans-serif; vertical-align: baseline; border-style: initial; border-color: initial; color: rgb(68, 68, 68); background-color: rgb(247, 239, 203); text-align: center; ">
		Website: http://van-an.net</p>
	<p style="margin-top: 0px; margin-right: 0px; margin-bottom: 1em; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; border-top-width: 0px; border-right-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-style: initial; border-color: initial; border-image: initial; font-size: 12px; font-family: Arial, Helvetica, sans-serif; vertical-align: baseline; border-style: initial; border-color: initial; color: rgb(68, 68, 68); background-color: rgb(247, 239, 203); text-align: center; ">
		Email: van-an@live.com</p>
	<p>
		 </p>
</div>
', 3, N'<p>
	Giỏ quà gồm: 1. Rượu Curner Sione: Thể tích: 750ml; Xuất xứ: Chile 2. Bánh Classe : Trọng lượng: 400g; Xuất xứ: Việt Nam 3. Hộp Cafe G7 Cappuccino: 1 hộp 12 gói; Xuất xứ: Việt Nam 4. Hộp Lipton tea 25 túi; Xuất xứ Việt Nam 5. Gói Oreo Trọng lượng: 137g Xuất xứ: Indonexia 6. Hộp sugas Trọng lượng: 140g Xuất xứ: Việt Nam 7. Hộp Hello panda Trọng lượng: 50g Xuất xứ Singapore 8. Giỏ mây và trang trí</p>
', N'/media/upload/images/1b4c48f5613d86232fbee5ef56be1b662.jpg', CAST(0x00009FD800000000 AS DateTime))
INSERT [dbo].[News] ([ID], [Title], [Content], [PosterID], [ShortContent], [ImageThumb], [CreatedDate]) VALUES (14, N' dung khong co gì moi noi dung khon', N'<p>
	noi dung khong co gì moi noi dung khong co gì moi noi dung khong co g<strong>ì moi noi dung khong co gì moi noi dung </strong>khong co gì moi noi dung khong co gì moi noi dung khong co gì <strong>moi noi dung khong co gì moi noi dung k</strong>hong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi <em>dung khong co gì moi noi dung khong co</em> gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co g<strong>ì moi noi dung khong co gì moi noi dung </strong>khong co gì moi noi dung khong co gì moi noi dung khong co gì <strong>moi noi dung khong co gì moi noi dung k</strong>hong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi <em>dung khong co gì moi noi dung khong co</em> gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co g<strong>ì moi noi dung khong co gì moi noi dung </strong>khong co gì moi noi dung khong co gì moi noi dung khong co gì <strong>moi noi dung khong co gì moi noi dung k</strong>hong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi <em>dung khong co gì moi noi dung khong co</em> gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co g<strong>ì moi noi dung khong co gì moi noi dung </strong>khong co gì moi noi dung khong co gì moi noi dung khong co gì <strong>moi noi dung khong co gì moi noi dung k</strong>hong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi <em>dung khong co gì moi noi dung khong co</em> gì moi noi dung khong co gì moinoi dung khong co gì moi noi dung khong co gì moi noi dung khong co g<strong>ì moi noi dung khong co gì moi noi dung </strong>khong co gì moi noi dung khong co gì moi noi dung khong co gì <strong>moi noi dung khong co gì moi noi dung k</strong>hong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi <em>dung khong co gì moi noi dung khong co</em> gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co g<strong>ì moi noi dung khong co gì moi noi dung </strong>khong co gì moi noi dung khong co gì moi noi dung khong co gì <strong>moi noi dung khong co gì moi noi dung k</strong>hong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi <em>dung khong co gì moi noi dung khong co</em> gì moi noi dung khong co gì moinoi dung khong co gì moi noi dung khong co gì moi noi dung khong co g<strong>ì moi noi dung khong co gì moi noi dung </strong>khong co gì moi noi dung khong co gì moi noi dung khong co gì <strong>moi noi dung khong co gì moi noi dung k</strong>hong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi <em>dung khong co gì moi noi dung khong co</em> gì moi noi dung khong co gì moinoi dung khong co gì moi noi dung khong co gì moi noi dung khong co g<strong>ì moi noi dung khong co gì moi noi dung </strong>khong co gì moi noi dung khong co gì moi noi dung khong co gì <strong>moi noi dung khong co gì moi noi dung k</strong>hong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi <em>dung khong co gì moi noi dung khong co</em> gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co g<strong>ì moi noi dung khong co gì moi noi dung </strong>khong co gì moi noi dung khong co gì moi noi dung khong co gì <strong>moi noi dung khong co gì moi noi dung k</strong>hong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi <em>dung khong co gì moi noi dung khong co</em> gì moi noi dung khong co gì moinoi dung khong co gì moi noi dung khong co gì moi noi dung khong co g<strong>ì moi noi dung khong co gì moi noi dung </strong>khong co gì moi noi dung khong co gì moi noi dung khong co gì <strong>moi noi dung khong co gì moi noi dung k</strong>hong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi <em>dung khong co gì moi noi dung khong co</em> gì moi noi dung khong co gì moinoi dung khong co gì moi noi dung khong co gì moi noi dung khong co g<strong>ì moi noi dung khong co gì moi noi dung </strong>khong co gì moi noi dung khong co gì moi noi dung khong co gì <strong>moi noi dung khong co gì moi noi dung k</strong>hong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi <em>dung khong co gì moi noi dung khong co</em> gì moi noi dung khong co gì moinoi dung khong co gì moi noi dung khong co gì moi noi dung khong co g<strong>ì moi noi dung khong co gì moi noi dung </strong>khong co gì moi noi dung khong co gì moi noi dung khong co gì <strong>moi noi dung khong co gì moi noi dung k</strong>hong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi <em>dung khong co gì moi noi dung khong co</em> gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co g<strong>ì moi noi dung khong co gì moi noi dung </strong>khong co gì moi noi dung khong co gì moi noi dung khong co gì <strong>moi noi dung khong co gì moi noi dung k</strong>hong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi <em>dung khong co gì moi noi dung khong co</em> gì moi noi dung khong co gì moinoi dung khong co gì moi noi dung khong co gì moi noi dung khong co g<strong>ì moi noi dung khong co gì moi noi dung </strong>khong co gì moi noi dung khong co gì moi noi dung khong co gì <strong>moi noi dung khong co gì moi noi dung k</strong>hong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi <em>dung khong co gì moi noi dung khong co</em> gì moi noi dung khong co gì moinoi dung khong co gì moi noi dung khong co gì moi noi dung khong co g<strong>ì moi noi dung khong co gì moi noi dung </strong>khong co gì moi noi dung khong co gì moi noi dung khong co gì <strong>moi noi dung khong co gì moi noi dung k</strong>hong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi <em>dung khong co gì moi noi dung khong co</em> gì moi noi dung khong co gì moinoi dung khong co gì moi noi dung khong co gì moi noi dung khong co g<strong>ì moi noi dung khong co gì moi noi dung </strong>khong co gì moi noi dung khong co gì moi noi dung khong co gì <strong>moi noi dung khong co gì moi noi dung k</strong>hong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi <em>dung khong co gì moi noi dung khong co</em> gì moi noi dung khong co gì moinoi dung khong co gì moi noi dung khong co gì moi noi dung khong co g<strong>ì moi noi dung khong co gì moi noi dung </strong>khong co gì moi noi dung khong co gì moi noi dung khong co gì <strong>moi noi dung khong co gì moi noi dung k</strong>hong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi <em>dung khong co gì moi noi dung khong co</em> gì moi noi dung khong co gì moi noi dung khong co gì moi <img alt="" src="/media/upload/images/1b4c48f5613d86232fbee5ef56be1b662.jpg" style="width: 200px; height: 177px; " />noi dung khong co gì moi noi dung khong co g<strong>ì moi noi dung khong co gì moi noi dung </strong>khong co gì moi noi dung khong co gì moi noi dung khong co gì <strong>moi noi dung khong co gì moi noi dung k</strong>hong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi <em>dung khong co gì moi noi dung khong co</em> gì moi noi dung khong co gì moinoi dung khong co gì moi noi dung khong co gì moi noi dung khong co g<strong>ì moi noi dung khong co gì moi noi dung </strong>khong co gì moi noi dung khong co gì moi noi dung khong co gì <strong>moi noi dung khong co gì moi noi dung k</strong>hong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi <em>dung khong co gì moi noi dung khong co</em> gì moi noi dung khong co gì moi </p>
', 1, N'<p>
	noi dung khong co gì moi noi dung khong co gì moi noi dung khong co g<strong>ì moi noi dung khong co gì moi noi dung </strong>khong co gì moi noi dung khong co gì moi noi dung khong co gì <strong>moi noi dung khong co gì moi noi dung k</strong>hong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi <em>dung khong co gì moi noi dung khong co</em> gì moi noi dung khong co gì moi </p>
', N'/media/upload/images/1b4c48f5613d86232fbee5ef56be1b662.jpg', CAST(0x00009FF700B369CB AS DateTime))
INSERT [dbo].[News] ([ID], [Title], [Content], [PosterID], [ShortContent], [ImageThumb], [CreatedDate]) VALUES (15, N' dung khong co gì moi noi dung khon', N'<p>
	noi dung khong co gì moi noi dung khong co gì moi noi dung khong co g<strong>ì moi noi dung khong co gì moi noi dung </strong>khong co gì moi noi dung khong co gì moi noi dung khong co gì <strong>moi noi dung khong co gì moi noi dung k</strong>hong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi <em>dung khong co gì moi noi dung khong co</em> gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co g<strong>ì moi noi dung khong co gì moi noi dung </strong>khong co gì moi noi dung khong co gì moi noi dung khong co gì <strong>moi noi dung khong co gì moi noi dung k</strong>hong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi <em>dung khong co gì moi noi dung khong co</em> gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co g<strong>ì moi noi dung khong co gì moi noi dung </strong>khong co gì moi noi dung khong co gì moi noi dung khong co gì <strong>moi noi dung khong co gì moi noi dung k</strong>hong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi <em>dung khong co gì moi noi dung khong co</em> gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co g<strong>ì moi noi dung khong co gì moi noi dung </strong>khong co gì moi noi dung khong co gì moi noi dung khong co gì <strong>moi noi dung khong co gì moi noi dung k</strong>hong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi <em>dung khong co gì moi noi dung khong co</em> gì moi noi dung khong co gì moinoi dung khong co gì moi noi dung khong co gì moi noi dung khong co g<strong>ì moi noi dung khong co gì moi noi dung </strong>khong co gì moi noi dung khong co gì moi noi dung khong co gì <strong>moi noi dung khong co gì moi noi dung k</strong>hong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi <em>dung khong co gì moi noi dung khong co</em> gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co g<strong>ì moi noi dung khong co gì moi noi dung </strong>khong co gì moi noi dung khong co gì moi noi dung khong co gì <strong>moi noi dung khong co gì moi noi dung k</strong>hong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi <em>dung khong co gì moi noi dung khong co</em> gì moi noi dung khong co gì moinoi dung khong co gì moi noi dung khong co gì moi noi dung khong co g<strong>ì moi noi dung khong co gì moi noi dung </strong>khong co gì moi noi dung khong co gì moi noi dung khong co gì <strong>moi noi dung khong co gì moi noi dung k</strong>hong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi <em>dung khong co gì moi noi dung khong co</em> gì moi noi dung khong co gì moinoi dung khong co gì moi noi dung khong co gì moi noi dung khong co g<strong>ì moi noi dung khong co gì moi noi dung </strong>khong co gì moi noi dung khong co gì moi noi dung khong co gì <strong>moi noi dung khong co gì moi noi dung k</strong>hong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi <em>dung khong co gì moi noi dung khong co</em> gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co g<strong>ì moi noi dung khong co gì moi noi dung </strong>khong co gì moi noi dung khong co gì moi noi dung khong co gì <strong>moi noi dung khong co gì moi noi dung k</strong>hong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi <em>dung khong co gì moi noi dung khong co</em> gì moi noi dung khong co gì moinoi dung khong co gì moi noi dung khong co gì moi noi dung khong co g<strong>ì moi noi dung khong co gì moi noi dung </strong>khong co gì moi noi dung khong co gì moi noi dung khong co gì <strong>moi noi dung khong co gì moi noi dung k</strong>hong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi <em>dung khong co gì moi noi dung khong co</em> gì moi noi dung khong co gì moinoi dung khong co gì moi noi dung khong co gì moi noi dung khong co g<strong>ì moi noi dung khong co gì moi noi dung </strong>khong co gì moi noi dung khong co gì moi noi dung khong co gì <strong>moi noi dung khong co gì moi noi dung k</strong>hong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi <em>dung khong co gì moi noi dung khong co</em> gì moi noi dung khong co gì moinoi dung khong co gì moi noi dung khong co gì moi noi dung khong co g<strong>ì moi noi dung khong co gì moi noi dung </strong>khong co gì moi noi dung khong co gì moi noi dung khong co gì <strong>moi noi dung khong co gì moi noi dung k</strong>hong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi <em>dung khong co gì moi noi dung khong co</em> gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co g<strong>ì moi noi dung khong co gì moi noi dung </strong>khong co gì moi noi dung khong co gì moi noi dung khong co gì <strong>moi noi dung khong co gì moi noi dung k</strong>hong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi <em>dung khong co gì moi noi dung khong co</em> gì moi noi dung khong co gì moinoi dung khong co gì moi noi dung khong co gì moi noi dung khong co g<strong>ì moi noi dung khong co gì moi noi dung </strong>khong co gì moi noi dung khong co gì moi noi dung khong co gì <strong>moi noi dung khong co gì moi noi dung k</strong>hong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi <em>dung khong co gì moi noi dung khong co</em> gì moi noi dung khong co gì moinoi dung khong co gì moi noi dung khong co gì moi noi dung khong co g<strong>ì moi noi dung khong co gì moi noi dung </strong>khong co gì moi noi dung khong co gì moi noi dung khong co gì <strong>moi noi dung khong co gì moi noi dung k</strong>hong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi <em>dung khong co gì moi noi dung khong co</em> gì moi noi dung khong co gì moinoi dung khong co gì moi noi dung khong co gì moi noi dung khong co g<strong>ì moi noi dung khong co gì moi noi dung </strong>khong co gì moi noi dung khong co gì moi noi dung khong co gì <strong>moi noi dung khong co gì moi noi dung k</strong>hong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi <em>dung khong co gì moi noi dung khong co</em> gì moi noi dung khong co gì moinoi dung khong co gì moi noi dung khong co gì moi noi dung khong co g<strong>ì moi noi dung khong co gì moi noi dung </strong>khong co gì moi noi dung khong co gì moi noi dung khong co gì <strong>moi noi dung khong co gì moi noi dung k</strong>hong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi <em>dung khong co gì moi noi dung khong co</em> gì moi noi dung khong co gì moi noi dung khong co gì moi <img alt="" src="/media/upload/images/1b4c48f5613d86232fbee5ef56be1b662.jpg" style="width: 200px; height: 177px; " />noi dung khong co gì moi noi dung khong co g<strong>ì moi noi dung khong co gì moi noi dung </strong>khong co gì moi noi dung khong co gì moi noi dung khong co gì <strong>moi noi dung khong co gì moi noi dung k</strong>hong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi <em>dung khong co gì moi noi dung khong co</em> gì moi noi dung khong co gì moinoi dung khong co gì moi noi dung khong co gì moi noi dung khong co g<strong>ì moi noi dung khong co gì moi noi dung </strong>khong co gì moi noi dung khong co gì moi noi dung khong co gì <strong>moi noi dung khong co gì moi noi dung k</strong>hong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi <em>dung khong co gì moi noi dung khong co</em> gì moi noi dung khong co gì moi </p>
', 1, N'<p>
	noi dung khong co gì moi noi dung khong co gì moi noi dung khong co g<strong>ì moi noi dung khong co gì moi noi dung </strong>khong co gì moi noi dung khong co gì moi noi dung khong co gì <strong>moi noi dung khong co gì moi noi dung k</strong>hong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi <em>dung khong co gì moi noi dung khong co</em> gì moi noi dung khong co gì moi </p>
', N'/media/upload/images/1b4c48f5613d86232fbee5ef56be1b662.jpg', CAST(0x00009FF700B3D2E0 AS DateTime))
INSERT [dbo].[News] ([ID], [Title], [Content], [PosterID], [ShortContent], [ImageThumb], [CreatedDate]) VALUES (16, N' dung khong co gì moi noi dung khon', N'<p>
	noi dung khong co gì moi noi dung khong co gì moi noi dung khong co g<strong>ì moi noi dung khong co gì moi noi dung </strong>khong co gì moi noi dung khong co gì moi noi dung khong co gì <strong>moi noi dung khong co gì moi noi dung k</strong>hong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi <em>dung khong co gì moi noi dung khong co</em> gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co g<strong>ì moi noi dung khong co gì moi noi dung </strong>khong co gì moi noi dung khong co gì moi noi dung khong co gì <strong>moi noi dung khong co gì moi noi dung k</strong>hong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi <em>dung khong co gì moi noi dung khong co</em> gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co g<strong>ì moi noi dung khong co gì moi noi dung </strong>khong co gì moi noi dung khong co gì moi noi dung khong co gì <strong>moi noi dung khong co gì moi noi dung k</strong>hong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi <em>dung khong co gì moi noi dung khong co</em> gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co g<strong>ì moi noi dung khong co gì moi noi dung </strong>khong co gì moi noi dung khong co gì moi noi dung khong co gì <strong>moi noi dung khong co gì moi noi dung k</strong>hong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi <em>dung khong co gì moi noi dung khong co</em> gì moi noi dung khong co gì moinoi dung khong co gì moi noi dung khong co gì moi noi dung khong co g<strong>ì moi noi dung khong co gì moi noi dung </strong>khong co gì moi noi dung khong co gì moi noi dung khong co gì <strong>moi noi dung khong co gì moi noi dung k</strong>hong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi <em>dung khong co gì moi noi dung khong co</em> gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co g<strong>ì moi noi dung khong co gì moi noi dung </strong>khong co gì moi noi dung khong co gì moi noi dung khong co gì <strong>moi noi dung khong co gì moi noi dung k</strong>hong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi <em>dung khong co gì moi noi dung khong co</em> gì moi noi dung khong co gì moinoi dung khong co gì moi noi dung khong co gì moi noi dung khong co g<strong>ì moi noi dung khong co gì moi noi dung </strong>khong co gì moi noi dung khong co gì moi noi dung khong co gì <strong>moi noi dung khong co gì moi noi dung k</strong>hong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi <em>dung khong co gì moi noi dung khong co</em> gì moi noi dung khong co gì moinoi dung khong co gì moi noi dung khong co gì moi noi dung khong co g<strong>ì moi noi dung khong co gì moi noi dung </strong>khong co gì moi noi dung khong co gì moi noi dung khong co gì <strong>moi noi dung khong co gì moi noi dung k</strong>hong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi <em>dung khong co gì moi noi dung khong co</em> gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co g<strong>ì moi noi dung khong co gì moi noi dung </strong>khong co gì moi noi dung khong co gì moi noi dung khong co gì <strong>moi noi dung khong co gì moi noi dung k</strong>hong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi <em>dung khong co gì moi noi dung khong co</em> gì moi noi dung khong co gì moinoi dung khong co gì moi noi dung khong co gì moi noi dung khong co g<strong>ì moi noi dung khong co gì moi noi dung </strong>khong co gì moi noi dung khong co gì moi noi dung khong co gì <strong>moi noi dung khong co gì moi noi dung k</strong>hong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi <em>dung khong co gì moi noi dung khong co</em> gì moi noi dung khong co gì moinoi dung khong co gì moi noi dung khong co gì moi noi dung khong co g<strong>ì moi noi dung khong co gì moi noi dung </strong>khong co gì moi noi dung khong co gì moi noi dung khong co gì <strong>moi noi dung khong co gì moi noi dung k</strong>hong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi <em>dung khong co gì moi noi dung khong co</em> gì moi noi dung khong co gì moinoi dung khong co gì moi noi dung khong co gì moi noi dung khong co g<strong>ì moi noi dung khong co gì moi noi dung </strong>khong co gì moi noi dung khong co gì moi noi dung khong co gì <strong>moi noi dung khong co gì moi noi dung k</strong>hong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi <em>dung khong co gì moi noi dung khong co</em> gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co g<strong>ì moi noi dung khong co gì moi noi dung </strong>khong co gì moi noi dung khong co gì moi noi dung khong co gì <strong>moi noi dung khong co gì moi noi dung k</strong>hong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi <em>dung khong co gì moi noi dung khong co</em> gì moi noi dung khong co gì moinoi dung khong co gì moi noi dung khong co gì moi noi dung khong co g<strong>ì moi noi dung khong co gì moi noi dung </strong>khong co gì moi noi dung khong co gì moi noi dung khong co gì <strong>moi noi dung khong co gì moi noi dung k</strong>hong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi <em>dung khong co gì moi noi dung khong co</em> gì moi noi dung khong co gì moinoi dung khong co gì moi noi dung khong co gì moi noi dung khong co g<strong>ì moi noi dung khong co gì moi noi dung </strong>khong co gì moi noi dung khong co gì moi noi dung khong co gì <strong>moi noi dung khong co gì moi noi dung k</strong>hong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi <em>dung khong co gì moi noi dung khong co</em> gì moi noi dung khong co gì moinoi dung khong co gì moi noi dung khong co gì moi noi dung khong co g<strong>ì moi noi dung khong co gì moi noi dung </strong>khong co gì moi noi dung khong co gì moi noi dung khong co gì <strong>moi noi dung khong co gì moi noi dung k</strong>hong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi <em>dung khong co gì moi noi dung khong co</em> gì moi noi dung khong co gì moinoi dung khong co gì moi noi dung khong co gì moi noi dung khong co g<strong>ì moi noi dung khong co gì moi noi dung </strong>khong co gì moi noi dung khong co gì moi noi dung khong co gì <strong>moi noi dung khong co gì moi noi dung k</strong>hong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi <em>dung khong co gì moi noi dung khong co</em> gì moi noi dung khong co gì moi noi dung khong co gì moi <img alt="" src="/media/upload/images/1b4c48f5613d86232fbee5ef56be1b662.jpg" style="width: 200px; height: 177px; " />noi dung khong co gì moi noi dung khong co g<strong>ì moi noi dung khong co gì moi noi dung </strong>khong co gì moi noi dung khong co gì moi noi dung khong co gì <strong>moi noi dung khong co gì moi noi dung k</strong>hong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi <em>dung khong co gì moi noi dung khong co</em> gì moi noi dung khong co gì moinoi dung khong co gì moi noi dung khong co gì moi noi dung khong co g<strong>ì moi noi dung khong co gì moi noi dung </strong>khong co gì moi noi dung khong co gì moi noi dung khong co gì <strong>moi noi dung khong co gì moi noi dung k</strong>hong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi <em>dung khong co gì moi noi dung khong co</em> gì moi noi dung khong co gì moi </p>
', 1, N'<p>
	noi dung khong co gì moi noi dung khong co gì moi noi dung khong co g<strong>ì moi noi dung khong co gì moi noi dung </strong>khong co gì moi noi dung khong co gì moi noi dung khong co gì <strong>moi noi dung khong co gì moi noi dung k</strong>hong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi <em>dung khong co gì moi noi dung khong co</em> gì moi noi dung khong co gì moi </p>
', N'/media/upload/images/1b4c48f5613d86232fbee5ef56be1b662.jpg', CAST(0x00009FF700B44C42 AS DateTime))
SET IDENTITY_INSERT [dbo].[News] OFF
/****** Object:  StoredProcedure [dbo].[GetUserInforByMail]    Script Date: 02/15/2012 21:05:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		NVN
-- Create date: 12 Feb 2012
-- Description:	NO
-- =============================================
CREATE PROCEDURE [dbo].[GetUserInforByMail]
	@email		nvarchar(400)
AS
BEGIN
	
	SET NOCOUNT ON;
		
	SELECT [FullMart].[dbo].[User].[ID] AS [ID]
      ,[fname]
      ,[lname]
      ,[email]
      ,[pass]
      ,(CONVERT(NVARCHAR(2),DATEPART(DAY,[bday]))+'/'+CONVERT(NVARCHAR(2),DATEPART(MONTH,[bday]))+'/'+CONVERT(NVARCHAR(4),DATEPART(YEAR,[bday]))) AS [bday] 
      ,[state]
      ,[CU]
      ,[class]
      ,(CONVERT(NVARCHAR(2),DATEPART(DAY,[createdate]))+'/'+CONVERT(NVARCHAR(2),DATEPART(MONTH,[createdate]))+'/'+CONVERT(NVARCHAR(4),DATEPART(YEAR,[createdate]))) AS [createdate] 
      ,[FullMart].[dbo].[Role].[Name] AS [ROLEID]
      ,[yahoo]
      ,[mobile]
      ,[ShopID]
      ,[Shopname]
      ,[Web]
      ,[Wishlist]
      ,[isActive]
  FROM [FullMart].[dbo].[User],[FullMart].[dbo].[Role]
  Where ([FullMart].[dbo].[User].[email] = @email)AND ([FullMart].[dbo].[User].[roleID]=[FullMart].[dbo].[Role].[ID])
END
GO
/****** Object:  StoredProcedure [dbo].[GetSubCategories]    Script Date: 02/15/2012 21:05:29 ******/
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
	WHERE [CategoryID] = @catID AND [Order] <>-99
	ORDER BY [Order]
	
END
GO
/****** Object:  Table [dbo].[ProductDetail]    Script Date: 02/15/2012 21:05:29 ******/
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
INSERT [dbo].[ProductDetail] ([ID], [ProductID], [Content]) VALUES (1, 2, N'<p>
	chưa có nội dung chi tiết chưa có nội dung chi tiết chưa có nội dung chi tiết chưa có nội dung chi tiết chưa có nội dung chi tiết chưa có nội dung chi tiết chưa có nội dung chi tiết chưa có nội dung chi tiết chưa có nội dung chi tiết </p>
<p>
	chưa có nội dung chi tiết chưa có nội dung chi tiết </p>
<p>
	chưa có nội dung chi tiết chưa có nội dung chi tiết </p>
<p>
	 </p>
<p>
	chưa có nội dung chi tiết </p>
<p>
	chưa có nội dung chi tiết </p>
<p>
	chưa có nội dung chi tiết </p>
<p>
	chưa có nội dung chi tiết </p>
<p>
	chưa có nội dung chi tiết chưa có nội dung chi tiết </p>
<p>
	 </p>
<p>
	 </p>
<p>
	chưa có nội dung chi tiết </p>
<p>
	 </p>
<p>
	chưa có nội dung chi tiết </p>
<p>
	chưa có nội dung chi tiết chưa có nội dung chi tiết </p>
<p>
	 </p>
<p>
	chưa có nội dung chi tiết </p>
<p>
	chưa có nội dung chi tiết </p>
<p>
	 </p>
')
INSERT [dbo].[ProductDetail] ([ID], [ProductID], [Content]) VALUES (2, 5, N'chưa có nội dung chi tiết')
INSERT [dbo].[ProductDetail] ([ID], [ProductID], [Content]) VALUES (3, 7, N'chưa có nội dung chi tiết')
INSERT [dbo].[ProductDetail] ([ID], [ProductID], [Content]) VALUES (4, 8, N'chưa có nội dung chi tiết')
INSERT [dbo].[ProductDetail] ([ID], [ProductID], [Content]) VALUES (5, 9, N'chưa có nội dung chi tiết')
INSERT [dbo].[ProductDetail] ([ID], [ProductID], [Content]) VALUES (6, 10, N'<p>
	 </p>
<h2 class="Lead" style="font-size: 11pt; color: rgb(95, 95, 95); background-color: rgb(244, 245, 246); ">
	Chiếc điện thoại đầu tiên chạy hệ điều hành MeeGo của Nokia đã được giới thiệu tại TP HCM tối 27/9. N9 có hai phiên bản 16 GB giá hơn 13 triệu đồng và 64 GB giá gần 15 triệu đồng.</h2>
<p class="Normal" style="font-size: 16px; background-color: rgb(244, 245, 246); ">
	Nokia tuyên bố N9 là mẫu smartphone đầu tiên trên thế giới màn hình không có nút điều khiển nào. Điện thoại hoạt động trên nền MeeGo 1.2, thiết kế nguyên khối với màn hình AMOLED 3,9 inch.</p>
<p class="Normal" style="font-size: 16px; background-color: rgb(244, 245, 246); ">
	N9 dùng bộ xử lý 1 GHz, bộ nhớ trong 16 hoặc 64 GB, camera mặt sau 8 megapixel hỗ trợ thêm webcam ở mặt trước. Bản 16 GB có các màu hồng, xanh và đen. Còn phiên bản 64 GB chỉ có màu đen.</p>
<table align="center" border="0" cellpadding="3" cellspacing="0" style="font-size: 16px; background-color: rgb(244, 245, 246); " width="1">
	<tbody>
		<tr>
			<td>
				<img border="1" height="350" src="http://vnexpress.net/Files/Subject/3b/a2/f6/09/gioi_thieu.JPG" width="490" /></td>
		</tr>
		<tr>
			<td align="center" class="Image" style="font-family: Arial; font-size: 8.5pt; ">
				Đại diện Nokia giới thiệu điện thoại N9 tại lễ ra mắt tối 27/9 tại TP HCM. Ảnh: <em designtimesp="10969">Hà Mai.</em></td>
		</tr>
	</tbody>
</table>
<p class="Normal" style="font-size: 16px; background-color: rgb(244, 245, 246); ">
	Giao diện Nokia N9 khá linh hoạt với cách điều khiển vuốt màn hình từ trên xuống để đóng ứng dụng, hay kéo ngang màn hình để tạm thời thoát ứng dụng để về giao diện chủ. Hỗ trợ chạy đa nhiệm ổn định. Một trong những ứng dụng nổi bật là khả năng kết nối không dây "một chạm" NFC cho phép N9 kết nối với loa hay các thiết bị tích hợp NFC khác với chỉ một cú chạm.</p>
<p class="Normal" style="font-size: 16px; background-color: rgb(244, 245, 246); ">
	Đại diện Nokia cho biết N9 hiện được cài sẵn 15 ứng dụng thuần Việt dành riêng cho dòng máy này. Các ứng dụng Việt khác vẫn đang được phát triển và cho đến cuối năm nay sẽ có thêm khoảng 15 ứng dụng nữa được cung cấp cho người dùng N9 thông qua Ovi Store.</p>
<p class="Normal" style="font-size: 16px; background-color: rgb(244, 245, 246); ">
	Nokia bắt đầu nhận đặt hàng trực tuyến của khách hàng mua N9 vào đầu tháng 10. Điện thoại sẽ chính thức bán ra thị trường vào cuối tháng 10, bản 64GB chỉ có màu đen, trong khi model 16GB sẽ thêm màu xanh lam và hồng.</p>
')
INSERT [dbo].[ProductDetail] ([ID], [ProductID], [Content]) VALUES (7, 11, N'<p>
	 </p>
<h2 class="Lead" style="font-size: 11pt; color: rgb(95, 95, 95); background-color: rgb(244, 245, 246); ">
	Chiếc điện thoại đầu tiên chạy hệ điều hành MeeGo của Nokia đã được giới thiệu tại TP HCM tối 27/9. N9 có hai phiên bản 16 GB giá hơn 13 triệu đồng và 64 GB giá gần 15 triệu đồng.</h2>
<p class="Normal" style="font-size: 16px; background-color: rgb(244, 245, 246); ">
	Nokia tuyên bố N9 là mẫu smartphone đầu tiên trên thế giới màn hình không có nút điều khiển nào. Điện thoại hoạt động trên nền MeeGo 1.2, thiết kế nguyên khối với màn hình AMOLED 3,9 inch.</p>
<p class="Normal" style="font-size: 16px; background-color: rgb(244, 245, 246); ">
	N9 dùng bộ xử lý 1 GHz, bộ nhớ trong 16 hoặc 64 GB, camera mặt sau 8 megapixel hỗ trợ thêm webcam ở mặt trước. Bản 16 GB có các màu hồng, xanh và đen. Còn phiên bản 64 GB chỉ có màu đen.</p>
<table align="center" border="0" cellpadding="3" cellspacing="0" style="font-size: 16px; background-color: rgb(244, 245, 246); " width="1">
	<tbody>
		<tr>
			<td>
				<img border="1" height="350" src="http://vnexpress.net/Files/Subject/3b/a2/f6/09/gioi_thieu.JPG" width="490" /></td>
		</tr>
		<tr>
			<td align="center" class="Image" style="font-family: Arial; font-size: 8.5pt; ">
				Đại diện Nokia giới thiệu điện thoại N9 tại lễ ra mắt tối 27/9 tại TP HCM. Ảnh: <em designtimesp="10969">Hà Mai.</em></td>
		</tr>
	</tbody>
</table>
<p class="Normal" style="font-size: 16px; background-color: rgb(244, 245, 246); ">
	Giao diện Nokia N9 khá linh hoạt với cách điều khiển vuốt màn hình từ trên xuống để đóng ứng dụng, hay kéo ngang màn hình để tạm thời thoát ứng dụng để về giao diện chủ. Hỗ trợ chạy đa nhiệm ổn định. Một trong những ứng dụng nổi bật là khả năng kết nối không dây "một chạm" NFC cho phép N9 kết nối với loa hay các thiết bị tích hợp NFC khác với chỉ một cú chạm.</p>
<p class="Normal" style="font-size: 16px; background-color: rgb(244, 245, 246); ">
	Đại diện Nokia cho biết N9 hiện được cài sẵn 15 ứng dụng thuần Việt dành riêng cho dòng máy này. Các ứng dụng Việt khác vẫn đang được phát triển và cho đến cuối năm nay sẽ có thêm khoảng 15 ứng dụng nữa được cung cấp cho người dùng N9 thông qua Ovi Store.</p>
<p class="Normal" style="font-size: 16px; background-color: rgb(244, 245, 246); ">
	Nokia bắt đầu nhận đặt hàng trực tuyến của khách hàng mua N9 vào đầu tháng 10. Điện thoại sẽ chính thức bán ra thị trường vào cuối tháng 10, bản 64GB chỉ có màu đen, trong khi model 16GB sẽ thêm màu xanh lam và hồng.</p>
')
INSERT [dbo].[ProductDetail] ([ID], [ProductID], [Content]) VALUES (8, 12, N'<p>
	 </p>
<h2 class="Lead" style="font-size: 11pt; color: rgb(95, 95, 95); background-color: rgb(244, 245, 246); ">
	Chiếc điện thoại đầu tiên chạy hệ điều hành MeeGo của Nokia đã được giới thiệu tại TP HCM tối 27/9. N9 có hai phiên bản 16 GB giá hơn 13 triệu đồng và 64 GB giá gần 15 triệu đồng.</h2>
<p class="Normal" style="font-size: 16px; background-color: rgb(244, 245, 246); ">
	Nokia tuyên bố N9 là mẫu smartphone đầu tiên trên thế giới màn hình không có nút điều khiển nào. Điện thoại hoạt động trên nền MeeGo 1.2, thiết kế nguyên khối với màn hình AMOLED 3,9 inch.</p>
<p class="Normal" style="font-size: 16px; background-color: rgb(244, 245, 246); ">
	N9 dùng bộ xử lý 1 GHz, bộ nhớ trong 16 hoặc 64 GB, camera mặt sau 8 megapixel hỗ trợ thêm webcam ở mặt trước. Bản 16 GB có các màu hồng, xanh và đen. Còn phiên bản 64 GB chỉ có màu đen.</p>
<table align="center" border="0" cellpadding="3" cellspacing="0" style="font-size: 16px; background-color: rgb(244, 245, 246); " width="1">
	<tbody>
		<tr>
			<td>
				<img border="1" height="350" src="http://vnexpress.net/Files/Subject/3b/a2/f6/09/gioi_thieu.JPG" width="490" /></td>
		</tr>
		<tr>
			<td align="center" class="Image" style="font-family: Arial; font-size: 8.5pt; ">
				Đại diện Nokia giới thiệu điện thoại N9 tại lễ ra mắt tối 27/9 tại TP HCM. Ảnh: <em designtimesp="10969">Hà Mai.</em></td>
		</tr>
	</tbody>
</table>
<p class="Normal" style="font-size: 16px; background-color: rgb(244, 245, 246); ">
	Giao diện Nokia N9 khá linh hoạt với cách điều khiển vuốt màn hình từ trên xuống để đóng ứng dụng, hay kéo ngang màn hình để tạm thời thoát ứng dụng để về giao diện chủ. Hỗ trợ chạy đa nhiệm ổn định. Một trong những ứng dụng nổi bật là khả năng kết nối không dây "một chạm" NFC cho phép N9 kết nối với loa hay các thiết bị tích hợp NFC khác với chỉ một cú chạm.</p>
<p class="Normal" style="font-size: 16px; background-color: rgb(244, 245, 246); ">
	Đại diện Nokia cho biết N9 hiện được cài sẵn 15 ứng dụng thuần Việt dành riêng cho dòng máy này. Các ứng dụng Việt khác vẫn đang được phát triển và cho đến cuối năm nay sẽ có thêm khoảng 15 ứng dụng nữa được cung cấp cho người dùng N9 thông qua Ovi Store.</p>
<p class="Normal" style="font-size: 16px; background-color: rgb(244, 245, 246); ">
	Nokia bắt đầu nhận đặt hàng trực tuyến của khách hàng mua N9 vào đầu tháng 10. Điện thoại sẽ chính thức bán ra thị trường vào cuối tháng 10, bản 64GB chỉ có màu đen, trong khi model 16GB sẽ thêm màu xanh lam và hồng.</p>
')
SET IDENTITY_INSERT [dbo].[ProductDetail] OFF
/****** Object:  StoredProcedure [dbo].[OutstandProduct]    Script Date: 02/15/2012 21:05:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		NVN
-- Create date: 15 feb, 2012
-- Description:	NO
-- =============================================
CREATE PROCEDURE [dbo].[OutstandProduct]
	@ID				INT,
    @OS				bit
AS
BEGIN
	
	SET NOCOUNT ON;

    UPDATE [FullMart].[dbo].[Product]
    SET    [Outstanding]=@OS
     WHERE ([FullMart].[dbo].[Product].[ID]=@ID)
END
GO
/****** Object:  StoredProcedure [dbo].[GetAllProductsOfCategoryBySubCatID]    Script Date: 02/15/2012 21:05:29 ******/
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
/****** Object:  StoredProcedure [dbo].[GetAllProductsOfCategory]    Script Date: 02/15/2012 21:05:29 ******/
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
/****** Object:  StoredProcedure [dbo].[GetAllProductsInSubCategory]    Script Date: 02/15/2012 21:05:29 ******/
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
/****** Object:  StoredProcedure [dbo].[GetAllProductsByPoster]    Script Date: 02/15/2012 21:05:29 ******/
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
/****** Object:  StoredProcedure [dbo].[GetAllNews1]    Script Date: 02/15/2012 21:05:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		NVN
-- Create date: 13 Feb 2012
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetAllNews1]
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT [FullMart].[dbo].[News].[ID] AS [ID]
      ,[Title]
      ,[Content]
      ,[FullMart].[dbo].[User].[fname] + ' ' +[FullMart].[dbo].[User].[lname] AS [Poster]
      ,[ShortContent]
      ,[ImageThumb]
      ,(CONVERT(NVARCHAR(2),DATEPART(DAY,[FullMart].[dbo].[News].[CreatedDate]))+'/'+CONVERT(NVARCHAR(2),DATEPART(MONTH,[FullMart].[dbo].[News].[CreatedDate]))+'/'+CONVERT(NVARCHAR(4),DATEPART(YEAR,[FullMart].[dbo].[News].[CreatedDate]))) AS [CREATEDATE]
  FROM [FullMart].[dbo].[News],[FullMart].[dbo].[User]
  WHERE [FullMart].[dbo].[News].[PosterID]=[FullMart].[dbo].[User].[ID]
  order by [FullMart].[dbo].[News].[CreatedDate] DESC
  
END
GO
/****** Object:  StoredProcedure [dbo].[GetAllNews]    Script Date: 02/15/2012 21:05:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		NVN
-- Create date: 13 Feb 2012
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetAllNews]
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT [FullMart].[dbo].[News].[ID] AS [ID]
      ,[Title]
      ,[Content]
      ,[FullMart].[dbo].[User].[email] AS [Poster]
      ,[ShortContent]
      ,[ImageThumb]
      ,[FullMart].[dbo].[News].[CreatedDate] AS [CREATEDATE]
  FROM [FullMart].[dbo].[News],[FullMart].[dbo].[User]
  WHERE [FullMart].[dbo].[News].[PosterID]=[FullMart].[dbo].[User].[ID]
  order by [FullMart].[dbo].[News].[CreatedDate] DESC
END
GO
/****** Object:  StoredProcedure [dbo].[DeleteNew]    Script Date: 02/15/2012 21:05:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		NVN
-- Create date: 13 Feb, 2012
-- Description:	NO
-- =============================================
CREATE PROCEDURE [dbo].[DeleteNew] 
	@ID		int
AS
BEGIN
	
	SET NOCOUNT ON;
	
	IF NOT EXISTS(SELECT * FROM [FullMart].[dbo].[News] WHERE [ID] = @ID)
		RETURN 1
	ELSE
	BEGIN	
		DELETE FROM [FullMart].[dbo].[News]
	WHERE [FullMart].[dbo].[News].[ID] = @ID
		RETURN 1
	END
END
GO
/****** Object:  Table [dbo].[Cart]    Script Date: 02/15/2012 21:05:29 ******/
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
/****** Object:  StoredProcedure [dbo].[CreateNew]    Script Date: 02/15/2012 21:05:29 ******/
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
GO
/****** Object:  Table [dbo].[Comment]    Script Date: 02/15/2012 21:05:29 ******/
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
/****** Object:  Table [dbo].[SubAQ]    Script Date: 02/15/2012 21:05:29 ******/
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
/****** Object:  StoredProcedure [dbo].[SearchAllProductsOfCategory]    Script Date: 02/15/2012 21:05:29 ******/
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
/****** Object:  StoredProcedure [dbo].[SearchAllProducts]    Script Date: 02/15/2012 21:05:29 ******/
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
/****** Object:  StoredProcedure [dbo].[UpdateNew]    Script Date: 02/15/2012 21:05:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		NVN
-- Create date: 13 FEB 2012
-- Description:	NO
-- =============================================
CREATE PROCEDURE [dbo].[UpdateNew]
	@ID			INT,
	@title		nvarchar(200),
	@content	ntext,
	@preview	ntext,
	@img		nvarchar(150)
	
AS
BEGIN
	
	SET NOCOUNT ON;
	
	IF NOT EXISTS(SELECT * FROM [FullMart].[dbo].[News] WHERE ID=@ID)
		RETURN 0
	ELSE
	BEGIN	
		UPDATE [FullMart].[dbo].[News]
   SET [Title] = @title
      ,[Content] = @content
      ,[ShortContent] = @preview
      ,[ImageThumb] = @img
	WHERE ID=@ID
		RETURN 1
	END
END
GO
/****** Object:  StoredProcedure [dbo].[GetNewDetail]    Script Date: 02/15/2012 21:05:29 ******/
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
/****** Object:  StoredProcedure [dbo].[GetManagingProductList]    Script Date: 02/15/2012 21:05:29 ******/
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
	
	DECLARE @intProductID		INT
	
	IF(@ProductID <> 'Search by Product ID')
		BEGIN
			SET @intProductID = CONVERT(INT, @ProductID)
		END	
	
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
		  AND ([FullMart].[dbo].[Product].[ID] = @intProductID
				OR @ProductID = 'Search by Product ID')
		  AND ([email] = @Email
				OR @Email LIKE 'Enter Email to search user%')
		  AND ([SubCategoryID] = @SubcatID
				OR @SubcatID = -9999)
END
GO
/****** Object:  Table [dbo].[SubComment]    Script Date: 02/15/2012 21:05:29 ******/
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
/****** Object:  StoredProcedure [dbo].[GetProductDetail]    Script Date: 02/15/2012 21:05:29 ******/
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
/****** Object:  StoredProcedure [dbo].[UpdateProduct]    Script Date: 02/15/2012 21:05:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		NVN
-- Create date: 15 feb, 2012
-- Description:	NO
-- =============================================
CREATE PROCEDURE [dbo].[UpdateProduct]
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
           ,[Picture]=@Picture
           ,[Thumbnail]=@Thumbnail
           ,[Title]=@Title
           ,[State]=@State
     WHERE ([FullMart].[dbo].[Product].[ID]=@ID)
     UPDATE [FullMart].[dbo].[ProductDetail]
     SET [FullMart].[dbo].[ProductDetail].[Content]=@Content
     WHERE [FullMart].[dbo].[ProductDetail].[ProductID]=@ID
     
    
END
GO
/****** Object:  StoredProcedure [dbo].[CreateProduct]    Script Date: 02/15/2012 21:05:29 ******/
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
/****** Object:  Default [DF_Cart_Amount]    Script Date: 02/15/2012 21:05:29 ******/
ALTER TABLE [dbo].[Cart] ADD  CONSTRAINT [DF_Cart_Amount]  DEFAULT ((0)) FOR [Amount]
GO
/****** Object:  ForeignKey [FK_SubCategory_Category]    Script Date: 02/15/2012 21:05:29 ******/
ALTER TABLE [dbo].[SubCategory]  WITH CHECK ADD  CONSTRAINT [FK_SubCategory_Category] FOREIGN KEY([CategoryID])
REFERENCES [dbo].[Category] ([ID])
GO
ALTER TABLE [dbo].[SubCategory] CHECK CONSTRAINT [FK_SubCategory_Category]
GO
/****** Object:  ForeignKey [FK_User_Role]    Script Date: 02/15/2012 21:05:29 ******/
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_Role] FOREIGN KEY([roleID])
REFERENCES [dbo].[Role] ([ID])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_Role]
GO
/****** Object:  ForeignKey [FK_AnswerQuestion_User]    Script Date: 02/15/2012 21:05:29 ******/
ALTER TABLE [dbo].[AnswerQuestion]  WITH CHECK ADD  CONSTRAINT [FK_AnswerQuestion_User] FOREIGN KEY([PosterID])
REFERENCES [dbo].[User] ([ID])
GO
ALTER TABLE [dbo].[AnswerQuestion] CHECK CONSTRAINT [FK_AnswerQuestion_User]
GO
/****** Object:  ForeignKey [FK_Product_SubCategory]    Script Date: 02/15/2012 21:05:29 ******/
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_SubCategory] FOREIGN KEY([SubCategoryID])
REFERENCES [dbo].[SubCategory] ([ID])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_SubCategory]
GO
/****** Object:  ForeignKey [FK_News_User]    Script Date: 02/15/2012 21:05:29 ******/
ALTER TABLE [dbo].[News]  WITH CHECK ADD  CONSTRAINT [FK_News_User] FOREIGN KEY([PosterID])
REFERENCES [dbo].[User] ([ID])
GO
ALTER TABLE [dbo].[News] CHECK CONSTRAINT [FK_News_User]
GO
/****** Object:  ForeignKey [FK_ProductDetail_Product]    Script Date: 02/15/2012 21:05:29 ******/
ALTER TABLE [dbo].[ProductDetail]  WITH CHECK ADD  CONSTRAINT [FK_ProductDetail_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ProductDetail] CHECK CONSTRAINT [FK_ProductDetail_Product]
GO
/****** Object:  ForeignKey [FK_Cart_Product]    Script Date: 02/15/2012 21:05:29 ******/
ALTER TABLE [dbo].[Cart]  WITH CHECK ADD  CONSTRAINT [FK_Cart_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ID])
GO
ALTER TABLE [dbo].[Cart] CHECK CONSTRAINT [FK_Cart_Product]
GO
/****** Object:  ForeignKey [FK_Comment_Product]    Script Date: 02/15/2012 21:05:29 ******/
ALTER TABLE [dbo].[Comment]  WITH CHECK ADD  CONSTRAINT [FK_Comment_Product] FOREIGN KEY([Product])
REFERENCES [dbo].[Product] ([ID])
GO
ALTER TABLE [dbo].[Comment] CHECK CONSTRAINT [FK_Comment_Product]
GO
/****** Object:  ForeignKey [FK_Comment_User]    Script Date: 02/15/2012 21:05:29 ******/
ALTER TABLE [dbo].[Comment]  WITH CHECK ADD  CONSTRAINT [FK_Comment_User] FOREIGN KEY([PosterID])
REFERENCES [dbo].[User] ([ID])
GO
ALTER TABLE [dbo].[Comment] CHECK CONSTRAINT [FK_Comment_User]
GO
/****** Object:  ForeignKey [FK_SubAQ_AnswerQuestion]    Script Date: 02/15/2012 21:05:29 ******/
ALTER TABLE [dbo].[SubAQ]  WITH CHECK ADD  CONSTRAINT [FK_SubAQ_AnswerQuestion] FOREIGN KEY([AQID])
REFERENCES [dbo].[AnswerQuestion] ([ID])
GO
ALTER TABLE [dbo].[SubAQ] CHECK CONSTRAINT [FK_SubAQ_AnswerQuestion]
GO
/****** Object:  ForeignKey [FK_SubAQ_User]    Script Date: 02/15/2012 21:05:29 ******/
ALTER TABLE [dbo].[SubAQ]  WITH CHECK ADD  CONSTRAINT [FK_SubAQ_User] FOREIGN KEY([PosterID])
REFERENCES [dbo].[User] ([ID])
GO
ALTER TABLE [dbo].[SubAQ] CHECK CONSTRAINT [FK_SubAQ_User]
GO
/****** Object:  ForeignKey [FK_SubComment_Comment]    Script Date: 02/15/2012 21:05:29 ******/
ALTER TABLE [dbo].[SubComment]  WITH CHECK ADD  CONSTRAINT [FK_SubComment_Comment] FOREIGN KEY([CommentID])
REFERENCES [dbo].[Comment] ([ID])
GO
ALTER TABLE [dbo].[SubComment] CHECK CONSTRAINT [FK_SubComment_Comment]
GO
/****** Object:  ForeignKey [FK_SubComment_User]    Script Date: 02/15/2012 21:05:29 ******/
ALTER TABLE [dbo].[SubComment]  WITH CHECK ADD  CONSTRAINT [FK_SubComment_User] FOREIGN KEY([PosterID])
REFERENCES [dbo].[User] ([ID])
GO
ALTER TABLE [dbo].[SubComment] CHECK CONSTRAINT [FK_SubComment_User]
GO
