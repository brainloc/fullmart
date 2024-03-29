/****** Object:  Database [FullMart]    Script Date: 03/05/2012 06:44:30 ******/
CREATE DATABASE [FullMart] 
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [FullMart].[dbo].[sp_fulltext_database] @action = 'enable'
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
/****** Object:  Role [aspnet_Roles_BasicAccess]    Script Date: 03/05/2012 06:44:31 ******/
CREATE ROLE [aspnet_Roles_BasicAccess] AUTHORIZATION [dbo]
GO
/****** Object:  Role [aspnet_Roles_FullAccess]    Script Date: 03/05/2012 06:44:31 ******/
CREATE ROLE [aspnet_Roles_FullAccess] AUTHORIZATION [dbo]
GO
/****** Object:  Role [aspnet_Roles_ReportingAccess]    Script Date: 03/05/2012 06:44:31 ******/
CREATE ROLE [aspnet_Roles_ReportingAccess] AUTHORIZATION [dbo]
GO
/****** Object:  Schema [aspnet_Roles_ReportingAccess]    Script Date: 03/05/2012 06:44:31 ******/
CREATE SCHEMA [aspnet_Roles_ReportingAccess] AUTHORIZATION [aspnet_Roles_ReportingAccess]
GO
/****** Object:  Schema [aspnet_Roles_FullAccess]    Script Date: 03/05/2012 06:44:31 ******/
CREATE SCHEMA [aspnet_Roles_FullAccess] AUTHORIZATION [aspnet_Roles_FullAccess]
GO
/****** Object:  Schema [aspnet_Roles_BasicAccess]    Script Date: 03/05/2012 06:44:31 ******/
CREATE SCHEMA [aspnet_Roles_BasicAccess] AUTHORIZATION [aspnet_Roles_BasicAccess]
GO
/****** Object:  Table [dbo].[aspnet_Applications]    Script Date: 03/05/2012 06:44:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[aspnet_Applications](
	[ApplicationName] [nvarchar](256) NOT NULL,
	[LoweredApplicationName] [nvarchar](256) NOT NULL,
	[ApplicationId] [uniqueidentifier] NOT NULL,
	[Description] [nvarchar](256) NULL,
PRIMARY KEY NONCLUSTERED 
(
	[ApplicationId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[LoweredApplicationName] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[ApplicationName] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE CLUSTERED INDEX [aspnet_Applications_Index] ON [dbo].[aspnet_Applications] 
(
	[LoweredApplicationName] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
INSERT [dbo].[aspnet_Applications] ([ApplicationName], [LoweredApplicationName], [ApplicationId], [Description]) VALUES (N'FullMart', N'fullmart', N'80a29eba-007e-4e72-9b81-35b3487ad17e', NULL)
/****** Object:  Table [dbo].[Advertise]    Script Date: 03/05/2012 06:44:34 ******/
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
/****** Object:  StoredProcedure [dbo].[aspnet_Setup_RestorePermissions]    Script Date: 03/05/2012 06:44:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Setup_RestorePermissions]
    @name   sysname
AS
BEGIN
    DECLARE @object sysname
    DECLARE @protectType char(10)
    DECLARE @action varchar(60)
    DECLARE @grantee sysname
    DECLARE @cmd nvarchar(500)
    DECLARE c1 cursor FORWARD_ONLY FOR
        SELECT Object, ProtectType, [Action], Grantee FROM #aspnet_Permissions where Object = @name

    OPEN c1

    FETCH c1 INTO @object, @protectType, @action, @grantee
    WHILE (@@fetch_status = 0)
    BEGIN
        SET @cmd = @protectType + ' ' + @action + ' on ' + @object + ' TO [' + @grantee + ']'
        EXEC (@cmd)
        FETCH c1 INTO @object, @protectType, @action, @grantee
    END

    CLOSE c1
    DEALLOCATE c1
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Setup_RemoveAllRoleMembers]    Script Date: 03/05/2012 06:44:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Setup_RemoveAllRoleMembers]
    @name   sysname
AS
BEGIN
    CREATE TABLE #aspnet_RoleMembers
    (
        Group_name      sysname,
        Group_id        smallint,
        Users_in_group  sysname,
        User_id         smallint
    )

    INSERT INTO #aspnet_RoleMembers
    EXEC sp_helpuser @name

    DECLARE @user_id smallint
    DECLARE @cmd nvarchar(500)
    DECLARE c1 cursor FORWARD_ONLY FOR
        SELECT User_id FROM #aspnet_RoleMembers

    OPEN c1

    FETCH c1 INTO @user_id
    WHILE (@@fetch_status = 0)
    BEGIN
        SET @cmd = 'EXEC sp_droprolemember ' + '''' + @name + ''', ''' + USER_NAME(@user_id) + ''''
        EXEC (@cmd)
        FETCH c1 INTO @user_id
    END

    CLOSE c1
    DEALLOCATE c1
END
GO
/****** Object:  Table [dbo].[aspnet_SchemaVersions]    Script Date: 03/05/2012 06:44:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[aspnet_SchemaVersions](
	[Feature] [nvarchar](128) NOT NULL,
	[CompatibleSchemaVersion] [nvarchar](128) NOT NULL,
	[IsCurrentVersion] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Feature] ASC,
	[CompatibleSchemaVersion] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[aspnet_SchemaVersions] ([Feature], [CompatibleSchemaVersion], [IsCurrentVersion]) VALUES (N'common', N'1', 1)
INSERT [dbo].[aspnet_SchemaVersions] ([Feature], [CompatibleSchemaVersion], [IsCurrentVersion]) VALUES (N'role manager', N'1', 1)
/****** Object:  Table [dbo].[Category]    Script Date: 03/05/2012 06:44:46 ******/
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
/****** Object:  Table [dbo].[GeneralOption]    Script Date: 03/05/2012 06:44:46 ******/
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
INSERT [dbo].[GeneralOption] ([ID], [Option], [EN], [VI]) VALUES (3, N'ShopTC', N'123123123123123123123 123 12 3 123 1 23 12 3 123 1 23 12 31 23 12 3 123 12 3 123 1 23 12 3 123 1 23 12 3 123 1 23', N'123123123123123123123 123 12 3 123 1 23 12 3 123 1 23 12 31 23 12 3 123 12 3 123 1 23 12 3 123 1 23 12 3 123 1 23<p>công ty của chúng tui</p><p>công ty của chúng tui</p><p>công ty của chúng tui</p><p>công ty của chúng tui</p><p>công ty của chúng tui</p><p>công ty của chúng tui</p><p>công ty của chúng tui</p><p>công ty của chúng tui</p><p>công ty của chúng tui</p><p>công ty của chúng tui</p><p>công ty của chúng tui</p><p>công ty của chúng tui</p><p>công ty của chúng tui</p><p>công ty của chúng tui</p><p>công ty của chúng tui</p><p>công ty của chúng tui</p><p>công ty của chúng tui</p><p>công ty của chúng tui</p><p>công ty của chúng tui</p><p>công ty của chúng tui</p><p>công ty của chúng tui</p><p>công ty của chúng tui</p><p>công ty của chúng tui</p><p>công ty của chúng tui</p><p>công ty của chúng tui</p><p>công ty của chúng tui</p><p>công ty của chúng tui</p><p>công ty của chúng tui</p><p>công ty của chúng tui</p><p>công ty của chúng tui</p><p>công ty của chúng tui</p><p>công ty của chúng tui</p><p>công ty của chúng tui</p><p>công ty của chúng tui</p><p>công ty của chúng tui</p><p>công ty của chúng tui</p><p>công ty của chúng tui</p><p>công ty của chúng tui</p><p>công ty của chúng tui</p><p>công ty của chúng tui</p><p>công ty của chúng tui</p><p>công ty của chúng tui</p><p>công ty của chúng tui</p><p>công ty của chúng tui</p><p>công ty của chúng tui</p><p>công ty của chúng tui</p><p>công ty của chúng tui</p><p>công ty của chúng tui</p><p>công ty của chúng tui</p><p>công ty của chúng tui</p><p>công ty của chúng tui</p><p>công ty của chúng tui</p><p>công ty của chúng tui</p><p>công ty của chúng tui</p><p>công ty của chúng tui</p><p>công ty của chúng tui</p><p>công ty của chúng tui</p><p>công ty của chúng tui</p><p>công ty của chúng tui</p><p>công ty của chúng tui</p><p>công ty của chúng tui</p><p>công ty của chúng tui</p><p>công ty của chúng tui</p><p>công ty của chúng tui</p><p>công ty của chúng tui</p><p>công ty của chúng tui</p><p>công ty của chúng tui</p><p>công ty của chúng tui</p><p>công ty của chúng tui</p><p>công ty của chúng tui</p><p>công ty của chúng tui</p><p>công ty của chúng tui</p><p>công ty của chúng tui</p><p>công ty của chúng tui</p><p>công ty của chúng tui</p><p>công ty của chúng tui</p><p>công ty của chúng tui</p><p>công ty của chúng tui</p><p>công ty của chúng tui</p><p>công ty của chúng tui</p><p>công ty của chúng tui</p><p>công ty của chúng tui</p><p>công ty của chúng tui</p><p>công ty của chúng tui</p><p>công ty của chúng tui</p><p>công ty của chúng tui</p><p>công ty của chúng tui</p><p>công ty của chúng tui</p><p>công ty của chúng tui</p><p>công ty của chúng tui</p><p>công ty của chúng tui</p><p>công ty của chúng tui</p><p>công ty của chúng tui</p><p>công ty của chúng tui</p><p>công ty của chúng tui</p><p>công ty của chúng tui</p><p>công ty của chúng tui</p><p>công ty của chúng tui</p><p>công ty của chúng tui</p><p>công ty của chúng tui</p><p>công ty của chúng tui</p><p>công ty của chúng tui</p><p>công ty của chúng tui</p><p>công ty của chúng tui</p><p>công ty của chúng tui</p><p>công ty của chúng tui</p><p>công ty của chúng tui</p><p>công ty của chúng tui</p><p>công ty của chúng tui</p><p>công ty của chúng tui</p><p>công ty của chúng tui</p><p>công ty của chúng tui</p><p>công ty của chúng tui</p><p>công ty của chúng tui</p><p>công ty của chúng tui</p><p>công ty của chúng tui</p><p>công ty của chúng tui</p><p>công ty của chúng tui</p><p>công ty của chúng tui</p><p>công ty của chúng tui</p><p>công ty của chúng tui</p><p>công ty của chúng tui</p><p>công ty của chúng tui</p><p>công ty của chúng tui</p><p>công ty của chúng tui</p><p>công ty của chúng tui</p><p>công ty của chúng tui</p><p>công ty của chúng tui</p><p>công ty của chúng tui</p><p>công ty của chúng tui</p><p>công ty của chúng tui</p><p>công ty của chúng tui</p><p>công ty của chúng tui</p>')
INSERT [dbo].[GeneralOption] ([ID], [Option], [EN], [VI]) VALUES (4, N'Slider', N'/themes/images/slide2.jpg', N'/themes/images/slide2.jpg')
INSERT [dbo].[GeneralOption] ([ID], [Option], [EN], [VI]) VALUES (5, N'Slider', N'/themes/images/slide2.jpg', N'/themes/images/slide2.jpg')
INSERT [dbo].[GeneralOption] ([ID], [Option], [EN], [VI]) VALUES (6, N'Slider', N'/themes/images/slide3.jpg', N'/themes/images/slide3.jpg')
INSERT [dbo].[GeneralOption] ([ID], [Option], [EN], [VI]) VALUES (7, N'Slider', N'/themes/images/slide4.jpg', N'/themes/images/slide4.jpg')
INSERT [dbo].[GeneralOption] ([ID], [Option], [EN], [VI]) VALUES (8, N'Slider', N'/themes/images/slide1.jpg', N'/themes/images/slide1.jpg')
SET IDENTITY_INSERT [dbo].[GeneralOption] OFF
/****** Object:  Table [dbo].[SubState]    Script Date: 03/05/2012 06:44:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SubState](
	[ID] [int] NOT NULL,
	[Name] [nvarchar](300) NOT NULL,
	[Order] [int] NOT NULL,
	[isAcitve] [bit] NOT NULL,
	[State] [int] NOT NULL,
 CONSTRAINT [PK_SubState] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[SubmitOrder]    Script Date: 03/05/2012 06:44:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		BTN
-- Create date: 26 Feb 2012
-- Description:	NO
-- =============================================
CREATE PROCEDURE [dbo].[SubmitOrder]
	@IDList				NVARCHAR(400)
AS
BEGIN

	SET NOCOUNT ON;

    DECLARE @SQL		NVARCHAR(600)
    
    SET @SQL = 'UPDATE [FullMart].[dbo].[Cart]
				SET [isSubmited] = 1
				WHERE [ID] IN ' + @IDList
				
	EXECUTE(@SQL)
END
GO
/****** Object:  Table [dbo].[Role]    Script Date: 03/05/2012 06:44:46 ******/
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
/****** Object:  Table [dbo].[MemsPostType]    Script Date: 03/05/2012 06:44:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MemsPostType](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Order] [tinyint] NULL,
 CONSTRAINT [PK_MemsPostType] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[MemsPostType] ON
INSERT [dbo].[MemsPostType] ([ID], [Name], [Order]) VALUES (1, N'Sell', 1)
INSERT [dbo].[MemsPostType] ([ID], [Name], [Order]) VALUES (2, N'Buy', 2)
INSERT [dbo].[MemsPostType] ([ID], [Name], [Order]) VALUES (3, N'Share', 3)
SET IDENTITY_INSERT [dbo].[MemsPostType] OFF
/****** Object:  Table [dbo].[State]    Script Date: 03/05/2012 06:44:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[State](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[StateName] [nvarchar](200) NULL,
	[Order] [smallint] NULL,
 CONSTRAINT [PK_State] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[State] ON
INSERT [dbo].[State] ([id], [StateName], [Order]) VALUES (1, N'Ha Noi', 1)
INSERT [dbo].[State] ([id], [StateName], [Order]) VALUES (2, N'Da Nang', 2)
INSERT [dbo].[State] ([id], [StateName], [Order]) VALUES (3, N'Ho Chi Minh', 3)
INSERT [dbo].[State] ([id], [StateName], [Order]) VALUES (4, N'Vung tau', 4)
INSERT [dbo].[State] ([id], [StateName], [Order]) VALUES (5, N'Bien hoa', 5)
INSERT [dbo].[State] ([id], [StateName], [Order]) VALUES (6, N' Serbia', -99)
INSERT [dbo].[State] ([id], [StateName], [Order]) VALUES (7, N'Nha Trang', 7)
INSERT [dbo].[State] ([id], [StateName], [Order]) VALUES (8, N'United States', 8)
INSERT [dbo].[State] ([id], [StateName], [Order]) VALUES (9, N'asd', 8)
INSERT [dbo].[State] ([id], [StateName], [Order]) VALUES (10, N'csad', -99)
SET IDENTITY_INSERT [dbo].[State] OFF
/****** Object:  Table [dbo].[Shop]    Script Date: 03/05/2012 06:44:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Shop](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ShopName] [nvarchar](500) NOT NULL,
	[Adress] [nvarchar](550) NOT NULL,
	[Phone] [nvarchar](15) NULL,
	[Chat] [nvarchar](50) NULL,
	[rate] [tinyint] NOT NULL,
	[isActive] [bit] NOT NULL,
	[isChecked] [bit] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
 CONSTRAINT [PK_Shop] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Shop] ON
INSERT [dbo].[Shop] ([ID], [ShopName], [Adress], [Phone], [Chat], [rate], [isActive], [isChecked], [CreateDate]) VALUES (1, N'GauShop', N'binh duong di an', N'09123123123', N'vunam289', 1, 1, 0, CAST(0x0000A00600F264D7 AS DateTime))
INSERT [dbo].[Shop] ([ID], [ShopName], [Adress], [Phone], [Chat], [rate], [isActive], [isChecked], [CreateDate]) VALUES (2, N'GauShop trang', N'binh duong di an', N'09123123123', N'sadman289', 5, 1, 1, CAST(0x0000A00600FAAEF7 AS DateTime))
INSERT [dbo].[Shop] ([ID], [ShopName], [Adress], [Phone], [Chat], [rate], [isActive], [isChecked], [CreateDate]) VALUES (3, N'GauShop1', N'binh duong di an', N'09123123123', N'vunam289', 1, 1, 0, CAST(0x0000A00600FB4601 AS DateTime))
INSERT [dbo].[Shop] ([ID], [ShopName], [Adress], [Phone], [Chat], [rate], [isActive], [isChecked], [CreateDate]) VALUES (4, N'CuaHangTongHop', N'CuaHangTongHop', N'123123123', N'1231231', 1, 1, 0, CAST(0x0000A00A00FC7290 AS DateTime))
SET IDENTITY_INSERT [dbo].[Shop] OFF
/****** Object:  Table [dbo].[SubCategory]    Script Date: 03/05/2012 06:44:46 ******/
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
INSERT [dbo].[SubCategory] ([ID], [CategoryID], [Name], [Order]) VALUES (16, 7, N'CACdfgdgd', 1)
INSERT [dbo].[SubCategory] ([ID], [CategoryID], [Name], [Order]) VALUES (17, 3, N'BlackBerry', 2)
INSERT [dbo].[SubCategory] ([ID], [CategoryID], [Name], [Order]) VALUES (18, 3, N'SamSung', 8)
INSERT [dbo].[SubCategory] ([ID], [CategoryID], [Name], [Order]) VALUES (19, 3, N'O2', 4)
INSERT [dbo].[SubCategory] ([ID], [CategoryID], [Name], [Order]) VALUES (20, 7, N'Secondhand', 2)
INSERT [dbo].[SubCategory] ([ID], [CategoryID], [Name], [Order]) VALUES (21, 1, N'aa', 1)
INSERT [dbo].[SubCategory] ([ID], [CategoryID], [Name], [Order]) VALUES (22, 2, N'asdas', 2)
SET IDENTITY_INSERT [dbo].[SubCategory] OFF
/****** Object:  Table [dbo].[Zone]    Script Date: 03/05/2012 06:44:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Zone](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Order] [int] NULL,
	[state] [int] NOT NULL,
 CONSTRAINT [PK_Zone] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Zone] ON
INSERT [dbo].[Zone] ([ID], [Name], [Order], [state]) VALUES (1, N'abc', 1, 1)
INSERT [dbo].[Zone] ([ID], [Name], [Order], [state]) VALUES (2, N'cbd', 1, 2)
INSERT [dbo].[Zone] ([ID], [Name], [Order], [state]) VALUES (3, N'asdasdasd', 2, 2)
INSERT [dbo].[Zone] ([ID], [Name], [Order], [state]) VALUES (4, N'asd', -99, 1)
INSERT [dbo].[Zone] ([ID], [Name], [Order], [state]) VALUES (5, N'asd', 3, 2)
INSERT [dbo].[Zone] ([ID], [Name], [Order], [state]) VALUES (6, N'asd', 1, 9)
INSERT [dbo].[Zone] ([ID], [Name], [Order], [state]) VALUES (7, N'fgh', 2, 9)
INSERT [dbo].[Zone] ([ID], [Name], [Order], [state]) VALUES (8, N'sdfsdf', 3, 9)
SET IDENTITY_INSERT [dbo].[Zone] OFF
/****** Object:  StoredProcedure [dbo].[UpdateGeneralOption]    Script Date: 03/05/2012 06:44:47 ******/
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
/****** Object:  StoredProcedure [dbo].[UpdateCategory]    Script Date: 03/05/2012 06:44:47 ******/
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
/****** Object:  StoredProcedure [dbo].[UpdateState]    Script Date: 03/05/2012 06:44:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		NVN
-- Create date: 14 Feb 2012
-- Description:	NO
-- =============================================
CREATE PROCEDURE [dbo].[UpdateState] 
	@ID		int,
	@Name		NVARCHAR(100),
	@Order		INT
	
AS
BEGIN
	
	SET NOCOUNT ON;
	
	IF NOT EXISTS(SELECT * FROM [FullMart].[dbo].[State] WHERE [ID] = @ID)
		RETURN 0
	ELSE
	BEGIN	
		UPDATE [FullMart].[dbo].[State]
	SET [StateName] = @Name
      ,[Order] = @Order
	WHERE [ID] = @ID
		RETURN 1
	END
END
GO
/****** Object:  View [dbo].[vw_aspnet_Applications]    Script Date: 03/05/2012 06:44:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE VIEW [dbo].[vw_aspnet_Applications]
  AS SELECT [dbo].[aspnet_Applications].[ApplicationName], [dbo].[aspnet_Applications].[LoweredApplicationName], [dbo].[aspnet_Applications].[ApplicationId], [dbo].[aspnet_Applications].[Description]
  FROM [dbo].[aspnet_Applications]
GO
/****** Object:  Table [dbo].[User]    Script Date: 03/05/2012 06:44:48 ******/
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
	[Web] [nvarchar](50) NULL,
	[Wishlist] [nvarchar](max) NULL,
	[isActive] [bit] NULL,
	[UserName] [nvarchar](50) NOT NULL,
	[isBanned] [bit] NOT NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[User] ON
