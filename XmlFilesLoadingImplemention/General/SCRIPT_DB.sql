USE [master]
GO

/****** Object:  Database [!ESTY&TAMAR]    Script Date: 15/09/2019 03:08:08 ******/
CREATE DATABASE [!ESTY&TAMAR]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'!ESTY&TAMAR', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\ST\!ESTY&TAMAR.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'!ESTY&TAMAR_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\ST\!ESTY&TAMAR_log.ldf' , SIZE = 73728KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
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

ALTER DATABASE [!ESTY&TAMAR] SET  READ_WRITE 
GO
