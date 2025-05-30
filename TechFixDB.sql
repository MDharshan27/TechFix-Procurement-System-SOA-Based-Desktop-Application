USE [master]
GO
/****** Object:  Database [TechFix]    Script Date: 3/8/2025 10:22:07 AM ******/
CREATE DATABASE [TechFix]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'TechFix', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\TechFix.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'TechFix_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\TechFix_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [TechFix] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TechFix].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [TechFix] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [TechFix] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [TechFix] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [TechFix] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [TechFix] SET ARITHABORT OFF 
GO
ALTER DATABASE [TechFix] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [TechFix] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [TechFix] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [TechFix] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [TechFix] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [TechFix] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [TechFix] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [TechFix] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [TechFix] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [TechFix] SET  ENABLE_BROKER 
GO
ALTER DATABASE [TechFix] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [TechFix] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [TechFix] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [TechFix] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [TechFix] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [TechFix] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [TechFix] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [TechFix] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [TechFix] SET  MULTI_USER 
GO
ALTER DATABASE [TechFix] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [TechFix] SET DB_CHAINING OFF 
GO
ALTER DATABASE [TechFix] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [TechFix] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [TechFix] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [TechFix] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [TechFix] SET QUERY_STORE = ON
GO
ALTER DATABASE [TechFix] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [TechFix]
GO
/****** Object:  Table [dbo].[Inventory]    Script Date: 3/8/2025 10:22:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Inventory](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ItemName] [varchar](50) NOT NULL,
	[Quantity] [int] NOT NULL,
	[Price] [decimal](18, 0) NOT NULL,
	[Discount] [decimal](18, 0) NOT NULL,
 CONSTRAINT [PK_Inventory] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 3/8/2025 10:22:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[OrderId] [int] IDENTITY(1,1) NOT NULL,
	[SupplierUsername] [varchar](100) NOT NULL,
	[ItemName] [nvarchar](100) NOT NULL,
	[Quantity] [int] NOT NULL,
	[Price] [decimal](10, 2) NOT NULL,
	[Discount] [decimal](5, 2) NULL,
	[Status] [varchar](20) NOT NULL,
	[OrderDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[OrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 3/8/2025 10:22:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[ProductId] [int] IDENTITY(1,1) NOT NULL,
	[ItemName] [nvarchar](100) NULL,
	[Quantity] [int] NULL,
	[Price] [decimal](18, 2) NULL,
	[Discount] [decimal](5, 2) NULL,
	[SupplierUsername] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Quotations]    Script Date: 3/8/2025 10:22:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Quotations](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ItemName] [varchar](255) NOT NULL,
	[Price] [decimal](10, 2) NOT NULL,
	[SupplierUsername] [varchar](100) NOT NULL,
	[Response] [text] NULL,
	[Status] [varchar](20) NOT NULL,
	[RequestDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 3/8/2025 10:22:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](255) NOT NULL,
	[Password_Hash] [nvarchar](255) NOT NULL,
	[Role] [nvarchar](10) NOT NULL,
	[Email] [nvarchar](255) NOT NULL,
	[Contact] [nvarchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Orders] ADD  DEFAULT ((0)) FOR [Discount]
GO
ALTER TABLE [dbo].[Orders] ADD  DEFAULT ('Pending') FOR [Status]
GO
ALTER TABLE [dbo].[Orders] ADD  DEFAULT (getdate()) FOR [OrderDate]
GO
ALTER TABLE [dbo].[Quotations] ADD  DEFAULT ('Pending') FOR [Status]
GO
ALTER TABLE [dbo].[Quotations] ADD  DEFAULT (getdate()) FOR [RequestDate]
GO
ALTER TABLE [dbo].[Users] ADD  DEFAULT ('Supplier') FOR [Role]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD CHECK  (([Discount]>=(0)))
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD CHECK  (([Price]>=(0)))
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD CHECK  (([Quantity]>(0)))
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [CK_Status] CHECK  (([Status]='Delivered' OR [Status]='Shipping' OR [Status]='Pending'))
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [CK_Status]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD CHECK  (([Discount]>=(0) AND [Discount]<=(100)))
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD CHECK  (([Price]>=(0)))
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD CHECK  (([Quantity]>=(0)))
GO
ALTER TABLE [dbo].[Quotations]  WITH CHECK ADD CHECK  (([Price]>=(0)))
GO
ALTER TABLE [dbo].[Quotations]  WITH CHECK ADD CHECK  (([Status]='Responded' OR [Status]='Pending'))
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD CHECK  (([Role]='Supplier' OR [Role]='Admin'))
GO
USE [master]
GO
ALTER DATABASE [TechFix] SET  READ_WRITE 
GO