INSERT [dbo].[User] ([ID], [fname], [lname], [email], [pass], [bday], [state], [CU], [class], [createdate], [roleID], [yahoo], [mobile], [ShopID], [Web], [Wishlist], [isActive], [UserName], [isBanned]) VALUES (1, N'nam', N'nguyễn', N'sa22dman289@gmail.com', N'E8E2ED953D8201AF064C369009071020640895E0', CAST(0x00009FD000000000 AS DateTime), N'Select your current states', N'Chose your College', N'Select you', CAST(0x00009FD001052FBC AS DateTime), 2, N'', N'1231231234', 4, N'anasjdsgd', N'anasjdsgd', 1, N'vunam', 0)
INSERT [dbo].[User] ([ID], [fname], [lname], [email], [pass], [bday], [state], [CU], [class], [createdate], [roleID], [yahoo], [mobile], [ShopID], [Web], [Wishlist], [isActive], [UserName], [isBanned]) VALUES (2, N'Nguyễn', N'nam', N'sa2dman289@gmail.com', N'E8E2ED953D8201AF064C369009071020640895E0', CAST(0x00009FD000000000 AS DateTime), N'Select your current states', N'Chose your College', N'Select you', CAST(0x00009FD0011195F8 AS DateTime), 2, N'', N'12312313', 2, N'123', N'123', 1, N'vunam1', 0)
INSERT [dbo].[User] ([ID], [fname], [lname], [email], [pass], [bday], [state], [CU], [class], [createdate], [roleID], [yahoo], [mobile], [ShopID], [Web], [Wishlist], [isActive], [UserName], [isBanned]) VALUES (3, N'Nguyễn', N'nam nguyễn', N'sadman289@gmail.com', N'E8E2ED953D8201AF064C369009071020640895E0', CAST(0x00009FD00113912B AS DateTime), N'Select your current states', N'Chose your College', N'Select you', CAST(0x00009FD00113912B AS DateTime), 2, N'vunam', N'3213213211', 1, NULL, NULL, 1, N'vunam2', 0)
INSERT [dbo].[User] ([ID], [fname], [lname], [email], [pass], [bday], [state], [CU], [class], [createdate], [roleID], [yahoo], [mobile], [ShopID], [Web], [Wishlist], [isActive], [UserName], [isBanned]) VALUES (4, N'Nguyễn', N'nam nguyễn', N'sadmanz289@gmail.com', N'E8E2ED953D8201AF064C369009071020640895E0', CAST(0x00009FD000000000 AS DateTime), N'Select your current states', N'Chose your College', N'Select you', CAST(0x00009FD001156239 AS DateTime), 2, N'', N'4564567899', 3, N'', N'', 1, N'vunam3', 0)
INSERT [dbo].[User] ([ID], [fname], [lname], [email], [pass], [bday], [state], [CU], [class], [createdate], [roleID], [yahoo], [mobile], [ShopID], [Web], [Wishlist], [isActive], [UserName], [isBanned]) VALUES (5, N'Namnguyen', N'vunam', N'sam@gmail.com', N'E8E2ED953D8201AF064C369009071020640895E0', CAST(0x00007E7E00000000 AS DateTime), N'Viet Nam', N'Chose your College', N'2006', CAST(0x00009FD20032E6FC AS DateTime), 1, NULL, N'9879879876', -1, NULL, NULL, 1, N'vunam4', 0)
INSERT [dbo].[User] ([ID], [fname], [lname], [email], [pass], [bday], [state], [CU], [class], [createdate], [roleID], [yahoo], [mobile], [ShopID], [Web], [Wishlist], [isActive], [UserName], [isBanned]) VALUES (6, N'sadman', N'sadman', N'sadman2894@gmail.com', N'E8E2ED953D8201AF064C369009071020640895E0', CAST(0x00007E7E00000000 AS DateTime), N'1', N'DHSPKT', N'asdasd', CAST(0x0000A00100B0D566 AS DateTime), 3, N'', N'', -1, N'', N'áadsd
ád
ád


ád
ád
ád', 1, N'sadman289', 0)
INSERT [dbo].[User] ([ID], [fname], [lname], [email], [pass], [bday], [state], [CU], [class], [createdate], [roleID], [yahoo], [mobile], [ShopID], [Web], [Wishlist], [isActive], [UserName], [isBanned]) VALUES (7, N'aaaaa', N'Nguyễn', N'1232123@asedaqwe.111', N'6CA07B8B938ECB352BE9743105E72CC64ACDDE57', CAST(0x00009FCC00000000 AS DateTime), N'3', N'asdasdsad', N'asdasd', CAST(0x0000A004004C93DD AS DateTime), 3, N'', N'', 0, N'', N'', 1, N'ádasd', 0)
INSERT [dbo].[User] ([ID], [fname], [lname], [email], [pass], [bday], [state], [CU], [class], [createdate], [roleID], [yahoo], [mobile], [ShopID], [Web], [Wishlist], [isActive], [UserName], [isBanned]) VALUES (8, N'aaaaaaaaa', N'aaaaaaaa', N'aaaaaaa@asa.aaa', N'6CA07B8B938ECB352BE9743105E72CC64ACDDE57', CAST(0x00009FDB00008CA0 AS DateTime), N'6', N'áda', N'ádasd', CAST(0x0000A00600AAB8D4 AS DateTime), 3, N'', N'', -1, N'', N'', 1, N'as', 0)
INSERT [dbo].[User] ([ID], [fname], [lname], [email], [pass], [bday], [state], [CU], [class], [createdate], [roleID], [yahoo], [mobile], [ShopID], [Web], [Wishlist], [isActive], [UserName], [isBanned]) VALUES (9, N'aaaaaaaaa', N'aaaaaaaa', N'aaa1aaa@asa.aaa', N'6CA07B8B938ECB352BE9743105E72CC64ACDDE57', CAST(0x00009FDB00008CA0 AS DateTime), N'6', N'áda', N'ádasd', CAST(0x0000A00600ABF50A AS DateTime), 3, N'', N'', -1, N'', N'', 1, N'as1', 0)
INSERT [dbo].[User] ([ID], [fname], [lname], [email], [pass], [bday], [state], [CU], [class], [createdate], [roleID], [yahoo], [mobile], [ShopID], [Web], [Wishlist], [isActive], [UserName], [isBanned]) VALUES (10, N'aaaaaaaaa', N'aaaaaaaa', N'aaaa1aaa@asa.aaa', N'6CA07B8B938ECB352BE9743105E72CC64ACDDE57', CAST(0x00009FDB00008CA0 AS DateTime), N'6', N'áda', N'ádasd', CAST(0x0000A00600AC7EC1 AS DateTime), 3, N'', N'', -1, N'', N'', 1, N'as1a', 0)
INSERT [dbo].[User] ([ID], [fname], [lname], [email], [pass], [bday], [state], [CU], [class], [createdate], [roleID], [yahoo], [mobile], [ShopID], [Web], [Wishlist], [isActive], [UserName], [isBanned]) VALUES (11, N'aaaaaaaaa', N'aaaaaaaa', N'aaaaa1aaa@asa.aaa', N'6CA07B8B938ECB352BE9743105E72CC64ACDDE57', CAST(0x00009FDB00008CA0 AS DateTime), N'6', N'áda', N'ádasd', CAST(0x0000A00600B0538A AS DateTime), 3, N'', N'', -1, N'', N'', 1, N'as1aa', 0)
SET IDENTITY_INSERT [dbo].[User] OFF
/****** Object:  StoredProcedure [dbo].[GetStates]    Script Date: 03/05/2012 06:44:48 ******/
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
	WHERE [dbo].[State].[Order] <> -99
	ORDER BY [Order]
    
END
GO
/****** Object:  StoredProcedure [dbo].[GetShopInfor]    Script Date: 03/05/2012 06:44:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		NVN
-- Create date: 13 Feb 2012
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetShopInfor]
@ID		INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT *
  FROM [dbo].[Shop]
  WHERE [ID]=@ID
END
GO
/****** Object:  StoredProcedure [dbo].[GetGeneralOption]    Script Date: 03/05/2012 06:44:48 ******/
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
/****** Object:  StoredProcedure [dbo].[GetCategories]    Script Date: 03/05/2012 06:44:48 ******/
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
/****** Object:  StoredProcedure [dbo].[DisableState]    Script Date: 03/05/2012 06:44:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		BTN
-- Create date: 13 Feb 2012
-- Description:	NO
-- =============================================
CREATE PROCEDURE [dbo].[DisableState]
	@ID		INT
AS
BEGIN
	
	SET NOCOUNT ON;

    UPDATE [FullMart].[dbo].[State]
	SET [Order] = -99
	WHERE [ID] = @ID
END
GO
/****** Object:  StoredProcedure [dbo].[DisableCategoryItem]    Script Date: 03/05/2012 06:44:48 ******/
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
/****** Object:  StoredProcedure [dbo].[CreateState]    Script Date: 03/05/2012 06:44:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		NVN
-- Create date: 13 Feb 2012
-- Description:	NO
-- =============================================
CREATE PROCEDURE [dbo].[CreateState]
	@Name		NVARCHAR(200),
	@Order		INT
AS
BEGIN
	
	SET NOCOUNT ON;

    INSERT INTO [FullMart].[dbo].[State]
           ([StateName]
           ,[Order])
    VALUES
           (@Name
           ,@Order)
     IF(@@IDENTITY IS NULL)
		RETURN 0
	 ELSE
		RETURN @@IDENTITY
END
GO
/****** Object:  Table [dbo].[aspnet_Users]    Script Date: 03/05/2012 06:44:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[aspnet_Users](
	[ApplicationId] [uniqueidentifier] NOT NULL,
	[UserId] [uniqueidentifier] NOT NULL,
	[UserName] [nvarchar](256) NOT NULL,
	[LoweredUserName] [nvarchar](256) NOT NULL,
	[MobileAlias] [nvarchar](16) NULL,
	[IsAnonymous] [bit] NOT NULL,
	[LastActivityDate] [datetime] NOT NULL,
PRIMARY KEY NONCLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE UNIQUE CLUSTERED INDEX [aspnet_Users_Index] ON [dbo].[aspnet_Users] 
(
	[ApplicationId] ASC,
	[LoweredUserName] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [aspnet_Users_Index2] ON [dbo].[aspnet_Users] 
(
	[ApplicationId] ASC,
	[LastActivityDate] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'80a29eba-007e-4e72-9b81-35b3487ad17e', N'4d6a6e13-a262-46b3-b67a-c65ddcecbaea', N'1232123@asedaqwe.111', N'1232123@asedaqwe.111', NULL, 0, CAST(0x0000A004004C9592 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'80a29eba-007e-4e72-9b81-35b3487ad17e', N'7b0f44ad-4770-4054-8024-0241293a5f22', N'aaa1aaa@asa.aaa', N'aaa1aaa@asa.aaa', NULL, 0, CAST(0x0000A00600ABF529 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'80a29eba-007e-4e72-9b81-35b3487ad17e', N'653dfd85-a6ce-4683-8f23-283b3cca358d', N'aaaa1aaa@asa.aaa', N'aaaa1aaa@asa.aaa', NULL, 0, CAST(0x0000A00600AC81E9 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'80a29eba-007e-4e72-9b81-35b3487ad17e', N'5727f2a9-1925-4ebd-a578-b1914d9681f2', N'aaaaa1aaa@asa.aaa', N'aaaaa1aaa@asa.aaa', NULL, 0, CAST(0x0000A00600B05770 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'80a29eba-007e-4e72-9b81-35b3487ad17e', N'608b44e5-e91c-408c-884c-84b4b6e45480', N'aaaaaaa@asa.aaa', N'aaaaaaa@asa.aaa', NULL, 0, CAST(0x0000A00600AABA1F AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'80a29eba-007e-4e72-9b81-35b3487ad17e', N'0c2c6c71-ae4a-4643-bfe6-28e005148c96', N'ádasd', N'ádasd', NULL, 0, CAST(0x0000A004004C93FF AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'80a29eba-007e-4e72-9b81-35b3487ad17e', N'450d6cc6-2973-4783-ae9a-7280c20e6350', N'as', N'as', NULL, 0, CAST(0x0000A00600AAB900 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'80a29eba-007e-4e72-9b81-35b3487ad17e', N'094aa000-83d5-4d50-a44a-419adbcf1746', N'as1', N'as1', NULL, 0, CAST(0x0000A00600ABF527 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'80a29eba-007e-4e72-9b81-35b3487ad17e', N'f25f12b1-beb4-4590-9414-763a575cb727', N'as1a', N'as1a', NULL, 0, CAST(0x0000A00600AC812A AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'80a29eba-007e-4e72-9b81-35b3487ad17e', N'df327b2d-8635-4a10-a588-659c41d5451c', N'as1aa', N'as1aa', NULL, 0, CAST(0x0000A00600B056F6 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'80a29eba-007e-4e72-9b81-35b3487ad17e', N'6c1db1bc-65cf-43e9-8ee3-379db618ed29', N'sadman289', N'sadman289', NULL, 0, CAST(0x0000A00100B0D8A2 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'80a29eba-007e-4e72-9b81-35b3487ad17e', N'c64e6889-c553-4f50-8190-e7952a833989', N'sadman2894@gmail.com', N'sadman2894@gmail.com', NULL, 0, CAST(0x0000A00100B0D9B1 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'80a29eba-007e-4e72-9b81-35b3487ad17e', N'd54d8c00-b7b1-4753-b25f-08300ce8c80b', N'vunam', N'vunam', NULL, 0, CAST(0x00009FFC00823713 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'80a29eba-007e-4e72-9b81-35b3487ad17e', N'0e6c68d7-d1ad-4805-9842-75f180f6e1d1', N'vunam1', N'vunam1', NULL, 0, CAST(0x00009FFC0081187B AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'80a29eba-007e-4e72-9b81-35b3487ad17e', N'4f8d3157-2d29-44f5-af46-35800a327cdc', N'vunam2', N'vunam2', NULL, 0, CAST(0x0000A00600FC6FD7 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'80a29eba-007e-4e72-9b81-35b3487ad17e', N'cb3dcbfc-8032-473b-a5a9-4bc22fd72a33', N'vunam3', N'vunam3', NULL, 0, CAST(0x0000A00600FC4A27 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'80a29eba-007e-4e72-9b81-35b3487ad17e', N'27d086c4-9338-4bfd-be78-2574b04b2319', N'vunam4', N'vunam4', NULL, 0, CAST(0x00009FFC00829ABA AS DateTime))
/****** Object:  StoredProcedure [dbo].[aspnet_UnRegisterSchemaVersion]    Script Date: 03/05/2012 06:44:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_UnRegisterSchemaVersion]
    @Feature                   nvarchar(128),
    @CompatibleSchemaVersion   nvarchar(128)
AS
BEGIN
    DELETE FROM dbo.aspnet_SchemaVersions
        WHERE   Feature = LOWER(@Feature) AND @CompatibleSchemaVersion = CompatibleSchemaVersion
END
GO
/****** Object:  StoredProcedure [dbo].[AddCategory]    Script Date: 03/05/2012 06:44:48 ******/
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
/****** Object:  Table [dbo].[aspnet_Roles]    Script Date: 03/05/2012 06:44:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[aspnet_Roles](
	[ApplicationId] [uniqueidentifier] NOT NULL,
	[RoleId] [uniqueidentifier] NOT NULL,
	[RoleName] [nvarchar](256) NOT NULL,
	[LoweredRoleName] [nvarchar](256) NOT NULL,
	[Description] [nvarchar](256) NULL,
PRIMARY KEY NONCLUSTERED 
(
	[RoleId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE UNIQUE CLUSTERED INDEX [aspnet_Roles_index1] ON [dbo].[aspnet_Roles] 
(
	[ApplicationId] ASC,
	[LoweredRoleName] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
INSERT [dbo].[aspnet_Roles] ([ApplicationId], [RoleId], [RoleName], [LoweredRoleName], [Description]) VALUES (N'80a29eba-007e-4e72-9b81-35b3487ad17e', N'47e1e5d2-cbcd-42b7-86f6-cab7c76af31f', N'1', N'1', NULL)
INSERT [dbo].[aspnet_Roles] ([ApplicationId], [RoleId], [RoleName], [LoweredRoleName], [Description]) VALUES (N'80a29eba-007e-4e72-9b81-35b3487ad17e', N'fadc2fe4-a639-4a1a-9b03-38121ffc7997', N'2', N'2', NULL)
INSERT [dbo].[aspnet_Roles] ([ApplicationId], [RoleId], [RoleName], [LoweredRoleName], [Description]) VALUES (N'80a29eba-007e-4e72-9b81-35b3487ad17e', N'283c2c14-c4fd-42a6-8449-8ccea9062fe6', N'3', N'3', NULL)
/****** Object:  StoredProcedure [dbo].[aspnet_RegisterSchemaVersion]    Script Date: 03/05/2012 06:44:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_RegisterSchemaVersion]
    @Feature                   nvarchar(128),
    @CompatibleSchemaVersion   nvarchar(128),
    @IsCurrentVersion          bit,
    @RemoveIncompatibleSchema  bit
AS
BEGIN
    IF( @RemoveIncompatibleSchema = 1 )
    BEGIN
        DELETE FROM dbo.aspnet_SchemaVersions WHERE Feature = LOWER( @Feature )
    END
    ELSE
    BEGIN
        IF( @IsCurrentVersion = 1 )
        BEGIN
            UPDATE dbo.aspnet_SchemaVersions
            SET IsCurrentVersion = 0
            WHERE Feature = LOWER( @Feature )
        END
    END

    INSERT  dbo.aspnet_SchemaVersions( Feature, CompatibleSchemaVersion, IsCurrentVersion )
    VALUES( LOWER( @Feature ), @CompatibleSchemaVersion, @IsCurrentVersion )
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_CheckSchemaVersion]    Script Date: 03/05/2012 06:44:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_CheckSchemaVersion]
    @Feature                   nvarchar(128),
    @CompatibleSchemaVersion   nvarchar(128)
AS
BEGIN
    IF (EXISTS( SELECT  *
                FROM    dbo.aspnet_SchemaVersions
                WHERE   Feature = LOWER( @Feature ) AND
                        CompatibleSchemaVersion = @CompatibleSchemaVersion ))
        RETURN 0

    RETURN 1
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Applications_CreateApplication]    Script Date: 03/05/2012 06:44:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Applications_CreateApplication]
    @ApplicationName      nvarchar(256),
    @ApplicationId        uniqueidentifier OUTPUT
AS
BEGIN
    SELECT  @ApplicationId = ApplicationId FROM dbo.aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName

    IF(@ApplicationId IS NULL)
    BEGIN
        DECLARE @TranStarted   bit
        SET @TranStarted = 0

        IF( @@TRANCOUNT = 0 )
        BEGIN
	        BEGIN TRANSACTION
	        SET @TranStarted = 1
        END
        ELSE
    	    SET @TranStarted = 0

        SELECT  @ApplicationId = ApplicationId
        FROM dbo.aspnet_Applications WITH (UPDLOCK, HOLDLOCK)
        WHERE LOWER(@ApplicationName) = LoweredApplicationName

        IF(@ApplicationId IS NULL)
        BEGIN
            SELECT  @ApplicationId = NEWID()
            INSERT  dbo.aspnet_Applications (ApplicationId, ApplicationName, LoweredApplicationName)
            VALUES  (@ApplicationId, @ApplicationName, LOWER(@ApplicationName))
        END


        IF( @TranStarted = 1 )
        BEGIN
            IF(@@ERROR = 0)
            BEGIN
	        SET @TranStarted = 0
	        COMMIT TRANSACTION
            END
            ELSE
            BEGIN
                SET @TranStarted = 0
                ROLLBACK TRANSACTION
            END
        END
    END
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_AnyDataInTables]    Script Date: 03/05/2012 06:44:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_AnyDataInTables]
    @TablesToCheck int
AS
BEGIN
    -- Check Membership table if (@TablesToCheck & 1) is set
    IF ((@TablesToCheck & 1) <> 0 AND
        (EXISTS (SELECT name FROM sysobjects WHERE (name = N'vw_aspnet_MembershipUsers') AND (type = 'V'))))
    BEGIN
        IF (EXISTS(SELECT TOP 1 UserId FROM dbo.aspnet_Membership))
        BEGIN
            SELECT N'aspnet_Membership'
            RETURN
        END
    END

    -- Check aspnet_Roles table if (@TablesToCheck & 2) is set
    IF ((@TablesToCheck & 2) <> 0  AND
        (EXISTS (SELECT name FROM sysobjects WHERE (name = N'vw_aspnet_Roles') AND (type = 'V'))) )
    BEGIN
        IF (EXISTS(SELECT TOP 1 RoleId FROM dbo.aspnet_Roles))
        BEGIN
            SELECT N'aspnet_Roles'
            RETURN
        END
    END

    -- Check aspnet_Profile table if (@TablesToCheck & 4) is set
    IF ((@TablesToCheck & 4) <> 0  AND
        (EXISTS (SELECT name FROM sysobjects WHERE (name = N'vw_aspnet_Profiles') AND (type = 'V'))) )
    BEGIN
        IF (EXISTS(SELECT TOP 1 UserId FROM dbo.aspnet_Profile))
        BEGIN
            SELECT N'aspnet_Profile'
            RETURN
        END
    END

    -- Check aspnet_PersonalizationPerUser table if (@TablesToCheck & 8) is set
    IF ((@TablesToCheck & 8) <> 0  AND
        (EXISTS (SELECT name FROM sysobjects WHERE (name = N'vw_aspnet_WebPartState_User') AND (type = 'V'))) )
    BEGIN
        IF (EXISTS(SELECT TOP 1 UserId FROM dbo.aspnet_PersonalizationPerUser))
        BEGIN
            SELECT N'aspnet_PersonalizationPerUser'
            RETURN
        END
    END

    -- Check aspnet_PersonalizationPerUser table if (@TablesToCheck & 16) is set
    IF ((@TablesToCheck & 16) <> 0  AND
        (EXISTS (SELECT name FROM sysobjects WHERE (name = N'aspnet_WebEvent_LogEvent') AND (type = 'P'))) )
    BEGIN
        IF (EXISTS(SELECT TOP 1 * FROM dbo.aspnet_WebEvent_Events))
        BEGIN
            SELECT N'aspnet_WebEvent_Events'
            RETURN
        END
    END

    -- Check aspnet_Users table if (@TablesToCheck & 1,2,4 & 8) are all set
    IF ((@TablesToCheck & 1) <> 0 AND
        (@TablesToCheck & 2) <> 0 AND
        (@TablesToCheck & 4) <> 0 AND
        (@TablesToCheck & 8) <> 0 AND
        (@TablesToCheck & 32) <> 0 AND
        (@TablesToCheck & 128) <> 0 AND
        (@TablesToCheck & 256) <> 0 AND
        (@TablesToCheck & 512) <> 0 AND
        (@TablesToCheck & 1024) <> 0)
    BEGIN
        IF (EXISTS(SELECT TOP 1 UserId FROM dbo.aspnet_Users))
        BEGIN
            SELECT N'aspnet_Users'
            RETURN
        END
        IF (EXISTS(SELECT TOP 1 ApplicationId FROM dbo.aspnet_Applications))
        BEGIN
            SELECT N'aspnet_Applications'
            RETURN
        END
    END
END
GO
/****** Object:  Table [dbo].[AnswerQuestion]    Script Date: 03/05/2012 06:44:48 ******/
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
 CONSTRAINT [PK_AnswerQuestion] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[AnswerQuestion] ON
INSERT [dbo].[AnswerQuestion] ([ID], [PosterID], [CreateDate], [type], [Content]) VALUES (24, 3, CAST(0x00009FFB00815487 AS DateTime), N'', N'DM5C')
INSERT [dbo].[AnswerQuestion] ([ID], [PosterID], [CreateDate], [type], [Content]) VALUES (25, 3, CAST(0x00009FFB0081BED3 AS DateTime), N'', N'P8T8')
INSERT [dbo].[AnswerQuestion] ([ID], [PosterID], [CreateDate], [type], [Content]) VALUES (27, 3, CAST(0x00009FFF007E3D5C AS DateTime), N'', N'sdf sdfvvfa saf')
INSERT [dbo].[AnswerQuestion] ([ID], [PosterID], [CreateDate], [type], [Content]) VALUES (28, 5, CAST(0x0000A00A0075654F AS DateTime), N'', N'asdasd')
INSERT [dbo].[AnswerQuestion] ([ID], [PosterID], [CreateDate], [type], [Content]) VALUES (29, 3, CAST(0x0000A00A00F50EAA AS DateTime), N'', N'asdlaskd;asd')
INSERT [dbo].[AnswerQuestion] ([ID], [PosterID], [CreateDate], [type], [Content]) VALUES (30, 3, CAST(0x0000A00A00F51EF2 AS DateTime), N'', N'500C')
SET IDENTITY_INSERT [dbo].[AnswerQuestion] OFF
/****** Object:  StoredProcedure [dbo].[AddSubCategory]    Script Date: 03/05/2012 06:44:48 ******/
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
/****** Object:  StoredProcedure [dbo].[aspnet_Users_CreateUser]    Script Date: 03/05/2012 06:44:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Users_CreateUser]
    @ApplicationId    uniqueidentifier,
    @UserName         nvarchar(256),
    @IsUserAnonymous  bit,
    @LastActivityDate DATETIME,
    @UserId           uniqueidentifier OUTPUT
AS
BEGIN
    IF( @UserId IS NULL )
        SELECT @UserId = NEWID()
    ELSE
    BEGIN
        IF( EXISTS( SELECT UserId FROM dbo.aspnet_Users
                    WHERE @UserId = UserId ) )
            RETURN -1
    END

    INSERT dbo.aspnet_Users (ApplicationId, UserId, UserName, LoweredUserName, IsAnonymous, LastActivityDate)
    VALUES (@ApplicationId, @UserId, @UserName, LOWER(@UserName), @IsUserAnonymous, @LastActivityDate)

    RETURN 0
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Roles_CreateRole]    Script Date: 03/05/2012 06:44:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Roles_CreateRole]
    @ApplicationName  nvarchar(256),
    @RoleName         nvarchar(256)
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL

    DECLARE @ErrorCode     int
    SET @ErrorCode = 0

    DECLARE @TranStarted   bit
    SET @TranStarted = 0

    IF( @@TRANCOUNT = 0 )
    BEGIN
        BEGIN TRANSACTION
        SET @TranStarted = 1
    END
    ELSE
        SET @TranStarted = 0

    EXEC dbo.aspnet_Applications_CreateApplication @ApplicationName, @ApplicationId OUTPUT

    IF( @@ERROR <> 0 )
    BEGIN
        SET @ErrorCode = -1
        GOTO Cleanup
    END

    IF (EXISTS(SELECT RoleId FROM dbo.aspnet_Roles WHERE LoweredRoleName = LOWER(@RoleName) AND ApplicationId = @ApplicationId))
    BEGIN
        SET @ErrorCode = 1
        GOTO Cleanup
    END

    INSERT INTO dbo.aspnet_Roles
                (ApplicationId, RoleName, LoweredRoleName)
         VALUES (@ApplicationId, @RoleName, LOWER(@RoleName))

    IF( @@ERROR <> 0 )
    BEGIN
        SET @ErrorCode = -1
        GOTO Cleanup
    END

    IF( @TranStarted = 1 )
    BEGIN
        SET @TranStarted = 0
        COMMIT TRANSACTION
    END

    RETURN(0)

Cleanup:

    IF( @TranStarted = 1 )
    BEGIN
        SET @TranStarted = 0
        ROLLBACK TRANSACTION
    END

    RETURN @ErrorCode

END
GO
/****** Object:  Table [dbo].[aspnet_UsersInRoles]    Script Date: 03/05/2012 06:44:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[aspnet_UsersInRoles](
	[UserId] [uniqueidentifier] NOT NULL,
	[RoleId] [uniqueidentifier] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [aspnet_UsersInRoles_index] ON [dbo].[aspnet_UsersInRoles] 
(
	[RoleId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'd54d8c00-b7b1-4753-b25f-08300ce8c80b', N'fadc2fe4-a639-4a1a-9b03-38121ffc7997')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'27d086c4-9338-4bfd-be78-2574b04b2319', N'fadc2fe4-a639-4a1a-9b03-38121ffc7997')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'4f8d3157-2d29-44f5-af46-35800a327cdc', N'fadc2fe4-a639-4a1a-9b03-38121ffc7997')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'cb3dcbfc-8032-473b-a5a9-4bc22fd72a33', N'fadc2fe4-a639-4a1a-9b03-38121ffc7997')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'0e6c68d7-d1ad-4805-9842-75f180f6e1d1', N'fadc2fe4-a639-4a1a-9b03-38121ffc7997')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'7b0f44ad-4770-4054-8024-0241293a5f22', N'283c2c14-c4fd-42a6-8449-8ccea9062fe6')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'27d086c4-9338-4bfd-be78-2574b04b2319', N'283c2c14-c4fd-42a6-8449-8ccea9062fe6')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'653dfd85-a6ce-4683-8f23-283b3cca358d', N'283c2c14-c4fd-42a6-8449-8ccea9062fe6')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'0c2c6c71-ae4a-4643-bfe6-28e005148c96', N'283c2c14-c4fd-42a6-8449-8ccea9062fe6')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'6c1db1bc-65cf-43e9-8ee3-379db618ed29', N'283c2c14-c4fd-42a6-8449-8ccea9062fe6')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'094aa000-83d5-4d50-a44a-419adbcf1746', N'283c2c14-c4fd-42a6-8449-8ccea9062fe6')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'df327b2d-8635-4a10-a588-659c41d5451c', N'283c2c14-c4fd-42a6-8449-8ccea9062fe6')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'450d6cc6-2973-4783-ae9a-7280c20e6350', N'283c2c14-c4fd-42a6-8449-8ccea9062fe6')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'f25f12b1-beb4-4590-9414-763a575cb727', N'283c2c14-c4fd-42a6-8449-8ccea9062fe6')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'608b44e5-e91c-408c-884c-84b4b6e45480', N'283c2c14-c4fd-42a6-8449-8ccea9062fe6')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'5727f2a9-1925-4ebd-a578-b1914d9681f2', N'283c2c14-c4fd-42a6-8449-8ccea9062fe6')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'4d6a6e13-a262-46b3-b67a-c65ddcecbaea', N'283c2c14-c4fd-42a6-8449-8ccea9062fe6')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'c64e6889-c553-4f50-8190-e7952a833989', N'283c2c14-c4fd-42a6-8449-8ccea9062fe6')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'27d086c4-9338-4bfd-be78-2574b04b2319', N'47e1e5d2-cbcd-42b7-86f6-cab7c76af31f')
/****** Object:  StoredProcedure [dbo].[aspnet_Roles_RoleExists]    Script Date: 03/05/2012 06:44:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Roles_RoleExists]
    @ApplicationName  nvarchar(256),
    @RoleName         nvarchar(256)
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
        RETURN(0)
    IF (EXISTS (SELECT RoleName FROM dbo.aspnet_Roles WHERE LOWER(@RoleName) = LoweredRoleName AND ApplicationId = @ApplicationId ))
        RETURN(1)
    ELSE
        RETURN(0)
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Roles_GetAllRoles]    Script Date: 03/05/2012 06:44:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Roles_GetAllRoles] (
    @ApplicationName           nvarchar(256))
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
        RETURN
    SELECT RoleName
    FROM   dbo.aspnet_Roles WHERE ApplicationId = @ApplicationId
    ORDER BY RoleName
END
GO
/****** Object:  StoredProcedure [dbo].[CheckUser2]    Script Date: 03/05/2012 06:44:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[CheckUser2] 
	@username			NVARCHAR(70)
AS
BEGIN
	
	SET NOCOUNT ON;
	
	SELECT * FROM [FullMart].[dbo].[User] WHERE [UserName] = @username
END
GO
/****** Object:  StoredProcedure [dbo].[CheckUser]    Script Date: 03/05/2012 06:44:48 ******/
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
/****** Object:  StoredProcedure [dbo].[CheckLogin]    Script Date: 03/05/2012 06:44:48 ******/
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
	
		SELECT [ID]
      ,[roleID]
      ,[isActive]
      ,[UserName]
      ,[isBanned] FROM [FullMart].[dbo].[User] WHERE ([UserName] = @email) AND ([pass] = @pass)
		
END
GO
/****** Object:  StoredProcedure [dbo].[CreateUser]    Script Date: 03/05/2012 06:44:48 ******/
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
	@username	NVARCHAR(70),
	@fname		NVARCHAR(50),
	@lname		NVARCHAR(50),
	@email		NVARCHAR(50),
	@pass		NVARCHAR(100),
	@bday		datetime,
	@state		NVARCHAR(100),
	@CU			NVARCHAR(100),
	@class		VARCHAR(10),
	@roleID		INT,
	@yahoo		NVARCHAR(50),
	@mobile		NVARCHAR(50),
	@web		NVARCHAR(50),
	@Wishlist	NVARCHAR(MAX)
	
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
           ,[Web]
           ,[Wishlist]
           ,[isActive]
           ,[UserName]
           ,[isBanned])
		 VALUES
			   (@fname,@lname,@email,@pass,@bday,@state,@CU,@class,GETUTCDATE(),@roleID,@yahoo,@mobile,@web,@Wishlist,1,@username,0)
		RETURN 1
	END
