USE [master]
GO
/****** Object:  Database [!ESTY&TAMAR]    Script Date: 05/08/2019 10:30:52 ******/
CREATE DATABASE [!ESTY&TAMAR] ON  PRIMARY 
( NAME = N'!ESTY&TAMAR', FILENAME = N'D:\SQL-DATA\!ESTY&TAMAR.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'!ESTY&TAMAR_log', FILENAME = N'D:\SQL-DATA\!ESTY&TAMAR_log.ldf' , SIZE = 3840KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [!ESTY&TAMAR] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [!ESTY&TAMAR].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [!ESTY&TAMAR] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [!ESTY&TAMAR] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [!ESTY&TAMAR] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [!ESTY&TAMAR] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [!ESTY&TAMAR] SET ARITHABORT OFF 
GO
ALTER DATABASE [!ESTY&TAMAR] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [!ESTY&TAMAR] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [!ESTY&TAMAR] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [!ESTY&TAMAR] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [!ESTY&TAMAR] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [!ESTY&TAMAR] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [!ESTY&TAMAR] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [!ESTY&TAMAR] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [!ESTY&TAMAR] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [!ESTY&TAMAR] SET  DISABLE_BROKER 
GO
ALTER DATABASE [!ESTY&TAMAR] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [!ESTY&TAMAR] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [!ESTY&TAMAR] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [!ESTY&TAMAR] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [!ESTY&TAMAR] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [!ESTY&TAMAR] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [!ESTY&TAMAR] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [!ESTY&TAMAR] SET RECOVERY FULL 
GO
ALTER DATABASE [!ESTY&TAMAR] SET  MULTI_USER 
GO
ALTER DATABASE [!ESTY&TAMAR] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [!ESTY&TAMAR] SET DB_CHAINING OFF 
GO
EXEC sys.sp_db_vardecimal_storage_format N'!ESTY&TAMAR', N'ON'
GO
USE [!ESTY&TAMAR]
GO
/****** Object:  User [students\hitmachut]    Script Date: 05/08/2019 10:30:53 ******/
CREATE USER [students\hitmachut] FOR LOGIN [STUDENTS\hitmachut] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [students\hitmachut]
GO
ALTER ROLE [db_accessadmin] ADD MEMBER [students\hitmachut]
GO
ALTER ROLE [db_securityadmin] ADD MEMBER [students\hitmachut]
GO
ALTER ROLE [db_ddladmin] ADD MEMBER [students\hitmachut]
GO
ALTER ROLE [db_backupoperator] ADD MEMBER [students\hitmachut]
GO
ALTER ROLE [db_datareader] ADD MEMBER [students\hitmachut]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [students\hitmachut]
GO
ALTER ROLE [db_denydatareader] ADD MEMBER [students\hitmachut]
GO
ALTER ROLE [db_denydatawriter] ADD MEMBER [students\hitmachut]
GO
/****** Object:  Table [dbo].[Absence]    Script Date: 05/08/2019 10:30:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Absence](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Absence] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AbsencesForTeacher]    Script Date: 05/08/2019 10:30:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AbsencesForTeacher](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Type] [int] NOT NULL,
	[TeacherId] [int] NOT NULL,
	[FromDate] [datetime] NOT NULL,
	[ToDate] [datetime] NOT NULL,
	[FromLesson] [int] NULL,
	[ToLesson] [int] NULL,
	[TeacherStandIn] [int] NULL,
 CONSTRAINT [PK_AbsencesForTeacher] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Class]    Script Date: 05/08/2019 10:30:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Class](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Num] [int] NOT NULL,
	[Name] [nvarchar](10) NOT NULL,
	[Layer] [int] NOT NULL,
	[Number] [int] NOT NULL,
	[SchoolType] [int] NULL,
 CONSTRAINT [PK_Classes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ClassesForGroup]    Script Date: 05/08/2019 10:30:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClassesForGroup](
	[GroupId] [int] NOT NULL,
	[ClassId] [int] NOT NULL,
 CONSTRAINT [PK_ClassesForGroup] PRIMARY KEY CLUSTERED 
(
	[GroupId] ASC,
	[ClassId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ClassesForOccasion]    Script Date: 05/08/2019 10:30:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClassesForOccasion](
	[OccasionId] [int] NOT NULL,
	[ClassId] [int] NOT NULL,
 CONSTRAINT [PK_ClassesForOcation] PRIMARY KEY CLUSTERED 
(
	[OccasionId] ASC,
	[ClassId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dairy]    Script Date: 05/08/2019 10:30:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dairy](
	[Id] [int] NOT NULL,
	[Num] [int] NULL,
	[TeacherId] [int] NULL,
	[SubjectId] [int] NULL,
	[TypeId] [int] NULL,
	[ClassId] [int] NULL,
	[RoomId] [int] NULL,
	[IsGrouped] [bit] NOT NULL,
	[OccasionId] [int] NULL,
	[Reforma] [int] NULL,
	[FromDate] [date] NOT NULL,
	[ToDate] [date] NOT NULL,
	[Hour] [int] NOT NULL,
	[CalculateHours] [decimal](4, 2) NULL,
	[Cause] [int] NULL,
 CONSTRAINT [PK_Groups_1] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DairyForClasses]    Script Date: 05/08/2019 10:30:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DairyForClasses](
	[DairyId] [int] NOT NULL,
	[ClassId] [int] NOT NULL,
 CONSTRAINT [PK_DairyForClasses] PRIMARY KEY CLUSTERED 
(
	[DairyId] ASC,
	[ClassId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Group]    Script Date: 05/08/2019 10:30:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Group](
	[Id] [int] NOT NULL,
	[Num] [int] NOT NULL,
	[Teacher] [int] NULL,
	[Subject] [int] NULL,
	[Room] [int] NULL,
	[Hours] [int] NULL,
	[CalculateHours] [decimal](4, 2) NULL,
	[SchoolType] [int] NULL,
	[Reforma] [int] NULL,
	[PayAbsence] [int] NULL,
	[HourType] [int] NULL,
	[SubHourType] [int] NULL,
 CONSTRAINT [PK_Group] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HourType]    Script Date: 05/08/2019 10:30:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HourType](
	[Id] [int] NOT NULL,
	[ParentId] [int] NULL,
	[Name] [nvarchar](70) NOT NULL,
 CONSTRAINT [PK_HourType] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Occasion]    Script Date: 05/08/2019 10:30:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Occasion](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FromDate] [date] NULL,
	[ToDate] [date] NULL,
	[FromLesson] [int] NULL,
	[ToLesson] [int] NULL,
	[OccasionType] [int] NULL,
 CONSTRAINT [PK_Ocation_1] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OccasionType]    Script Date: 05/08/2019 10:30:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OccasionType](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Ocation] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PayAbsence]    Script Date: 05/08/2019 10:30:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PayAbsence](
	[Id] [int] NOT NULL,
	[Name] [nvarchar](30) NOT NULL,
	[IsStandart] [bit] NULL,
 CONSTRAINT [PK_GormimMeshalmim] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PayAbsencesForTeacher]    Script Date: 05/08/2019 10:30:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PayAbsencesForTeacher](
	[IdTeacher] [int] NOT NULL,
	[IdPayAbsence] [int] NOT NULL,
 CONSTRAINT [PK_PayAbsencesForTeacher] PRIMARY KEY CLUSTERED 
(
	[IdTeacher] ASC,
	[IdPayAbsence] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Reforma]    Script Date: 05/08/2019 10:30:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reforma](
	[Id] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Reforma] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Room]    Script Date: 05/08/2019 10:30:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Room](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Floor] [int] NOT NULL,
	[Number] [int] NOT NULL,
	[ClassId] [int] NULL,
	[UseFor] [nvarchar](20) NULL,
 CONSTRAINT [PK_Room] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RoomsForOccasion]    Script Date: 05/08/2019 10:30:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RoomsForOccasion](
	[OccasionId] [int] NOT NULL,
	[RoomId] [int] NOT NULL,
 CONSTRAINT [PK_RoomsForOcation] PRIMARY KEY CLUSTERED 
(
	[OccasionId] ASC,
	[RoomId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Schedule]    Script Date: 05/08/2019 10:30:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Schedule](
	[Num] [int] NOT NULL,
	[WeekDay] [int] NOT NULL,
	[Day] [int] NOT NULL,
	[Hour] [int] NOT NULL,
	[Room] [int] NULL,
 CONSTRAINT [PK_Schedule] PRIMARY KEY CLUSTERED 
(
	[Num] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SchoolType]    Script Date: 05/08/2019 10:30:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SchoolType](
	[Id] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_SchoolType] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Subject]    Script Date: 05/08/2019 10:30:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Subject](
	[Id] [int] NOT NULL,
	[Name] [nvarchar](30) NOT NULL,
 CONSTRAINT [PK_Subjects_1] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SubjectsForClass]    Script Date: 05/08/2019 10:30:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SubjectsForClass](
	[ClassId] [int] NOT NULL,
	[SubjectId] [int] NOT NULL,
 CONSTRAINT [PK_SubjectsForClass] PRIMARY KEY CLUSTERED 
(
	[ClassId] ASC,
	[SubjectId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Teacher]    Script Date: 05/08/2019 10:30:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Teacher](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Num] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Teachers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TeachersForOccasion]    Script Date: 05/08/2019 10:30:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TeachersForOccasion](
	[OccasionId] [int] NOT NULL,
	[TeacherId] [int] NOT NULL,
 CONSTRAINT [PK_TeachersForOcation_1] PRIMARY KEY CLUSTERED 
(
	[OccasionId] ASC,
	[TeacherId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Absence] ON 

INSERT [dbo].[Absence] ([Id], [Name]) VALUES (1, N'מחלה')
INSERT [dbo].[Absence] ([Id], [Name]) VALUES (2, N'מחלת ילד')
INSERT [dbo].[Absence] ([Id], [Name]) VALUES (3, N'ששש')
SET IDENTITY_INSERT [dbo].[Absence] OFF
SET IDENTITY_INSERT [dbo].[AbsencesForTeacher] ON 

INSERT [dbo].[AbsencesForTeacher] ([Id], [Type], [TeacherId], [FromDate], [ToDate], [FromLesson], [ToLesson], [TeacherStandIn]) VALUES (2, 1, 800, CAST(N'2019-08-01T00:00:00.000' AS DateTime), CAST(N'2019-09-01T00:00:00.000' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[AbsencesForTeacher] ([Id], [Type], [TeacherId], [FromDate], [ToDate], [FromLesson], [ToLesson], [TeacherStandIn]) VALUES (3, 1, 779, CAST(N'2019-07-04T15:30:00.093' AS DateTime), CAST(N'2019-07-04T15:30:00.100' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[AbsencesForTeacher] ([Id], [Type], [TeacherId], [FromDate], [ToDate], [FromLesson], [ToLesson], [TeacherStandIn]) VALUES (4, 1, 779, CAST(N'2019-07-05T10:28:31.087' AS DateTime), CAST(N'2019-07-05T10:28:31.100' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[AbsencesForTeacher] ([Id], [Type], [TeacherId], [FromDate], [ToDate], [FromLesson], [ToLesson], [TeacherStandIn]) VALUES (5, 1, 779, CAST(N'2019-07-05T10:34:16.033' AS DateTime), CAST(N'2019-07-05T10:34:16.040' AS DateTime), NULL, NULL, 780)
INSERT [dbo].[AbsencesForTeacher] ([Id], [Type], [TeacherId], [FromDate], [ToDate], [FromLesson], [ToLesson], [TeacherStandIn]) VALUES (11, 1, 779, CAST(N'2019-07-05T10:53:55.183' AS DateTime), CAST(N'2019-07-05T10:53:55.193' AS DateTime), NULL, NULL, 780)
INSERT [dbo].[AbsencesForTeacher] ([Id], [Type], [TeacherId], [FromDate], [ToDate], [FromLesson], [ToLesson], [TeacherStandIn]) VALUES (13, 2, 777, CAST(N'2019-07-05T11:09:01.240' AS DateTime), CAST(N'2019-07-05T11:08:52.540' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[AbsencesForTeacher] ([Id], [Type], [TeacherId], [FromDate], [ToDate], [FromLesson], [ToLesson], [TeacherStandIn]) VALUES (14, 2, 820, CAST(N'2019-07-08T13:57:42.447' AS DateTime), CAST(N'2019-07-08T13:57:42.447' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[AbsencesForTeacher] ([Id], [Type], [TeacherId], [FromDate], [ToDate], [FromLesson], [ToLesson], [TeacherStandIn]) VALUES (15, 3, 775, CAST(N'2019-07-12T00:00:00.000' AS DateTime), CAST(N'2019-07-13T00:00:00.000' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[AbsencesForTeacher] ([Id], [Type], [TeacherId], [FromDate], [ToDate], [FromLesson], [ToLesson], [TeacherStandIn]) VALUES (16, 2, 787, CAST(N'2019-07-16T00:00:00.000' AS DateTime), CAST(N'2019-07-17T00:00:00.000' AS DateTime), NULL, NULL, 777)
INSERT [dbo].[AbsencesForTeacher] ([Id], [Type], [TeacherId], [FromDate], [ToDate], [FromLesson], [ToLesson], [TeacherStandIn]) VALUES (17, 1, 779, CAST(N'2019-07-15T17:27:18.860' AS DateTime), CAST(N'2019-07-15T17:27:18.880' AS DateTime), NULL, NULL, 780)
INSERT [dbo].[AbsencesForTeacher] ([Id], [Type], [TeacherId], [FromDate], [ToDate], [FromLesson], [ToLesson], [TeacherStandIn]) VALUES (18, 1, 779, CAST(N'2019-07-15T17:28:01.027' AS DateTime), CAST(N'2019-07-15T17:28:01.037' AS DateTime), NULL, NULL, 780)
INSERT [dbo].[AbsencesForTeacher] ([Id], [Type], [TeacherId], [FromDate], [ToDate], [FromLesson], [ToLesson], [TeacherStandIn]) VALUES (19, 1, 779, CAST(N'2019-07-15T17:28:41.313' AS DateTime), CAST(N'2019-07-15T17:28:41.323' AS DateTime), NULL, NULL, 780)
INSERT [dbo].[AbsencesForTeacher] ([Id], [Type], [TeacherId], [FromDate], [ToDate], [FromLesson], [ToLesson], [TeacherStandIn]) VALUES (20, 1, 779, CAST(N'2019-07-15T17:28:52.353' AS DateTime), CAST(N'2019-07-15T17:28:52.370' AS DateTime), NULL, NULL, 780)
INSERT [dbo].[AbsencesForTeacher] ([Id], [Type], [TeacherId], [FromDate], [ToDate], [FromLesson], [ToLesson], [TeacherStandIn]) VALUES (21, 1, 779, CAST(N'2019-07-15T17:29:05.297' AS DateTime), CAST(N'2019-07-15T17:29:05.300' AS DateTime), NULL, NULL, 780)
INSERT [dbo].[AbsencesForTeacher] ([Id], [Type], [TeacherId], [FromDate], [ToDate], [FromLesson], [ToLesson], [TeacherStandIn]) VALUES (22, 1, 779, CAST(N'2019-07-15T17:37:50.367' AS DateTime), CAST(N'2019-07-15T17:37:50.377' AS DateTime), NULL, NULL, 780)
INSERT [dbo].[AbsencesForTeacher] ([Id], [Type], [TeacherId], [FromDate], [ToDate], [FromLesson], [ToLesson], [TeacherStandIn]) VALUES (23, 1, 779, CAST(N'2019-07-15T17:42:53.867' AS DateTime), CAST(N'2019-07-15T17:42:53.877' AS DateTime), NULL, NULL, 780)
INSERT [dbo].[AbsencesForTeacher] ([Id], [Type], [TeacherId], [FromDate], [ToDate], [FromLesson], [ToLesson], [TeacherStandIn]) VALUES (24, 1, 779, CAST(N'2019-07-15T17:43:43.043' AS DateTime), CAST(N'2019-07-15T17:43:43.053' AS DateTime), NULL, NULL, 780)
INSERT [dbo].[AbsencesForTeacher] ([Id], [Type], [TeacherId], [FromDate], [ToDate], [FromLesson], [ToLesson], [TeacherStandIn]) VALUES (25, 1, 779, CAST(N'2019-07-15T17:46:05.410' AS DateTime), CAST(N'2019-07-15T17:46:05.420' AS DateTime), NULL, NULL, 780)
INSERT [dbo].[AbsencesForTeacher] ([Id], [Type], [TeacherId], [FromDate], [ToDate], [FromLesson], [ToLesson], [TeacherStandIn]) VALUES (26, 1, 779, CAST(N'2019-07-15T17:47:19.097' AS DateTime), CAST(N'2019-07-15T17:47:19.103' AS DateTime), NULL, NULL, 780)
INSERT [dbo].[AbsencesForTeacher] ([Id], [Type], [TeacherId], [FromDate], [ToDate], [FromLesson], [ToLesson], [TeacherStandIn]) VALUES (27, 1, 779, CAST(N'2019-07-15T17:48:04.357' AS DateTime), CAST(N'2019-07-15T17:48:04.367' AS DateTime), NULL, NULL, 780)
INSERT [dbo].[AbsencesForTeacher] ([Id], [Type], [TeacherId], [FromDate], [ToDate], [FromLesson], [ToLesson], [TeacherStandIn]) VALUES (28, 1, 779, CAST(N'2019-07-15T17:49:57.433' AS DateTime), CAST(N'2019-07-15T17:49:57.440' AS DateTime), NULL, NULL, 780)
INSERT [dbo].[AbsencesForTeacher] ([Id], [Type], [TeacherId], [FromDate], [ToDate], [FromLesson], [ToLesson], [TeacherStandIn]) VALUES (29, 1, 779, CAST(N'2019-07-15T17:52:25.627' AS DateTime), CAST(N'2019-07-15T17:52:25.637' AS DateTime), NULL, NULL, 780)
INSERT [dbo].[AbsencesForTeacher] ([Id], [Type], [TeacherId], [FromDate], [ToDate], [FromLesson], [ToLesson], [TeacherStandIn]) VALUES (30, 1, 779, CAST(N'2019-07-15T17:53:35.930' AS DateTime), CAST(N'2019-07-15T17:53:35.940' AS DateTime), NULL, NULL, 780)
INSERT [dbo].[AbsencesForTeacher] ([Id], [Type], [TeacherId], [FromDate], [ToDate], [FromLesson], [ToLesson], [TeacherStandIn]) VALUES (31, 1, 779, CAST(N'2019-07-15T17:57:33.857' AS DateTime), CAST(N'2019-07-15T17:57:33.863' AS DateTime), NULL, NULL, 780)
INSERT [dbo].[AbsencesForTeacher] ([Id], [Type], [TeacherId], [FromDate], [ToDate], [FromLesson], [ToLesson], [TeacherStandIn]) VALUES (32, 1, 770, CAST(N'2019-07-16T00:00:00.000' AS DateTime), CAST(N'2019-07-17T00:00:00.000' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[AbsencesForTeacher] ([Id], [Type], [TeacherId], [FromDate], [ToDate], [FromLesson], [ToLesson], [TeacherStandIn]) VALUES (33, 2, 771, CAST(N'2019-07-19T00:00:00.000' AS DateTime), CAST(N'2019-07-20T00:00:00.000' AS DateTime), NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[AbsencesForTeacher] OFF
SET IDENTITY_INSERT [dbo].[Class] ON 

INSERT [dbo].[Class] ([Id], [Num], [Name], [Layer], [Number], [SchoolType]) VALUES (1141, 0, N'ט 1', 9, 1, 2)
INSERT [dbo].[Class] ([Id], [Num], [Name], [Layer], [Number], [SchoolType]) VALUES (1142, 1, N'ט 2', 9, 2, 2)
INSERT [dbo].[Class] ([Id], [Num], [Name], [Layer], [Number], [SchoolType]) VALUES (1143, 2, N'ט 3', 9, 3, 2)
INSERT [dbo].[Class] ([Id], [Num], [Name], [Layer], [Number], [SchoolType]) VALUES (1144, 3, N'ט 4', 9, 4, 2)
INSERT [dbo].[Class] ([Id], [Num], [Name], [Layer], [Number], [SchoolType]) VALUES (1145, 4, N'ט 5', 9, 5, 2)
INSERT [dbo].[Class] ([Id], [Num], [Name], [Layer], [Number], [SchoolType]) VALUES (1146, 5, N'ט 6', 9, 6, 2)
INSERT [dbo].[Class] ([Id], [Num], [Name], [Layer], [Number], [SchoolType]) VALUES (1147, 6, N'ט 7', 9, 7, 2)
INSERT [dbo].[Class] ([Id], [Num], [Name], [Layer], [Number], [SchoolType]) VALUES (1148, 7, N'ט 8', 9, 8, 2)
INSERT [dbo].[Class] ([Id], [Num], [Name], [Layer], [Number], [SchoolType]) VALUES (1149, 8, N'ט 9', 9, 9, 2)
INSERT [dbo].[Class] ([Id], [Num], [Name], [Layer], [Number], [SchoolType]) VALUES (1150, 9, N'ט 10', 9, 10, 2)
INSERT [dbo].[Class] ([Id], [Num], [Name], [Layer], [Number], [SchoolType]) VALUES (1151, 10, N'י 1', 10, 1, 3)
INSERT [dbo].[Class] ([Id], [Num], [Name], [Layer], [Number], [SchoolType]) VALUES (1152, 11, N'י 2', 10, 2, 3)
INSERT [dbo].[Class] ([Id], [Num], [Name], [Layer], [Number], [SchoolType]) VALUES (1153, 12, N'י 3', 10, 3, 3)
INSERT [dbo].[Class] ([Id], [Num], [Name], [Layer], [Number], [SchoolType]) VALUES (1154, 19, N'י 4', 10, 4, 3)
INSERT [dbo].[Class] ([Id], [Num], [Name], [Layer], [Number], [SchoolType]) VALUES (1155, 13, N'י 5', 10, 5, 3)
INSERT [dbo].[Class] ([Id], [Num], [Name], [Layer], [Number], [SchoolType]) VALUES (1156, 15, N'י 6', 10, 6, 3)
INSERT [dbo].[Class] ([Id], [Num], [Name], [Layer], [Number], [SchoolType]) VALUES (1157, 14, N'י 7', 10, 7, 3)
INSERT [dbo].[Class] ([Id], [Num], [Name], [Layer], [Number], [SchoolType]) VALUES (1158, 16, N'י 8', 10, 8, 3)
INSERT [dbo].[Class] ([Id], [Num], [Name], [Layer], [Number], [SchoolType]) VALUES (1159, 17, N'י 9', 10, 9, 3)
INSERT [dbo].[Class] ([Id], [Num], [Name], [Layer], [Number], [SchoolType]) VALUES (1160, 18, N'י 10', 10, 10, 3)
INSERT [dbo].[Class] ([Id], [Num], [Name], [Layer], [Number], [SchoolType]) VALUES (1161, 20, N'יא 1', 11, 1, 3)
INSERT [dbo].[Class] ([Id], [Num], [Name], [Layer], [Number], [SchoolType]) VALUES (1162, 21, N'יא 2', 11, 2, 3)
INSERT [dbo].[Class] ([Id], [Num], [Name], [Layer], [Number], [SchoolType]) VALUES (1163, 22, N'יא 3', 11, 3, 3)
INSERT [dbo].[Class] ([Id], [Num], [Name], [Layer], [Number], [SchoolType]) VALUES (1164, 23, N'יא 5', 11, 5, 3)
INSERT [dbo].[Class] ([Id], [Num], [Name], [Layer], [Number], [SchoolType]) VALUES (1165, 24, N'יא 6', 11, 6, 3)
INSERT [dbo].[Class] ([Id], [Num], [Name], [Layer], [Number], [SchoolType]) VALUES (1166, 25, N'יא 7', 11, 7, 3)
INSERT [dbo].[Class] ([Id], [Num], [Name], [Layer], [Number], [SchoolType]) VALUES (1167, 26, N'יא 8', 11, 8, 3)
INSERT [dbo].[Class] ([Id], [Num], [Name], [Layer], [Number], [SchoolType]) VALUES (1168, 27, N'יא 9', 11, 9, 3)
INSERT [dbo].[Class] ([Id], [Num], [Name], [Layer], [Number], [SchoolType]) VALUES (1169, 29, N'יא.4', 11, 4, 3)
INSERT [dbo].[Class] ([Id], [Num], [Name], [Layer], [Number], [SchoolType]) VALUES (1170, 28, N'יא 10', 11, 10, 3)
INSERT [dbo].[Class] ([Id], [Num], [Name], [Layer], [Number], [SchoolType]) VALUES (1171, 30, N'יב 1', 12, 1, 3)
INSERT [dbo].[Class] ([Id], [Num], [Name], [Layer], [Number], [SchoolType]) VALUES (1172, 31, N'יב 2', 12, 2, 3)
INSERT [dbo].[Class] ([Id], [Num], [Name], [Layer], [Number], [SchoolType]) VALUES (1173, 32, N'יב 3', 12, 3, 3)
INSERT [dbo].[Class] ([Id], [Num], [Name], [Layer], [Number], [SchoolType]) VALUES (1174, 33, N'יב 4', 12, 4, 3)
INSERT [dbo].[Class] ([Id], [Num], [Name], [Layer], [Number], [SchoolType]) VALUES (1175, 34, N'יב 5', 12, 5, 3)
INSERT [dbo].[Class] ([Id], [Num], [Name], [Layer], [Number], [SchoolType]) VALUES (1176, 35, N'יב 6', 12, 6, 3)
INSERT [dbo].[Class] ([Id], [Num], [Name], [Layer], [Number], [SchoolType]) VALUES (1177, 36, N'יב 7', 12, 7, 3)
INSERT [dbo].[Class] ([Id], [Num], [Name], [Layer], [Number], [SchoolType]) VALUES (1178, 37, N'יב 8', 12, 8, 3)
INSERT [dbo].[Class] ([Id], [Num], [Name], [Layer], [Number], [SchoolType]) VALUES (1179, 38, N'יב 9', 12, 9, 3)
INSERT [dbo].[Class] ([Id], [Num], [Name], [Layer], [Number], [SchoolType]) VALUES (1180, 39, N'יב 10', 12, 10, 3)
INSERT [dbo].[Class] ([Id], [Num], [Name], [Layer], [Number], [SchoolType]) VALUES (1181, 40, N'יג 1', 13, 1, 4)
INSERT [dbo].[Class] ([Id], [Num], [Name], [Layer], [Number], [SchoolType]) VALUES (1182, 41, N'יג 2', 13, 2, 4)
INSERT [dbo].[Class] ([Id], [Num], [Name], [Layer], [Number], [SchoolType]) VALUES (1183, 42, N'יג 3', 13, 3, 4)
INSERT [dbo].[Class] ([Id], [Num], [Name], [Layer], [Number], [SchoolType]) VALUES (1184, 43, N'יג 4', 13, 4, 4)
INSERT [dbo].[Class] ([Id], [Num], [Name], [Layer], [Number], [SchoolType]) VALUES (1185, 44, N'יג 5', 13, 5, 4)
INSERT [dbo].[Class] ([Id], [Num], [Name], [Layer], [Number], [SchoolType]) VALUES (1186, 45, N'יג 6', 13, 6, 4)
INSERT [dbo].[Class] ([Id], [Num], [Name], [Layer], [Number], [SchoolType]) VALUES (1187, 46, N'יג 7', 13, 7, 4)
INSERT [dbo].[Class] ([Id], [Num], [Name], [Layer], [Number], [SchoolType]) VALUES (1188, 47, N'יג 8', 13, 8, 4)
INSERT [dbo].[Class] ([Id], [Num], [Name], [Layer], [Number], [SchoolType]) VALUES (1189, 48, N'יג 9', 13, 9, 4)
INSERT [dbo].[Class] ([Id], [Num], [Name], [Layer], [Number], [SchoolType]) VALUES (1190, 49, N'יג 10', 13, 10, 4)
INSERT [dbo].[Class] ([Id], [Num], [Name], [Layer], [Number], [SchoolType]) VALUES (1191, 50, N'יד 1', 14, 1, 4)
INSERT [dbo].[Class] ([Id], [Num], [Name], [Layer], [Number], [SchoolType]) VALUES (1192, 51, N'יד 2', 14, 2, 4)
INSERT [dbo].[Class] ([Id], [Num], [Name], [Layer], [Number], [SchoolType]) VALUES (1193, 52, N'יד 3', 14, 3, 4)
INSERT [dbo].[Class] ([Id], [Num], [Name], [Layer], [Number], [SchoolType]) VALUES (1194, 53, N'יד 4', 14, 4, 4)
INSERT [dbo].[Class] ([Id], [Num], [Name], [Layer], [Number], [SchoolType]) VALUES (1195, 54, N'יד 5', 14, 5, 4)
INSERT [dbo].[Class] ([Id], [Num], [Name], [Layer], [Number], [SchoolType]) VALUES (1196, 55, N'יד 6', 14, 6, 4)
INSERT [dbo].[Class] ([Id], [Num], [Name], [Layer], [Number], [SchoolType]) VALUES (1197, 56, N'יד 7', 14, 7, 4)
INSERT [dbo].[Class] ([Id], [Num], [Name], [Layer], [Number], [SchoolType]) VALUES (1198, 57, N'יד 8', 14, 8, 4)
INSERT [dbo].[Class] ([Id], [Num], [Name], [Layer], [Number], [SchoolType]) VALUES (1199, 58, N'יד 9', 14, 9, 4)
INSERT [dbo].[Class] ([Id], [Num], [Name], [Layer], [Number], [SchoolType]) VALUES (1200, 59, N'יד 10', 14, 10, 4)
SET IDENTITY_INSERT [dbo].[Class] OFF
INSERT [dbo].[ClassesForOccasion] ([OccasionId], [ClassId]) VALUES (9, 1191)
INSERT [dbo].[ClassesForOccasion] ([OccasionId], [ClassId]) VALUES (9, 1195)
INSERT [dbo].[ClassesForOccasion] ([OccasionId], [ClassId]) VALUES (10, 1194)
INSERT [dbo].[ClassesForOccasion] ([OccasionId], [ClassId]) VALUES (10, 1195)
INSERT [dbo].[ClassesForOccasion] ([OccasionId], [ClassId]) VALUES (10, 1196)
SET IDENTITY_INSERT [dbo].[Occasion] ON 

INSERT [dbo].[Occasion] ([Id], [FromDate], [ToDate], [FromLesson], [ToLesson], [OccasionType]) VALUES (0, CAST(N'2019-07-16' AS Date), CAST(N'2019-07-17' AS Date), NULL, NULL, 2)
INSERT [dbo].[Occasion] ([Id], [FromDate], [ToDate], [FromLesson], [ToLesson], [OccasionType]) VALUES (2, CAST(N'2019-07-17' AS Date), CAST(N'2019-07-18' AS Date), NULL, NULL, 3)
INSERT [dbo].[Occasion] ([Id], [FromDate], [ToDate], [FromLesson], [ToLesson], [OccasionType]) VALUES (3, CAST(N'2019-07-04' AS Date), CAST(N'2019-07-25' AS Date), NULL, NULL, NULL)
INSERT [dbo].[Occasion] ([Id], [FromDate], [ToDate], [FromLesson], [ToLesson], [OccasionType]) VALUES (4, CAST(N'2019-07-03' AS Date), CAST(N'2019-07-17' AS Date), NULL, NULL, 1)
INSERT [dbo].[Occasion] ([Id], [FromDate], [ToDate], [FromLesson], [ToLesson], [OccasionType]) VALUES (5, CAST(N'2019-07-25' AS Date), CAST(N'2019-07-27' AS Date), NULL, NULL, 2)
INSERT [dbo].[Occasion] ([Id], [FromDate], [ToDate], [FromLesson], [ToLesson], [OccasionType]) VALUES (6, CAST(N'2019-07-25' AS Date), CAST(N'2019-07-27' AS Date), NULL, NULL, 2)
INSERT [dbo].[Occasion] ([Id], [FromDate], [ToDate], [FromLesson], [ToLesson], [OccasionType]) VALUES (7, CAST(N'2019-07-25' AS Date), CAST(N'2019-07-27' AS Date), NULL, NULL, 2)
INSERT [dbo].[Occasion] ([Id], [FromDate], [ToDate], [FromLesson], [ToLesson], [OccasionType]) VALUES (8, CAST(N'2019-07-25' AS Date), CAST(N'2019-07-27' AS Date), NULL, NULL, 2)
INSERT [dbo].[Occasion] ([Id], [FromDate], [ToDate], [FromLesson], [ToLesson], [OccasionType]) VALUES (9, CAST(N'2019-07-25' AS Date), CAST(N'2019-07-25' AS Date), NULL, NULL, 3)
INSERT [dbo].[Occasion] ([Id], [FromDate], [ToDate], [FromLesson], [ToLesson], [OccasionType]) VALUES (10, CAST(N'2019-07-10' AS Date), CAST(N'2019-07-11' AS Date), NULL, NULL, 1)
SET IDENTITY_INSERT [dbo].[Occasion] OFF
SET IDENTITY_INSERT [dbo].[OccasionType] ON 

INSERT [dbo].[OccasionType] ([Id], [Name]) VALUES (1, N'טיול')
INSERT [dbo].[OccasionType] ([Id], [Name]) VALUES (2, N'מחנה')
INSERT [dbo].[OccasionType] ([Id], [Name]) VALUES (3, N'הרצאה')
SET IDENTITY_INSERT [dbo].[OccasionType] OFF
SET IDENTITY_INSERT [dbo].[Room] ON 

INSERT [dbo].[Room] ([Id], [Floor], [Number], [ClassId], [UseFor]) VALUES (309, 0, 6, NULL, N'הקב, 1')
INSERT [dbo].[Room] ([Id], [Floor], [Number], [ClassId], [UseFor]) VALUES (310, 0, 7, NULL, N'הקב, 2')
INSERT [dbo].[Room] ([Id], [Floor], [Number], [ClassId], [UseFor]) VALUES (311, 0, 8, NULL, N'הקב, 3')
INSERT [dbo].[Room] ([Id], [Floor], [Number], [ClassId], [UseFor]) VALUES (312, 0, 9, NULL, N'הקב, 4')
INSERT [dbo].[Room] ([Id], [Floor], [Number], [ClassId], [UseFor]) VALUES (313, 1, 100, NULL, N'הקב, 5')
INSERT [dbo].[Room] ([Id], [Floor], [Number], [ClassId], [UseFor]) VALUES (314, 1, 101, NULL, N'הקב, 6')
INSERT [dbo].[Room] ([Id], [Floor], [Number], [ClassId], [UseFor]) VALUES (315, 1, 102, NULL, N'הקב, 7')
INSERT [dbo].[Room] ([Id], [Floor], [Number], [ClassId], [UseFor]) VALUES (316, 1, 103, NULL, N'הקב, 8')
INSERT [dbo].[Room] ([Id], [Floor], [Number], [ClassId], [UseFor]) VALUES (317, 9, 908, NULL, N'קב'' 9')
INSERT [dbo].[Room] ([Id], [Floor], [Number], [ClassId], [UseFor]) VALUES (318, 1, 108, NULL, N'התעמלות')
INSERT [dbo].[Room] ([Id], [Floor], [Number], [ClassId], [UseFor]) VALUES (319, 1, 106, NULL, N'חדר יהדות')
INSERT [dbo].[Room] ([Id], [Floor], [Number], [ClassId], [UseFor]) VALUES (320, 2, 209, 1141, N'ט 1')
INSERT [dbo].[Room] ([Id], [Floor], [Number], [ClassId], [UseFor]) VALUES (321, 3, 300, 1142, N'ט 2')
INSERT [dbo].[Room] ([Id], [Floor], [Number], [ClassId], [UseFor]) VALUES (322, 3, 301, 1143, N'ט 3')
INSERT [dbo].[Room] ([Id], [Floor], [Number], [ClassId], [UseFor]) VALUES (323, 3, 302, 1144, N'ט 4')
INSERT [dbo].[Room] ([Id], [Floor], [Number], [ClassId], [UseFor]) VALUES (324, 3, 303, 1145, N'ט 5')
INSERT [dbo].[Room] ([Id], [Floor], [Number], [ClassId], [UseFor]) VALUES (325, 3, 304, 1146, N'ט 6')
INSERT [dbo].[Room] ([Id], [Floor], [Number], [ClassId], [UseFor]) VALUES (326, 3, 305, 1147, N'ט 7')
INSERT [dbo].[Room] ([Id], [Floor], [Number], [ClassId], [UseFor]) VALUES (327, 3, 306, 1148, N'ט 8')
INSERT [dbo].[Room] ([Id], [Floor], [Number], [ClassId], [UseFor]) VALUES (328, 3, 307, 1149, N'ט 9')
INSERT [dbo].[Room] ([Id], [Floor], [Number], [ClassId], [UseFor]) VALUES (329, 3, 308, 1150, N'ט 10')
INSERT [dbo].[Room] ([Id], [Floor], [Number], [ClassId], [UseFor]) VALUES (330, 1, 109, 1151, N'י 1')
INSERT [dbo].[Room] ([Id], [Floor], [Number], [ClassId], [UseFor]) VALUES (331, 2, 200, 1152, N'י 2')
INSERT [dbo].[Room] ([Id], [Floor], [Number], [ClassId], [UseFor]) VALUES (332, 2, 201, 1153, N'י 3')
INSERT [dbo].[Room] ([Id], [Floor], [Number], [ClassId], [UseFor]) VALUES (333, 2, 208, 1154, N'י 4')
INSERT [dbo].[Room] ([Id], [Floor], [Number], [ClassId], [UseFor]) VALUES (334, 2, 202, 1155, N'י 5')
INSERT [dbo].[Room] ([Id], [Floor], [Number], [ClassId], [UseFor]) VALUES (335, 2, 203, 1156, N'י 6')
INSERT [dbo].[Room] ([Id], [Floor], [Number], [ClassId], [UseFor]) VALUES (336, 2, 204, 1157, N'י 7')
INSERT [dbo].[Room] ([Id], [Floor], [Number], [ClassId], [UseFor]) VALUES (337, 2, 205, 1158, N'י 8')
INSERT [dbo].[Room] ([Id], [Floor], [Number], [ClassId], [UseFor]) VALUES (338, 2, 206, 1159, N'י 9')
INSERT [dbo].[Room] ([Id], [Floor], [Number], [ClassId], [UseFor]) VALUES (339, 2, 207, 1160, N'י 10')
INSERT [dbo].[Room] ([Id], [Floor], [Number], [ClassId], [UseFor]) VALUES (340, 0, 0, NULL, N'מחשבים 1')
INSERT [dbo].[Room] ([Id], [Floor], [Number], [ClassId], [UseFor]) VALUES (341, 0, 1, NULL, N'מחשבים 2')
INSERT [dbo].[Room] ([Id], [Floor], [Number], [ClassId], [UseFor]) VALUES (342, 0, 2, NULL, N'מחשבים 3')
INSERT [dbo].[Room] ([Id], [Floor], [Number], [ClassId], [UseFor]) VALUES (343, 0, 3, NULL, N'מחשבים 4')
INSERT [dbo].[Room] ([Id], [Floor], [Number], [ClassId], [UseFor]) VALUES (344, 0, 4, NULL, N'מחשבים 5')
INSERT [dbo].[Room] ([Id], [Floor], [Number], [ClassId], [UseFor]) VALUES (345, 0, 5, NULL, N'מחשבים 6')
INSERT [dbo].[Room] ([Id], [Floor], [Number], [ClassId], [UseFor]) VALUES (346, 4, 400, NULL, N'מחשבים 7')
INSERT [dbo].[Room] ([Id], [Floor], [Number], [ClassId], [UseFor]) VALUES (347, 4, 401, NULL, N'מחשבים 8')
INSERT [dbo].[Room] ([Id], [Floor], [Number], [ClassId], [UseFor]) VALUES (348, 1, 107, NULL, N'ספריה')
INSERT [dbo].[Room] ([Id], [Floor], [Number], [ClassId], [UseFor]) VALUES (349, 4, 402, NULL, N'תפירה 1')
INSERT [dbo].[Room] ([Id], [Floor], [Number], [ClassId], [UseFor]) VALUES (350, 4, 403, NULL, N'תפירה 2')
INSERT [dbo].[Room] ([Id], [Floor], [Number], [ClassId], [UseFor]) VALUES (351, 4, 404, NULL, N'תפירה 3')
INSERT [dbo].[Room] ([Id], [Floor], [Number], [ClassId], [UseFor]) VALUES (352, 4, 405, NULL, N'תפירה 4')
SET IDENTITY_INSERT [dbo].[Room] OFF
INSERT [dbo].[Subject] ([Id], [Name]) VALUES (2000, N'כתובים')
INSERT [dbo].[Subject] ([Id], [Name]) VALUES (2001, N'יהדות')
INSERT [dbo].[Subject] ([Id], [Name]) VALUES (2002, N'תורה')
INSERT [dbo].[Subject] ([Id], [Name]) VALUES (2003, N'בקיאות')
INSERT [dbo].[Subject] ([Id], [Name]) VALUES (2004, N'נ ראשונים')
INSERT [dbo].[Subject] ([Id], [Name]) VALUES (2005, N'נ אחרונים')
INSERT [dbo].[Subject] ([Id], [Name]) VALUES (2006, N'פיוט ואגדתא')
INSERT [dbo].[Subject] ([Id], [Name]) VALUES (2007, N'דינים')
INSERT [dbo].[Subject] ([Id], [Name]) VALUES (2008, N'דעות ומידות')
INSERT [dbo].[Subject] ([Id], [Name]) VALUES (2009, N'ח הלבבות')
INSERT [dbo].[Subject] ([Id], [Name]) VALUES (2010, N'הסטוריה י')
INSERT [dbo].[Subject] ([Id], [Name]) VALUES (2011, N'הסטוריה כ')
INSERT [dbo].[Subject] ([Id], [Name]) VALUES (2012, N'כימיה')
INSERT [dbo].[Subject] ([Id], [Name]) VALUES (2013, N'אזרחות')
INSERT [dbo].[Subject] ([Id], [Name]) VALUES (2014, N'אנגלית')
INSERT [dbo].[Subject] ([Id], [Name]) VALUES (2015, N'שמיטה')
INSERT [dbo].[Subject] ([Id], [Name]) VALUES (2016, N'מחשבים')
INSERT [dbo].[Subject] ([Id], [Name]) VALUES (2017, N'ע ראשונה')
INSERT [dbo].[Subject] ([Id], [Name]) VALUES (2018, N'פס בהוראה')
INSERT [dbo].[Subject] ([Id], [Name]) VALUES (2019, N'פס עיונית')
INSERT [dbo].[Subject] ([Id], [Name]) VALUES (2020, N'אומנות')
INSERT [dbo].[Subject] ([Id], [Name]) VALUES (2021, N'מתמטיקה')
INSERT [dbo].[Subject] ([Id], [Name]) VALUES (2022, N'מסילת ישרים')
INSERT [dbo].[Subject] ([Id], [Name]) VALUES (2023, N'דקדוק')
INSERT [dbo].[Subject] ([Id], [Name]) VALUES (2024, N'מדעים')
INSERT [dbo].[Subject] ([Id], [Name]) VALUES (2025, N'הסטוריה')
INSERT [dbo].[Subject] ([Id], [Name]) VALUES (2026, N'התעמלות')
INSERT [dbo].[Subject] ([Id], [Name]) VALUES (2027, N'פדגוגיה')
INSERT [dbo].[Subject] ([Id], [Name]) VALUES (2028, N'מתוד,קדש')
INSERT [dbo].[Subject] ([Id], [Name]) VALUES (2029, N'שמיה"ל')
INSERT [dbo].[Subject] ([Id], [Name]) VALUES (2030, N'דיון  ושיח')
INSERT [dbo].[Subject] ([Id], [Name]) VALUES (2031, N'עיונים')
INSERT [dbo].[Subject] ([Id], [Name]) VALUES (2032, N'מבוא לח"מ')
INSERT [dbo].[Subject] ([Id], [Name]) VALUES (2033, N'ספריה')
INSERT [dbo].[Subject] ([Id], [Name]) VALUES (2034, N'מתוד''   לגן')
INSERT [dbo].[Subject] ([Id], [Name]) VALUES (2035, N'ספורי תורה')
INSERT [dbo].[Subject] ([Id], [Name]) VALUES (2036, N'חינוך')
INSERT [dbo].[Subject] ([Id], [Name]) VALUES (2037, N'נביא')
INSERT [dbo].[Subject] ([Id], [Name]) VALUES (2038, N'הבעה והבנה')
INSERT [dbo].[Subject] ([Id], [Name]) VALUES (2039, N'תחביר')
INSERT [dbo].[Subject] ([Id], [Name]) VALUES (2040, N'פ השבוע')
INSERT [dbo].[Subject] ([Id], [Name]) VALUES (2041, N'קול יוצר')
INSERT [dbo].[Subject] ([Id], [Name]) VALUES (2042, N'מתור, לחשבון')
INSERT [dbo].[Subject] ([Id], [Name]) VALUES (2043, N'מוכנות לחשבון')
INSERT [dbo].[Subject] ([Id], [Name]) VALUES (2044, N'קשרים וכשורים')
INSERT [dbo].[Subject] ([Id], [Name]) VALUES (2045, N'והערב נא')
INSERT [dbo].[Subject] ([Id], [Name]) VALUES (2046, N'דרשו')
INSERT [dbo].[Subject] ([Id], [Name]) VALUES (2047, N'עברית')
INSERT [dbo].[Subject] ([Id], [Name]) VALUES (2048, N'ודברת בם')
INSERT [dbo].[Subject] ([Id], [Name]) VALUES (2049, N'קומי עורי')
INSERT [dbo].[Subject] ([Id], [Name]) VALUES (2050, N'ריתמיקה')
INSERT [dbo].[Subject] ([Id], [Name]) VALUES (2051, N'מתוד,כללית')
INSERT [dbo].[Subject] ([Id], [Name]) VALUES (2052, N'אומנות בגן')
INSERT [dbo].[Subject] ([Id], [Name]) VALUES (2053, N'תזונה ובריאות')
INSERT [dbo].[Subject] ([Id], [Name]) VALUES (2054, N'משאבי למידה')
INSERT [dbo].[Subject] ([Id], [Name]) VALUES (2055, N'פסיכולוגיה')
INSERT [dbo].[Subject] ([Id], [Name]) VALUES (2056, N'מן המקור')
INSERT [dbo].[Subject] ([Id], [Name]) VALUES (2057, N'תפירה')
INSERT [dbo].[Subject] ([Id], [Name]) VALUES (2058, N'עיצוב')
INSERT [dbo].[Subject] ([Id], [Name]) VALUES (2059, N'טכסטיל')
INSERT [dbo].[Subject] ([Id], [Name]) VALUES (2060, N'אורחות יושר')
INSERT [dbo].[Subject] ([Id], [Name]) VALUES (2061, N'קשרים')
INSERT [dbo].[Subject] ([Id], [Name]) VALUES (2062, N'מוסר ומידות')
INSERT [dbo].[Subject] ([Id], [Name]) VALUES (2063, N'מפרשי התורה')
INSERT [dbo].[Subject] ([Id], [Name]) VALUES (2064, N'כתובים ק''')
INSERT [dbo].[Subject] ([Id], [Name]) VALUES (2065, N'סוגיות חינוכיות')
INSERT [dbo].[Subject] ([Id], [Name]) VALUES (2066, N'הצגה בלמידה')
INSERT [dbo].[Subject] ([Id], [Name]) VALUES (2067, N'מגילות')
INSERT [dbo].[Subject] ([Id], [Name]) VALUES (2068, N'הבית יהודי')
INSERT [dbo].[Subject] ([Id], [Name]) VALUES (2069, N'אמונה ובטחון')
INSERT [dbo].[Subject] ([Id], [Name]) VALUES (2070, N'טבע בגן')
INSERT [dbo].[Subject] ([Id], [Name]) VALUES (2071, N'חורבן יהדות אירופה')
INSERT [dbo].[Subject] ([Id], [Name]) VALUES (2072, N'דיוקים בתנ"ך')
INSERT [dbo].[Subject] ([Id], [Name]) VALUES (2073, N'אנגלית מדברת א,')
INSERT [dbo].[Subject] ([Id], [Name]) VALUES (2074, N'כלים בלמידה')
INSERT [dbo].[Subject] ([Id], [Name]) VALUES (2075, N'מוסר וחסידות')
INSERT [dbo].[Subject] ([Id], [Name]) VALUES (2076, N'מודעות')
INSERT [dbo].[Subject] ([Id], [Name]) VALUES (2077, N'אחת שאלתי')
INSERT [dbo].[Subject] ([Id], [Name]) VALUES (2078, N'לישרים תהילה')
INSERT [dbo].[Subject] ([Id], [Name]) VALUES (2079, N'אנגלית מדוברת א,2')
INSERT [dbo].[Subject] ([Id], [Name]) VALUES (2080, N'חשבון בגן')
INSERT [dbo].[Subject] ([Id], [Name]) VALUES (2081, N'מפרשי התורה')
INSERT [dbo].[Subject] ([Id], [Name]) VALUES (2082, N'אז נדברו')
INSERT [dbo].[Subject] ([Id], [Name]) VALUES (2083, N'הסטוריה ישראלית')
INSERT [dbo].[Subject] ([Id], [Name]) VALUES (2084, N'לשון')
INSERT [dbo].[Subject] ([Id], [Name]) VALUES (2085, N'חנוך לנער')
INSERT [dbo].[Subject] ([Id], [Name]) VALUES (2086, N'רישומים דידקטים')
INSERT [dbo].[Subject] ([Id], [Name]) VALUES (2087, N'משחקים דידקטים')
INSERT [dbo].[Subject] ([Id], [Name]) VALUES (2088, N'ימים מיוחדים')
INSERT [dbo].[Subject] ([Id], [Name]) VALUES (2089, N'מקראי קדש')
INSERT [dbo].[Subject] ([Id], [Name]) VALUES (2090, N'הקנית מושגים')
INSERT [dbo].[Subject] ([Id], [Name]) VALUES (2091, N'מג'' טכנלוגית')
INSERT [dbo].[Subject] ([Id], [Name]) VALUES (2092, N'התפתחות רגשית')
INSERT [dbo].[Subject] ([Id], [Name]) VALUES (2093, N'אורינות מדעית')
INSERT [dbo].[Subject] ([Id], [Name]) VALUES (2094, N'לשוב לאיתנים')
INSERT [dbo].[Subject] ([Id], [Name]) VALUES (2095, N'חשבון')
INSERT [dbo].[Subject] ([Id], [Name]) VALUES (2096, N'מג'' ספר עיונים')
INSERT [dbo].[Subject] ([Id], [Name]) VALUES (2097, N'עלי ספר-עיונים')
INSERT [dbo].[Subject] ([Id], [Name]) VALUES (2098, N'מוכניות')
INSERT [dbo].[Subject] ([Id], [Name]) VALUES (2099, N'פ"ש בגן')
GO
INSERT [dbo].[Subject] ([Id], [Name]) VALUES (2100, N'השקפה ואקטואליה')
INSERT [dbo].[Subject] ([Id], [Name]) VALUES (2101, N'ודברת בם')
INSERT [dbo].[Subject] ([Id], [Name]) VALUES (2102, N'סוגיות בחינוך')
INSERT [dbo].[Subject] ([Id], [Name]) VALUES (2103, N'מסורת העברת התורה')
INSERT [dbo].[Subject] ([Id], [Name]) VALUES (2104, N'חכמת נשים')
INSERT [dbo].[Subject] ([Id], [Name]) VALUES (2105, N'"תוספת.בניה"')
INSERT [dbo].[Subject] ([Id], [Name]) VALUES (2106, N'עיונים.במשנת')
INSERT [dbo].[Subject] ([Id], [Name]) VALUES (2107, N'תהילים')
INSERT [dbo].[Subject] ([Id], [Name]) VALUES (2108, N'מחשבת לתיכונים')
INSERT [dbo].[Subject] ([Id], [Name]) VALUES (2109, N'מטעמי המקרא')
INSERT [dbo].[Subject] ([Id], [Name]) VALUES (2110, N'שערים לתפילה')
INSERT [dbo].[Subject] ([Id], [Name]) VALUES (2111, N'שמיטה')
INSERT [dbo].[Subject] ([Id], [Name]) VALUES (2112, N'העצמה חינוכית')
INSERT [dbo].[Subject] ([Id], [Name]) VALUES (2113, N'מעגלי יושר')
INSERT [dbo].[Subject] ([Id], [Name]) VALUES (2114, N'מבקשי')
INSERT [dbo].[Subject] ([Id], [Name]) VALUES (2115, N'שיח מחנכת')
INSERT [dbo].[Subject] ([Id], [Name]) VALUES (2116, N'ספר החנוך')
INSERT [dbo].[Subject] ([Id], [Name]) VALUES (2117, N'הל'' כבוד או"א')
INSERT [dbo].[Subject] ([Id], [Name]) VALUES (2118, N'צוות בצותא')
INSERT [dbo].[Subject] ([Id], [Name]) VALUES (2119, N'עיקבתא דמשיחא')
INSERT [dbo].[Subject] ([Id], [Name]) VALUES (2120, N'חיי עולם')
INSERT [dbo].[Subject] ([Id], [Name]) VALUES (2121, N'שערי תפילה')
INSERT [dbo].[Subject] ([Id], [Name]) VALUES (2122, N'איסט'' למידה')
INSERT [dbo].[Subject] ([Id], [Name]) VALUES (2123, N'פרטני')
INSERT [dbo].[Subject] ([Id], [Name]) VALUES (2124, N'דעת עצמנו')
INSERT [dbo].[Subject] ([Id], [Name]) VALUES (2125, N'שה"ש')
INSERT [dbo].[Subject] ([Id], [Name]) VALUES (2126, N'מכתב מאליהו')
INSERT [dbo].[Subject] ([Id], [Name]) VALUES (2127, N'הל,מוקצה')
INSERT [dbo].[Subject] ([Id], [Name]) VALUES (2128, N'הל,יחוד')
INSERT [dbo].[Subject] ([Id], [Name]) VALUES (2129, N'שהייה')
INSERT [dbo].[Subject] ([Id], [Name]) VALUES (2130, N'שיחה')
INSERT [dbo].[Subject] ([Id], [Name]) VALUES (2131, N'בית  יודי ')
INSERT [dbo].[Subject] ([Id], [Name]) VALUES (2133, N'משנת חכמים')
INSERT [dbo].[Subject] ([Id], [Name]) VALUES (2134, N'למועד הימים')
INSERT [dbo].[Subject] ([Id], [Name]) VALUES (2135, N'שמונה פרקים')
INSERT [dbo].[Subject] ([Id], [Name]) VALUES (2136, N'תומכות הוראה')
INSERT [dbo].[Subject] ([Id], [Name]) VALUES (2138, N'מצוות תמידיות')
INSERT [dbo].[Subject] ([Id], [Name]) VALUES (2139, N'מעשי אבות')
INSERT [dbo].[Subject] ([Id], [Name]) VALUES (2166, N'האזינו')
INSERT [dbo].[Subject] ([Id], [Name]) VALUES (2249, N'הל'' כבוד אן"א')
INSERT [dbo].[Subject] ([Id], [Name]) VALUES (2999, N'העשרה')
SET IDENTITY_INSERT [dbo].[Teacher] ON 

INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (769, 1197, N'אדלר ב')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (770, 1231, N'אדלר ט')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (771, 1151, N'אדלר מ')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (772, 1100, N'אדלר ש')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (773, 1073, N'אדלשטיין ה')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (774, 1006, N'אולמן ד')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (775, 1180, N'אולמן ה')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (776, 1098, N'איזנשטיין ח')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (777, 1084, N'איזנשטיין ש')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (778, 1177, N'איתן י')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (779, 1099, N'איתן מ')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (780, 1159, N'אלחרר ש"צ')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (781, 1189, N'אלטוסקי.ח')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (782, 1138, N'אלפא ש')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (783, 1050, N'אלפר ג')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (784, 1178, N'אנגל פ')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (785, 1160, N'אריאלי ש')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (786, 1000, N'בביוף..ט')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (787, 1157, N'בוגץ ש')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (788, 1109, N'בוימרינד ב')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (789, 1179, N'בידרמן ר')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (790, 1114, N'בלום ר')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (791, 1034, N'בן שלמה א')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (792, 1033, N'בן- שלמה')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (793, 1024, N'בק  ח')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (794, 1090, N'ברגמן ח')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (795, 1240, N'ברדנשטיין ש')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (796, 1119, N'ברונפמן מ')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (797, 1124, N'ברטלר א')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (798, 1115, N'ברטלר מ')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (799, 1125, N'ברטלר ש')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (800, 1091, N'ברלינגר י')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (801, 1055, N'ברמן א')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (802, 1081, N'ברמן פ')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (803, 1156, N'ברנפלד ר')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (804, 1247, N'ברנשטיין ר')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (805, 1062, N'גוטליב.ח')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (806, 1194, N'גולדברג פ')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (807, 1183, N'גולדוסר.מ')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (808, 1023, N'גולדיש הרב')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (809, 1170, N'גילרנטר ב"ש')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (810, 1149, N'גינזבורג א')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (811, 1039, N'גינזבורג מ')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (812, 1195, N'גינסברגר א')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (813, 1226, N'גינסברגר ר')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (814, 1185, N'גלעד ר')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (815, 1061, N'גנוט ח')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (816, 1132, N'גרבוז ש')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (817, 1105, N'גרוב ר')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (818, 1049, N'גרינולד מרים')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (819, 1279, N'גרמן ב')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (820, 1184, N'דויטש ג')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (821, 1208, N'דויטש ח')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (822, 1080, N'דיאמנט הרב')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (823, 1068, N'דינקל ר')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (824, 1999, N'דינר רות')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (825, 1191, N'דסקל מ')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (826, 1027, N'דרבקין ב')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (827, 1026, N'דרבקין ט')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (828, 1095, N'דרורי ר')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (829, 1162, N'הורביץ ש')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (830, 1104, N'הלפרן ש')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (831, 1233, N'הלר ש')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (832, 1032, N'הרב וולף')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (833, 1130, N'הרב וולף ש')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (834, 1020, N'הרשלר א')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (835, 1021, N'הרשלר ר')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (836, 1031, N'וולף ט')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (837, 1215, N'וייס ט')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (838, 1083, N'וינטר ש')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (839, 1082, N'וינטרויב י')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (840, 1102, N'ויספיש א')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (841, 1212, N'ויספיש ב')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (842, 1103, N'ויספיש פ')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (843, 1196, N'ולדודה צ')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (844, 1145, N'ולדמן ר')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (845, 1071, N'זייציק ר')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (846, 1161, N'זיכרמן ח')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (847, 1070, N'זילבר ר')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (848, 1018, N'זינגר ר')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (849, 1202, N'זיסמן מ')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (850, 1131, N'זכריש ש')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (851, 1205, N'זלושינסקי')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (852, 1140, N'זלזניק ר')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (853, 1137, N'זנדמן ת')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (854, 1094, N'זריצקי ח')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (855, 1066, N'ח שולזינגר')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (856, 1154, N'חיים ל')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (857, 1004, N'טאוב ל')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (858, 1153, N'טאובה ר')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (859, 1225, N'טאראב מ')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (860, 1142, N'טופורוביץ ת')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (861, 1044, N'טננבוים ב"ש')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (862, 1075, N'טננהויז א')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (863, 1199, N'יוגל ש')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (864, 1206, N'יוספי מ')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (865, 1211, N'יחזקאל בש')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (866, 1217, N'יעבץ ר')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (867, 1063, N'יעקבוביץ ח')
GO
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (868, 1069, N'יעקבוביץ.א')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (869, 1079, N'יעקבזון נ')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (870, 1078, N'יעקבזון ר')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (871, 1182, N'יערי.ט')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (872, 1146, N'ישראל ב"ש')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (873, 1218, N'ישראלזון ל')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (874, 1117, N'ישרמי י')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (875, 1122, N'כהן ב')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (876, 1120, N'כהן ל')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (877, 1121, N'כהן ר')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (878, 1123, N'כהן רחל')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (879, 1213, N'כהן ת')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (880, 1074, N'כהן..רחל..2')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (881, 1201, N'כץ נ')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (882, 1214, N'לאבנשטיין ב')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (883, 1096, N'לוי ד')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (884, 1234, N'לוי מ')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (885, 1152, N'לוי ר')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (886, 1112, N'לוין א')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (887, 1251, N'לורוא ל')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (888, 1059, N'לוריא י')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (889, 1186, N'לוריא ל')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (890, 1058, N'לוריא מ')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (891, 1060, N'לוריא ר')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (892, 1209, N'לורנץ ר')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (893, 1040, N'ליבוביץ ט')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (894, 1249, N'ליבוביץ מ')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (895, 1051, N'ליברמן י')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (896, 1047, N'לידר ל')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (897, 1046, N'לידר נ')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (898, 1171, N'ליזנובסקי ש')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (899, 1200, N'ליטקה ה')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (900, 1193, N'לנדא ל')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (901, 1168, N'לנציצקי א')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (902, 1155, N'לרנר ר')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (903, 1037, N'לרר פ')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (904, 1175, N'מאגר א')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (905, 1092, N'מאיר ש')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (906, 1141, N'מאירוביץ ש')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (907, 1203, N'מובשוביץ ש')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (908, 1147, N'מונדרי צ')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (909, 1227, N'מונק מ')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (910, 1077, N'מילר א')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (911, 1236, N'מילר י')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (912, 1219, N'מינצר ת')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (913, 1242, N'מליק ש')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (914, 1057, N'מלכא ש')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (915, 1221, N'מן ה')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (916, 1222, N'מרמרוש ט')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (917, 1150, N'נבנצאל ג')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (918, 1220, N'נובק ת')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (919, 1048, N'נוימן ר')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (920, 1025, N'סאלם א')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (921, 1017, N'סבו ש')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (922, 1015, N'סגל א')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (923, 1016, N'סגל ר')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (924, 1045, N'סגל ת')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (925, 1134, N'סופר ב')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (926, 1243, N'סימפולינסקי ב')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (927, 1106, N'סלובס מ')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (928, 1239, N'ספרא א')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (929, 1148, N'ספרא צ')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (930, 1093, N'עמרם ד')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (931, 1110, N'עמרם ש')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (932, 1163, N'פוברסקי ד')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (933, 1190, N'פוריס ש')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (934, 1198, N'פיינשטיין נ')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (935, 1237, N'פיינשטיין ע')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (936, 1245, N'פינקלשטיין נ')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (937, 1228, N'פיפרמן מ')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (938, 1108, N'פישהוף א')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (939, 1107, N'פישהוף ש')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (940, 1133, N'פישר ח')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (941, 1223, N'פליישמן ש')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (942, 1244, N'פלר פ')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (943, 1111, N'פסטבסקי ח')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (944, 1252, N'פקירו ט')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (945, 1056, N'פרוינד ד')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (946, 1207, N'פרוכטר ש')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (947, 1187, N'פרידלנדר ח')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (948, 1126, N'פרידמן ד')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (949, 1128, N'פרידמן מ')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (950, 1127, N'פרידמן שפ')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (951, 1204, N'פרץ א')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (952, 1238, N'פרקש ר')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (953, 1030, N'צביון ח')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (954, 1013, N'צוקר ח')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (955, 1139, N'צייטלין מ')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (956, 1067, N'צימרמן נ')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (957, 1229, N'צלר ט')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (958, 1166, N'קויפמן ב')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (959, 1076, N'קויפמן ר')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (960, 1143, N'קופשיץ.מ')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (961, 1011, N'קורלנסקי ח')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (962, 1012, N'קורלנסקי ר')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (963, 1022, N'קורנפלד ר')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (964, 1176, N'קימל י')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (965, 1116, N'קינסטלכער ש')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (966, 1038, N'קיסנר ש')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (967, 1241, N'קלויזנר ז')
GO
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (968, 1254, N'קלויזנר ר')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (969, 1054, N'קלופט ל')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (970, 1003, N'קלופר י')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (971, 1230, N'קליין א')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (972, 1118, N'קליין מ')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (973, 1097, N'קליינמן ר')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (974, 1009, N'קלרמן ה')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (975, 1010, N'קלרמן נ')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (976, 1216, N'קנובל א')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (977, 1246, N'קנופלר')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (978, 1248, N'קצבורג צ')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (979, 1035, N'קראוס י')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (980, 1113, N'קראוס נ')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (981, 1165, N'קראוס ר')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (982, 1052, N'קרלשטיין מ')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (983, 1101, N'קרפט ש')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (984, 1065, N'ר שולזינגר')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (985, 1087, N'ראובן')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (986, 1053, N'ראם ר')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (987, 1043, N'ראקוב י')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (988, 1169, N'רבינוביץ ר')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (989, 1172, N'רבנים')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (990, 1210, N'רבנים ו')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (991, 1235, N'רהאן')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (992, 1088, N'רובין ת')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (993, 1167, N'רוזן ה')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (994, 1164, N'רוזנברג ח')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (995, 1029, N'רוט א')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (996, 1028, N'רוט ט')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (997, 1036, N'רוטר ב')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (998, 1144, N'רוכלין ר')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (999, 1135, N'רייכנברג ב')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (1000, 1181, N'ריינר א')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (1001, 1005, N'שוב ר')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (1002, 1232, N'שוגול י')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (1003, 1002, N'שוורץ ח')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (1004, 1173, N'שוורצברג')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (1005, 1041, N'שוורצמן מ')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (1006, 1014, N'שולזינגר ג')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (1007, 1174, N'שולזינגר ח')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (1008, 1064, N'שולזינגר ש')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (1009, 1192, N'שטיינהרטר..ט')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (1010, 1224, N'שטמר ר')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (1011, 1188, N'שטראוס ע')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (1012, 1001, N'שטרנגר מ')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (1013, 1086, N'שיף א')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (1014, 1089, N'שיף ב')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (1015, 1085, N'שיף מא')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (1016, 1136, N'שניידר י')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (1017, 1072, N'שנק ר')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (1018, 1278, N'שפיץ')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (1019, 1019, N'שפירא ש')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (1020, 1042, N'שפרנצלס ט')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (1021, 1129, N'שרייבר א')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (1022, 1007, N'שרייבר ב')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (1023, 1008, N'שרייבר ר')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (1024, 1158, N'שרייבר ר"ל')
SET IDENTITY_INSERT [dbo].[Teacher] OFF
INSERT [dbo].[TeachersForOccasion] ([OccasionId], [TeacherId]) VALUES (9, 769)
INSERT [dbo].[TeachersForOccasion] ([OccasionId], [TeacherId]) VALUES (10, 772)
ALTER TABLE [dbo].[AbsencesForTeacher]  WITH CHECK ADD  CONSTRAINT [FK_AbsencesForTeacher_Absence1] FOREIGN KEY([Type])
REFERENCES [dbo].[Absence] ([Id])
GO
ALTER TABLE [dbo].[AbsencesForTeacher] CHECK CONSTRAINT [FK_AbsencesForTeacher_Absence1]
GO
ALTER TABLE [dbo].[AbsencesForTeacher]  WITH CHECK ADD  CONSTRAINT [FK_AbsencesForTeacher_Teacher] FOREIGN KEY([TeacherStandIn])
REFERENCES [dbo].[Teacher] ([Id])
GO
ALTER TABLE [dbo].[AbsencesForTeacher] CHECK CONSTRAINT [FK_AbsencesForTeacher_Teacher]
GO
ALTER TABLE [dbo].[AbsencesForTeacher]  WITH CHECK ADD  CONSTRAINT [FK_AbsencesForTeacher_TeacherStandIn] FOREIGN KEY([TeacherStandIn])
REFERENCES [dbo].[Teacher] ([Id])
GO
ALTER TABLE [dbo].[AbsencesForTeacher] CHECK CONSTRAINT [FK_AbsencesForTeacher_TeacherStandIn]
GO
ALTER TABLE [dbo].[ClassesForGroup]  WITH CHECK ADD  CONSTRAINT [FK_ClassesForGroup_Class] FOREIGN KEY([ClassId])
REFERENCES [dbo].[Class] ([Id])
GO
ALTER TABLE [dbo].[ClassesForGroup] CHECK CONSTRAINT [FK_ClassesForGroup_Class]
GO
ALTER TABLE [dbo].[ClassesForGroup]  WITH CHECK ADD  CONSTRAINT [FK_ClassesForGroup_Group] FOREIGN KEY([GroupId])
REFERENCES [dbo].[Group] ([Id])
GO
ALTER TABLE [dbo].[ClassesForGroup] CHECK CONSTRAINT [FK_ClassesForGroup_Group]
GO
ALTER TABLE [dbo].[ClassesForOccasion]  WITH CHECK ADD  CONSTRAINT [FK_ClassesForOcation_Class] FOREIGN KEY([ClassId])
REFERENCES [dbo].[Class] ([Id])
GO
ALTER TABLE [dbo].[ClassesForOccasion] CHECK CONSTRAINT [FK_ClassesForOcation_Class]
GO
ALTER TABLE [dbo].[ClassesForOccasion]  WITH CHECK ADD  CONSTRAINT [FK_ClassesForOcation_Ocation] FOREIGN KEY([OccasionId])
REFERENCES [dbo].[Occasion] ([Id])
GO
ALTER TABLE [dbo].[ClassesForOccasion] CHECK CONSTRAINT [FK_ClassesForOcation_Ocation]
GO
ALTER TABLE [dbo].[Dairy]  WITH CHECK ADD  CONSTRAINT [FK_Dairy_Class] FOREIGN KEY([ClassId])
REFERENCES [dbo].[Class] ([Id])
GO
ALTER TABLE [dbo].[Dairy] CHECK CONSTRAINT [FK_Dairy_Class]
GO
ALTER TABLE [dbo].[Dairy]  WITH CHECK ADD  CONSTRAINT [FK_Dairy_Ocation] FOREIGN KEY([OccasionId])
REFERENCES [dbo].[Occasion] ([Id])
GO
ALTER TABLE [dbo].[Dairy] CHECK CONSTRAINT [FK_Dairy_Ocation]
GO
ALTER TABLE [dbo].[Dairy]  WITH CHECK ADD  CONSTRAINT [FK_Dairy_OcationType] FOREIGN KEY([TypeId])
REFERENCES [dbo].[OccasionType] ([Id])
GO
ALTER TABLE [dbo].[Dairy] CHECK CONSTRAINT [FK_Dairy_OcationType]
GO
ALTER TABLE [dbo].[Dairy]  WITH CHECK ADD  CONSTRAINT [FK_Dairy_Room] FOREIGN KEY([RoomId])
REFERENCES [dbo].[Room] ([Id])
GO
ALTER TABLE [dbo].[Dairy] CHECK CONSTRAINT [FK_Dairy_Room]
GO
ALTER TABLE [dbo].[Dairy]  WITH CHECK ADD  CONSTRAINT [FK_Dairy_Subject] FOREIGN KEY([SubjectId])
REFERENCES [dbo].[Subject] ([Id])
GO
ALTER TABLE [dbo].[Dairy] CHECK CONSTRAINT [FK_Dairy_Subject]
GO
ALTER TABLE [dbo].[Dairy]  WITH CHECK ADD  CONSTRAINT [FK_Dairy_Teacher] FOREIGN KEY([TeacherId])
REFERENCES [dbo].[Teacher] ([Id])
GO
ALTER TABLE [dbo].[Dairy] CHECK CONSTRAINT [FK_Dairy_Teacher]
GO
ALTER TABLE [dbo].[DairyForClasses]  WITH CHECK ADD  CONSTRAINT [FK_DairyForClasses_Class] FOREIGN KEY([ClassId])
REFERENCES [dbo].[Class] ([Id])
GO
ALTER TABLE [dbo].[DairyForClasses] CHECK CONSTRAINT [FK_DairyForClasses_Class]
GO
ALTER TABLE [dbo].[DairyForClasses]  WITH CHECK ADD  CONSTRAINT [FK_DairyForClasses_Dairy] FOREIGN KEY([DairyId])
REFERENCES [dbo].[Dairy] ([Id])
GO
ALTER TABLE [dbo].[DairyForClasses] CHECK CONSTRAINT [FK_DairyForClasses_Dairy]
GO
ALTER TABLE [dbo].[Group]  WITH CHECK ADD  CONSTRAINT [FK_Group_HourType] FOREIGN KEY([HourType])
REFERENCES [dbo].[HourType] ([Id])
GO
ALTER TABLE [dbo].[Group] CHECK CONSTRAINT [FK_Group_HourType]
GO
ALTER TABLE [dbo].[Group]  WITH CHECK ADD  CONSTRAINT [FK_Group_Reforma] FOREIGN KEY([Reforma])
REFERENCES [dbo].[Reforma] ([Id])
GO
ALTER TABLE [dbo].[Group] CHECK CONSTRAINT [FK_Group_Reforma]
GO
ALTER TABLE [dbo].[Group]  WITH CHECK ADD  CONSTRAINT [FK_Group_Room] FOREIGN KEY([Room])
REFERENCES [dbo].[Room] ([Id])
GO
ALTER TABLE [dbo].[Group] CHECK CONSTRAINT [FK_Group_Room]
GO
ALTER TABLE [dbo].[Group]  WITH CHECK ADD  CONSTRAINT [FK_Group_SchoolType] FOREIGN KEY([SchoolType])
REFERENCES [dbo].[SchoolType] ([Id])
GO
ALTER TABLE [dbo].[Group] CHECK CONSTRAINT [FK_Group_SchoolType]
GO
ALTER TABLE [dbo].[Group]  WITH CHECK ADD  CONSTRAINT [FK_Group_Subject] FOREIGN KEY([Subject])
REFERENCES [dbo].[Subject] ([Id])
GO
ALTER TABLE [dbo].[Group] CHECK CONSTRAINT [FK_Group_Subject]
GO
ALTER TABLE [dbo].[Group]  WITH CHECK ADD  CONSTRAINT [FK_Group_Teacher] FOREIGN KEY([Teacher])
REFERENCES [dbo].[Teacher] ([Id])
GO
ALTER TABLE [dbo].[Group] CHECK CONSTRAINT [FK_Group_Teacher]
GO
ALTER TABLE [dbo].[Occasion]  WITH CHECK ADD  CONSTRAINT [FK_Ocation_OcationType] FOREIGN KEY([OccasionType])
REFERENCES [dbo].[OccasionType] ([Id])
GO
ALTER TABLE [dbo].[Occasion] CHECK CONSTRAINT [FK_Ocation_OcationType]
GO
ALTER TABLE [dbo].[PayAbsencesForTeacher]  WITH CHECK ADD  CONSTRAINT [FK_PayAbsencesForTeacher_PayAbsence] FOREIGN KEY([IdPayAbsence])
REFERENCES [dbo].[PayAbsence] ([Id])
GO
ALTER TABLE [dbo].[PayAbsencesForTeacher] CHECK CONSTRAINT [FK_PayAbsencesForTeacher_PayAbsence]
GO
ALTER TABLE [dbo].[PayAbsencesForTeacher]  WITH CHECK ADD  CONSTRAINT [FK_PayAbsencesForTeacher_Teacher] FOREIGN KEY([IdTeacher])
REFERENCES [dbo].[Teacher] ([Id])
GO
ALTER TABLE [dbo].[PayAbsencesForTeacher] CHECK CONSTRAINT [FK_PayAbsencesForTeacher_Teacher]
GO
ALTER TABLE [dbo].[Room]  WITH CHECK ADD  CONSTRAINT [FK_Room_Class] FOREIGN KEY([ClassId])
REFERENCES [dbo].[Class] ([Id])
GO
ALTER TABLE [dbo].[Room] CHECK CONSTRAINT [FK_Room_Class]
GO
ALTER TABLE [dbo].[RoomsForOccasion]  WITH CHECK ADD  CONSTRAINT [FK_RoomsForOcation_Ocation] FOREIGN KEY([OccasionId])
REFERENCES [dbo].[Occasion] ([Id])
GO
ALTER TABLE [dbo].[RoomsForOccasion] CHECK CONSTRAINT [FK_RoomsForOcation_Ocation]
GO
ALTER TABLE [dbo].[RoomsForOccasion]  WITH CHECK ADD  CONSTRAINT [FK_RoomsForOcation_Room] FOREIGN KEY([RoomId])
REFERENCES [dbo].[Room] ([Id])
GO
ALTER TABLE [dbo].[RoomsForOccasion] CHECK CONSTRAINT [FK_RoomsForOcation_Room]
GO
ALTER TABLE [dbo].[Schedule]  WITH CHECK ADD  CONSTRAINT [FK_Schedule_Room] FOREIGN KEY([Room])
REFERENCES [dbo].[Room] ([Id])
GO
ALTER TABLE [dbo].[Schedule] CHECK CONSTRAINT [FK_Schedule_Room]
GO
ALTER TABLE [dbo].[SubjectsForClass]  WITH CHECK ADD  CONSTRAINT [FK_SubjectsForClass_Class] FOREIGN KEY([ClassId])
REFERENCES [dbo].[Class] ([Id])
GO
ALTER TABLE [dbo].[SubjectsForClass] CHECK CONSTRAINT [FK_SubjectsForClass_Class]
GO
ALTER TABLE [dbo].[SubjectsForClass]  WITH CHECK ADD  CONSTRAINT [FK_SubjectsForClass_Subject] FOREIGN KEY([SubjectId])
REFERENCES [dbo].[Subject] ([Id])
GO
ALTER TABLE [dbo].[SubjectsForClass] CHECK CONSTRAINT [FK_SubjectsForClass_Subject]
GO
ALTER TABLE [dbo].[TeachersForOccasion]  WITH CHECK ADD  CONSTRAINT [FK_TeachersForOcation_Ocation] FOREIGN KEY([OccasionId])
REFERENCES [dbo].[Occasion] ([Id])
GO
ALTER TABLE [dbo].[TeachersForOccasion] CHECK CONSTRAINT [FK_TeachersForOcation_Ocation]
GO
ALTER TABLE [dbo].[TeachersForOccasion]  WITH CHECK ADD  CONSTRAINT [FK_TeachersForOcation_Teacher] FOREIGN KEY([TeacherId])
REFERENCES [dbo].[Teacher] ([Id])
GO
ALTER TABLE [dbo].[TeachersForOccasion] CHECK CONSTRAINT [FK_TeachersForOcation_Teacher]
GO
USE [master]
GO
ALTER DATABASE [!ESTY&TAMAR] SET  READ_WRITE 
GO
