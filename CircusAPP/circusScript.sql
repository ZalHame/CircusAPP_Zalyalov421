USE [master]
GO
/****** Object:  Database [Circus]    Script Date: 12.03.2024 21:51:46 ******/
CREATE DATABASE [Circus]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Circus', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\Circus.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Circus_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\Circus_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [Circus] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Circus].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Circus] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Circus] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Circus] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Circus] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Circus] SET ARITHABORT OFF 
GO
ALTER DATABASE [Circus] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Circus] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Circus] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Circus] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Circus] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Circus] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Circus] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Circus] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Circus] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Circus] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Circus] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Circus] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Circus] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Circus] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Circus] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Circus] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Circus] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Circus] SET RECOVERY FULL 
GO
ALTER DATABASE [Circus] SET  MULTI_USER 
GO
ALTER DATABASE [Circus] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Circus] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Circus] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Circus] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Circus] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Circus] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Circus', N'ON'
GO
ALTER DATABASE [Circus] SET QUERY_STORE = ON
GO
ALTER DATABASE [Circus] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [Circus]
GO
/****** Object:  Table [dbo].[Animal]    Script Date: 12.03.2024 21:51:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Animal](
	[Animal_ID] [int] IDENTITY(1,1) NOT NULL,
	[Animal_Name] [varchar](15) NOT NULL,
	[Animal_Age] [int] NOT NULL,
	[Gender_ID] [int] NOT NULL,
	[Animal_Height] [decimal](18, 0) NOT NULL,
	[Recommend_Food] [text] NULL,
	[Care] [text] NULL,
	[User_ID] [int] NOT NULL,
 CONSTRAINT [PK_Animal] PRIMARY KEY CLUSTERED 
(
	[Animal_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AnimalTraining]    Script Date: 12.03.2024 21:51:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AnimalTraining](
	[AnimalTraining_ID] [int] IDENTITY(1,1) NOT NULL,
	[Animal_ID] [int] NOT NULL,
	[Number_Hours] [int] NOT NULL,
	[Start_Time] [date] NOT NULL,
 CONSTRAINT [PK_Training] PRIMARY KEY CLUSTERED 
(
	[AnimalTraining_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Artist]    Script Date: 12.03.2024 21:51:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Artist](
	[Artist_ID] [int] IDENTITY(1,1) NOT NULL,
	[User_ID] [int] NOT NULL,
	[ArtistType_ID] [int] NOT NULL,
	[Perfomance_Number] [int] NULL,
 CONSTRAINT [PK_Artist] PRIMARY KEY CLUSTERED 
(
	[Artist_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ArtistTraining]    Script Date: 12.03.2024 21:51:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ArtistTraining](
	[ArtistTraining_ID] [int] IDENTITY(1,1) NOT NULL,
	[User_ID] [int] NOT NULL,
	[Start_Time] [date] NOT NULL,
	[Number_Hours] [int] NOT NULL,
 CONSTRAINT [PK_ArtistTraining] PRIMARY KEY CLUSTERED 
(
	[ArtistTraining_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ArtistType]    Script Date: 12.03.2024 21:51:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ArtistType](
	[ArtistType_ID] [int] IDENTITY(1,1) NOT NULL,
	[ArtistType_Name] [varchar](20) NOT NULL,
 CONSTRAINT [PK_ArtistType] PRIMARY KEY CLUSTERED 
(
	[ArtistType_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Gender]    Script Date: 12.03.2024 21:51:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Gender](
	[Gender_ID] [int] IDENTITY(1,1) NOT NULL,
	[Gender_Name] [varchar](10) NOT NULL,
 CONSTRAINT [PK_Gender] PRIMARY KEY CLUSTERED 
(
	[Gender_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 12.03.2024 21:51:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[Role_ID] [int] IDENTITY(1,1) NOT NULL,
	[Role_Name] [varchar](20) NOT NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[Role_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 12.03.2024 21:51:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[User_ID] [int] IDENTITY(1,1) NOT NULL,
	[Login] [varchar](20) NOT NULL,
	[Password] [varchar](20) NOT NULL,
	[FirstName] [varchar](20) NOT NULL,
	[LastName] [varchar](20) NOT NULL,
	[Role_ID] [int] NOT NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[User_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Animal] ON 

INSERT [dbo].[Animal] ([Animal_ID], [Animal_Name], [Animal_Age], [Gender_ID], [Animal_Height], [Recommend_Food], [Care], [User_ID]) VALUES (1, N'Дамбо', 2, 1, CAST(204 AS Decimal(18, 0)), N'Ест овёс', N'', 3)
SET IDENTITY_INSERT [dbo].[Animal] OFF
GO
SET IDENTITY_INSERT [dbo].[Gender] ON 

INSERT [dbo].[Gender] ([Gender_ID], [Gender_Name]) VALUES (1, N'Мужской')
INSERT [dbo].[Gender] ([Gender_ID], [Gender_Name]) VALUES (2, N'Женский')
SET IDENTITY_INSERT [dbo].[Gender] OFF
GO
SET IDENTITY_INSERT [dbo].[Role] ON 

INSERT [dbo].[Role] ([Role_ID], [Role_Name]) VALUES (1, N'Администратор')
INSERT [dbo].[Role] ([Role_ID], [Role_Name]) VALUES (2, N'Артист')
INSERT [dbo].[Role] ([Role_ID], [Role_Name]) VALUES (3, N'Дрессировщик')
SET IDENTITY_INSERT [dbo].[Role] OFF
GO
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([User_ID], [Login], [Password], [FirstName], [LastName], [Role_ID]) VALUES (1, N'admin', N'admin', N'Admin', N'Admin', 1)
INSERT [dbo].[User] ([User_ID], [Login], [Password], [FirstName], [LastName], [Role_ID]) VALUES (2, N'admin1', N'adm1in', N'Admin1', N'Admin1', 1)
INSERT [dbo].[User] ([User_ID], [Login], [Password], [FirstName], [LastName], [Role_ID]) VALUES (3, N'trainer', N'trainer', N'AnimalTrainer', N'AnimalTrainer', 3)
INSERT [dbo].[User] ([User_ID], [Login], [Password], [FirstName], [LastName], [Role_ID]) VALUES (4, N'artist', N'artist', N'Artist', N'Artist', 2)
INSERT [dbo].[User] ([User_ID], [Login], [Password], [FirstName], [LastName], [Role_ID]) VALUES (5, N'trainer1', N'trainer1', N'AnimalTrainer1', N'AnimalTrainer1', 3)
SET IDENTITY_INSERT [dbo].[User] OFF
GO
ALTER TABLE [dbo].[Animal]  WITH CHECK ADD  CONSTRAINT [FK_Animal_Gender] FOREIGN KEY([Gender_ID])
REFERENCES [dbo].[Gender] ([Gender_ID])
GO
ALTER TABLE [dbo].[Animal] CHECK CONSTRAINT [FK_Animal_Gender]
GO
ALTER TABLE [dbo].[Animal]  WITH CHECK ADD  CONSTRAINT [FK_Animal_User] FOREIGN KEY([User_ID])
REFERENCES [dbo].[User] ([User_ID])
GO
ALTER TABLE [dbo].[Animal] CHECK CONSTRAINT [FK_Animal_User]
GO
ALTER TABLE [dbo].[AnimalTraining]  WITH CHECK ADD  CONSTRAINT [FK_AnimalTraining_Animal] FOREIGN KEY([Animal_ID])
REFERENCES [dbo].[Animal] ([Animal_ID])
GO
ALTER TABLE [dbo].[AnimalTraining] CHECK CONSTRAINT [FK_AnimalTraining_Animal]
GO
ALTER TABLE [dbo].[Artist]  WITH CHECK ADD  CONSTRAINT [FK_Artist_ArtistType] FOREIGN KEY([ArtistType_ID])
REFERENCES [dbo].[ArtistType] ([ArtistType_ID])
GO
ALTER TABLE [dbo].[Artist] CHECK CONSTRAINT [FK_Artist_ArtistType]
GO
ALTER TABLE [dbo].[Artist]  WITH CHECK ADD  CONSTRAINT [FK_Artist_User] FOREIGN KEY([User_ID])
REFERENCES [dbo].[User] ([User_ID])
GO
ALTER TABLE [dbo].[Artist] CHECK CONSTRAINT [FK_Artist_User]
GO
ALTER TABLE [dbo].[ArtistTraining]  WITH CHECK ADD  CONSTRAINT [FK_ArtistTraining_User] FOREIGN KEY([User_ID])
REFERENCES [dbo].[User] ([User_ID])
GO
ALTER TABLE [dbo].[ArtistTraining] CHECK CONSTRAINT [FK_ArtistTraining_User]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_Role] FOREIGN KEY([Role_ID])
REFERENCES [dbo].[Role] ([Role_ID])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_Role]
GO
USE [master]
GO
ALTER DATABASE [Circus] SET  READ_WRITE 
GO