END
GO
/****** Object:  StoredProcedure [dbo].[CreateSubState]    Script Date: 03/05/2012 06:44:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		BTN
-- Create date: 13 Feb 2012
-- Description:	NO
-- =============================================
CREATE PROCEDURE [dbo].[CreateSubState]
	@ID				INT,
	@Name	NVARCHAR(100),
	@Order		INT
AS
BEGIN
	
	SET NOCOUNT ON;
	IF NOT EXISTS(SELECT * FROM [FullMart].[dbo].[State] WHERE ID=@ID)
		RETURN 0
	ELSE
    INSERT INTO [FullMart].[dbo].[Zone]
           ([State]
           ,[Name]
           ,[Order])
    VALUES
           (@ID
           ,@Name
           ,@Order)
     IF(@@IDENTITY IS NULL)
		RETURN 0
	 ELSE
		RETURN @@IDENTITY
END
GO
/****** Object:  StoredProcedure [dbo].[CreateShop]    Script Date: 03/05/2012 06:44:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		NVN
-- Create date: 29/02 2012
-- Description:	NO
-- =============================================
CREATE PROCEDURE [dbo].[CreateShop] 
	@username	NVARCHAR(70),
	@Shopname	NVARCHAR(500),
	@Adress		NVARCHAR(550),
	@phone		nvarchar(15),
	@chat		nvarchar(100)
	
AS
BEGIN
	
	SET NOCOUNT ON;
	
	IF EXISTS(SELECT * FROM [FullMart].[dbo].[Shop] WHERE [ShopName] = @Shopname)
		RETURN 0
	ELSE
	BEGIN	
		INSERT INTO [FullMart].[dbo].[Shop]
           ([ShopName]
           ,[Adress]
           ,[Phone]
           ,[Chat]
           ,[rate]
           ,[isActive]
           ,[isChecked]
           ,[CreateDate])
     VALUES
           (@Shopname,@Adress,@phone,@chat,1,1,0,GETUTCDATE())
     IF(@@IDENTITY IS NULL)
		RETURN 0
	 ELSE
		BEGIN
			 UPDATE [dbo].[User]
			SET ShopID=@@IDENTITY,
				roleID=2
			WHERE (UserName=@username)
		END
		RETURN 1
	END
END
GO
/****** Object:  StoredProcedure [dbo].[DeleteUser]    Script Date: 03/05/2012 06:44:48 ******/
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
/****** Object:  StoredProcedure [dbo].[GetAllUserByRole]    Script Date: 03/05/2012 06:44:48 ******/
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
		
	SELECT [dbo].[User].[ID] AS [ID]
      ,[fname]
      ,[lname]
      ,[email]
      ,[pass]
      ,(CONVERT(NVARCHAR(2),DATEPART(DAY,[bday]))+'/'+CONVERT(NVARCHAR(2),DATEPART(MONTH,[bday]))+'/'+CONVERT(NVARCHAR(4),DATEPART(YEAR,[bday]))) AS [bday] 
      ,[state]
      ,[CU]
      ,[class]
      ,(CONVERT(NVARCHAR(2),DATEPART(DAY,[dbo].[User].[createdate]))+'/'+CONVERT(NVARCHAR(2),DATEPART(MONTH,[dbo].[User].[createdate]))+'/'+CONVERT(NVARCHAR(4),DATEPART(YEAR,[dbo].[User].[createdate]))) AS [createdate] 
      ,[roleID]
      ,[yahoo]
      ,[mobile]
      ,[User].[ShopID]
      ,[dbo].[Shop].[ShopName]
      ,[Web]
      ,[Wishlist]
      ,[dbo].[User].[isActive]
      ,[User].[UserName]
      ,[User].[isBanned]
  FROM [FullMart].[dbo].[Shop] RIGHT JOIN [FullMart].[dbo].[User] 
								ON [FullMart].[dbo].[Shop].[ID] = [FullMart].[dbo].[User].[ShopID]
  Where ([FullMart].[dbo].[User].[roleID]=@roleID)
		AND ([FullMart].[dbo].[User].[isActive]<>0)
		AND ([dbo].[User].[isBanned]=0)
  ORDER BY [createdate] DESC
END
GO
/****** Object:  StoredProcedure [dbo].[GetAllUserByBanned]    Script Date: 03/05/2012 06:44:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		NVN
-- Create date: 12 Feb 2012
-- Description:	NO
-- =============================================
CREATE PROCEDURE [dbo].[GetAllUserByBanned]
AS
BEGIN
	SET NOCOUNT ON;
		
	SELECT [dbo].[User].[ID] AS [ID]
      ,[fname]
      ,[lname]
      ,[email]
      ,[pass]
      ,(CONVERT(NVARCHAR(2),DATEPART(DAY,[bday]))+'/'+CONVERT(NVARCHAR(2),DATEPART(MONTH,[bday]))+'/'+CONVERT(NVARCHAR(4),DATEPART(YEAR,[bday]))) AS [bday] 
      ,[state]
      ,[CU]
      ,[class]
      ,(CONVERT(NVARCHAR(2),DATEPART(DAY,[dbo].[User].[createdate]))+'/'+CONVERT(NVARCHAR(2),DATEPART(MONTH,[dbo].[User].[createdate]))+'/'+CONVERT(NVARCHAR(4),DATEPART(YEAR,[dbo].[User].[createdate]))) AS [createdate] 
      ,[roleID]
      ,[yahoo]
      ,[mobile]
      ,[User].[ShopID]
      ,[dbo].[Shop].[ShopName]
      ,[Web]
      ,[Wishlist]
      ,[dbo].[User].[isActive]
      ,[User].[UserName]
      ,[User].[isBanned]
  FROM [FullMart].[dbo].[Shop] RIGHT JOIN [FullMart].[dbo].[User] 
								ON [FullMart].[dbo].[Shop].[ID] = [FullMart].[dbo].[User].[ShopID]
  Where ([FullMart].[dbo].[User].[isBanned]='1')
		AND ([FullMart].[dbo].[User].[isActive]<>0)
  ORDER BY [createdate] DESC
END
GO
/****** Object:  StoredProcedure [dbo].[GetAllShop]    Script Date: 03/05/2012 06:44:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		NVN
-- Create date: 12 Feb 2012
-- Description:	NO
-- =============================================
CREATE PROCEDURE [dbo].[GetAllShop]
AS
BEGIN
	SET NOCOUNT ON;
		
	SELECT [dbo].[Shop].[ID]
      ,[ShopName]
      ,[Adress]
      ,[Phone]
      ,[Chat]
      ,[rate]
      ,[dbo].[Shop].[isActive]
      ,[isChecked]
      ,[dbo].[Shop].[CreateDate]
      ,[dbo].[User].UserName AS [ShopOwner]
  FROM [FullMart].[dbo].[Shop],[dbo].[User]
  WHERE [Shop].[ID] = [dbo].[User].[ShopID]
  ORDER BY [createdate] DESC
END
GO
/****** Object:  StoredProcedure [dbo].[DisableSubState]    Script Date: 03/05/2012 06:44:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		BTN
-- Create date: 13 Feb 2012
-- Description:	NO
-- =============================================
CREATE PROCEDURE [dbo].[DisableSubState]
	@ID		INT
AS
BEGIN
	
	SET NOCOUNT ON;

    UPDATE [FullMart].[dbo].[Zone]
	SET [Order] = -99
	WHERE [ID] = @ID
END
GO
/****** Object:  StoredProcedure [dbo].[DisableSubCategoryItem]    Script Date: 03/05/2012 06:44:48 ******/
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
/****** Object:  StoredProcedure [dbo].[GetListSubSameCat]    Script Date: 03/05/2012 06:44:49 ******/
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
/****** Object:  StoredProcedure [dbo].[BanUnBanUS]    Script Date: 03/05/2012 06:44:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		NVN
-- Create date: 04 Jan, 2012
-- Description:	NO
-- =============================================
CREATE PROCEDURE [dbo].[BanUnBanUS]
	@ID		int,
	@status	bit
	
AS
BEGIN
	
	SET NOCOUNT ON;
	
	IF NOT EXISTS(SELECT * FROM [FullMart].[dbo].[User] WHERE ID = @ID)
		RETURN 0
	ELSE
	BEGIN	
		UPDATE [FullMart].[dbo].[User]
   SET [isBanned] = @status
		WHERE [dbo].[User].[ID]=@ID
		RETURN 1
	END
END
GO
/****** Object:  StoredProcedure [dbo].[GetNameCatSubCatByIDSub]    Script Date: 03/05/2012 06:44:49 ******/
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
/****** Object:  StoredProcedure [dbo].[UpdateUserInfo]    Script Date: 03/05/2012 06:44:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		BTN
-- Create date: 03 March
-- Description:	NO
-- =============================================
CREATE PROCEDURE [dbo].[UpdateUserInfo]
	@ID			INT,	
	@fname		NVARCHAR(50),
	@lname		NVARCHAR(50),
	@email		NVARCHAR(50),
	@pass		NVARCHAR(20),
	@bday		datetime,
	@state		NVARCHAR(100),
	@CU			NVARCHAR(100),
	@class		VARCHAR(10),	
	@yahoo		NVARCHAR(50),
	@mobile		NVARCHAR(50),
	@web		NVARCHAR(50),
	@Wishlist	NVARCHAR(MAX)
AS
BEGIN
	
	SET NOCOUNT ON;

	IF (EXISTS(SELECT * FROM [FullMart].[dbo].[User] WHERE [email] = @email AND [ID] <> @ID))
		RETURN 0
	ELSE
	BEGIN
		UPDATE [FullMart].[dbo].[User]
		SET [fname] = @fname
		  ,[lname] = @lname
		  ,[email] = @email
		  ,[pass] = @pass
		  ,[bday] = @bday
		  ,[state] = @state
		  ,[CU] = @CU	
		  ,[class] = @class
		  ,[yahoo] = @yahoo
		  ,[mobile] = @mobile
		  ,[Web] = @web
		  ,[Wishlist] = @Wishlist      
		WHERE [ID] = @ID
		RETURN 1
	END
END
GO
/****** Object:  StoredProcedure [dbo].[UpdateUser]    Script Date: 03/05/2012 06:44:49 ******/
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
	@ShopName	INT,
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
      ,[ShopID] = @ShopName
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
/****** Object:  StoredProcedure [dbo].[UpdateSubState]    Script Date: 03/05/2012 06:44:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		NVN
-- Create date: 14 Feb 2012
-- Description:	NO
-- =============================================
CREATE PROCEDURE [dbo].[UpdateSubState] 
	@ID		int,
	@Name		NVARCHAR(100),
	@Order		INT
	
AS
BEGIN
	
	SET NOCOUNT ON;
	
	IF NOT EXISTS(SELECT * FROM [FullMart].[dbo].[Zone] WHERE [ID] = @ID)
		RETURN 0
	ELSE
	BEGIN	
		UPDATE [FullMart].[dbo].[Zone]
	SET [Name] = @Name
      ,[Order] = @Order
	WHERE [ID] = @ID
		RETURN 1
	END
END
GO
/****** Object:  StoredProcedure [dbo].[UpdateSubCategory]    Script Date: 03/05/2012 06:44:49 ******/
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
/****** Object:  View [dbo].[vw_aspnet_Users]    Script Date: 03/05/2012 06:44:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE VIEW [dbo].[vw_aspnet_Users]
  AS SELECT [dbo].[aspnet_Users].[ApplicationId], [dbo].[aspnet_Users].[UserId], [dbo].[aspnet_Users].[UserName], [dbo].[aspnet_Users].[LoweredUserName], [dbo].[aspnet_Users].[MobileAlias], [dbo].[aspnet_Users].[IsAnonymous], [dbo].[aspnet_Users].[LastActivityDate]
  FROM [dbo].[aspnet_Users]
GO
/****** Object:  View [dbo].[vw_aspnet_Roles]    Script Date: 03/05/2012 06:44:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE VIEW [dbo].[vw_aspnet_Roles]
  AS SELECT [dbo].[aspnet_Roles].[ApplicationId], [dbo].[aspnet_Roles].[RoleId], [dbo].[aspnet_Roles].[RoleName], [dbo].[aspnet_Roles].[LoweredRoleName], [dbo].[aspnet_Roles].[Description]
  FROM [dbo].[aspnet_Roles]
GO
/****** Object:  StoredProcedure [dbo].[UpdateShopbyUser]    Script Date: 03/05/2012 06:44:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		NVN
-- Create date: 04 Jan, 2012
-- Description:	NO
-- =============================================
CREATE PROCEDURE [dbo].[UpdateShopbyUser] 
	@username	NVARCHAR(70),
	@Shopname	NVARCHAR(500),
	@Adress		NVARCHAR(550),
	@phone		nvarchar(15),
	@chat		nvarchar(100)
	
AS
BEGIN
	
	SET NOCOUNT ON;
	
	IF NOT EXISTS(SELECT * FROM [FullMart].[dbo].[Shop], [dbo].[User] WHERE [ShopName] = @Shopname AND UserName = @username AND [User].ShopID=[Shop].[ID])
		RETURN 0
	ELSE
	BEGIN	
		UPDATE [FullMart].[dbo].[Shop]
				SET [Adress] = @Adress
				  ,[Phone] = @phone
				  ,[Chat] = @chat
				WHERE [ShopName] = @Shopname
		RETURN 1
	END
END
GO
/****** Object:  Table [dbo].[Product]    Script Date: 03/05/2012 06:44:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[SubCategoryID] [int] NOT NULL,
	[Price] [nvarchar](20) NOT NULL,
	[Picture] [nvarchar](70) NULL,
	[Thumbnail] [nvarchar](70) NULL,
	[CreatedDate] [datetime] NOT NULL,
	[PosterID] [int] NOT NULL,
	[Outstanding] [bit] NOT NULL,
	[Title] [nvarchar](250) NOT NULL,
	[State] [int] NULL,
	[type] [int] NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Product] ON
INSERT [dbo].[Product] ([ID], [SubCategoryID], [Price], [Picture], [Thumbnail], [CreatedDate], [PosterID], [Outstanding], [Title], [State], [type]) VALUES (2, 2, N'100000', N'150212064810.jpg', N'150212064810_thumb.jpg', CAST(0x00009FD400000000 AS DateTime), 1, 1, N'nokia N9', 1, 1)
INSERT [dbo].[Product] ([ID], [SubCategoryID], [Price], [Picture], [Thumbnail], [CreatedDate], [PosterID], [Outstanding], [Title], [State], [type]) VALUES (5, 5, N'500000', N'', N'', CAST(0x00009F9800000000 AS DateTime), 2, 1, N'1010192', 1, 2)
INSERT [dbo].[Product] ([ID], [SubCategoryID], [Price], [Picture], [Thumbnail], [CreatedDate], [PosterID], [Outstanding], [Title], [State], [type]) VALUES (7, 7, N'2000000', N'product4.jpg', N'product4.jpg', CAST(0x00009FC100000000 AS DateTime), 3, 1, N'1010192', 3, 1)
INSERT [dbo].[Product] ([ID], [SubCategoryID], [Price], [Picture], [Thumbnail], [CreatedDate], [PosterID], [Outstanding], [Title], [State], [type]) VALUES (8, 8, N'200000', N'product4.jpg', N'product4.jpg', CAST(0x00009FA300000000 AS DateTime), 3, 1, N'1010192', 4, 1)
INSERT [dbo].[Product] ([ID], [SubCategoryID], [Price], [Picture], [Thumbnail], [CreatedDate], [PosterID], [Outstanding], [Title], [State], [type]) VALUES (9, 9, N'1000000', N'/media/upload/product5.jpg', N'/media/upload/product5_thumb.jpg', CAST(0x00009FCC00000000 AS DateTime), 2, 1, N'1010192', 1, 1)
INSERT [dbo].[Product] ([ID], [SubCategoryID], [Price], [Picture], [Thumbnail], [CreatedDate], [PosterID], [Outstanding], [Title], [State], [type]) VALUES (10, 10, N'10000000', N'150212081752.jpg', N'150212081752_thumb.jpg', CAST(0x00009FF800DB248F AS DateTime), 1, 1, N'nokia N9', 1, 1)
INSERT [dbo].[Product] ([ID], [SubCategoryID], [Price], [Picture], [Thumbnail], [CreatedDate], [PosterID], [Outstanding], [Title], [State], [type]) VALUES (11, 17, N'10000000', N'150212081813.jpg', N'150212081813_thumb.jpg', CAST(0x00009FF800DB3CCC AS DateTime), 1, 1, N'nokia N9', 1, 1)
INSERT [dbo].[Product] ([ID], [SubCategoryID], [Price], [Picture], [Thumbnail], [CreatedDate], [PosterID], [Outstanding], [Title], [State], [type]) VALUES (12, 12, N'10000000', N'150212081830.jpg', N'150212081830_thumb.jpg', CAST(0x00009FF800DB50E7 AS DateTime), 1, 0, N'nokia N9', 1, 2)
INSERT [dbo].[Product] ([ID], [SubCategoryID], [Price], [Picture], [Thumbnail], [CreatedDate], [PosterID], [Outstanding], [Title], [State], [type]) VALUES (13, 17, N'4000000', N'220212110843.jpg', N'220212110843_thumb.jpg', CAST(0x00009FFF004450B8 AS DateTime), 1, 0, N'aaaaaaaaaa', 6, 3)
INSERT [dbo].[Product] ([ID], [SubCategoryID], [Price], [Picture], [Thumbnail], [CreatedDate], [PosterID], [Outstanding], [Title], [State], [type]) VALUES (14, 12, N'333333', N'220212015451.jpg', N'220212015451_thumb.jpg', CAST(0x00009FFF0071F1EF AS DateTime), 1, 0, N'dfgdgdfgd', 4, 3)
INSERT [dbo].[Product] ([ID], [SubCategoryID], [Price], [Picture], [Thumbnail], [CreatedDate], [PosterID], [Outstanding], [Title], [State], [type]) VALUES (15, 14, N'3322222', N'220212015514.jpg', N'220212015514_thumb.jpg', CAST(0x00009FFF00720C59 AS DateTime), 1, 0, N'kljask jdlkja xfglsdl asd', 4, 3)
INSERT [dbo].[Product] ([ID], [SubCategoryID], [Price], [Picture], [Thumbnail], [CreatedDate], [PosterID], [Outstanding], [Title], [State], [type]) VALUES (16, 14, N'3322222', N'220212015545.jpg', N'220212015545_thumb.jpg', CAST(0x00009FFF0072309B AS DateTime), 1, 0, N'dxgxdg', 4, 1)
INSERT [dbo].[Product] ([ID], [SubCategoryID], [Price], [Picture], [Thumbnail], [CreatedDate], [PosterID], [Outstanding], [Title], [State], [type]) VALUES (17, 13, N'3322222', N'220212015559.jpg', N'220212015559_thumb.jpg', CAST(0x00009FFF0072421B AS DateTime), 1, 0, N'dgdxgd', 4, 1)
INSERT [dbo].[Product] ([ID], [SubCategoryID], [Price], [Picture], [Thumbnail], [CreatedDate], [PosterID], [Outstanding], [Title], [State], [type]) VALUES (18, 12, N'3322222', N'220212015653.jpg', N'220212015653_thumb.jpg', CAST(0x00009FFF0072802D AS DateTime), 1, 0, N'gdgdgdfg', 4, 1)
INSERT [dbo].[Product] ([ID], [SubCategoryID], [Price], [Picture], [Thumbnail], [CreatedDate], [PosterID], [Outstanding], [Title], [State], [type]) VALUES (19, 6, N'2000000', N'220212021549.jpg', N'220212021549_thumb.jpg', CAST(0x00009FFF0077B38A AS DateTime), 1, 0, N'sdfs sdfsdf dfs dfs df', 5, 1)
INSERT [dbo].[Product] ([ID], [SubCategoryID], [Price], [Picture], [Thumbnail], [CreatedDate], [PosterID], [Outstanding], [Title], [State], [type]) VALUES (20, 2, N'2000000', N'220212021611.jpg', N'220212021611_thumb.jpg', CAST(0x00009FFF0077CD4D AS DateTime), 1, 0, N'sdfs sdfsdf dfs dfs df', 5, 1)
INSERT [dbo].[Product] ([ID], [SubCategoryID], [Price], [Picture], [Thumbnail], [CreatedDate], [PosterID], [Outstanding], [Title], [State], [type]) VALUES (21, 16, N'2000000', N'220212021634.jpg', N'220212021634_thumb.jpg', CAST(0x00009FFF0077E88C AS DateTime), 1, 0, N'sdfs sdfsdf dfs dfs df', 6, 1)
INSERT [dbo].[Product] ([ID], [SubCategoryID], [Price], [Picture], [Thumbnail], [CreatedDate], [PosterID], [Outstanding], [Title], [State], [type]) VALUES (22, 8, N'2000000', N'220212021742.jpg', N'220212021742_thumb.jpg', CAST(0x00009FFF0078383A AS DateTime), 1, 0, N'sdfs sdfsdf dfs dfs df', 7, 1)
INSERT [dbo].[Product] ([ID], [SubCategoryID], [Price], [Picture], [Thumbnail], [CreatedDate], [PosterID], [Outstanding], [Title], [State], [type]) VALUES (23, 1, N'2000000', N'220212022442.jpg', N'220212022442_thumb.jpg', CAST(0x00009FFF007A2408 AS DateTime), 1, 0, N'sdfs sdfsdf dfs dfs df', 7, 1)
INSERT [dbo].[Product] ([ID], [SubCategoryID], [Price], [Picture], [Thumbnail], [CreatedDate], [PosterID], [Outstanding], [Title], [State], [type]) VALUES (24, 8, N'2000000', N'220212022456.jpg', N'220212022456_thumb.jpg', CAST(0x00009FFF007A34D5 AS DateTime), 1, 0, N'sdfs sdfsdf dfs dfs df', 3, 1)
INSERT [dbo].[Product] ([ID], [SubCategoryID], [Price], [Picture], [Thumbnail], [CreatedDate], [PosterID], [Outstanding], [Title], [State], [type]) VALUES (25, 10, N'2000000', N'220212023558.jpg', N'220212023558_thumb.jpg', CAST(0x00009FFF007D3C87 AS DateTime), 1, 0, N'sdfs sdfsdf dfs dfs df', 3, 2)
INSERT [dbo].[Product] ([ID], [SubCategoryID], [Price], [Picture], [Thumbnail], [CreatedDate], [PosterID], [Outstanding], [Title], [State], [type]) VALUES (26, 7, N'2000000', N'220212023619.jpg', N'220212023619_thumb.jpg', CAST(0x00009FFF007D5545 AS DateTime), 1, 0, N'sdfs sdfsdf dfs dfs df', 3, 2)
SET IDENTITY_INSERT [dbo].[Product] OFF
/****** Object:  StoredProcedure [dbo].[GetZoneByStateID]    Script Date: 03/05/2012 06:44:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		BTN
-- Create date: 22 Feb 2012
-- Description:	NO
-- =============================================
CREATE PROCEDURE [dbo].[GetZoneByStateID]
	@StateID		INT
AS
BEGIN

	SET NOCOUNT ON;

	SELECT [ID]
		   ,[Name]
		   ,[Order]
	FROM [FullMart].[dbo].[Zone]
	WHERE [state] = @StateID AND [Order] <>-99
	ORDER BY [Order]
END
GO
/****** Object:  StoredProcedure [dbo].[GetUShopByShopID]    Script Date: 03/05/2012 06:44:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetUShopByShopID]
	@ID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * from [dbo].[User] WHERE [dbo].[User].[ShopID] = @ID
END
GO
/****** Object:  StoredProcedure [dbo].[GetUserRole]    Script Date: 03/05/2012 06:44:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		NVN
-- Create date: 12 Feb 2012
-- Description:	NO
-- =============================================
CREATE PROCEDURE [dbo].[GetUserRole]
	@email		nvarchar(400)
AS
BEGIN
	
	SET NOCOUNT ON;
		
	SELECT [ID]
      ,[fname]
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
      ,[ShopID]
      ,[Web]
      ,[Wishlist]
      ,[isActive]
      ,[UserName]
      ,[isBanned]
  FROM [FullMart].[dbo].[User]
  Where ([FullMart].[dbo].[User].[email] = @email) OR ([FullMart].[dbo].[User].[UserName]=@email)
END
GO
/****** Object:  StoredProcedure [dbo].[GetUserInforByMail]    Script Date: 03/05/2012 06:44:49 ******/
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
      ,[Web]
      ,[Wishlist]
      ,[isActive]
  FROM [FullMart].[dbo].[User],[FullMart].[dbo].[Role]
  Where ([FullMart].[dbo].[User].[email] = @email)AND ([FullMart].[dbo].[User].[roleID]=[FullMart].[dbo].[Role].[ID])
