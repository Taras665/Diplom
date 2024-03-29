USE [master]
GO
/****** Object:  Database [SharovBallistics]    Script Date: 18.06.2022 5:06:02 ******/
CREATE DATABASE [SharovBallistics] ON  PRIMARY 
( NAME = N'SharovBallistics', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10.SQLEXPRESS\MSSQL\DATA\SharovBallistics.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'SharovBallistics_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10.SQLEXPRESS\MSSQL\DATA\SharovBallistics_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [SharovBallistics] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SharovBallistics].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SharovBallistics] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SharovBallistics] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SharovBallistics] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SharovBallistics] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SharovBallistics] SET ARITHABORT OFF 
GO
ALTER DATABASE [SharovBallistics] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [SharovBallistics] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SharovBallistics] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SharovBallistics] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SharovBallistics] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SharovBallistics] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SharovBallistics] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SharovBallistics] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SharovBallistics] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SharovBallistics] SET  DISABLE_BROKER 
GO
ALTER DATABASE [SharovBallistics] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SharovBallistics] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SharovBallistics] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SharovBallistics] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SharovBallistics] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SharovBallistics] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [SharovBallistics] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SharovBallistics] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [SharovBallistics] SET  MULTI_USER 
GO
ALTER DATABASE [SharovBallistics] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SharovBallistics] SET DB_CHAINING OFF 
GO
USE [SharovBallistics]
GO
/****** Object:  Table [dbo].[LabWork]    Script Date: 18.06.2022 5:06:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LabWork](
	[id] [int] NOT NULL,
	[maxLenghtValue] [float] NULL,
	[maxLenghtTimeValue] [float] NULL,
	[maxHeightValue] [float] NULL,
	[maxHeightTimeValue] [float] NULL,
	[correctAngleValue] [decimal](18, 0) NULL,
	[correctAngleValueVar2] [decimal](18, 0) NULL,
	[correctTargetValue] [float] NULL,
	[nameGun] [nvarchar](50) NULL,
 CONSTRAINT [PK_LabWork] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LabWorkStudent]    Script Date: 18.06.2022 5:06:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LabWorkStudent](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[IdStudent] [int] NULL,
	[IdLab] [int] NULL,
	[maxLenght] [bit] NULL,
	[maxHeight] [bit] NULL,
	[correctWeight] [bit] NULL,
	[correctCaliber] [bit] NULL,
	[correctCRF] [bit] NULL,
	[correctTarget] [bit] NULL,
	[markStudent] [int] NULL,
 CONSTRAINT [PK_LabWorkStudent] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LogHistory]    Script Date: 18.06.2022 5:06:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LogHistory](
	[id] [int] IDENTITY(0,1) NOT NULL,
	[Login] [nvarchar](100) NULL,
	[TimeLogin] [datetime2](7) NULL,
	[ResultLogin] [bit] NULL,
 CONSTRAINT [PK_LogHistory] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 18.06.2022 5:06:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[id] [int] NOT NULL,
	[Title] [nchar](10) NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Student]    Script Date: 18.06.2022 5:06:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Student](
	[idStudent] [int] NOT NULL,
	[LastName] [nvarchar](50) NULL,
	[FirstName] [nvarchar](50) NULL,
	[Grade] [nvarchar](50) NULL,
 CONSTRAINT [PK_Student] PRIMARY KEY CLUSTERED 
(
	[idStudent] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Teacher]    Script Date: 18.06.2022 5:06:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Teacher](
	[idTeacher] [int] NOT NULL,
	[LastName] [nvarchar](100) NULL,
	[FirstName] [nvarchar](100) NULL,
	[MiddleName] [nvarchar](100) NULL,
 CONSTRAINT [PK_Teacher] PRIMARY KEY CLUSTERED 
(
	[idTeacher] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserLogin]    Script Date: 18.06.2022 5:06:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserLogin](
	[id] [int] IDENTITY(0,1) NOT NULL,
	[Email] [nvarchar](100) NULL,
	[Password] [nvarchar](100) NULL,
	[IdRole] [int] NULL,
 CONSTRAINT [PK_UserLogin] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[LabWorkStudent]  WITH CHECK ADD  CONSTRAINT [FK_LabWorkStudent_LabWork] FOREIGN KEY([IdLab])
REFERENCES [dbo].[LabWork] ([id])
GO
ALTER TABLE [dbo].[LabWorkStudent] CHECK CONSTRAINT [FK_LabWorkStudent_LabWork]
GO
ALTER TABLE [dbo].[LabWorkStudent]  WITH CHECK ADD  CONSTRAINT [FK_LabWorkStudent_Student] FOREIGN KEY([IdStudent])
REFERENCES [dbo].[Student] ([idStudent])
GO
ALTER TABLE [dbo].[LabWorkStudent] CHECK CONSTRAINT [FK_LabWorkStudent_Student]
GO
ALTER TABLE [dbo].[Student]  WITH CHECK ADD  CONSTRAINT [FK_Student_UserLogin] FOREIGN KEY([idStudent])
REFERENCES [dbo].[UserLogin] ([id])
GO
ALTER TABLE [dbo].[Student] CHECK CONSTRAINT [FK_Student_UserLogin]
GO
ALTER TABLE [dbo].[Teacher]  WITH CHECK ADD  CONSTRAINT [FK_Teacher_UserLogin1] FOREIGN KEY([idTeacher])
REFERENCES [dbo].[UserLogin] ([id])
GO
ALTER TABLE [dbo].[Teacher] CHECK CONSTRAINT [FK_Teacher_UserLogin1]
GO
ALTER TABLE [dbo].[UserLogin]  WITH CHECK ADD  CONSTRAINT [FK_UserLogin_Role1] FOREIGN KEY([IdRole])
REFERENCES [dbo].[Role] ([id])
GO
ALTER TABLE [dbo].[UserLogin] CHECK CONSTRAINT [FK_UserLogin_Role1]
GO
USE [master]
GO
ALTER DATABASE [SharovBallistics] SET  READ_WRITE 
GO
