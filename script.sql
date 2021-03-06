USE [master]
GO
/****** Object:  Database [OnlineHospitalInfoDB]    Script Date: 29-Apr-16 9:29:49 AM ******/
CREATE DATABASE [OnlineHospitalInfoDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'OnlineHospitalInfoDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\OnlineHospitalInfoDB.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'OnlineHospitalInfoDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\OnlineHospitalInfoDB_log.ldf' , SIZE = 1280KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [OnlineHospitalInfoDB] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [OnlineHospitalInfoDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [OnlineHospitalInfoDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [OnlineHospitalInfoDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [OnlineHospitalInfoDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [OnlineHospitalInfoDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [OnlineHospitalInfoDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [OnlineHospitalInfoDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [OnlineHospitalInfoDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [OnlineHospitalInfoDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [OnlineHospitalInfoDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [OnlineHospitalInfoDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [OnlineHospitalInfoDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [OnlineHospitalInfoDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [OnlineHospitalInfoDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [OnlineHospitalInfoDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [OnlineHospitalInfoDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [OnlineHospitalInfoDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [OnlineHospitalInfoDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [OnlineHospitalInfoDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [OnlineHospitalInfoDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [OnlineHospitalInfoDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [OnlineHospitalInfoDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [OnlineHospitalInfoDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [OnlineHospitalInfoDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [OnlineHospitalInfoDB] SET  MULTI_USER 
GO
ALTER DATABASE [OnlineHospitalInfoDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [OnlineHospitalInfoDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [OnlineHospitalInfoDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [OnlineHospitalInfoDB] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [OnlineHospitalInfoDB] SET DELAYED_DURABILITY = DISABLED 
GO
USE [OnlineHospitalInfoDB]
GO
/****** Object:  Table [dbo].[Day]    Script Date: 29-Apr-16 9:29:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Day](
	[DayId] [int] IDENTITY(1,1) NOT NULL,
	[DayName] [varchar](50) NOT NULL,
	[DoctorId] [int] NOT NULL,
	[Time] [varchar](100) NOT NULL,
 CONSTRAINT [PK_Day] PRIMARY KEY CLUSTERED 
(
	[DayId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Degree]    Script Date: 29-Apr-16 9:29:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Degree](
	[DegreeId] [int] IDENTITY(1,1) NOT NULL,
	[DegreeName] [varchar](100) NOT NULL,
 CONSTRAINT [PK_Degree] PRIMARY KEY CLUSTERED 
(
	[DegreeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Department]    Script Date: 29-Apr-16 9:29:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Department](
	[DepartmentId] [int] IDENTITY(1,1) NOT NULL,
	[DepartmentName] [varchar](300) NOT NULL,
	[HospitalId] [int] NOT NULL,
 CONSTRAINT [PK_[Department] PRIMARY KEY CLUSTERED 
(
	[DepartmentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Doctor]    Script Date: 29-Apr-16 9:29:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Doctor](
	[DoctorId] [int] IDENTITY(1,1) NOT NULL,
	[DoctorName] [varchar](150) NOT NULL,
	[Gender] [varchar](20) NOT NULL,
	[DepartmentId] [int] NOT NULL,
	[DegreeId] [int] NOT NULL,
	[InstitutionId] [int] NOT NULL,
	[SpecilizationId] [int] NOT NULL,
	[HospitalId] [int] NOT NULL,
	[Visit] [int] NOT NULL,
	[GovernmentHospitalId] [int] NULL,
 CONSTRAINT [PK_Doctor] PRIMARY KEY CLUSTERED 
(
	[DoctorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Hospital]    Script Date: 29-Apr-16 9:29:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Hospital](
	[HospitalId] [int] IDENTITY(1,1) NOT NULL,
	[HospitalName] [varchar](400) NOT NULL,
	[Location] [varchar](400) NOT NULL,
	[HospitalType] [varchar](100) NOT NULL,
	[HospitalShortDescription] [varchar](400) NULL,
	[ImageData] [image] NOT NULL,
 CONSTRAINT [PK_Hospital] PRIMARY KEY CLUSTERED 
(
	[HospitalId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[HospitalUserLogin]    Script Date: 29-Apr-16 9:29:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[HospitalUserLogin](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [varchar](50) NOT NULL,
	[Password] [varchar](50) NOT NULL,
	[LastLoginDateTime] [datetime] NULL,
	[HospitalId] [int] NOT NULL,
 CONSTRAINT [PK_HospitalUserLogin] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PatientBooking]    Script Date: 29-Apr-16 9:29:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PatientBooking](
	[PatientId] [int] IDENTITY(1,1) NOT NULL,
	[PatientName] [varchar](70) NOT NULL,
	[PatientAge] [int] NOT NULL,
	[MaritalStatus] [varchar](50) NOT NULL,
	[Gender] [varchar](50) NOT NULL,
	[VisitDate] [date] NOT NULL,
	[PatientType] [varchar](50) NOT NULL,
	[DoctorId] [int] NOT NULL,
	[BookingDateTime] [datetime] NOT NULL,
	[HospitalId] [int] NOT NULL,
	[SerialNo] [int] NOT NULL,
 CONSTRAINT [PK_PatientBooking] PRIMARY KEY CLUSTERED 
(
	[PatientId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Specilization]    Script Date: 29-Apr-16 9:29:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Specilization](
	[SpecilizationId] [int] IDENTITY(1,1) NOT NULL,
	[SpecilizationName] [varchar](300) NOT NULL,
 CONSTRAINT [PK_Specilization] PRIMARY KEY CLUSTERED 
(
	[SpecilizationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[T]    Script Date: 29-Apr-16 9:29:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[T](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Value] [int] NOT NULL,
	[Deg] [int] NULL,
 CONSTRAINT [PK_T] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Test]    Script Date: 29-Apr-16 9:29:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Test](
	[TestId] [int] IDENTITY(1,1) NOT NULL,
	[TestName] [varchar](100) NOT NULL,
	[Coast] [int] NOT NULL,
	[HospitalId] [int] NOT NULL,
 CONSTRAINT [PK_Test] PRIMARY KEY CLUSTERED 
(
	[TestId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Time]    Script Date: 29-Apr-16 9:29:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Time](
	[TimeId] [int] IDENTITY(1,1) NOT NULL,
	[TimeRange] [varchar](100) NOT NULL,
 CONSTRAINT [PK_Time] PRIMARY KEY CLUSTERED 
(
	[TimeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Visit]    Script Date: 29-Apr-16 9:29:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Visit](
	[VisitId] [int] IDENTITY(1,1) NOT NULL,
	[VisitCost] [int] NOT NULL,
 CONSTRAINT [PK_Visit] PRIMARY KEY CLUSTERED 
(
	[VisitId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
USE [master]
GO
ALTER DATABASE [OnlineHospitalInfoDB] SET  READ_WRITE 
GO