END
GO
/****** Object:  StoredProcedure [dbo].[GetUserInforbyID]    Script Date: 03/05/2012 06:44:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		NVN
-- Create date: 12 Feb 2012
-- Description:	NO
-- =============================================
CREATE PROCEDURE [dbo].[GetUserInforbyID]
	@ID		INT
AS
BEGIN
	
	  SET NOCOUNT ON;	  
	  SELECT [ID]
      ,[fname]
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
      ,[ShopID]
      ,[Web]
      ,[Wishlist]
      ,[isActive]
      ,[UserName]
      ,[isBanned]
    FROM [FullMart].[dbo].[User]
	WHERE [ID] = @ID
END
GO
/****** Object:  StoredProcedure [dbo].[GetSubState]    Script Date: 03/05/2012 06:44:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		BTN
-- Create date: 15 Jan, 2012
-- Description:	NO
-- =============================================
CREATE PROCEDURE [dbo].[GetSubState]	
	@ID		INT
AS
BEGIN
	
	SET NOCOUNT ON;

	SELECT [ID],[Name],[Order]
	FROM [FullMart].[dbo].[Zone]
	WHERE [State] = @ID AND [Order] <>-99
	ORDER BY [Order]
	
END
GO
/****** Object:  Table [dbo].[News]    Script Date: 03/05/2012 06:44:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[News](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](200) NOT NULL,
	[Content] [ntext] NULL,
	[OutContent] [nvarchar](250) NULL,
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
INSERT [dbo].[News] ([ID], [Title], [Content], [OutContent], [PosterID], [ShortContent], [ImageThumb], [CreatedDate]) VALUES (1, N'tiêu đề bài viết', N'<div class="contentn">
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
', NULL, 2, N'<p>
	 </p>
<p style="margin-top: 0px; margin-right: 0px; margin-bottom: 1em; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; border-top-width: 0px; border-right-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-style: initial; border-color: initial; border-image: initial; font-size: 12px; font-family: Arial, Helvetica, sans-serif; vertical-align: baseline; border-style: initial; border-color: initial; color: rgb(68, 68, 68); background-color: rgb(247, 239, 203); ">
	<span style="margin-top: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; border-top-width: 0px; border-right-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-style: initial; border-color: initial; border-image: initial; font-style: inherit; font-size: small; vertical-align: baseline; border-style: initial; border-color: initial; ">1. R<span style="margin-top: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; border-top-width: 0px; border-right-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-style: initial; border-color: initial; border-image: initial; font-style: inherit; font-size: 13px; vertical-align: baseline; border-style: initial; border-color: initial; ">ượ</span>u Curner Sione: Th<span style="margin-top: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; border-top-width: 0px; border-right-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-style: initial; border-color: initial; border-image: initial; font-style: inherit; font-size: 13px; vertical-align: baseline; border-style: initial; border-color: initial; ">ể</span> tích: 750ml;  Xu<span style="margin-top: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; border-top-width: 0px; border-right-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-style: initial; border-color: initial; border-image: initial; font-style: inherit; font-size: 13px; vertical-align: baseline; border-style: initial; border-color: initial; ">ấ</span>t x<span style="margin-top: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; border-top-width: 0px; border-right-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-style: initial; border-color: initial; border-image: initial; font-style: inherit; font-size: 13px; vertical-align: baseline; border-style: initial; border-color: initial; ">ứ</span>: Chile</span></p>
<p style="margin-top: 0px; margin-right: 0px; margin-bottom: 1em; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; border-top-width: 0px; border-right-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-style: initial; border-color: initial; border-image: initial; font-size: 12px; font-family: Arial, Helvetica, sans-serif; vertical-align: baseline; border-style: initial; border-color: initial; color: rgb(68, 68, 68); background-color: rgb(247, 239, 203); ">
	<span style="margin-top: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; border-top-width: 0px; border-right-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-style: initial; border-color: initial; border-image: initial; font-style: inherit; font-size: small; vertical-align: baseline; border-style: initial; border-color: initial; ">2. Bánh Classe : Trọng lượng: 400g; Xuất xứ: Việt Nam</span></p>
<p style="margin-top: 0px; margin-right: 0px; margin-bottom: 1em; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; border-top-width: 0px; border-right-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-style: initial; border-color: initial; border-image: initial; font-size: 12px; font-family: Arial, Helvetica, sans-serif; vertical-align: baseline; border-style: initial; border-color: initial; color: rgb(68, 68, 68); background-color: rgb(247, 239, 203); ">
	<span style="margin-top: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; border-top-width: 0px; border-right-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-style: initial; border-color: initial; border-image: initial; font-style: inherit; font-size: small; vertical-align: baseline; border-style: initial; border-color: initial; ">3. </span><span style="margin-top: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; border-top-width: 0px; border-right-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-style: initial; border-color: initial; border-image: initial; font-style: inherit; font-size: 11pt; vertical-align: baseline; border-style: initial; border-color: initial; line-height: 17px; ">Hộp Cafe G7 Cappuccino: 1 hộp 12 gói; Xuất xứ: Việt Nam</span></p>
', N'/media/upload/images/1b4c48f5613d86232fbee5ef56be1b662.jpg', CAST(0x00009FF600000000 AS DateTime))
INSERT [dbo].[News] ([ID], [Title], [Content], [OutContent], [PosterID], [ShortContent], [ImageThumb], [CreatedDate]) VALUES (4, N'tieu de bai viet tieu de bai viet tieu de bai viet tieu de bai viet ', N'<div class="contentn">
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
', NULL, 3, N'<p>
	Giỏ quà gồm: 1. Rượu Curner Sione: Thể tích: 750ml; Xuất xứ: Chile 2. Bánh Classe : Trọng lượng: 400g; Xuất xứ: Việt Nam 3. Hộp Cafe G7 Cappuccino: 1 hộp 12 gói; Xuất xứ: Việt Nam 4. Hộp Lipton tea 25 túi; Xuất xứ Việt Nam 5. Gói Oreo Trọng lượng: 137g Xuất xứ: Indonexia 6. Hộp sugas Trọng lượng: 140g Xuất xứ: Việt Nam 7. Hộp Hello panda Trọng lượng: 50g Xuất xứ Singapore 8. Giỏ mây và trang trí</p>
', N'/media/upload/images/1b4c48f5613d86232fbee5ef56be1b662.jpg', CAST(0x00009FD800000000 AS DateTime))
INSERT [dbo].[News] ([ID], [Title], [Content], [OutContent], [PosterID], [ShortContent], [ImageThumb], [CreatedDate]) VALUES (14, N' dung khong co gì moi noi dung khon', N'<p>
	noi dung khong co gì moi noi dung khong co gì moi noi dung khong co g<strong>ì moi noi dung khong co gì moi noi dung </strong>khong co gì moi noi dung khong co gì moi noi dung khong co gì <strong>moi noi dung khong co gì moi noi dung k</strong>hong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi <em>dung khong co gì moi noi dung khong co</em> gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co g<strong>ì moi noi dung khong co gì moi noi dung </strong>khong co gì moi noi dung khong co gì moi noi dung khong co gì <strong>moi noi dung khong co gì moi noi dung k</strong>hong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi <em>dung khong co gì moi noi dung khong co</em> gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co g<strong>ì moi noi dung khong co gì moi noi dung </strong>khong co gì moi noi dung khong co gì moi noi dung khong co gì <strong>moi noi dung khong co gì moi noi dung k</strong>hong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi <em>dung khong co gì moi noi dung khong co</em> gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co g<strong>ì moi noi dung khong co gì moi noi dung </strong>khong co gì moi noi dung khong co gì moi noi dung khong co gì <strong>moi noi dung khong co gì moi noi dung k</strong>hong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi <em>dung khong co gì moi noi dung khong co</em> gì moi noi dung khong co gì moinoi dung khong co gì moi noi dung khong co gì moi noi dung khong co g<strong>ì moi noi dung khong co gì moi noi dung </strong>khong co gì moi noi dung khong co gì moi noi dung khong co gì <strong>moi noi dung khong co gì moi noi dung k</strong>hong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi <em>dung khong co gì moi noi dung khong co</em> gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co g<strong>ì moi noi dung khong co gì moi noi dung </strong>khong co gì moi noi dung khong co gì moi noi dung khong co gì <strong>moi noi dung khong co gì moi noi dung k</strong>hong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi <em>dung khong co gì moi noi dung khong co</em> gì moi noi dung khong co gì moinoi dung khong co gì moi noi dung khong co gì moi noi dung khong co g<strong>ì moi noi dung khong co gì moi noi dung </strong>khong co gì moi noi dung khong co gì moi noi dung khong co gì <strong>moi noi dung khong co gì moi noi dung k</strong>hong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi <em>dung khong co gì moi noi dung khong co</em> gì moi noi dung khong co gì moinoi dung khong co gì moi noi dung khong co gì moi noi dung khong co g<strong>ì moi noi dung khong co gì moi noi dung </strong>khong co gì moi noi dung khong co gì moi noi dung khong co gì <strong>moi noi dung khong co gì moi noi dung k</strong>hong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi <em>dung khong co gì moi noi dung khong co</em> gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co g<strong>ì moi noi dung khong co gì moi noi dung </strong>khong co gì moi noi dung khong co gì moi noi dung khong co gì <strong>moi noi dung khong co gì moi noi dung k</strong>hong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi <em>dung khong co gì moi noi dung khong co</em> gì moi noi dung khong co gì moinoi dung khong co gì moi noi dung khong co gì moi noi dung khong co g<strong>ì moi noi dung khong co gì moi noi dung </strong>khong co gì moi noi dung khong co gì moi noi dung khong co gì <strong>moi noi dung khong co gì moi noi dung k</strong>hong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi <em>dung khong co gì moi noi dung khong co</em> gì moi noi dung khong co gì moinoi dung khong co gì moi noi dung khong co gì moi noi dung khong co g<strong>ì moi noi dung khong co gì moi noi dung </strong>khong co gì moi noi dung khong co gì moi noi dung khong co gì <strong>moi noi dung khong co gì moi noi dung k</strong>hong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi <em>dung khong co gì moi noi dung khong co</em> gì moi noi dung khong co gì moinoi dung khong co gì moi noi dung khong co gì moi noi dung khong co g<strong>ì moi noi dung khong co gì moi noi dung </strong>khong co gì moi noi dung khong co gì moi noi dung khong co gì <strong>moi noi dung khong co gì moi noi dung k</strong>hong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi <em>dung khong co gì moi noi dung khong co</em> gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co g<strong>ì moi noi dung khong co gì moi noi dung </strong>khong co gì moi noi dung khong co gì moi noi dung khong co gì <strong>moi noi dung khong co gì moi noi dung k</strong>hong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi <em>dung khong co gì moi noi dung khong co</em> gì moi noi dung khong co gì moinoi dung khong co gì moi noi dung khong co gì moi noi dung khong co g<strong>ì moi noi dung khong co gì moi noi dung </strong>khong co gì moi noi dung khong co gì moi noi dung khong co gì <strong>moi noi dung khong co gì moi noi dung k</strong>hong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi <em>dung khong co gì moi noi dung khong co</em> gì moi noi dung khong co gì moinoi dung khong co gì moi noi dung khong co gì moi noi dung khong co g<strong>ì moi noi dung khong co gì moi noi dung </strong>khong co gì moi noi dung khong co gì moi noi dung khong co gì <strong>moi noi dung khong co gì moi noi dung k</strong>hong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi <em>dung khong co gì moi noi dung khong co</em> gì moi noi dung khong co gì moinoi dung khong co gì moi noi dung khong co gì moi noi dung khong co g<strong>ì moi noi dung khong co gì moi noi dung </strong>khong co gì moi noi dung khong co gì moi noi dung khong co gì <strong>moi noi dung khong co gì moi noi dung k</strong>hong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi <em>dung khong co gì moi noi dung khong co</em> gì moi noi dung khong co gì moinoi dung khong co gì moi noi dung khong co gì moi noi dung khong co g<strong>ì moi noi dung khong co gì moi noi dung </strong>khong co gì moi noi dung khong co gì moi noi dung khong co gì <strong>moi noi dung khong co gì moi noi dung k</strong>hong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi <em>dung khong co gì moi noi dung khong co</em> gì moi noi dung khong co gì moi noi dung khong co gì moi <img alt="" src="/media/upload/images/1b4c48f5613d86232fbee5ef56be1b662.jpg" style="width: 200px; height: 177px; " />noi dung khong co gì moi noi dung khong co g<strong>ì moi noi dung khong co gì moi noi dung </strong>khong co gì moi noi dung khong co gì moi noi dung khong co gì <strong>moi noi dung khong co gì moi noi dung k</strong>hong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi <em>dung khong co gì moi noi dung khong co</em> gì moi noi dung khong co gì moinoi dung khong co gì moi noi dung khong co gì moi noi dung khong co g<strong>ì moi noi dung khong co gì moi noi dung </strong>khong co gì moi noi dung khong co gì moi noi dung khong co gì <strong>moi noi dung khong co gì moi noi dung k</strong>hong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi <em>dung khong co gì moi noi dung khong co</em> gì moi noi dung khong co gì moi </p>
', NULL, 1, N'<p>
	noi dung khong co gì moi noi dung khong co gì moi noi dung khong co g<strong>ì moi noi dung khong co gì moi noi dung </strong>khong co gì moi noi dung khong co gì moi noi dung khong co gì <strong>moi noi dung khong co gì moi noi dung k</strong>hong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi <em>dung khong co gì moi noi dung khong co</em> gì moi noi dung khong co gì moi </p>
', N'/media/upload/images/1b4c48f5613d86232fbee5ef56be1b662.jpg', CAST(0x00009FF700B369CB AS DateTime))
INSERT [dbo].[News] ([ID], [Title], [Content], [OutContent], [PosterID], [ShortContent], [ImageThumb], [CreatedDate]) VALUES (15, N' dung khong co gì moi noi dung khon', N'<p>
	noi dung khong co gì moi noi dung khong co gì moi noi dung khong co g<strong>ì moi noi dung khong co gì moi noi dung </strong>khong co gì moi noi dung khong co gì moi noi dung khong co gì <strong>moi noi dung khong co gì moi noi dung k</strong>hong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi <em>dung khong co gì moi noi dung khong co</em> gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co g<strong>ì moi noi dung khong co gì moi noi dung </strong>khong co gì moi noi dung khong co gì moi noi dung khong co gì <strong>moi noi dung khong co gì moi noi dung k</strong>hong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi <em>dung khong co gì moi noi dung khong co</em> gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co g<strong>ì moi noi dung khong co gì moi noi dung </strong>khong co gì moi noi dung khong co gì moi noi dung khong co gì <strong>moi noi dung khong co gì moi noi dung k</strong>hong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi <em>dung khong co gì moi noi dung khong co</em> gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co g<strong>ì moi noi dung khong co gì moi noi dung </strong>khong co gì moi noi dung khong co gì moi noi dung khong co gì <strong>moi noi dung khong co gì moi noi dung k</strong>hong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi <em>dung khong co gì moi noi dung khong co</em> gì moi noi dung khong co gì moinoi dung khong co gì moi noi dung khong co gì moi noi dung khong co g<strong>ì moi noi dung khong co gì moi noi dung </strong>khong co gì moi noi dung khong co gì moi noi dung khong co gì <strong>moi noi dung khong co gì moi noi dung k</strong>hong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi <em>dung khong co gì moi noi dung khong co</em> gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co g<strong>ì moi noi dung khong co gì moi noi dung </strong>khong co gì moi noi dung khong co gì moi noi dung khong co gì <strong>moi noi dung khong co gì moi noi dung k</strong>hong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi <em>dung khong co gì moi noi dung khong co</em> gì moi noi dung khong co gì moinoi dung khong co gì moi noi dung khong co gì moi noi dung khong co g<strong>ì moi noi dung khong co gì moi noi dung </strong>khong co gì moi noi dung khong co gì moi noi dung khong co gì <strong>moi noi dung khong co gì moi noi dung k</strong>hong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi <em>dung khong co gì moi noi dung khong co</em> gì moi noi dung khong co gì moinoi dung khong co gì moi noi dung khong co gì moi noi dung khong co g<strong>ì moi noi dung khong co gì moi noi dung </strong>khong co gì moi noi dung khong co gì moi noi dung khong co gì <strong>moi noi dung khong co gì moi noi dung k</strong>hong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi <em>dung khong co gì moi noi dung khong co</em> gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co g<strong>ì moi noi dung khong co gì moi noi dung </strong>khong co gì moi noi dung khong co gì moi noi dung khong co gì <strong>moi noi dung khong co gì moi noi dung k</strong>hong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi <em>dung khong co gì moi noi dung khong co</em> gì moi noi dung khong co gì moinoi dung khong co gì moi noi dung khong co gì moi noi dung khong co g<strong>ì moi noi dung khong co gì moi noi dung </strong>khong co gì moi noi dung khong co gì moi noi dung khong co gì <strong>moi noi dung khong co gì moi noi dung k</strong>hong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi <em>dung khong co gì moi noi dung khong co</em> gì moi noi dung khong co gì moinoi dung khong co gì moi noi dung khong co gì moi noi dung khong co g<strong>ì moi noi dung khong co gì moi noi dung </strong>khong co gì moi noi dung khong co gì moi noi dung khong co gì <strong>moi noi dung khong co gì moi noi dung k</strong>hong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi <em>dung khong co gì moi noi dung khong co</em> gì moi noi dung khong co gì moinoi dung khong co gì moi noi dung khong co gì moi noi dung khong co g<strong>ì moi noi dung khong co gì moi noi dung </strong>khong co gì moi noi dung khong co gì moi noi dung khong co gì <strong>moi noi dung khong co gì moi noi dung k</strong>hong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi <em>dung khong co gì moi noi dung khong co</em> gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co g<strong>ì moi noi dung khong co gì moi noi dung </strong>khong co gì moi noi dung khong co gì moi noi dung khong co gì <strong>moi noi dung khong co gì moi noi dung k</strong>hong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi <em>dung khong co gì moi noi dung khong co</em> gì moi noi dung khong co gì moinoi dung khong co gì moi noi dung khong co gì moi noi dung khong co g<strong>ì moi noi dung khong co gì moi noi dung </strong>khong co gì moi noi dung khong co gì moi noi dung khong co gì <strong>moi noi dung khong co gì moi noi dung k</strong>hong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi <em>dung khong co gì moi noi dung khong co</em> gì moi noi dung khong co gì moinoi dung khong co gì moi noi dung khong co gì moi noi dung khong co g<strong>ì moi noi dung khong co gì moi noi dung </strong>khong co gì moi noi dung khong co gì moi noi dung khong co gì <strong>moi noi dung khong co gì moi noi dung k</strong>hong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi <em>dung khong co gì moi noi dung khong co</em> gì moi noi dung khong co gì moinoi dung khong co gì moi noi dung khong co gì moi noi dung khong co g<strong>ì moi noi dung khong co gì moi noi dung </strong>khong co gì moi noi dung khong co gì moi noi dung khong co gì <strong>moi noi dung khong co gì moi noi dung k</strong>hong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi <em>dung khong co gì moi noi dung khong co</em> gì moi noi dung khong co gì moinoi dung khong co gì moi noi dung khong co gì moi noi dung khong co g<strong>ì moi noi dung khong co gì moi noi dung </strong>khong co gì moi noi dung khong co gì moi noi dung khong co gì <strong>moi noi dung khong co gì moi noi dung k</strong>hong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi <em>dung khong co gì moi noi dung khong co</em> gì moi noi dung khong co gì moi noi dung khong co gì moi <img alt="" src="/media/upload/images/1b4c48f5613d86232fbee5ef56be1b662.jpg" style="width: 200px; height: 177px; " />noi dung khong co gì moi noi dung khong co g<strong>ì moi noi dung khong co gì moi noi dung </strong>khong co gì moi noi dung khong co gì moi noi dung khong co gì <strong>moi noi dung khong co gì moi noi dung k</strong>hong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi <em>dung khong co gì moi noi dung khong co</em> gì moi noi dung khong co gì moinoi dung khong co gì moi noi dung khong co gì moi noi dung khong co g<strong>ì moi noi dung khong co gì moi noi dung </strong>khong co gì moi noi dung khong co gì moi noi dung khong co gì <strong>moi noi dung khong co gì moi noi dung k</strong>hong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi <em>dung khong co gì moi noi dung khong co</em> gì moi noi dung khong co gì moi </p>
', NULL, 1, N'<p>
	noi dung khong co gì moi noi dung khong co gì moi noi dung khong co g<strong>ì moi noi dung khong co gì moi noi dung </strong>khong co gì moi noi dung khong co gì moi noi dung khong co gì <strong>moi noi dung khong co gì moi noi dung k</strong>hong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi <em>dung khong co gì moi noi dung khong co</em> gì moi noi dung khong co gì moi </p>
', N'/media/upload/images/1b4c48f5613d86232fbee5ef56be1b662.jpg', CAST(0x00009FF700B3D2E0 AS DateTime))
INSERT [dbo].[News] ([ID], [Title], [Content], [OutContent], [PosterID], [ShortContent], [ImageThumb], [CreatedDate]) VALUES (16, N' dung khong co gì moi noi dung khon', N'<p>
	noi dung khong co gì moi noi dung khong co gì moi noi dung khong co g<strong>ì moi noi dung khong co gì moi noi dung </strong>khong co gì moi noi dung khong co gì moi noi dung khong co gì <strong>moi noi dung khong co gì moi noi dung k</strong>hong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi <em>dung khong co gì moi noi dung khong co</em> gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co g<strong>ì moi noi dung khong co gì moi noi dung </strong>khong co gì moi noi dung khong co gì moi noi dung khong co gì <strong>moi noi dung khong co gì moi noi dung k</strong>hong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi <em>dung khong co gì moi noi dung khong co</em> gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co g<strong>ì moi noi dung khong co gì moi noi dung </strong>khong co gì moi noi dung khong co gì moi noi dung khong co gì <strong>moi noi dung khong co gì moi noi dung k</strong>hong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi <em>dung khong co gì moi noi dung khong co</em> gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co g<strong>ì moi noi dung khong co gì moi noi dung </strong>khong co gì moi noi dung khong co gì moi noi dung khong co gì <strong>moi noi dung khong co gì moi noi dung k</strong>hong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi <em>dung khong co gì moi noi dung khong co</em> gì moi noi dung khong co gì moinoi dung khong co gì moi noi dung khong co gì moi noi dung khong co g<strong>ì moi noi dung khong co gì moi noi dung </strong>khong co gì moi noi dung khong co gì moi noi dung khong co gì <strong>moi noi dung khong co gì moi noi dung k</strong>hong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi <em>dung khong co gì moi noi dung khong co</em> gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co g<strong>ì moi noi dung khong co gì moi noi dung </strong>khong co gì moi noi dung khong co gì moi noi dung khong co gì <strong>moi noi dung khong co gì moi noi dung k</strong>hong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi <em>dung khong co gì moi noi dung khong co</em> gì moi noi dung khong co gì moinoi dung khong co gì moi noi dung khong co gì moi noi dung khong co g<strong>ì moi noi dung khong co gì moi noi dung </strong>khong co gì moi noi dung khong co gì moi noi dung khong co gì <strong>moi noi dung khong co gì moi noi dung k</strong>hong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi <em>dung khong co gì moi noi dung khong co</em> gì moi noi dung khong co gì moinoi dung khong co gì moi noi dung khong co gì moi noi dung khong co g<strong>ì moi noi dung khong co gì moi noi dung </strong>khong co gì moi noi dung khong co gì moi noi dung khong co gì <strong>moi noi dung khong co gì moi noi dung k</strong>hong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi <em>dung khong co gì moi noi dung khong co</em> gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co g<strong>ì moi noi dung khong co gì moi noi dung </strong>khong co gì moi noi dung khong co gì moi noi dung khong co gì <strong>moi noi dung khong co gì moi noi dung k</strong>hong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi <em>dung khong co gì moi noi dung khong co</em> gì moi noi dung khong co gì moinoi dung khong co gì moi noi dung khong co gì moi noi dung khong co g<strong>ì moi noi dung khong co gì moi noi dung </strong>khong co gì moi noi dung khong co gì moi noi dung khong co gì <strong>moi noi dung khong co gì moi noi dung k</strong>hong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi <em>dung khong co gì moi noi dung khong co</em> gì moi noi dung khong co gì moinoi dung khong co gì moi noi dung khong co gì moi noi dung khong co g<strong>ì moi noi dung khong co gì moi noi dung </strong>khong co gì moi noi dung khong co gì moi noi dung khong co gì <strong>moi noi dung khong co gì moi noi dung k</strong>hong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi <em>dung khong co gì moi noi dung khong co</em> gì moi noi dung khong co gì moinoi dung khong co gì moi noi dung khong co gì moi noi dung khong co g<strong>ì moi noi dung khong co gì moi noi dung </strong>khong co gì moi noi dung khong co gì moi noi dung khong co gì <strong>moi noi dung khong co gì moi noi dung k</strong>hong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi <em>dung khong co gì moi noi dung khong co</em> gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co g<strong>ì moi noi dung khong co gì moi noi dung </strong>khong co gì moi noi dung khong co gì moi noi dung khong co gì <strong>moi noi dung khong co gì moi noi dung k</strong>hong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi <em>dung khong co gì moi noi dung khong co</em> gì moi noi dung khong co gì moinoi dung khong co gì moi noi dung khong co gì moi noi dung khong co g<strong>ì moi noi dung khong co gì moi noi dung </strong>khong co gì moi noi dung khong co gì moi noi dung khong co gì <strong>moi noi dung khong co gì moi noi dung k</strong>hong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi <em>dung khong co gì moi noi dung khong co</em> gì moi noi dung khong co gì moinoi dung khong co gì moi noi dung khong co gì moi noi dung khong co g<strong>ì moi noi dung khong co gì moi noi dung </strong>khong co gì moi noi dung khong co gì moi noi dung khong co gì <strong>moi noi dung khong co gì moi noi dung k</strong>hong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi <em>dung khong co gì moi noi dung khong co</em> gì moi noi dung khong co gì moinoi dung khong co gì moi noi dung khong co gì moi noi dung khong co g<strong>ì moi noi dung khong co gì moi noi dung </strong>khong co gì moi noi dung khong co gì moi noi dung khong co gì <strong>moi noi dung khong co gì moi noi dung k</strong>hong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi <em>dung khong co gì moi noi dung khong co</em> gì moi noi dung khong co gì moinoi dung khong co gì moi noi dung khong co gì moi noi dung khong co g<strong>ì moi noi dung khong co gì moi noi dung </strong>khong co gì moi noi dung khong co gì moi noi dung khong co gì <strong>moi noi dung khong co gì moi noi dung k</strong>hong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi <em>dung khong co gì moi noi dung khong co</em> gì moi noi dung khong co gì moi noi dung khong co gì moi <img alt="" src="/media/upload/images/1b4c48f5613d86232fbee5ef56be1b662.jpg" style="width: 200px; height: 177px; " />noi dung khong co gì moi noi dung khong co g<strong>ì moi noi dung khong co gì moi noi dung </strong>khong co gì moi noi dung khong co gì moi noi dung khong co gì <strong>moi noi dung khong co gì moi noi dung k</strong>hong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi <em>dung khong co gì moi noi dung khong co</em> gì moi noi dung khong co gì moinoi dung khong co gì moi noi dung khong co gì moi noi dung khong co g<strong>ì moi noi dung khong co gì moi noi dung </strong>khong co gì moi noi dung khong co gì moi noi dung khong co gì <strong>moi noi dung khong co gì moi noi dung k</strong>hong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi <em>dung khong co gì moi noi dung khong co</em> gì moi noi dung khong co gì moi </p>
', NULL, 1, N'<p>
	noi dung khong co gì moi noi dung khong co gì moi noi dung khong co g<strong>ì moi noi dung khong co gì moi noi dung </strong>khong co gì moi noi dung khong co gì moi noi dung khong co gì <strong>moi noi dung khong co gì moi noi dung k</strong>hong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi dung khong co gì moi noi <em>dung khong co gì moi noi dung khong co</em> gì moi noi dung khong co gì moi </p>
', N'/media/upload/images/1b4c48f5613d86232fbee5ef56be1b662.jpg', CAST(0x00009FF700B44C42 AS DateTime))
SET IDENTITY_INSERT [dbo].[News] OFF
/****** Object:  StoredProcedure [dbo].[GetSubCategories]    Script Date: 03/05/2012 06:44:49 ******/
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
/****** Object:  StoredProcedure [dbo].[SearchAllUserByKey]    Script Date: 03/05/2012 06:44:49 ******/
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
		
	SELECT DISTINCT [dbo].[User].[ID] AS [ID]
      ,[fname]
      ,[lname]
      ,[email]
      ,[pass]
      ,(CONVERT(NVARCHAR(2),DATEPART(DAY,[bday]))+'/'+CONVERT(NVARCHAR(2),DATEPART(MONTH,[bday]))+'/'+CONVERT(NVARCHAR(4),DATEPART(YEAR,[bday]))) AS [bday] 
      ,[state]
      ,[CU]
      ,[class]
      ,(CONVERT(NVARCHAR(2),DATEPART(DAY,[dbo].[User].[createdate]))+'/'+CONVERT(NVARCHAR(2),DATEPART(MONTH,[dbo].[User].[createdate]))+'/'+CONVERT(NVARCHAR(4),DATEPART(YEAR,[dbo].[User].[createdate]))) AS [createdate] 
      ,[FullMart].[dbo].[Role].[Name] AS [roleID]
      ,[yahoo]
      ,[mobile]
      ,[User].[ShopID]
      ,[dbo].[Shop].[ShopName]
      ,[Web]
      ,[Wishlist]
      ,[dbo].[User].[isActive]
      ,[User].[UserName]
      ,[User].[isBanned]
  FROM [FullMart].[dbo].[Shop] RIGHT JOIN [FullMart].[dbo].[User] 
								ON [FullMart].[dbo].[Shop].[ID] = [FullMart].[dbo].[User].[ShopID],[FullMart].[dbo].[Role]
  Where ([FullMart].[dbo].[User].[email] like '%'+@key+'%' OR [FullMart].[dbo].[User].[fname] like '%'+@key+'%' OR [FullMart].[dbo].[User].lname like '%'+@key+'%') AND ([FullMart].[dbo].[User].[roleID]=[FullMart].[dbo].[Role].[ID])
  ORDER BY [createdate] DESC
