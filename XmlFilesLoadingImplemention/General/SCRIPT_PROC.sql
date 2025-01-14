USE [master]
GO
/****** Object:  Database [!ESTY&TAMAR]    Script Date: 13/09/2019 13:32:31 ******/
CREATE DATABASE [!ESTY&TAMAR]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'!ESTY&TAMAR', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\ST\!ESTY&TAMAR.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'!ESTY&TAMAR_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\ST\!ESTY&TAMAR_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
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
ALTER DATABASE [!ESTY&TAMAR] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [!ESTY&TAMAR] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [!ESTY&TAMAR] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'!ESTY&TAMAR', N'ON'
GO
ALTER DATABASE [!ESTY&TAMAR] SET QUERY_STORE = OFF
GO
USE [!ESTY&TAMAR]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
USE [!ESTY&TAMAR]
GO
/****** Object:  Table [dbo].[Absence]    Script Date: 13/09/2019 13:32:31 ******/
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
/****** Object:  Table [dbo].[AbsencesForTeacher]    Script Date: 13/09/2019 13:32:31 ******/
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
	[TeacherStandIn] [int] NULL,
	[FromLesson] [int] NULL,
	[ToLesson] [int] NULL,
 CONSTRAINT [PK_AbsencesForTeacher] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Class]    Script Date: 13/09/2019 13:32:31 ******/
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
/****** Object:  Table [dbo].[ClassesForGroup]    Script Date: 13/09/2019 13:32:31 ******/
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
/****** Object:  Table [dbo].[ClassesForOccasion]    Script Date: 13/09/2019 13:32:31 ******/
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
/****** Object:  Table [dbo].[Dairy]    Script Date: 13/09/2019 13:32:31 ******/
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
	[GroupId] [int] NULL,
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
/****** Object:  Table [dbo].[DairyForClasses]    Script Date: 13/09/2019 13:32:31 ******/
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
/****** Object:  Table [dbo].[Group]    Script Date: 13/09/2019 13:32:31 ******/
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
/****** Object:  Table [dbo].[HourType]    Script Date: 13/09/2019 13:32:32 ******/
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
/****** Object:  Table [dbo].[Occasion]    Script Date: 13/09/2019 13:32:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Occasion](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FromDate] [date] NULL,
	[ToDate] [date] NULL,
	[OccasionType] [int] NULL,
	[FromLesson] [int] NULL,
	[ToLesson] [int] NULL,
 CONSTRAINT [PK_Ocation_1] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OccasionType]    Script Date: 13/09/2019 13:32:32 ******/
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
/****** Object:  Table [dbo].[PayAbsence]    Script Date: 13/09/2019 13:32:32 ******/
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
/****** Object:  Table [dbo].[PayAbsencesForTeacher]    Script Date: 13/09/2019 13:32:32 ******/
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
/****** Object:  Table [dbo].[Reforma]    Script Date: 13/09/2019 13:32:32 ******/
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
/****** Object:  Table [dbo].[Room]    Script Date: 13/09/2019 13:32:32 ******/
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
/****** Object:  Table [dbo].[RoomsForOccasion]    Script Date: 13/09/2019 13:32:32 ******/
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
/****** Object:  Table [dbo].[Schedule]    Script Date: 13/09/2019 13:32:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Schedule](
	[Num] [int] NOT NULL,
	[GroupId] [int] NOT NULL,
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
/****** Object:  Table [dbo].[SchoolType]    Script Date: 13/09/2019 13:32:32 ******/
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
/****** Object:  Table [dbo].[Subject]    Script Date: 13/09/2019 13:32:32 ******/
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
/****** Object:  Table [dbo].[SubjectsForClass]    Script Date: 13/09/2019 13:32:32 ******/
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
/****** Object:  Table [dbo].[Teacher]    Script Date: 13/09/2019 13:32:32 ******/
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
/****** Object:  Table [dbo].[TeachersForOccasion]    Script Date: 13/09/2019 13:32:32 ******/
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
ALTER TABLE [dbo].[Dairy]  WITH CHECK ADD  CONSTRAINT [FK_Dairy_Group] FOREIGN KEY([GroupId])
REFERENCES [dbo].[Group] ([Id])
GO
ALTER TABLE [dbo].[Dairy] CHECK CONSTRAINT [FK_Dairy_Group]
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
ALTER TABLE [dbo].[Group]  WITH CHECK ADD  CONSTRAINT [FK_Group_HourType1] FOREIGN KEY([SubHourType])
REFERENCES [dbo].[HourType] ([Id])
GO
ALTER TABLE [dbo].[Group] CHECK CONSTRAINT [FK_Group_HourType1]
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
ALTER TABLE [dbo].[Schedule]  WITH CHECK ADD  CONSTRAINT [FK_Schedule_Group] FOREIGN KEY([GroupId])
REFERENCES [dbo].[Group] ([Id])
GO
ALTER TABLE [dbo].[Schedule] CHECK CONSTRAINT [FK_Schedule_Group]
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
/****** Object:  StoredProcedure [dbo].[FILL_CONST_TABLES]    Script Date: 13/09/2019 13:32:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[FILL_CONST_TABLES]
AS
BEGIN 
INSERT INTO [dbo].[Reforma]
           ([Id]
           ,[Name])
     VALUES (-1,'-1'),
      (3,'3'),
      (4,'4'),
      (5,'5')

INSERT INTO [dbo].[SchoolType]
           ([Id]
           ,[Name])
     VALUES (2,'2'),
      (3,'3'),
      (4,'4')
INSERT INTO [dbo].[HourType]
           ([Id], [ParentId]
           ,[Name])
     VALUES (1, 1,'1')
INSERT INTO [dbo].[PayAbsence]
           ([Id]
           ,[Name], [IsStandart])
     VALUES (-1, '-1', 1)
END
GO
/****** Object:  StoredProcedure [dbo].[TRUNCATE_MONTHLY_TABLES]    Script Date: 13/09/2019 13:32:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[TRUNCATE_MONTHLY_TABLES] 
AS
BEGIN
TRUNCATE TABLE [SCHEDULE]
TRUNCATE TABLE [GROUP]
TRUNCATE TABLE [ROOM]
TRUNCATE TABLE [CLASS]
TRUNCATE TABLE [TEACHER]
END
GO
USE [master]
GO
ALTER DATABASE [!ESTY&TAMAR] SET  READ_WRITE 
GO