END
GO
/****** Object:  Table [dbo].[SubAQ]    Script Date: 03/05/2012 06:44:49 ******/
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
INSERT [dbo].[SubAQ] ([ID], [PosterID], [AQID], [Content], [CreateDate]) VALUES (17, 3, 24, N'T2AX', CAST(0x00009FFB008878D2 AS DateTime))
INSERT [dbo].[SubAQ] ([ID], [PosterID], [AQID], [Content], [CreateDate]) VALUES (18, 3, 25, N'61CU', CAST(0x00009FFB00895D86 AS DateTime))
INSERT [dbo].[SubAQ] ([ID], [PosterID], [AQID], [Content], [CreateDate]) VALUES (19, 3, 25, N'8HFU', CAST(0x00009FFB00896A80 AS DateTime))
SET IDENTITY_INSERT [dbo].[SubAQ] OFF
/****** Object:  StoredProcedure [dbo].[SearchAllProductsOfCategory]    Script Date: 03/05/2012 06:44:49 ******/
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
/****** Object:  StoredProcedure [dbo].[SearchAllProducts]    Script Date: 03/05/2012 06:44:49 ******/
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
/****** Object:  StoredProcedure [dbo].[GetNewDetail]    Script Date: 03/05/2012 06:44:49 ******/
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
/****** Object:  Table [dbo].[ProductDetail]    Script Date: 03/05/2012 06:44:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductDetail](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ProductID] [int] NOT NULL,
	[Content] [nvarchar](max) NULL,
	[Image1] [nvarchar](500) NULL,
	[Image2] [nvarchar](500) NULL,
	[Image3] [nvarchar](500) NULL,
 CONSTRAINT [PK_ProductDetail] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[ProductDetail] ON
INSERT [dbo].[ProductDetail] ([ID], [ProductID], [Content], [Image1], [Image2], [Image3]) VALUES (1, 2, N'<p>
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
', NULL, NULL, NULL)
INSERT [dbo].[ProductDetail] ([ID], [ProductID], [Content], [Image1], [Image2], [Image3]) VALUES (2, 5, N'<p>
	chưa có nội dung chi tiếtchưa có nội dung chi tiếtchưa có nội dung chi tiếtchưa có nội dung chi tiếtchưa có nội dung chi tiếtchưa có nội dung chi tiếtchưa có nội dung chi tiếtchưa có nội dung chi tiếtchưa có nội dung chi tiếtchưa có nội dung chi tiếtchưa có nội dung chi tiếtchưa có nội dung chi tiếtchưa có nội dung chi tiếtchưa có nội dung chi tiếtchưa có nội dung chi tiếtchưa có nội dung chi tiếtchưa có nội dung chi tiếtchư<img class="imgthumbN" id="ctl00_formPanel_imgthumbN" src="/media/upload/product2.jpg" style="border-top-width: 0px; border-right-width: 0px; border-bottom-width: 0px; border-left-width: 0px; float: left; width: 185px; height: 185px; " />a có nội dung chi tiếtchưa có nội dung chi tiếtchưa có nội dung chi tiếtchưa có nội dung chi tiếtchưa có nội dung chi tiếtchưa có nội dung chi tiếtchưa có nội dung chi tiếtchưa có nội dung chi tiếtchưa có nội dung chi tiếtchưa có nội dun</p>
<p>
	g chi tiếtchưa có nội dung chi tiếtchưa có nội dung chi tiếtchưa có nội dung chi tiếtchưa có nội dung chi tiếtchưa có nội dung chi tiếtchưa có nội dung chi tiết</p>
<p>
	<img src="/media/upload/product2.jpg" style="border-top-width: 0px; border-right-width: 0px; border-bottom-width: 0px; border-left-width: 0px; float: left; width: 185px; height: 185px; " title="images Thumb preview" /></p>
<p>
	chưa có nội dung chi tiếtchưa có nội dung chi tiếtchưa có nội dung chi tiếtchưa có nội dung chi tiếtchưa có nội dung chi tiếtchưa có nội dung chi tiếtchưa có nội dung chi tiếtchưa có nội dung chi tiếtchưa có nội dung chi tiếtchưa có nội dung chi tiếtchưa có nội dung chi tiếtchưa có nội dung chi tiếtchưa có nội dung chi tiếtchưa có nội dung chi tiếtchưa có nội dung chi tiếtchưa có nội dung chi tiếtchưa có nội dung chi tiết</p>
', NULL, NULL, NULL)
INSERT [dbo].[ProductDetail] ([ID], [ProductID], [Content], [Image1], [Image2], [Image3]) VALUES (3, 7, N'chưa có nội dung chi tiết', NULL, NULL, NULL)
INSERT [dbo].[ProductDetail] ([ID], [ProductID], [Content], [Image1], [Image2], [Image3]) VALUES (4, 8, N'chưa có nội dung chi tiết', NULL, NULL, NULL)
INSERT [dbo].[ProductDetail] ([ID], [ProductID], [Content], [Image1], [Image2], [Image3]) VALUES (5, 9, N'<p>
	chưa có nội dung chi tiết</p>
', N'http://resource.hula.vn/images/shop/products/2012/2/1/normal/dong-ho-cap-doi-mai-nho-14232.jpg', N'http://resource.hula.vn/images/shop/products/2012/2/1/normal/dong-ho-cap-doi-mai-nho-14233.jpg', N'http://resource.hula.vn/images/shop/products/2012/2/1/normal/dong-ho-cap-doi-mai-nho-14234.jpg')
INSERT [dbo].[ProductDetail] ([ID], [ProductID], [Content], [Image1], [Image2], [Image3]) VALUES (6, 10, N'<p>
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
', NULL, NULL, NULL)
INSERT [dbo].[ProductDetail] ([ID], [ProductID], [Content], [Image1], [Image2], [Image3]) VALUES (7, 11, N'<p>
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
', NULL, NULL, NULL)
INSERT [dbo].[ProductDetail] ([ID], [ProductID], [Content], [Image1], [Image2], [Image3]) VALUES (8, 12, N'<p>
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
', NULL, NULL, NULL)
INSERT [dbo].[ProductDetail] ([ID], [ProductID], [Content], [Image1], [Image2], [Image3]) VALUES (9, 13, N'<p>
	asda ad a da asd asd asd a d asd asda ad a da asd asd asd a d asd asda ad a da asd asd asd a d asd asda ad a da asd asd asd a d asd asda ad a da asd asd asd a d asd asda ad a da asd asd asd a d asd asda ad a da asd asd asd a d asd asda ad a da asd asd asd a d asd asda ad a da asd asd asd a d asd asda ad a da asd asd asd a d asd asda ad a da asd asd asd a d asd asda ad a da asd asd asd a d asd asda ad a da asd asd asd a d asd asda ad a da asd asd asd a d asd asda ad a da asd asd asd a d asd asda ad a da asd asd asd a d asd asda ad a da asd asd asd a d asd asda ad a da asd asd asd a d asd asda ad a da asd asd asd a d asd asda ad a da asd asd asd a d asd asda ad a da asd asd asd a d asd asda ad a da asd asd asd a d asd asda ad a da asd asd asd a d asd asda ad a da asd asd asd a d asd asda ad a da asd asd asd a d asd asda ad a da asd asd asd a d asd asda ad a da asd asd asd a d asd asda ad a da asd asd asd a d asd asda ad a da asd asd asd a d asd asda ad a da asd asd asd a d asd asda ad a da asd asd asd a d asd asda ad a da asd asd asd a d asd asda ad a da asd asd asd a d asd asda ad a da asd asd asd a d asd asda ad a da asd asd asd a d asd asda ad a da asd asd asd a d asd asda ad a da asd asd asd a d asd asda ad a da asd asd asd a d asd asda ad a da asd asd asd a d asd asda ad a da asd asd asd a d asd asda ad a da asd asd asd a d asd asda ad a da asd asd asd a d asd asda ad a da asd asd asd a d asd asda ad a da asd asd asd a d asd asda ad a da asd asd asd a d asd asda ad a da asd asd asd a d asd asda ad a da asd asd asd a d asd asda ad a da asd asd asd a d asd asda ad a da asd asd asd a d asd asda ad a da asd asd asd a d asd asda ad a da asd asd asd a d asd asda ad a da asd asd asd a d asd asda ad a da asd asd asd a d asd asda ad a da asd asd asd a d asd asda ad a da asd asd asd a d asd asda ad a da asd asd asd a d asd asda ad a da asd asd asd a d asd asda ad a da asd asd asd a d asd asda ad a da asd asd asd a d asd asda ad a da asd asd asd a d asd asda ad a da asd asd asd a d asd asda ad a da asd asd asd a d asd asda ad a da asd asd asd a d asd asda ad a da asd asd asd a d asd asda ad a da asd asd asd a d asd asda ad a da asd asd asd a d asd asda ad a da asd asd asd a d asd asda ad a da asd asd asd a d asd asda ad a da asd asd asd a d asd asda ad a da asd asd asd a d asd asda ad a da asd asd asd a d asd asda ad a da asd asd asd a d asd asda ad a da asd asd asd a d asd asda ad a da asd asd asd a d asd asda ad a da asd asd asd a d asd asda ad a da asd asd asd a d asd asda ad a da asd asd asd a d asd asda ad a da asd asd asd a d asd asda ad a da asd asd asd a d asd asda ad a da asd asd asd a d asd asda ad a da asd asd asd a d asd asda ad a da asd asd asd a d asd asda ad a da asd asd asd a d asd asda ad a da asd asd asd a d asd asda ad a da asd asd asd a d asd asda ad a da asd asd asd a d asd asda ad a da asd asd asd a d asd asda ad a da asd asd asd a d asd asda ad a da asd asd asd a d asd asda ad a da asd asd asd a d asd asda ad a da asd asd asd a d asd asda ad a da asd asd asd a d asd asda ad a da asd asd asd a d asd asda ad a da asd asd asd a d asd asda ad a da asd asd asd a d asd asda ad a da asd asd asd a d asd asda ad a da asd asd asd a d asd asda ad a da asd asd asd a d asd asda ad a da asd asd asd a d asd asda ad a da asd asd asd a d asd asda ad a da asd asd asd a d asd asda ad a da asd asd asd a d asd asda ad a da asd asd asd a d asd asda ad a da asd asd asd a d asd </p>
', NULL, NULL, NULL)
INSERT [dbo].[ProductDetail] ([ID], [ProductID], [Content], [Image1], [Image2], [Image3]) VALUES (10, 14, N'<p>
	asasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd a</p>
', NULL, NULL, NULL)
INSERT [dbo].[ProductDetail] ([ID], [ProductID], [Content], [Image1], [Image2], [Image3]) VALUES (11, 15, N'<p>
	asasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd a</p>
', NULL, NULL, NULL)
INSERT [dbo].[ProductDetail] ([ID], [ProductID], [Content], [Image1], [Image2], [Image3]) VALUES (12, 16, N'<p>
	asasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd a</p>
', NULL, NULL, NULL)
INSERT [dbo].[ProductDetail] ([ID], [ProductID], [Content], [Image1], [Image2], [Image3]) VALUES (13, 17, N'<p>
	asasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd a</p>
', NULL, NULL, NULL)
INSERT [dbo].[ProductDetail] ([ID], [ProductID], [Content], [Image1], [Image2], [Image3]) VALUES (14, 18, N'<p>
	asasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd aasasdaasd asd a</p>
', NULL, NULL, NULL)
INSERT [dbo].[ProductDetail] ([ID], [ProductID], [Content], [Image1], [Image2], [Image3]) VALUES (15, 19, N'<p>
	aaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasda</p>
', NULL, NULL, NULL)
INSERT [dbo].[ProductDetail] ([ID], [ProductID], [Content], [Image1], [Image2], [Image3]) VALUES (16, 20, N'<p>
	aaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasda</p>
', NULL, NULL, NULL)
INSERT [dbo].[ProductDetail] ([ID], [ProductID], [Content], [Image1], [Image2], [Image3]) VALUES (17, 21, N'<p>
	aaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasda</p>
', NULL, NULL, NULL)
INSERT [dbo].[ProductDetail] ([ID], [ProductID], [Content], [Image1], [Image2], [Image3]) VALUES (18, 22, N'<p>
	aaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasda</p>
', NULL, NULL, NULL)
INSERT [dbo].[ProductDetail] ([ID], [ProductID], [Content], [Image1], [Image2], [Image3]) VALUES (19, 23, N'<p>
	aaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasda</p>
', NULL, NULL, NULL)
INSERT [dbo].[ProductDetail] ([ID], [ProductID], [Content], [Image1], [Image2], [Image3]) VALUES (20, 24, N'<p>
	aaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasda</p>
', NULL, NULL, NULL)
INSERT [dbo].[ProductDetail] ([ID], [ProductID], [Content], [Image1], [Image2], [Image3]) VALUES (21, 25, N'<p>
	aaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasda</p>
', NULL, NULL, NULL)
INSERT [dbo].[ProductDetail] ([ID], [ProductID], [Content], [Image1], [Image2], [Image3]) VALUES (22, 26, N'<p>
	aaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasdaaaaasd a asda sdasda</p>
', NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[ProductDetail] OFF
/****** Object:  StoredProcedure [dbo].[UpdateNew]    Script Date: 03/05/2012 06:44:49 ******/
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
	@outcontent nvarchar(250),
	@shortcontent ntext,
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
      ,[OutContent] = @outcontent
      ,[ShortContent] = @preview
      ,[ImageThumb] = @img
	WHERE ID=@ID
		RETURN 1
	END
END
GO
/****** Object:  View [dbo].[vw_aspnet_UsersInRoles]    Script Date: 03/05/2012 06:44:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE VIEW [dbo].[vw_aspnet_UsersInRoles]
  AS SELECT [dbo].[aspnet_UsersInRoles].[UserId], [dbo].[aspnet_UsersInRoles].[RoleId]
  FROM [dbo].[aspnet_UsersInRoles]
GO
/****** Object:  StoredProcedure [dbo].[PostQuestion]    Script Date: 03/05/2012 06:44:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		BTN
-- Create date: 16 Feb 2012
-- Description:	NO
-- =============================================
CREATE PROCEDURE [dbo].[PostQuestion]
	@PosterID		INT,
	@Content		NVARCHAR(MAX),
	@Type			NVARCHAR(100)
AS
BEGIN
	INSERT INTO [FullMart].[dbo].[AnswerQuestion]
           ([PosterID]
           ,[CreateDate]
           ,[type]
           ,[Content])
    VALUES
           (@PosterID
           ,GETUTCDATE()
           ,@Type
           ,@Content)
END
GO
/****** Object:  StoredProcedure [dbo].[OutstandProduct]    Script Date: 03/05/2012 06:44:49 ******/
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
/****** Object:  StoredProcedure [dbo].[GetManagingProductList]    Script Date: 03/05/2012 06:44:49 ******/
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
	@roleID					INT,
	@usID					INT,
	@Email					NVARCHAR(50),
	@CatID					NVARCHAR(10),
	@SubcatID				NVARCHAR(10) = NULL,
	@SortBy					NVARCHAR(30) = NULL
AS
BEGIN	
	SET NOCOUNT ON;
	
	DECLARE @intProductID		INT
	
	IF(@ProductID <> 'Search by Product ID')
		BEGIN
			SET @intProductID = CONVERT(INT, @ProductID)
		END	
BEGIN
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
		  AND ([FullMart].[dbo].[User].[ID] = @usID OR @roleID = 1)
		  AND [FullMart].[dbo].[SubCategory].[ID] = [SubCategoryID]
		  AND ([FullMart].[dbo].[Product].[ID] = @intProductID
				OR @ProductID = 'Search by Product ID')
		  AND ([email] = @Email
				OR @Email LIKE 'Enter Email to search user%')
		  AND ([SubCategoryID] = @SubcatID
				OR @SubcatID = -9999)	
	ORDER BY CASE		 @SortBy 
					WHEN 'Title'			THEN [Title]
					WHEN 'CreatedDate'		THEN [CreatedDate]
					WHEN 'email'			THEN [email]
					WHEN 'Price'			THEN [Price]
					WHEN 'SubCategoryID'	THEN [FullMart].[dbo].[SubCategory].[Name]					
					ELSE [FullMart].[dbo].[Product].[ID]
	 END
END

END
GO
/****** Object:  StoredProcedure [dbo].[GetAllProductsOfCategoryBySubCatID]    Script Date: 03/05/2012 06:44:49 ******/
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
  
	SELECT [dbo].[Product].[ID],[Price],[Thumbnail],[Title],[Type]
	FROM [FullMart].[dbo].[Product],[dbo].[User]
	WHERE ([dbo].[User].[roleID] <>3 AND [dbo].[Product].[PosterID] = [dbo].[User].[ID]) AND [FullMart].[dbo].[Product].[SubCategoryID] 
		  IN (
				SELECT [FullMart].[dbo].[SubCategory].[ID]
				FROM [FullMart].[dbo].[SubCategory]
				WHERE [FullMart].[dbo].[SubCategory].[CategoryID] = @CatID
			 )
	ORDER BY [CreatedDate] DESC
END
GO
/****** Object:  StoredProcedure [dbo].[GetAllProductsOfCategory]    Script Date: 03/05/2012 06:44:49 ******/
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
  
	SELECT [dbo].[Product].[ID],[Price],[Thumbnail],[Title],@CatName AS [CatName]
	FROM [FullMart].[dbo].[Product],[dbo].[User]
	WHERE ([dbo].[User].[roleID] <>3 AND [dbo].[Product].[PosterID] = [dbo].[User].[ID]) AND[FullMart].[dbo].[Product].[SubCategoryID] 
		  IN (
				SELECT [FullMart].[dbo].[SubCategory].[ID]
				FROM [FullMart].[dbo].[SubCategory]
				WHERE [FullMart].[dbo].[SubCategory].[CategoryID] = @CatID
			 )
	ORDER BY  [dbo].[Product].[type] ASC,[CreatedDate] DESC
END
GO
/****** Object:  StoredProcedure [dbo].[GetAllProductsInSubCategory]    Script Date: 03/05/2012 06:44:49 ******/
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
	
	SELECT [ID],[Price],[Thumbnail],[Title],[Type]
			,@SubcatName AS [SubcatName], @CatName AS [CatName]
	FROM [FullMart].[dbo].[Product]
	WHERE [FullMart].[dbo].[Product].[SubCategoryID] = @SubcatID		  
	ORDER BY [dbo].[Product].[type] ASC,[CreatedDate] DESC
END
GO
/****** Object:  StoredProcedure [dbo].[GetAllProductsByPoster]    Script Date: 03/05/2012 06:44:49 ******/
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

	SELECT [ID],[Price],[Thumbnail],[Title],[Type],[CreatedDate]
	FROM [dbo].[Product]
	WHERE [PosterID] = @PosterID
	ORDER BY [Type] ASC,[CreatedDate] DESC
END
GO
/****** Object:  StoredProcedure [dbo].[GetAllNews1]    Script Date: 03/05/2012 06:44:49 ******/
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
/****** Object:  StoredProcedure [dbo].[GetAllNews]    Script Date: 03/05/2012 06:44:49 ******/
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
/****** Object:  StoredProcedure [dbo].[DeleteQA]    Script Date: 03/05/2012 06:44:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		BTN
-- Create date: 18 Feb 2012
-- Description:	NO
-- =============================================
CREATE PROCEDURE [dbo].[DeleteQA]
	@QAID		INT
AS
BEGIN
	
	SET NOCOUNT ON;

    DELETE FROM [FullMart].[dbo].[AnswerQuestion]
    WHERE [ID] = @QAID
END
GO
/****** Object:  Table [dbo].[Cart]    Script Date: 03/05/2012 06:44:49 ******/
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
	[RecipientsName] [nvarchar](300) NULL,
	[RecipientsPhone] [nvarchar](14) NULL,
	[RecipientsAddress] [nvarchar](400) NULL,
	[RecipientsEmail] [nvarchar](100) NULL,
	[isSubmited] [bit] NULL,
 CONSTRAINT [PK_Cart] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Cart] ON
INSERT [dbo].[Cart] ([ID], [ProductID], [Amount], [Buyer], [CreateDate], [MoreDetail], [isRead], [RecipientsName], [RecipientsPhone], [RecipientsAddress], [RecipientsEmail], [isSubmited]) VALUES (1, 8, 15, 5, CAST(0x0000A00200EC698D AS DateTime), N'29384-23414 2v3039', 1, N'knjaskdnasn', N'asjdalsdj', N'lkasjdhawld', N'kjasdlaks', 1)
INSERT [dbo].[Cart] ([ID], [ProductID], [Amount], [Buyer], [CreateDate], [MoreDetail], [isRead], [RecipientsName], [RecipientsPhone], [RecipientsAddress], [RecipientsEmail], [isSubmited]) VALUES (2, 7, 7, 5, CAST(0x0000A0020107A68B AS DateTime), N'aksjhdlas hdvliuh9', 1, N'askdhalsd', N'8342093847', N'askjhdlasi938', N'384-23vnfhewf', 1)
INSERT [dbo].[Cart] ([ID], [ProductID], [Amount], [Buyer], [CreateDate], [MoreDetail], [isRead], [RecipientsName], [RecipientsPhone], [RecipientsAddress], [RecipientsEmail], [isSubmited]) VALUES (3, 8, 3, 3, CAST(0x0000A00300B33619 AS DateTime), N'lweuhfvowieuhvwoieufh309485703485', 1, N'kjalskdj', N'jdhslvweif', N'8ri3urwekdh', N'ehdlviwhi2uh3847`', 1)
INSERT [dbo].[Cart] ([ID], [ProductID], [Amount], [Buyer], [CreateDate], [MoreDetail], [isRead], [RecipientsName], [RecipientsPhone], [RecipientsAddress], [RecipientsEmail], [isSubmited]) VALUES (5, 8, 6, 2, CAST(0x0000A0030106F550 AS DateTime), N'ádas', 0, N'sad ad ád', N'áda', N'ádasd', N'ád', 0)
INSERT [dbo].[Cart] ([ID], [ProductID], [Amount], [Buyer], [CreateDate], [MoreDetail], [isRead], [RecipientsName], [RecipientsPhone], [RecipientsAddress], [RecipientsEmail], [isSubmited]) VALUES (6, 8, 1, 5, CAST(0x0000A004002DAD8B AS DateTime), N'mn,', 1, N'jkhi', N'ngbn', N'bv', N'2134', 1)
SET IDENTITY_INSERT [dbo].[Cart] OFF
/****** Object:  StoredProcedure [dbo].[CreateNew]    Script Date: 03/05/2012 06:44:49 ******/
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
	@outcontent nvarchar(250),
	@content	ntext,
	@preview	ntext,
	@img		nvarchar(150)
AS
BEGIN
	
	SET NOCOUNT ON;

    INSERT INTO [FullMart].[dbo].[News]
           ([Title]
           ,[Content]
           ,[OutContent]
           ,[PosterID]
           ,[ShortContent]
           ,[ImageThumb]
           ,[CreatedDate])
     VALUES
			(@title,
			@content,
			@outcontent,
			@posterID,
			@preview,
			@img,
			GETUTCDATE()
			)
END
GO
/****** Object:  Table [dbo].[Comment]    Script Date: 03/05/2012 06:44:49 ******/
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
INSERT [dbo].[Comment] ([ID], [PosterID], [Product], [CreateDate], [Content]) VALUES (5, 4, 2, CAST(0x00009FFC0027436C AS DateTime), N'hjzz 1')
INSERT [dbo].[Comment] ([ID], [PosterID], [Product], [CreateDate], [Content]) VALUES (8, 3, 8, CAST(0x00009FFF00B260C8 AS DateTime), N'asdasdasd')
INSERT [dbo].[Comment] ([ID], [PosterID], [Product], [CreateDate], [Content]) VALUES (11, 3, 8, CAST(0x00009FFF00B606B8 AS DateTime), N'asdasdasd')
INSERT [dbo].[Comment] ([ID], [PosterID], [Product], [CreateDate], [Content]) VALUES (12, 3, 8, CAST(0x00009FFF00B64C54 AS DateTime), N'test laij cai nua :|')
INSERT [dbo].[Comment] ([ID], [PosterID], [Product], [CreateDate], [Content]) VALUES (14, 5, 8, CAST(0x00009FFF00BA4159 AS DateTime), N'asdasd')
INSERT [dbo].[Comment] ([ID], [PosterID], [Product], [CreateDate], [Content]) VALUES (15, 5, 8, CAST(0x00009FFF00BA4964 AS DateTime), N'asdasd')
INSERT [dbo].[Comment] ([ID], [PosterID], [Product], [CreateDate], [Content]) VALUES (16, 5, 8, CAST(0x00009FFF00BA513A AS DateTime), N'asdasd')
INSERT [dbo].[Comment] ([ID], [PosterID], [Product], [CreateDate], [Content]) VALUES (17, 5, 8, CAST(0x00009FFF00BA5890 AS DateTime), N'asdasd')
INSERT [dbo].[Comment] ([ID], [PosterID], [Product], [CreateDate], [Content]) VALUES (18, 5, 8, CAST(0x00009FFF00BA646D AS DateTime), N'asdasd')
INSERT [dbo].[Comment] ([ID], [PosterID], [Product], [CreateDate], [Content]) VALUES (19, 5, 8, CAST(0x00009FFF00BA6D61 AS DateTime), N'asdasd')
INSERT [dbo].[Comment] ([ID], [PosterID], [Product], [CreateDate], [Content]) VALUES (20, 5, 8, CAST(0x00009FFF00BA79A6 AS DateTime), N'asdasd')
INSERT [dbo].[Comment] ([ID], [PosterID], [Product], [CreateDate], [Content]) VALUES (21, 5, 8, CAST(0x00009FFF00BA83E0 AS DateTime), N'asdasd')
INSERT [dbo].[Comment] ([ID], [PosterID], [Product], [CreateDate], [Content]) VALUES (22, 5, 8, CAST(0x00009FFF00BAA211 AS DateTime), N'asdasda sd')
INSERT [dbo].[Comment] ([ID], [PosterID], [Product], [CreateDate], [Content]) VALUES (23, 5, 8, CAST(0x00009FFF00BAADD0 AS DateTime), N'asdasda sd')
INSERT [dbo].[Comment] ([ID], [PosterID], [Product], [CreateDate], [Content]) VALUES (24, 5, 8, CAST(0x00009FFF00BAB65C AS DateTime), N'asdasda sd')
INSERT [dbo].[Comment] ([ID], [PosterID], [Product], [CreateDate], [Content]) VALUES (25, 5, 8, CAST(0x00009FFF00BBF183 AS DateTime), N'test cái cuối cùng')
INSERT [dbo].[Comment] ([ID], [PosterID], [Product], [CreateDate], [Content]) VALUES (29, 5, 8, CAST(0x0000A009008A880E AS DateTime), N'5DIC')
INSERT [dbo].[Comment] ([ID], [PosterID], [Product], [CreateDate], [Content]) VALUES (30, 5, 23, CAST(0x0000A00A0039AB7D AS DateTime), N'E92G')
SET IDENTITY_INSERT [dbo].[Comment] OFF
/****** Object:  StoredProcedure [dbo].[aspnet_UsersInRoles_RemoveUsersFromRoles]    Script Date: 03/05/2012 06:44:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_UsersInRoles_RemoveUsersFromRoles]
	@ApplicationName  nvarchar(256),
	@UserNames		  nvarchar(4000),
	@RoleNames		  nvarchar(4000)
AS
BEGIN
	DECLARE @AppId uniqueidentifier
	SELECT  @AppId = NULL
	SELECT  @AppId = ApplicationId FROM aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
	IF (@AppId IS NULL)
		RETURN(2)


	DECLARE @TranStarted   bit
	SET @TranStarted = 0

	IF( @@TRANCOUNT = 0 )
	BEGIN
		BEGIN TRANSACTION
		SET @TranStarted = 1
	END

	DECLARE @tbNames  table(Name nvarchar(256) NOT NULL PRIMARY KEY)
	DECLARE @tbRoles  table(RoleId uniqueidentifier NOT NULL PRIMARY KEY)
	DECLARE @tbUsers  table(UserId uniqueidentifier NOT NULL PRIMARY KEY)
	DECLARE @Num	  int
	DECLARE @Pos	  int
	DECLARE @NextPos  int
	DECLARE @Name	  nvarchar(256)
	DECLARE @CountAll int
	DECLARE @CountU	  int
	DECLARE @CountR	  int


	SET @Num = 0
	SET @Pos = 1
	WHILE(@Pos <= LEN(@RoleNames))
	BEGIN
		SELECT @NextPos = CHARINDEX(N',', @RoleNames,  @Pos)
		IF (@NextPos = 0 OR @NextPos IS NULL)
			SELECT @NextPos = LEN(@RoleNames) + 1
		SELECT @Name = RTRIM(LTRIM(SUBSTRING(@RoleNames, @Pos, @NextPos - @Pos)))
		SELECT @Pos = @NextPos+1

		INSERT INTO @tbNames VALUES (@Name)
		SET @Num = @Num + 1
	END

	INSERT INTO @tbRoles
	  SELECT RoleId
	  FROM   dbo.aspnet_Roles ar, @tbNames t
	  WHERE  LOWER(t.Name) = ar.LoweredRoleName AND ar.ApplicationId = @AppId
	SELECT @CountR = @@ROWCOUNT

	IF (@CountR <> @Num)
	BEGIN
		SELECT TOP 1 N'', Name
		FROM   @tbNames
		WHERE  LOWER(Name) NOT IN (SELECT ar.LoweredRoleName FROM dbo.aspnet_Roles ar,  @tbRoles r WHERE r.RoleId = ar.RoleId)
		IF( @TranStarted = 1 )
			ROLLBACK TRANSACTION
		RETURN(2)
	END


	DELETE FROM @tbNames WHERE 1=1
	SET @Num = 0
	SET @Pos = 1


	WHILE(@Pos <= LEN(@UserNames))
	BEGIN
		SELECT @NextPos = CHARINDEX(N',', @UserNames,  @Pos)
		IF (@NextPos = 0 OR @NextPos IS NULL)
			SELECT @NextPos = LEN(@UserNames) + 1
		SELECT @Name = RTRIM(LTRIM(SUBSTRING(@UserNames, @Pos, @NextPos - @Pos)))
		SELECT @Pos = @NextPos+1

		INSERT INTO @tbNames VALUES (@Name)
		SET @Num = @Num + 1
	END

	INSERT INTO @tbUsers
	  SELECT UserId
	  FROM   dbo.aspnet_Users ar, @tbNames t
	  WHERE  LOWER(t.Name) = ar.LoweredUserName AND ar.ApplicationId = @AppId

	SELECT @CountU = @@ROWCOUNT
	IF (@CountU <> @Num)
	BEGIN
		SELECT TOP 1 Name, N''
		FROM   @tbNames
		WHERE  LOWER(Name) NOT IN (SELECT au.LoweredUserName FROM dbo.aspnet_Users au,  @tbUsers u WHERE u.UserId = au.UserId)

		IF( @TranStarted = 1 )
			ROLLBACK TRANSACTION
		RETURN(1)
	END

	SELECT  @CountAll = COUNT(*)
	FROM	dbo.aspnet_UsersInRoles ur, @tbUsers u, @tbRoles r
	WHERE   ur.UserId = u.UserId AND ur.RoleId = r.RoleId

	IF (@CountAll <> @CountU * @CountR)
	BEGIN
		SELECT TOP 1 UserName, RoleName
		FROM		 @tbUsers tu, @tbRoles tr, dbo.aspnet_Users u, dbo.aspnet_Roles r
		WHERE		 u.UserId = tu.UserId AND r.RoleId = tr.RoleId AND
					 tu.UserId NOT IN (SELECT ur.UserId FROM dbo.aspnet_UsersInRoles ur WHERE ur.RoleId = tr.RoleId) AND
					 tr.RoleId NOT IN (SELECT ur.RoleId FROM dbo.aspnet_UsersInRoles ur WHERE ur.UserId = tu.UserId)
		IF( @TranStarted = 1 )
			ROLLBACK TRANSACTION
		RETURN(3)
	END

	DELETE FROM dbo.aspnet_UsersInRoles
	WHERE UserId IN (SELECT UserId FROM @tbUsers)
	  AND RoleId IN (SELECT RoleId FROM @tbRoles)
	IF( @TranStarted = 1 )
		COMMIT TRANSACTION
	RETURN(0)
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_UsersInRoles_IsUserInRole]    Script Date: 03/05/2012 06:44:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_UsersInRoles_IsUserInRole]
    @ApplicationName  nvarchar(256),
    @UserName         nvarchar(256),
    @RoleName         nvarchar(256)
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
        RETURN(2)
    DECLARE @UserId uniqueidentifier
    SELECT  @UserId = NULL
    DECLARE @RoleId uniqueidentifier
    SELECT  @RoleId = NULL

    SELECT  @UserId = UserId
    FROM    dbo.aspnet_Users
    WHERE   LoweredUserName = LOWER(@UserName) AND ApplicationId = @ApplicationId

    IF (@UserId IS NULL)
        RETURN(2)

    SELECT  @RoleId = RoleId
    FROM    dbo.aspnet_Roles
    WHERE   LoweredRoleName = LOWER(@RoleName) AND ApplicationId = @ApplicationId

    IF (@RoleId IS NULL)
        RETURN(3)

    IF (EXISTS( SELECT * FROM dbo.aspnet_UsersInRoles WHERE  UserId = @UserId AND RoleId = @RoleId))
        RETURN(1)
    ELSE
        RETURN(0)
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_UsersInRoles_GetUsersInRoles]    Script Date: 03/05/2012 06:44:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_UsersInRoles_GetUsersInRoles]
    @ApplicationName  nvarchar(256),
    @RoleName         nvarchar(256)
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
        RETURN(1)
     DECLARE @RoleId uniqueidentifier
     SELECT  @RoleId = NULL

     SELECT  @RoleId = RoleId
     FROM    dbo.aspnet_Roles
     WHERE   LOWER(@RoleName) = LoweredRoleName AND ApplicationId = @ApplicationId

     IF (@RoleId IS NULL)
         RETURN(1)

    SELECT u.UserName
    FROM   dbo.aspnet_Users u, dbo.aspnet_UsersInRoles ur
    WHERE  u.UserId = ur.UserId AND @RoleId = ur.RoleId AND u.ApplicationId = @ApplicationId
    ORDER BY u.UserName
    RETURN(0)
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_UsersInRoles_GetRolesForUser]    Script Date: 03/05/2012 06:44:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_UsersInRoles_GetRolesForUser]
    @ApplicationName  nvarchar(256),
    @UserName         nvarchar(256)
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
        RETURN(1)
    DECLARE @UserId uniqueidentifier
    SELECT  @UserId = NULL

    SELECT  @UserId = UserId
    FROM    dbo.aspnet_Users
    WHERE   LoweredUserName = LOWER(@UserName) AND ApplicationId = @ApplicationId

    IF (@UserId IS NULL)
        RETURN(1)

    SELECT r.RoleName
    FROM   dbo.aspnet_Roles r, dbo.aspnet_UsersInRoles ur
    WHERE  r.RoleId = ur.RoleId AND r.ApplicationId = @ApplicationId AND ur.UserId = @UserId
    ORDER BY r.RoleName
    RETURN (0)
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_UsersInRoles_FindUsersInRole]    Script Date: 03/05/2012 06:44:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_UsersInRoles_FindUsersInRole]
    @ApplicationName  nvarchar(256),
    @RoleName         nvarchar(256),
    @UserNameToMatch  nvarchar(256)
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
        RETURN(1)
     DECLARE @RoleId uniqueidentifier
     SELECT  @RoleId = NULL

     SELECT  @RoleId = RoleId
     FROM    dbo.aspnet_Roles
     WHERE   LOWER(@RoleName) = LoweredRoleName AND ApplicationId = @ApplicationId

     IF (@RoleId IS NULL)
         RETURN(1)

    SELECT u.UserName
    FROM   dbo.aspnet_Users u, dbo.aspnet_UsersInRoles ur
    WHERE  u.UserId = ur.UserId AND @RoleId = ur.RoleId AND u.ApplicationId = @ApplicationId AND LoweredUserName LIKE LOWER(@UserNameToMatch)
    ORDER BY u.UserName
    RETURN(0)
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_UsersInRoles_AddUsersToRoles]    Script Date: 03/05/2012 06:44:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_UsersInRoles_AddUsersToRoles]
	@ApplicationName  nvarchar(256),
	@UserNames		  nvarchar(4000),
	@RoleNames		  nvarchar(4000),
	@CurrentTimeUtc   datetime
AS
BEGIN
	DECLARE @AppId uniqueidentifier
	SELECT  @AppId = NULL
	SELECT  @AppId = ApplicationId FROM aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
	IF (@AppId IS NULL)
		RETURN(2)
	DECLARE @TranStarted   bit
	SET @TranStarted = 0

	IF( @@TRANCOUNT = 0 )
	BEGIN
		BEGIN TRANSACTION
		SET @TranStarted = 1
	END

	DECLARE @tbNames	table(Name nvarchar(256) NOT NULL PRIMARY KEY)
	DECLARE @tbRoles	table(RoleId uniqueidentifier NOT NULL PRIMARY KEY)
	DECLARE @tbUsers	table(UserId uniqueidentifier NOT NULL PRIMARY KEY)
	DECLARE @Num		int
	DECLARE @Pos		int
	DECLARE @NextPos	int
	DECLARE @Name		nvarchar(256)

	SET @Num = 0
	SET @Pos = 1
	WHILE(@Pos <= LEN(@RoleNames))
	BEGIN
		SELECT @NextPos = CHARINDEX(N',', @RoleNames,  @Pos)
		IF (@NextPos = 0 OR @NextPos IS NULL)
			SELECT @NextPos = LEN(@RoleNames) + 1
		SELECT @Name = RTRIM(LTRIM(SUBSTRING(@RoleNames, @Pos, @NextPos - @Pos)))
		SELECT @Pos = @NextPos+1

		INSERT INTO @tbNames VALUES (@Name)
		SET @Num = @Num + 1
	END

	INSERT INTO @tbRoles
	  SELECT RoleId
	  FROM   dbo.aspnet_Roles ar, @tbNames t
	  WHERE  LOWER(t.Name) = ar.LoweredRoleName AND ar.ApplicationId = @AppId

	IF (@@ROWCOUNT <> @Num)
	BEGIN
		SELECT TOP 1 Name
		FROM   @tbNames
		WHERE  LOWER(Name) NOT IN (SELECT ar.LoweredRoleName FROM dbo.aspnet_Roles ar,  @tbRoles r WHERE r.RoleId = ar.RoleId)
		IF( @TranStarted = 1 )
			ROLLBACK TRANSACTION
		RETURN(2)
	END

	DELETE FROM @tbNames WHERE 1=1
	SET @Num = 0
	SET @Pos = 1

	WHILE(@Pos <= LEN(@UserNames))
	BEGIN
		SELECT @NextPos = CHARINDEX(N',', @UserNames,  @Pos)
		IF (@NextPos = 0 OR @NextPos IS NULL)
			SELECT @NextPos = LEN(@UserNames) + 1
		SELECT @Name = RTRIM(LTRIM(SUBSTRING(@UserNames, @Pos, @NextPos - @Pos)))
		SELECT @Pos = @NextPos+1

		INSERT INTO @tbNames VALUES (@Name)
		SET @Num = @Num + 1
	END

	INSERT INTO @tbUsers
	  SELECT UserId
	  FROM   dbo.aspnet_Users ar, @tbNames t
	  WHERE  LOWER(t.Name) = ar.LoweredUserName AND ar.ApplicationId = @AppId

	IF (@@ROWCOUNT <> @Num)
	BEGIN
		DELETE FROM @tbNames
		WHERE LOWER(Name) IN (SELECT LoweredUserName FROM dbo.aspnet_Users au,  @tbUsers u WHERE au.UserId = u.UserId)

		INSERT dbo.aspnet_Users (ApplicationId, UserId, UserName, LoweredUserName, IsAnonymous, LastActivityDate)
		  SELECT @AppId, NEWID(), Name, LOWER(Name), 0, @CurrentTimeUtc
		  FROM   @tbNames

		INSERT INTO @tbUsers
		  SELECT  UserId
		  FROM	dbo.aspnet_Users au, @tbNames t
		  WHERE   LOWER(t.Name) = au.LoweredUserName AND au.ApplicationId = @AppId
	END

	IF (EXISTS (SELECT * FROM dbo.aspnet_UsersInRoles ur, @tbUsers tu, @tbRoles tr WHERE tu.UserId = ur.UserId AND tr.RoleId = ur.RoleId))
	BEGIN
		SELECT TOP 1 UserName, RoleName
		FROM		 dbo.aspnet_UsersInRoles ur, @tbUsers tu, @tbRoles tr, aspnet_Users u, aspnet_Roles r
		WHERE		u.UserId = tu.UserId AND r.RoleId = tr.RoleId AND tu.UserId = ur.UserId AND tr.RoleId = ur.RoleId

		IF( @TranStarted = 1 )
			ROLLBACK TRANSACTION
		RETURN(3)
	END

	INSERT INTO dbo.aspnet_UsersInRoles (UserId, RoleId)
	SELECT UserId, RoleId
	FROM @tbUsers, @tbRoles

	IF( @TranStarted = 1 )
		COMMIT TRANSACTION
	RETURN(0)
END
GO
/****** Object:  StoredProcedure [dbo].[DeleteNew]    Script Date: 03/05/2012 06:44:49 ******/
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
/****** Object:  StoredProcedure [dbo].[aspnet_Roles_DeleteRole]    Script Date: 03/05/2012 06:44:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Roles_DeleteRole]
    @ApplicationName            nvarchar(256),
    @RoleName                   nvarchar(256),
    @DeleteOnlyIfRoleIsEmpty    bit
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
        RETURN(1)

    DECLARE @ErrorCode     int
    SET @ErrorCode = 0

    DECLARE @TranStarted   bit
    SET @TranStarted = 0

    IF( @@TRANCOUNT = 0 )
    BEGIN
        BEGIN TRANSACTION
        SET @TranStarted = 1
    END
    ELSE
        SET @TranStarted = 0

    DECLARE @RoleId   uniqueidentifier
    SELECT  @RoleId = NULL
    SELECT  @RoleId = RoleId FROM dbo.aspnet_Roles WHERE LoweredRoleName = LOWER(@RoleName) AND ApplicationId = @ApplicationId

    IF (@RoleId IS NULL)
    BEGIN
        SELECT @ErrorCode = 1
        GOTO Cleanup
    END
    IF (@DeleteOnlyIfRoleIsEmpty <> 0)
    BEGIN
        IF (EXISTS (SELECT RoleId FROM dbo.aspnet_UsersInRoles  WHERE @RoleId = RoleId))
        BEGIN
            SELECT @ErrorCode = 2
            GOTO Cleanup
        END
    END


    DELETE FROM dbo.aspnet_UsersInRoles  WHERE @RoleId = RoleId

    IF( @@ERROR <> 0 )
    BEGIN
        SET @ErrorCode = -1
        GOTO Cleanup
    END

    DELETE FROM dbo.aspnet_Roles WHERE @RoleId = RoleId  AND ApplicationId = @ApplicationId

    IF( @@ERROR <> 0 )
    BEGIN
        SET @ErrorCode = -1
        GOTO Cleanup
    END

    IF( @TranStarted = 1 )
    BEGIN
        SET @TranStarted = 0
        COMMIT TRANSACTION
    END

    RETURN(0)

Cleanup:

    IF( @TranStarted = 1 )
    BEGIN
        SET @TranStarted = 0
        ROLLBACK TRANSACTION
    END

    RETURN @ErrorCode
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Users_DeleteUser]    Script Date: 03/05/2012 06:44:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Users_DeleteUser]
    @ApplicationName  nvarchar(256),
    @UserName         nvarchar(256),
    @TablesToDeleteFrom int,
    @NumTablesDeletedFrom int OUTPUT
AS
BEGIN
    DECLARE @UserId               uniqueidentifier
    SELECT  @UserId               = NULL
    SELECT  @NumTablesDeletedFrom = 0

    DECLARE @TranStarted   bit
    SET @TranStarted = 0

    IF( @@TRANCOUNT = 0 )
    BEGIN
	    BEGIN TRANSACTION
	    SET @TranStarted = 1
    END
    ELSE
	SET @TranStarted = 0

    DECLARE @ErrorCode   int
    DECLARE @RowCount    int

    SET @ErrorCode = 0
    SET @RowCount  = 0

    SELECT  @UserId = u.UserId
    FROM    dbo.aspnet_Users u, dbo.aspnet_Applications a
    WHERE   u.LoweredUserName       = LOWER(@UserName)
        AND u.ApplicationId         = a.ApplicationId
        AND LOWER(@ApplicationName) = a.LoweredApplicationName

    IF (@UserId IS NULL)
    BEGIN
        GOTO Cleanup
    END

    -- Delete from Membership table if (@TablesToDeleteFrom & 1) is set
    IF ((@TablesToDeleteFrom & 1) <> 0 AND
        (EXISTS (SELECT name FROM sysobjects WHERE (name = N'vw_aspnet_MembershipUsers') AND (type = 'V'))))
    BEGIN
        DELETE FROM dbo.aspnet_Membership WHERE @UserId = UserId

        SELECT @ErrorCode = @@ERROR,
               @RowCount = @@ROWCOUNT

        IF( @ErrorCode <> 0 )
            GOTO Cleanup

        IF (@RowCount <> 0)
            SELECT  @NumTablesDeletedFrom = @NumTablesDeletedFrom + 1
    END

    -- Delete from aspnet_UsersInRoles table if (@TablesToDeleteFrom & 2) is set
    IF ((@TablesToDeleteFrom & 2) <> 0  AND
        (EXISTS (SELECT name FROM sysobjects WHERE (name = N'vw_aspnet_UsersInRoles') AND (type = 'V'))) )
    BEGIN
        DELETE FROM dbo.aspnet_UsersInRoles WHERE @UserId = UserId

        SELECT @ErrorCode = @@ERROR,
                @RowCount = @@ROWCOUNT

        IF( @ErrorCode <> 0 )
            GOTO Cleanup

        IF (@RowCount <> 0)
            SELECT  @NumTablesDeletedFrom = @NumTablesDeletedFrom + 1
    END

    -- Delete from aspnet_Profile table if (@TablesToDeleteFrom & 4) is set
    IF ((@TablesToDeleteFrom & 4) <> 0  AND
        (EXISTS (SELECT name FROM sysobjects WHERE (name = N'vw_aspnet_Profiles') AND (type = 'V'))) )
    BEGIN
        DELETE FROM dbo.aspnet_Profile WHERE @UserId = UserId

        SELECT @ErrorCode = @@ERROR,
                @RowCount = @@ROWCOUNT

        IF( @ErrorCode <> 0 )
            GOTO Cleanup

        IF (@RowCount <> 0)
            SELECT  @NumTablesDeletedFrom = @NumTablesDeletedFrom + 1
    END

    -- Delete from aspnet_PersonalizationPerUser table if (@TablesToDeleteFrom & 8) is set
    IF ((@TablesToDeleteFrom & 8) <> 0  AND
        (EXISTS (SELECT name FROM sysobjects WHERE (name = N'vw_aspnet_WebPartState_User') AND (type = 'V'))) )
    BEGIN
        DELETE FROM dbo.aspnet_PersonalizationPerUser WHERE @UserId = UserId

        SELECT @ErrorCode = @@ERROR,
                @RowCount = @@ROWCOUNT

        IF( @ErrorCode <> 0 )
            GOTO Cleanup

        IF (@RowCount <> 0)
            SELECT  @NumTablesDeletedFrom = @NumTablesDeletedFrom + 1
    END

    -- Delete from aspnet_Users table if (@TablesToDeleteFrom & 1,2,4 & 8) are all set
    IF ((@TablesToDeleteFrom & 1) <> 0 AND
        (@TablesToDeleteFrom & 2) <> 0 AND
        (@TablesToDeleteFrom & 4) <> 0 AND
        (@TablesToDeleteFrom & 8) <> 0 AND
        (EXISTS (SELECT UserId FROM dbo.aspnet_Users WHERE @UserId = UserId)))
    BEGIN
        DELETE FROM dbo.aspnet_Users WHERE @UserId = UserId

        SELECT @ErrorCode = @@ERROR,
                @RowCount = @@ROWCOUNT

        IF( @ErrorCode <> 0 )
            GOTO Cleanup

        IF (@RowCount <> 0)
            SELECT  @NumTablesDeletedFrom = @NumTablesDeletedFrom + 1
    END

    IF( @TranStarted = 1 )
    BEGIN
	    SET @TranStarted = 0
	    COMMIT TRANSACTION
    END

    RETURN 0

Cleanup:
    SET @NumTablesDeletedFrom = 0

    IF( @TranStarted = 1 )
    BEGIN
        SET @TranStarted = 0
	    ROLLBACK TRANSACTION
    END

    RETURN @ErrorCode

END
GO
/****** Object:  StoredProcedure [dbo].[AddProductComment]    Script Date: 03/05/2012 06:44:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		BTN
-- Create date: 19 Feb 2012
-- Description:	NO
-- =============================================
CREATE PROCEDURE [dbo].[AddProductComment]
	@PosterID				INT,
	@ProductID				INT,
	@Content				NVARCHAR(MAX)
AS
BEGIN
	
	SET NOCOUNT ON;
    
	INSERT INTO [FullMart].[dbo].[Comment]
           ([PosterID]
           ,[Product]
           ,[CreateDate]
           ,[Content])
     VALUES
           (@PosterID
           ,@ProductID
           ,GETUTCDATE()
           ,@Content)
END
GO
/****** Object:  StoredProcedure [dbo].[AddPurchaseBooking]    Script Date: 03/05/2012 06:44:49 ******/
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
/****** Object:  StoredProcedure [dbo].[DelAnswer]    Script Date: 03/05/2012 06:44:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		NVN
-- Create date: 16 Feb 2012
-- Description:	NO
-- =============================================
CREATE PROCEDURE [dbo].[DelAnswer]
	@ID			INT
AS
BEGIN
	DELETE FROM [FullMart].[dbo].[SubAQ]
      WHERE [FullMart].[dbo].[SubAQ].[ID]=@ID
END
GO
/****** Object:  StoredProcedure [dbo].[CreateProduct]    Script Date: 03/05/2012 06:44:49 ******/
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
    @Price				NVARCHAR(20),
    @Picture			NVARCHAR(300),
    @Thumbnail			NVARCHAR(300),    
    @PosterID			INT,
    @Content			NVARCHAR(MAX),
    @Title				NVARCHAR(150),
    @State				INT,
    @type				INT,
    @img1				NVARCHAR(500),
    @img2				NVARCHAR(500),
    @img3				NVARCHAR(500)
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
           ,[State]
           ,[Type])
     VALUES
           (@SubCategoryID
           ,@Price
           ,@Picture
           ,@Thumbnail
           ,GETUTCDATE()
           ,@PosterID
           ,0
           ,@Title
           ,@State
           ,@type)
     
     IF(@@IDENTITY IS NULL)
		RETURN 0
	 ELSE
		BEGIN
			INSERT INTO [FullMart].[dbo].[ProductDetail]
				   ([ProductID]
				   ,[Content]
				   ,[Image1]
				   ,[Image2]
				   ,[Image3]
				   )
			VALUES
				   (@@IDENTITY
				   ,@Content
				   ,@img1
				   ,@img2
				   ,@img3)
			RETURN 1
		END
END
GO
/****** Object:  StoredProcedure [dbo].[DelQuetion]    Script Date: 03/05/2012 06:44:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		NVN
-- Create date: 16 Feb 2012
-- Description:	NO
-- =============================================
CREATE PROCEDURE [dbo].[DelQuetion]
	@ID			INT
AS
BEGIN
	DELETE FROM [FullMart].[dbo].[SubAQ]
	  WHERE [FullMart].[dbo].[SubAQ].[AQID]=@ID
	  DELETE FROM [FullMart].[dbo].[AnswerQuestion]
	  WHERE [FullMart].[dbo].[AnswerQuestion].[ID]=@ID
END
GO
/****** Object:  StoredProcedure [dbo].[delProduct]    Script Date: 03/05/2012 06:44:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[delProduct]
	-- Add the parameters for the stored procedure here
	@ID		int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    DELETE FROM [FullMart].[dbo].[ProductDetail]
    WHERE [FullMart].[dbo].[ProductDetail].[ProductID]=@ID
    DELETE FROM [FullMart].[dbo].[Product]
    WHERE [FullMart].[dbo].[Product].ID=@ID
      
END
GO
/****** Object:  StoredProcedure [dbo].[DeleteSubQA]    Script Date: 03/05/2012 06:44:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		BTN
-- Create date: 18 Feb 2012
-- Description:	NO
-- =============================================
CREATE PROCEDURE [dbo].[DeleteSubQA]
	@QAID		INT,
	@SubQAID	INT
AS
BEGIN
	
	SET NOCOUNT ON;

    DELETE FROM [FullMart].[dbo].[SubAQ]
      WHERE [AQID] = @QAID
			AND [ID] = @SubQAID
END
GO
/****** Object:  StoredProcedure [dbo].[GetQAStatistic]    Script Date: 03/05/2012 06:44:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		BTN
-- Create date: 18 Feb 2012
-- Description:	NO
-- =============================================
CREATE PROCEDURE [dbo].[GetQAStatistic]
	
AS
BEGIN
	
	SET NOCOUNT ON;

    SELECT [FullMart].[dbo].[AnswerQuestion].[ID],[UserName],
		   (
			   SELECT COUNT([FullMart].[dbo].[SubAQ].[ID])
			   FROM [FullMart].[dbo].[SubAQ]
			   WHERE [FullMart].[dbo].[SubAQ].[AQID] = [FullMart].[dbo].[AnswerQuestion].[ID]
		   ) AS [COMMENTSCOUNT],
	       [FullMart].[dbo].[AnswerQuestion].[CreateDate],
	       [FullMart].[dbo].[AnswerQuestion].[Content] 
	FROM [FullMart].[dbo].[AnswerQuestion],
		 [FullMart].[dbo].[User]
	WHERE [FullMart].[dbo].[User].[ID] = [FullMart].[dbo].[AnswerQuestion].[PosterID]
	ORDER BY [FullMart].[dbo].[AnswerQuestion].[CreateDate] DESC

END
GO
/****** Object:  StoredProcedure [dbo].[GetProductDetail]    Script Date: 03/05/2012 06:44:49 ******/
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
	IF EXISTS(SELECT * FROM [dbo].[User],[dbo].[Shop],[dbo].[Product] WHERE [Product].[ID]=@ID AND [Product].[PosterID] = [User].ID AND [dbo].[User].[ShopID] = [dbo].[Shop].[ID] AND [User].[ShopID] <> -1 )
		BEGIN
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
			  ,[FullMart].[dbo].[State].[StateName] AS [StateName]
			  ,[FullMart].[dbo].[ProductDetail].[ID]
			  ,[FullMart].[dbo].[ProductDetail].[Content]
			  ,[dbo].[Product].[type]
			  ,[dbo].[User].[roleID]
			  ,[dbo].Shop.[Adress] AS [ShopAddress]
			  ,[dbo].[Shop].[Chat] AS [ShopYahoo]
			  ,[dbo].[Shop].[CreateDate] AS [ShopCreatedDate]
			  ,[dbo].[User].[ShopID] AS [ShopID]
			  ,[dbo].[Shop].[Phone] AS [ShopPhone]
			  ,[dbo].[Shop].[ShopName] AS [ShopName]
			  ,[dbo].[Shop].[isActive] AS [ShopActive]
			  ,[dbo].[Shop].[isChecked] AS [ShopChecked]
			  ,[dbo].[Shop].[rate] AS [Shoprate]
			  ,[dbo].[ProductDetail].[Image1] AS img1
			  ,[dbo].[ProductDetail].[Image2] AS img2
			  ,[dbo].[ProductDetail].[Image3] AS img3
			FROM [FullMart].[dbo].[Product]
				,[FullMart].[dbo].[ProductDetail]
				,[FullMart].[dbo].[State]
				,[FullMart].[dbo].[User]
				,[dbo].[Shop]
			WHERE [FullMart].[dbo].[Product].[ID] = @ID
					AND [FullMart].[dbo].[Product].[ID] = [FullMart].[dbo].[ProductDetail].[ProductID]
					AND [FullMart].[dbo].[State].[id]=[FullMart].[dbo].[Product].[State]
					AND [FullMart].[dbo].[User].[ID] = [FullMart].[dbo].[Product].[PosterID]
					AND [dbo].[User].[ShopID] = [dbo].[Shop].[ID]
		END
	ELSE
		BEGIN
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
			  ,[FullMart].[dbo].[State].[StateName] AS [StateName]
			  ,[FullMart].[dbo].[ProductDetail].[ID]
			  ,[FullMart].[dbo].[ProductDetail].[Content]
			  ,[dbo].[Product].[type]
			  ,[dbo].[User].[roleID]
			  ,[dbo].[User].[ShopID] AS [ShopID]
			  ,[dbo].[ProductDetail].[Image1] AS img1
			  ,[dbo].[ProductDetail].[Image2] AS img2
			  ,[dbo].[ProductDetail].[Image3] AS img3
			FROM [FullMart].[dbo].[Product]
				,[FullMart].[dbo].[ProductDetail]
				,[FullMart].[dbo].[State]
				,[FullMart].[dbo].[User]
			WHERE [FullMart].[dbo].[Product].[ID] = @ID
					AND [FullMart].[dbo].[Product].[ID] = [FullMart].[dbo].[ProductDetail].[ProductID]
					AND [FullMart].[dbo].[State].[id]=[FullMart].[dbo].[Product].[State]
					AND [FullMart].[dbo].[User].[ID] = [FullMart].[dbo].[Product].[PosterID]
		END
END
GO
/****** Object:  StoredProcedure [dbo].[GetOrderInfo]    Script Date: 03/05/2012 06:44:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		BTN
-- Create date: 26 Feb 2012
-- Description:	NO
-- =============================================
CREATE PROCEDURE [dbo].[GetOrderInfo]
	@OrderID		INT
AS
BEGIN

	SET NOCOUNT ON;
	
	SELECT [RecipientsEmail]
		  ,[Title]
		  ,[ProductID]
		  ,[Amount] 
		  ,[MoreDetail]      
	FROM [FullMart].[dbo].[Cart],[FullMart].[dbo].[Product]
	WHERE [FullMart].[dbo].[Cart].[ID] = @OrderID
		  AND [FullMart].[dbo].[Cart].[ProductID] = [FullMart].[dbo].[Product].[ID]
END
GO
/****** Object:  StoredProcedure [dbo].[GetNewOrders]    Script Date: 03/05/2012 06:44:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		BTN
-- Create date: 26 Feb 2012
-- Description:	NO
-- =============================================
CREATE PROCEDURE [dbo].[GetNewOrders]
	@UserID			INT
AS
BEGIN

	SET NOCOUNT ON;
	
	WITH CartInfo AS
	(
	  SELECT [FullMart].[dbo].[Cart].[ID]
			  ,[ProductID]
			  ,[email]
			  ,[Amount]
			  ,[Buyer]
			  ,[FullMart].[dbo].[Cart].[CreateDate]
			  ,[MoreDetail]
			  ,[isRead]
			  ,[RecipientsName]
			  ,[RecipientsPhone]
			  ,[RecipientsAddress]
			  ,[RecipientsEmail]
			  ,[isSubmited]
	  FROM	  [FullMart].[dbo].[Cart] JOIN [FullMart].[dbo].[Product]
			  ON /*[isRead] = 0
				 AND */[isSubmited] = 1
				 AND [type] = 1 /*Sell*/
				 AND [FullMart].[dbo].[Cart].[ProductID] = [FullMart].[dbo].[Product].[ID]
				 AND [PosterID] = @UserID
				 JOIN [FullMart].[dbo].[User]
				 ON [FullMart].[dbo].[Cart].[Buyer] = [FullMart].[dbo].[User].[ID]
	)
	SELECT * FROM CartInfo	
END
GO
/****** Object:  StoredProcedure [dbo].[GetCart]    Script Date: 03/05/2012 06:44:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		BTN
-- Create date: 26 Feb 2012
-- Description:	NO
-- =============================================
CREATE PROCEDURE [dbo].[GetCart]
	@BuyerID		INT
AS
BEGIN
	
	SET NOCOUNT ON;

	SELECT [FullMart].[dbo].[Cart].[ID]
      ,[ProductID]
      ,[FullMart].[dbo].[Product].[Title]
      ,[FullMart].[dbo].[Product].[Price]
      ,[Amount]
      ,[MoreDetail]      
	FROM [FullMart].[dbo].[Cart],[FullMart].[dbo].[Product]
	WHERE [isSubmited] = 0
		  AND [Buyer] = @BuyerID	      
	      AND [ProductID] = [FullMart].[dbo].[Product].[ID]
END
GO
/****** Object:  StoredProcedure [dbo].[UpdateProduct]    Script Date: 03/05/2012 06:44:49 ******/
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
    @Price				NVARCHAR(20),
    @Picture			NVARCHAR(300),
    @Thumbnail			NVARCHAR(300),    
    @PosterID			INT,
    @Content			NVARCHAR(MAX),
    @Title				NVARCHAR(150),
    @State				INT,
    @type				INT,
    @img1				NVARCHAR(500),
    @img2				NVARCHAR(500),
    @img3				NVARCHAR(500)
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
           ,[type]=@type
     WHERE ([FullMart].[dbo].[Product].[ID]=@ID)
     UPDATE [FullMart].[dbo].[ProductDetail]
     SET [FullMart].[dbo].[ProductDetail].[Content]=@Content,[dbo].[ProductDetail].[Image1]=@img1,[dbo].[ProductDetail].[Image2] = @img2,[dbo].[ProductDetail].[Image3] = @img3
     WHERE [FullMart].[dbo].[ProductDetail].[ProductID]=@ID
     
    
END
GO
/****** Object:  Table [dbo].[SubComment]    Script Date: 03/05/2012 06:44:49 ******/
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
INSERT [dbo].[SubComment] ([ID], [PosterID], [CommentID], [Content], [CreateDate]) VALUES (4, 4, 5, N'hizz 1 2', CAST(0x00009FFC0027AE59 AS DateTime))
INSERT [dbo].[SubComment] ([ID], [PosterID], [CommentID], [Content], [CreateDate]) VALUES (6, 3, 12, N'gio toi sub', CAST(0x00009FFF00B68330 AS DateTime))
INSERT [dbo].[SubComment] ([ID], [PosterID], [CommentID], [Content], [CreateDate]) VALUES (7, 3, 12, N'good roi :)', CAST(0x00009FFF00B69DBE AS DateTime))
INSERT [dbo].[SubComment] ([ID], [PosterID], [CommentID], [Content], [CreateDate]) VALUES (9, 2, 12, N'good', CAST(0x00009FFF00B853CC AS DateTime))
INSERT [dbo].[SubComment] ([ID], [PosterID], [CommentID], [Content], [CreateDate]) VALUES (10, 5, 11, N'tezt', CAST(0x00009FFF00BA2C89 AS DateTime))
INSERT [dbo].[SubComment] ([ID], [PosterID], [CommentID], [Content], [CreateDate]) VALUES (11, 5, 25, N'test sub cái cuối cùng', CAST(0x00009FFF00BC1889 AS DateTime))
INSERT [dbo].[SubComment] ([ID], [PosterID], [CommentID], [Content], [CreateDate]) VALUES (17, 5, 29, N'NUOP', CAST(0x0000A009008A97A3 AS DateTime))
INSERT [dbo].[SubComment] ([ID], [PosterID], [CommentID], [Content], [CreateDate]) VALUES (18, 5, 29, N'UY0W', CAST(0x0000A009008C91FD AS DateTime))
SET IDENTITY_INSERT [dbo].[SubComment] OFF
/****** Object:  StoredProcedure [dbo].[RemovePurchaseBooking]    Script Date: 03/05/2012 06:44:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		BTN
-- Create date: 26 Feb 2012
-- Description:	NO
-- =============================================
CREATE PROCEDURE [dbo].[RemovePurchaseBooking]
	@ID			INT
AS
BEGIN
	
	SET NOCOUNT ON;
	
	DELETE FROM [FullMart].[dbo].[Cart]
    WHERE [ID] = @ID
END
GO
/****** Object:  StoredProcedure [dbo].[PostSubQA]    Script Date: 03/05/2012 06:44:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		BTN
-- Create date: 17 Feb 2012
-- Description:	NO
-- =============================================
CREATE PROCEDURE [dbo].[PostSubQA] 
	@PosterID		INT,
	@AQID			INT,
	@Content		NVARCHAR(MAX)
AS
BEGIN
	
	SET NOCOUNT ON;

	IF EXISTS(SELECT [ID] FROM [FullMart].[dbo].[AnswerQuestion] WHERE [ID] = @AQID)
	BEGIN
		INSERT INTO [FullMart].[dbo].[SubAQ]
			   ([PosterID]
			   ,[AQID]
			   ,[Content]
			   ,[CreateDate])
		VALUES
			   (@PosterID
			   ,@AQID
			   ,@Content
			   ,GETUTCDATE())
	END
END
GO
/****** Object:  StoredProcedure [dbo].[MarkOrderInfoAsRead]    Script Date: 03/05/2012 06:44:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		BTN
-- Create date: 04 March
-- Description:	NO
-- =============================================
CREATE PROCEDURE [dbo].[MarkOrderInfoAsRead]
	@OrderInfoID	INT
AS
BEGIN

	SET NOCOUNT ON;

    UPDATE [FullMart].[dbo].[Cart]
	SET [isRead] = 1      
	WHERE [ID] = @OrderInfoID
END
GO
/****** Object:  StoredProcedure [dbo].[GetSubQA]    Script Date: 03/05/2012 06:44:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		BTN
-- Create date: 18 Feb 2012
-- Description:	NO
-- =============================================
CREATE PROCEDURE [dbo].[GetSubQA]
	@QAID		INT
AS
BEGIN
	
	SET NOCOUNT ON;

    SELECT [FullMart].[dbo].[SubAQ].[ID],[UserName],[AQID],[Content]
		   ,[FullMart].[dbo].[SubAQ].[CreateDate] 
	FROM [FullMart].[dbo].[SubAQ],[FullMart].[dbo].[User] 
	WHERE [AQID] = @QAID
		  AND [FullMart].[dbo].[User].[ID] = [FullMart].[dbo].[SubAQ].[PosterID] 
	ORDER BY [FullMart].[dbo].[SubAQ].[CreateDate] DESC
END
GO
/****** Object:  StoredProcedure [dbo].[GetSubComment]    Script Date: 03/05/2012 06:44:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		BTN
-- Create date: 18 Feb 2012
-- Description:	NO
-- =============================================
CREATE PROCEDURE [dbo].[GetSubComment]
	@CommentID		INT
AS
BEGIN
	
	SET NOCOUNT ON;

	SELECT [FullMart].[dbo].[SubComment].[ID]
		   ,[UserName],[CommentID]
		   ,[Content],[FullMart].[dbo].[SubComment].[CreateDate]      
	FROM [FullMart].[dbo].[SubComment]
	     ,[FullMart].[dbo].[User]
	WHERE [CommentID] = @CommentID
		  AND [FullMart].[dbo].[User].[ID] = [FullMart].[dbo].[SubComment].[PosterID]
	ORDER BY [FullMart].[dbo].[SubComment].[CreateDate] DESC
END
GO
/****** Object:  StoredProcedure [dbo].[GetCommentStatistic]    Script Date: 03/05/2012 06:44:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		BTN
-- Create date: 18 Feb 2012
-- Description:	NO
-- =============================================
CREATE PROCEDURE [dbo].[GetCommentStatistic]
	@ProductID		INT
AS
BEGIN
	
	SET NOCOUNT ON;

	SELECT [FullMart].[dbo].[Comment].[ID]
			,[UserName], (
							SELECT COUNT([FullMart].[dbo].[SubComment].[ID])
							FROM [FullMart].[dbo].[SubComment]
							WHERE [CommentID] = [FullMart].[dbo].[Comment].[ID]
						) AS [COMMENTSCOUNT]
			,[FullMart].[dbo].[Comment].[CreateDate],[Content]      
	FROM [FullMart].[dbo].[Comment],[FullMart].[dbo].[User]
	WHERE [FullMart].[dbo].[Comment].[Product] = @ProductID
		  AND [FullMart].[dbo].[User].[ID] = [FullMart].[dbo].[Comment].[PosterID]
	ORDER BY [FullMart].[dbo].[Comment].[CreateDate] DESC
END
GO
/****** Object:  StoredProcedure [dbo].[DeleteProductSubComment]    Script Date: 03/05/2012 06:44:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		BTN
-- Create date: 19 Feb 2012
-- Description:	NO
-- =============================================
CREATE PROCEDURE [dbo].[DeleteProductSubComment]
	@SubCommentID			INT
AS
BEGIN
	
	SET NOCOUNT ON;

	DELETE FROM [FullMart].[dbo].[SubComment]
    WHERE [ID] = @SubCommentID
END
GO
/****** Object:  StoredProcedure [dbo].[DeleteProductComment]    Script Date: 03/05/2012 06:44:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		BTN
-- Create date: 19 Feb 2012
-- Description:	NO
-- =============================================
CREATE PROCEDURE [dbo].[DeleteProductComment]
	@CommentID		INT
AS
BEGIN

	SET NOCOUNT ON;

    DELETE FROM [FullMart].[dbo].[SubComment]
    WHERE [CommentID] = @CommentID
    
    DELETE FROM [FullMart].[dbo].[Comment]
    WHERE [ID] = @CommentID
END
GO
/****** Object:  StoredProcedure [dbo].[AddProductSubComment]    Script Date: 03/05/2012 06:44:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		BTN
-- Create date: 19 Feb 2012
-- Description:	NO
-- =============================================
CREATE PROCEDURE [dbo].[AddProductSubComment]
	@PosterID			INT,
	@CommentID			INT,
	@Content			NVARCHAR(MAX)
AS
BEGIN
	
	SET NOCOUNT ON;

	IF EXISTS(SELECT [ID] FROM [FullMart].[dbo].[Comment] WHERE [ID] = @CommentID)
	BEGIN
		INSERT INTO [FullMart].[dbo].[SubComment]
			   ([PosterID]
			   ,[CommentID]
			   ,[Content]
			   ,[CreateDate])
		VALUES
			   (@PosterID
			   ,@CommentID
			   ,@Content
			   ,GETUTCDATE())
    END
END
GO
/****** Object:  Default [DF__aspnet_Ap__Appli__08B54D69]    Script Date: 03/05/2012 06:44:34 ******/
ALTER TABLE [dbo].[aspnet_Applications] ADD  DEFAULT (newid()) FOR [ApplicationId]
GO
/****** Object:  Default [DF_Shop_rate]    Script Date: 03/05/2012 06:44:46 ******/
ALTER TABLE [dbo].[Shop] ADD  CONSTRAINT [DF_Shop_rate]  DEFAULT ((1)) FOR [rate]
GO
/****** Object:  Default [DF_Shop_isActive]    Script Date: 03/05/2012 06:44:46 ******/
ALTER TABLE [dbo].[Shop] ADD  CONSTRAINT [DF_Shop_isActive]  DEFAULT ((0)) FOR [isActive]
GO
/****** Object:  Default [DF_Shop_isChecked]    Script Date: 03/05/2012 06:44:46 ******/
ALTER TABLE [dbo].[Shop] ADD  CONSTRAINT [DF_Shop_isChecked]  DEFAULT ((0)) FOR [isChecked]
GO
/****** Object:  Default [DF_User_ShopID]    Script Date: 03/05/2012 06:44:48 ******/
ALTER TABLE [dbo].[User] ADD  CONSTRAINT [DF_User_ShopID]  DEFAULT ((-1)) FOR [ShopID]
GO
/****** Object:  Default [DF_User_isActive]    Script Date: 03/05/2012 06:44:48 ******/
ALTER TABLE [dbo].[User] ADD  CONSTRAINT [DF_User_isActive]  DEFAULT ((1)) FOR [isActive]
GO
/****** Object:  Default [DF_User_isBanned]    Script Date: 03/05/2012 06:44:48 ******/
ALTER TABLE [dbo].[User] ADD  CONSTRAINT [DF_User_isBanned]  DEFAULT ((0)) FOR [isBanned]
GO
/****** Object:  Default [DF__aspnet_Us__UserI__0C85DE4D]    Script Date: 03/05/2012 06:44:48 ******/
ALTER TABLE [dbo].[aspnet_Users] ADD  DEFAULT (newid()) FOR [UserId]
GO
/****** Object:  Default [DF__aspnet_Us__Mobil__0D7A0286]    Script Date: 03/05/2012 06:44:48 ******/
ALTER TABLE [dbo].[aspnet_Users] ADD  DEFAULT (NULL) FOR [MobileAlias]
GO
/****** Object:  Default [DF__aspnet_Us__IsAno__0E6E26BF]    Script Date: 03/05/2012 06:44:48 ******/
ALTER TABLE [dbo].[aspnet_Users] ADD  DEFAULT ((0)) FOR [IsAnonymous]
GO
/****** Object:  Default [DF__aspnet_Ro__RoleI__0F624AF8]    Script Date: 03/05/2012 06:44:48 ******/
ALTER TABLE [dbo].[aspnet_Roles] ADD  DEFAULT (newid()) FOR [RoleId]
GO
/****** Object:  Default [DF_Product_type]    Script Date: 03/05/2012 06:44:49 ******/
ALTER TABLE [dbo].[Product] ADD  CONSTRAINT [DF_Product_type]  DEFAULT ((2)) FOR [type]
GO
/****** Object:  Default [DF_Cart_Amount]    Script Date: 03/05/2012 06:44:49 ******/
ALTER TABLE [dbo].[Cart] ADD  CONSTRAINT [DF_Cart_Amount]  DEFAULT ((0)) FOR [Amount]
GO
/****** Object:  ForeignKey [FK_SubCategory_Category]    Script Date: 03/05/2012 06:44:46 ******/
ALTER TABLE [dbo].[SubCategory]  WITH CHECK ADD  CONSTRAINT [FK_SubCategory_Category] FOREIGN KEY([CategoryID])
REFERENCES [dbo].[Category] ([ID])
GO
ALTER TABLE [dbo].[SubCategory] CHECK CONSTRAINT [FK_SubCategory_Category]
GO
/****** Object:  ForeignKey [FK_Zone_State]    Script Date: 03/05/2012 06:44:47 ******/
ALTER TABLE [dbo].[Zone]  WITH CHECK ADD  CONSTRAINT [FK_Zone_State] FOREIGN KEY([state])
REFERENCES [dbo].[State] ([id])
GO
ALTER TABLE [dbo].[Zone] CHECK CONSTRAINT [FK_Zone_State]
GO
/****** Object:  ForeignKey [FK_User_Role]    Script Date: 03/05/2012 06:44:48 ******/
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_Role] FOREIGN KEY([roleID])
REFERENCES [dbo].[Role] ([ID])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_Role]
GO
/****** Object:  ForeignKey [FK__aspnet_Us__Appli__151B244E]    Script Date: 03/05/2012 06:44:48 ******/
ALTER TABLE [dbo].[aspnet_Users]  WITH CHECK ADD FOREIGN KEY([ApplicationId])
REFERENCES [dbo].[aspnet_Applications] ([ApplicationId])
GO
/****** Object:  ForeignKey [FK__aspnet_Us__Appli__160F4887]    Script Date: 03/05/2012 06:44:48 ******/
ALTER TABLE [dbo].[aspnet_Users]  WITH CHECK ADD FOREIGN KEY([ApplicationId])
REFERENCES [dbo].[aspnet_Applications] ([ApplicationId])
GO
/****** Object:  ForeignKey [FK__aspnet_Ro__Appli__17036CC0]    Script Date: 03/05/2012 06:44:48 ******/
ALTER TABLE [dbo].[aspnet_Roles]  WITH CHECK ADD FOREIGN KEY([ApplicationId])
REFERENCES [dbo].[aspnet_Applications] ([ApplicationId])
GO
/****** Object:  ForeignKey [FK__aspnet_Ro__Appli__17F790F9]    Script Date: 03/05/2012 06:44:48 ******/
ALTER TABLE [dbo].[aspnet_Roles]  WITH CHECK ADD FOREIGN KEY([ApplicationId])
REFERENCES [dbo].[aspnet_Applications] ([ApplicationId])
GO
/****** Object:  ForeignKey [FK_AnswerQuestion_User]    Script Date: 03/05/2012 06:44:48 ******/
ALTER TABLE [dbo].[AnswerQuestion]  WITH CHECK ADD  CONSTRAINT [FK_AnswerQuestion_User] FOREIGN KEY([PosterID])
REFERENCES [dbo].[User] ([ID])
GO
ALTER TABLE [dbo].[AnswerQuestion] CHECK CONSTRAINT [FK_AnswerQuestion_User]
GO
/****** Object:  ForeignKey [FK__aspnet_Us__RoleI__1CBC4616]    Script Date: 03/05/2012 06:44:48 ******/
ALTER TABLE [dbo].[aspnet_UsersInRoles]  WITH CHECK ADD FOREIGN KEY([RoleId])
REFERENCES [dbo].[aspnet_Roles] ([RoleId])
GO
/****** Object:  ForeignKey [FK__aspnet_Us__UserI__1DB06A4F]    Script Date: 03/05/2012 06:44:48 ******/
ALTER TABLE [dbo].[aspnet_UsersInRoles]  WITH CHECK ADD FOREIGN KEY([UserId])
REFERENCES [dbo].[aspnet_Users] ([UserId])
GO
/****** Object:  ForeignKey [FK_Product_MemsPostType]    Script Date: 03/05/2012 06:44:49 ******/
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_MemsPostType] FOREIGN KEY([type])
REFERENCES [dbo].[MemsPostType] ([ID])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_MemsPostType]
GO
/****** Object:  ForeignKey [FK_Product_SubCategory]    Script Date: 03/05/2012 06:44:49 ******/
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_SubCategory] FOREIGN KEY([SubCategoryID])
REFERENCES [dbo].[SubCategory] ([ID])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_SubCategory]
GO
/****** Object:  ForeignKey [FK_Product_User]    Script Date: 03/05/2012 06:44:49 ******/
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_User] FOREIGN KEY([PosterID])
REFERENCES [dbo].[User] ([ID])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_User]
GO
/****** Object:  ForeignKey [FK_News_User]    Script Date: 03/05/2012 06:44:49 ******/
ALTER TABLE [dbo].[News]  WITH CHECK ADD  CONSTRAINT [FK_News_User] FOREIGN KEY([PosterID])
REFERENCES [dbo].[User] ([ID])
GO
ALTER TABLE [dbo].[News] CHECK CONSTRAINT [FK_News_User]
GO
/****** Object:  ForeignKey [FK_SubAQ_AnswerQuestion]    Script Date: 03/05/2012 06:44:49 ******/
ALTER TABLE [dbo].[SubAQ]  WITH CHECK ADD  CONSTRAINT [FK_SubAQ_AnswerQuestion] FOREIGN KEY([AQID])
REFERENCES [dbo].[AnswerQuestion] ([ID])
GO
ALTER TABLE [dbo].[SubAQ] CHECK CONSTRAINT [FK_SubAQ_AnswerQuestion]
GO
/****** Object:  ForeignKey [FK_SubAQ_User]    Script Date: 03/05/2012 06:44:49 ******/
ALTER TABLE [dbo].[SubAQ]  WITH CHECK ADD  CONSTRAINT [FK_SubAQ_User] FOREIGN KEY([PosterID])
REFERENCES [dbo].[User] ([ID])
GO
ALTER TABLE [dbo].[SubAQ] CHECK CONSTRAINT [FK_SubAQ_User]
GO
/****** Object:  ForeignKey [FK_ProductDetail_Product]    Script Date: 03/05/2012 06:44:49 ******/
ALTER TABLE [dbo].[ProductDetail]  WITH CHECK ADD  CONSTRAINT [FK_ProductDetail_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ProductDetail] CHECK CONSTRAINT [FK_ProductDetail_Product]
GO
/****** Object:  ForeignKey [FK_Cart_Product]    Script Date: 03/05/2012 06:44:49 ******/
ALTER TABLE [dbo].[Cart]  WITH CHECK ADD  CONSTRAINT [FK_Cart_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ID])
GO
ALTER TABLE [dbo].[Cart] CHECK CONSTRAINT [FK_Cart_Product]
GO
/****** Object:  ForeignKey [FK_Cart_User]    Script Date: 03/05/2012 06:44:49 ******/
ALTER TABLE [dbo].[Cart]  WITH CHECK ADD  CONSTRAINT [FK_Cart_User] FOREIGN KEY([Buyer])
REFERENCES [dbo].[User] ([ID])
GO
ALTER TABLE [dbo].[Cart] CHECK CONSTRAINT [FK_Cart_User]
GO
/****** Object:  ForeignKey [FK_Comment_Product]    Script Date: 03/05/2012 06:44:49 ******/
ALTER TABLE [dbo].[Comment]  WITH CHECK ADD  CONSTRAINT [FK_Comment_Product] FOREIGN KEY([Product])
REFERENCES [dbo].[Product] ([ID])
GO
ALTER TABLE [dbo].[Comment] CHECK CONSTRAINT [FK_Comment_Product]
GO
/****** Object:  ForeignKey [FK_Comment_User]    Script Date: 03/05/2012 06:44:49 ******/
ALTER TABLE [dbo].[Comment]  WITH CHECK ADD  CONSTRAINT [FK_Comment_User] FOREIGN KEY([PosterID])
REFERENCES [dbo].[User] ([ID])
GO
ALTER TABLE [dbo].[Comment] CHECK CONSTRAINT [FK_Comment_User]
GO
/****** Object:  ForeignKey [FK_SubComment_Comment]    Script Date: 03/05/2012 06:44:49 ******/
ALTER TABLE [dbo].[SubComment]  WITH CHECK ADD  CONSTRAINT [FK_SubComment_Comment] FOREIGN KEY([CommentID])
REFERENCES [dbo].[Comment] ([ID])
GO
ALTER TABLE [dbo].[SubComment] CHECK CONSTRAINT [FK_SubComment_Comment]
GO
/****** Object:  ForeignKey [FK_SubComment_User]    Script Date: 03/05/2012 06:44:49 ******/
ALTER TABLE [dbo].[SubComment]  WITH CHECK ADD  CONSTRAINT [FK_SubComment_User] FOREIGN KEY([PosterID])
REFERENCES [dbo].[User] ([ID])
GO
ALTER TABLE [dbo].[SubComment] CHECK CONSTRAINT [FK_SubComment_User]
GO
