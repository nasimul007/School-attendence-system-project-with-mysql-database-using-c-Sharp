USE [master]
GO
/****** Object:  Database [StudentAttendanceSystem]    Script Date: 25-May-18 2:39:14 PM ******/
CREATE DATABASE [StudentAttendanceSystem]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'StudentAttendanceSystem', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\StudentAttendanceSystem.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'StudentAttendanceSystem_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\StudentAttendanceSystem_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [StudentAttendanceSystem] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [StudentAttendanceSystem].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [StudentAttendanceSystem] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [StudentAttendanceSystem] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [StudentAttendanceSystem] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [StudentAttendanceSystem] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [StudentAttendanceSystem] SET ARITHABORT OFF 
GO
ALTER DATABASE [StudentAttendanceSystem] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [StudentAttendanceSystem] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [StudentAttendanceSystem] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [StudentAttendanceSystem] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [StudentAttendanceSystem] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [StudentAttendanceSystem] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [StudentAttendanceSystem] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [StudentAttendanceSystem] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [StudentAttendanceSystem] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [StudentAttendanceSystem] SET  DISABLE_BROKER 
GO
ALTER DATABASE [StudentAttendanceSystem] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [StudentAttendanceSystem] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [StudentAttendanceSystem] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [StudentAttendanceSystem] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [StudentAttendanceSystem] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [StudentAttendanceSystem] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [StudentAttendanceSystem] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [StudentAttendanceSystem] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [StudentAttendanceSystem] SET  MULTI_USER 
GO
ALTER DATABASE [StudentAttendanceSystem] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [StudentAttendanceSystem] SET DB_CHAINING OFF 
GO
ALTER DATABASE [StudentAttendanceSystem] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [StudentAttendanceSystem] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [StudentAttendanceSystem] SET DELAYED_DURABILITY = DISABLED 
GO
USE [StudentAttendanceSystem]
GO
/****** Object:  Table [dbo].[AcademicYear]    Script Date: 25-May-18 2:39:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AcademicYear](
	[YearId] [int] IDENTITY(1,1) NOT NULL,
	[Year] [nvarchar](10) NOT NULL,
	[IsCurrent] [bit] NOT NULL CONSTRAINT [DF_AcademicYear_IsCurrent]  DEFAULT ((0)),
 CONSTRAINT [PK_AcademicYear] PRIMARY KEY CLUSTERED 
(
	[YearId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Admin]    Script Date: 25-May-18 2:39:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Admin](
	[AdminId] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[EmployeeId] [int] NOT NULL,
 CONSTRAINT [PK_Admin] PRIMARY KEY CLUSTERED 
(
	[AdminId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Attendance]    Script Date: 25-May-18 2:39:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Attendance](
	[AttendanceId] [bigint] IDENTITY(1,1) NOT NULL,
	[Date] [date] NOT NULL,
	[IsAttend] [bit] NOT NULL CONSTRAINT [DF_Attendance_IsAttend]  DEFAULT ((1)),
	[StudentId] [int] NOT NULL,
	[UpdatedBy] [int] NOT NULL,
 CONSTRAINT [PK_Attendance] PRIMARY KEY CLUSTERED 
(
	[AttendanceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[BaseData]    Script Date: 25-May-18 2:39:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BaseData](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Value] [nvarchar](250) NOT NULL,
	[Category] [nvarchar](250) NOT NULL,
	[OrderBy] [int] NULL,
	[IsActive] [bit] NOT NULL CONSTRAINT [DF_BaseData_IsActive]  DEFAULT ((1)),
 CONSTRAINT [PK_BaseData] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Class]    Script Date: 25-May-18 2:39:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Class](
	[ClassId] [int] IDENTITY(1,1) NOT NULL,
	[ClassName] [nvarchar](25) NOT NULL,
	[IsGroup] [bit] NOT NULL CONSTRAINT [DF_Class_IsGroup]  DEFAULT ((0)),
	[IsActive] [bit] NOT NULL CONSTRAINT [DF_Class_IsActive]  DEFAULT ((1)),
	[OrderBy] [int] NOT NULL,
 CONSTRAINT [PK_Class] PRIMARY KEY CLUSTERED 
(
	[ClassId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ClassSection]    Script Date: 25-May-18 2:39:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClassSection](
	[ClassSectionId] [int] IDENTITY(1,1) NOT NULL,
	[ClassId] [int] NOT NULL,
	[SectionName] [nvarchar](50) NOT NULL,
	[IsActive] [bit] NOT NULL CONSTRAINT [DF_ClassSection_IsActive]  DEFAULT ((1)),
	[ClassTeacherId] [int] NOT NULL,
 CONSTRAINT [PK_ClassSection] PRIMARY KEY CLUSTERED 
(
	[ClassSectionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ClassSectionDayPeriodSubject]    Script Date: 25-May-18 2:39:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClassSectionDayPeriodSubject](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ClassSectionId] [int] NOT NULL,
	[DayId] [int] NOT NULL,
	[PeriodId] [int] NOT NULL,
	[SubjectId] [int] NOT NULL,
 CONSTRAINT [PK_ClassSectionDayPeriod] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ClassSectionSubject]    Script Date: 25-May-18 2:39:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClassSectionSubject](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ClassSectionId] [int] NOT NULL,
	[SubjectId] [int] NOT NULL,
	[IsActive] [bit] NOT NULL CONSTRAINT [DF_ClassSectionSubject_IsActive]  DEFAULT ((1)),
 CONSTRAINT [PK_ClassSectionTeacherSubject] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ClassSectionSubjectTeacher]    Script Date: 25-May-18 2:39:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClassSectionSubjectTeacher](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TeacherId] [int] NOT NULL,
	[ClassSectionSubjectId] [int] NOT NULL,
	[Remarks] [nvarchar](500) NULL,
 CONSTRAINT [PK_ClassSectionSubjectTeacher] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Day]    Script Date: 25-May-18 2:39:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Day](
	[DayId] [int] IDENTITY(1,1) NOT NULL,
	[DayName] [nvarchar](20) NOT NULL,
	[IsOffDay] [bit] NOT NULL,
 CONSTRAINT [PK_Day] PRIMARY KEY CLUSTERED 
(
	[DayId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Designation]    Script Date: 25-May-18 2:39:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Designation](
	[DesignationId] [int] IDENTITY(1,1) NOT NULL,
	[DesignationName] [nvarchar](50) NOT NULL,
	[IsActive] [bit] NOT NULL CONSTRAINT [DF_Designation_IsActive]  DEFAULT ((1)),
 CONSTRAINT [PK_Designation] PRIMARY KEY CLUSTERED 
(
	[DesignationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Employee]    Script Date: 25-May-18 2:39:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee](
	[EmployeeId] [int] IDENTITY(1,1) NOT NULL,
	[JoinDate] [date] NOT NULL,
	[Phone] [nvarchar](20) NOT NULL,
	[IsActive] [bit] NOT NULL CONSTRAINT [DF_Employee_IsActive]  DEFAULT ((1)),
	[PersonId] [int] NOT NULL,
	[IdNumber] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK_Employee] PRIMARY KEY CLUSTERED 
(
	[EmployeeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Exam]    Script Date: 25-May-18 2:39:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Exam](
	[ExamId] [int] IDENTITY(1,1) NOT NULL,
	[ExamName] [nvarchar](50) NOT NULL,
	[IsActive] [bit] NOT NULL CONSTRAINT [DF_Exam_IsActive]  DEFAULT ((1)),
	[FinalPercentage] [float] NOT NULL,
 CONSTRAINT [PK_Exam] PRIMARY KEY CLUSTERED 
(
	[ExamId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Marks]    Script Date: 25-May-18 2:39:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Marks](
	[MarksId] [int] IDENTITY(1,1) NOT NULL,
	[ExamId] [int] NOT NULL,
	[StudentId] [int] NOT NULL,
	[ClassSectionSubjectId] [int] NOT NULL,
	[Marks] [float] NOT NULL,
	[YearId] [int] NOT NULL,
	[UpdateBy] [int] NOT NULL,
 CONSTRAINT [PK_Marks] PRIMARY KEY CLUSTERED 
(
	[MarksId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Period]    Script Date: 25-May-18 2:39:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Period](
	[PeriodId] [int] IDENTITY(1,1) NOT NULL,
	[PeriodName] [nvarchar](30) NOT NULL,
	[TimeFrom] [time](7) NOT NULL,
	[TimeTo] [time](7) NOT NULL,
 CONSTRAINT [PK_Period] PRIMARY KEY CLUSTERED 
(
	[PeriodId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Person]    Script Date: 25-May-18 2:39:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Person](
	[PersonId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[BirthDate] [date] NOT NULL,
	[BloodGroupId] [int] NULL,
	[GenderId] [int] NOT NULL,
	[Religion] [nvarchar](20) NULL,
	[Address] [nvarchar](500) NULL,
	[CreatedBy] [int] NULL,
	[CreatedDate] [date] NULL,
 CONSTRAINT [PK_Person] PRIMARY KEY CLUSTERED 
(
	[PersonId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PromotionHistory]    Script Date: 25-May-18 2:39:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PromotionHistory](
	[PromotionId] [int] IDENTITY(1,1) NOT NULL,
	[StudentId] [int] NOT NULL,
	[PreviousClassId] [int] NOT NULL,
	[CurrentClassId] [int] NULL,
	[Remarks] [text] NULL,
	[PreviousYearId] [int] NOT NULL,
	[UpdatedBy] [int] NOT NULL,
 CONSTRAINT [PK_PromotionHistory] PRIMARY KEY CLUSTERED 
(
	[PromotionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Settings]    Script Date: 25-May-18 2:39:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Settings](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[SchoolName] [nvarchar](250) NOT NULL,
	[SchoolAddress] [nvarchar](500) NOT NULL,
	[MobileNo] [nvarchar](20) NULL,
	[TNT] [nvarchar](20) NULL,
	[Logo] [nvarchar](250) NULL,
 CONSTRAINT [PK_Settings] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Staff]    Script Date: 25-May-18 2:39:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Staff](
	[StaffId] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[EmployeeId] [int] NOT NULL,
 CONSTRAINT [PK_Staff] PRIMARY KEY CLUSTERED 
(
	[StaffId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Student]    Script Date: 25-May-18 2:39:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Student](
	[StudentId] [int] IDENTITY(1,1) NOT NULL,
	[PersonId] [int] NOT NULL,
	[IsActive] [bit] NOT NULL CONSTRAINT [DF_Student_IsActive]  DEFAULT ((1)),
	[IdNumber] [nvarchar](32) NOT NULL,
	[FatherName] [nvarchar](100) NOT NULL,
	[MotherName] [nvarchar](100) NOT NULL,
	[FatherProfession] [nvarchar](50) NOT NULL,
	[MotherProfession] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](100) NULL,
	[Phone] [nvarchar](20) NOT NULL,
 CONSTRAINT [PK_Student] PRIMARY KEY CLUSTERED 
(
	[StudentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[StudentClassSection]    Script Date: 25-May-18 2:39:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StudentClassSection](
	[StudentClassSectionId] [int] IDENTITY(1,1) NOT NULL,
	[ClassSectionId] [int] NOT NULL,
	[StudentId] [int] NOT NULL,
	[Roll] [int] NOT NULL,
	[YearId] [int] NOT NULL,
	[StatusId] [int] NOT NULL,
 CONSTRAINT [PK_StudentClassSection] PRIMARY KEY CLUSTERED 
(
	[StudentClassSectionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Subject]    Script Date: 25-May-18 2:39:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Subject](
	[SubjectId] [int] IDENTITY(1,1) NOT NULL,
	[SubjectName] [nvarchar](50) NOT NULL,
	[IsActive] [bit] NOT NULL CONSTRAINT [DF_Subject_IsActive]  DEFAULT ((1)),
 CONSTRAINT [PK_Subject] PRIMARY KEY CLUSTERED 
(
	[SubjectId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Teacher]    Script Date: 25-May-18 2:39:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Teacher](
	[TeacherId] [int] IDENTITY(1,1) NOT NULL,
	[EmployeeId] [int] NOT NULL,
	[Email] [nvarchar](250) NULL,
	[DesignationId] [int] NOT NULL,
 CONSTRAINT [PK_Teacher] PRIMARY KEY CLUSTERED 
(
	[TeacherId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TeacherExpertise]    Script Date: 25-May-18 2:39:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TeacherExpertise](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TeacherId] [int] NOT NULL,
	[SubjectId] [int] NOT NULL,
 CONSTRAINT [PK_TeacherExpertise] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TempPromotionTable]    Script Date: 25-May-18 2:39:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TempPromotionTable](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[StudentId] [int] NOT NULL,
	[IsPassed] [bit] NOT NULL,
	[NextClassSectionId] [int] NULL,
	[CurrentYearId] [int] NOT NULL,
	[AverageMarks] [float] NOT NULL,
	[Remarks] [nvarchar](500) NOT NULL,
	[NextClassId] [int] NULL,
 CONSTRAINT [PK_TempPromotionTable] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[User]    Script Date: 25-May-18 2:39:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](100) NOT NULL,
	[Email] [nvarchar](100) NOT NULL,
	[UserTypeId] [int] NOT NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[Day] ADD  CONSTRAINT [DF_Day_IsOffDay]  DEFAULT ((1)) FOR [IsOffDay]
GO
ALTER TABLE [dbo].[Admin]  WITH CHECK ADD  CONSTRAINT [FK_Admin_Employee] FOREIGN KEY([EmployeeId])
REFERENCES [dbo].[Employee] ([EmployeeId])
GO
ALTER TABLE [dbo].[Admin] CHECK CONSTRAINT [FK_Admin_Employee]
GO
ALTER TABLE [dbo].[Admin]  WITH CHECK ADD  CONSTRAINT [FK_Admin_User] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([UserId])
GO
ALTER TABLE [dbo].[Admin] CHECK CONSTRAINT [FK_Admin_User]
GO
ALTER TABLE [dbo].[Attendance]  WITH CHECK ADD  CONSTRAINT [FK_Attendance_Student] FOREIGN KEY([StudentId])
REFERENCES [dbo].[Student] ([StudentId])
GO
ALTER TABLE [dbo].[Attendance] CHECK CONSTRAINT [FK_Attendance_Student]
GO
ALTER TABLE [dbo].[Attendance]  WITH CHECK ADD  CONSTRAINT [FK_Attendance_User] FOREIGN KEY([UpdatedBy])
REFERENCES [dbo].[User] ([UserId])
GO
ALTER TABLE [dbo].[Attendance] CHECK CONSTRAINT [FK_Attendance_User]
GO
ALTER TABLE [dbo].[ClassSection]  WITH CHECK ADD  CONSTRAINT [FK_ClassSection_Class] FOREIGN KEY([ClassId])
REFERENCES [dbo].[Class] ([ClassId])
GO
ALTER TABLE [dbo].[ClassSection] CHECK CONSTRAINT [FK_ClassSection_Class]
GO
ALTER TABLE [dbo].[ClassSectionDayPeriodSubject]  WITH CHECK ADD  CONSTRAINT [FK_Table_1_ClassSection] FOREIGN KEY([ClassSectionId])
REFERENCES [dbo].[ClassSection] ([ClassSectionId])
GO
ALTER TABLE [dbo].[ClassSectionDayPeriodSubject] CHECK CONSTRAINT [FK_Table_1_ClassSection]
GO
ALTER TABLE [dbo].[ClassSectionDayPeriodSubject]  WITH CHECK ADD  CONSTRAINT [FK_Table_1_Day] FOREIGN KEY([DayId])
REFERENCES [dbo].[Day] ([DayId])
GO
ALTER TABLE [dbo].[ClassSectionDayPeriodSubject] CHECK CONSTRAINT [FK_Table_1_Day]
GO
ALTER TABLE [dbo].[ClassSectionDayPeriodSubject]  WITH CHECK ADD  CONSTRAINT [FK_Table_1_Period] FOREIGN KEY([PeriodId])
REFERENCES [dbo].[Period] ([PeriodId])
GO
ALTER TABLE [dbo].[ClassSectionDayPeriodSubject] CHECK CONSTRAINT [FK_Table_1_Period]
GO
ALTER TABLE [dbo].[ClassSectionDayPeriodSubject]  WITH CHECK ADD  CONSTRAINT [FK_Table_1_Subject] FOREIGN KEY([SubjectId])
REFERENCES [dbo].[Subject] ([SubjectId])
GO
ALTER TABLE [dbo].[ClassSectionDayPeriodSubject] CHECK CONSTRAINT [FK_Table_1_Subject]
GO
ALTER TABLE [dbo].[ClassSectionSubject]  WITH CHECK ADD  CONSTRAINT [FK_Table1_ClassSection] FOREIGN KEY([ClassSectionId])
REFERENCES [dbo].[ClassSection] ([ClassSectionId])
GO
ALTER TABLE [dbo].[ClassSectionSubject] CHECK CONSTRAINT [FK_Table1_ClassSection]
GO
ALTER TABLE [dbo].[ClassSectionSubject]  WITH CHECK ADD  CONSTRAINT [FK_Table1_Subject] FOREIGN KEY([SubjectId])
REFERENCES [dbo].[Subject] ([SubjectId])
GO
ALTER TABLE [dbo].[ClassSectionSubject] CHECK CONSTRAINT [FK_Table1_Subject]
GO
ALTER TABLE [dbo].[ClassSectionSubjectTeacher]  WITH CHECK ADD  CONSTRAINT [FK_ClassSectionSubjectTeacher_ClassSectionSubject] FOREIGN KEY([ClassSectionSubjectId])
REFERENCES [dbo].[ClassSectionSubject] ([Id])
GO
ALTER TABLE [dbo].[ClassSectionSubjectTeacher] CHECK CONSTRAINT [FK_ClassSectionSubjectTeacher_ClassSectionSubject]
GO
ALTER TABLE [dbo].[ClassSectionSubjectTeacher]  WITH CHECK ADD  CONSTRAINT [FK_ClassSectionSubjectTeacher_Teacher] FOREIGN KEY([TeacherId])
REFERENCES [dbo].[Teacher] ([TeacherId])
GO
ALTER TABLE [dbo].[ClassSectionSubjectTeacher] CHECK CONSTRAINT [FK_ClassSectionSubjectTeacher_Teacher]
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [FK_Employee_Person] FOREIGN KEY([PersonId])
REFERENCES [dbo].[Person] ([PersonId])
GO
ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [FK_Employee_Person]
GO
ALTER TABLE [dbo].[Marks]  WITH CHECK ADD  CONSTRAINT [FK_Marks_AcademicYear] FOREIGN KEY([YearId])
REFERENCES [dbo].[AcademicYear] ([YearId])
GO
ALTER TABLE [dbo].[Marks] CHECK CONSTRAINT [FK_Marks_AcademicYear]
GO
ALTER TABLE [dbo].[Marks]  WITH CHECK ADD  CONSTRAINT [FK_Marks_ClassSectionSubject] FOREIGN KEY([ClassSectionSubjectId])
REFERENCES [dbo].[ClassSectionSubject] ([Id])
GO
ALTER TABLE [dbo].[Marks] CHECK CONSTRAINT [FK_Marks_ClassSectionSubject]
GO
ALTER TABLE [dbo].[Marks]  WITH CHECK ADD  CONSTRAINT [FK_Marks_Exam] FOREIGN KEY([ExamId])
REFERENCES [dbo].[Exam] ([ExamId])
GO
ALTER TABLE [dbo].[Marks] CHECK CONSTRAINT [FK_Marks_Exam]
GO
ALTER TABLE [dbo].[Marks]  WITH CHECK ADD  CONSTRAINT [FK_Marks_Student] FOREIGN KEY([StudentId])
REFERENCES [dbo].[Student] ([StudentId])
GO
ALTER TABLE [dbo].[Marks] CHECK CONSTRAINT [FK_Marks_Student]
GO
ALTER TABLE [dbo].[Marks]  WITH CHECK ADD  CONSTRAINT [FK_Marks_User] FOREIGN KEY([UpdateBy])
REFERENCES [dbo].[User] ([UserId])
GO
ALTER TABLE [dbo].[Marks] CHECK CONSTRAINT [FK_Marks_User]
GO
ALTER TABLE [dbo].[Person]  WITH CHECK ADD  CONSTRAINT [FK_Person_BaseData] FOREIGN KEY([GenderId])
REFERENCES [dbo].[BaseData] ([Id])
GO
ALTER TABLE [dbo].[Person] CHECK CONSTRAINT [FK_Person_BaseData]
GO
ALTER TABLE [dbo].[Person]  WITH CHECK ADD  CONSTRAINT [FK_Person_BaseData1] FOREIGN KEY([BloodGroupId])
REFERENCES [dbo].[BaseData] ([Id])
GO
ALTER TABLE [dbo].[Person] CHECK CONSTRAINT [FK_Person_BaseData1]
GO
ALTER TABLE [dbo].[Person]  WITH CHECK ADD  CONSTRAINT [FK_Person_User] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[User] ([UserId])
GO
ALTER TABLE [dbo].[Person] CHECK CONSTRAINT [FK_Person_User]
GO
ALTER TABLE [dbo].[PromotionHistory]  WITH CHECK ADD  CONSTRAINT [FK_PromotionHistory_AcademicYear] FOREIGN KEY([PreviousYearId])
REFERENCES [dbo].[AcademicYear] ([YearId])
GO
ALTER TABLE [dbo].[PromotionHistory] CHECK CONSTRAINT [FK_PromotionHistory_AcademicYear]
GO
ALTER TABLE [dbo].[PromotionHistory]  WITH CHECK ADD  CONSTRAINT [FK_PromotionHistory_Class] FOREIGN KEY([PreviousClassId])
REFERENCES [dbo].[Class] ([ClassId])
GO
ALTER TABLE [dbo].[PromotionHistory] CHECK CONSTRAINT [FK_PromotionHistory_Class]
GO
ALTER TABLE [dbo].[PromotionHistory]  WITH CHECK ADD  CONSTRAINT [FK_PromotionHistory_Class1] FOREIGN KEY([CurrentClassId])
REFERENCES [dbo].[Class] ([ClassId])
GO
ALTER TABLE [dbo].[PromotionHistory] CHECK CONSTRAINT [FK_PromotionHistory_Class1]
GO
ALTER TABLE [dbo].[PromotionHistory]  WITH CHECK ADD  CONSTRAINT [FK_PromotionHistory_Student] FOREIGN KEY([StudentId])
REFERENCES [dbo].[Student] ([StudentId])
GO
ALTER TABLE [dbo].[PromotionHistory] CHECK CONSTRAINT [FK_PromotionHistory_Student]
GO
ALTER TABLE [dbo].[PromotionHistory]  WITH CHECK ADD  CONSTRAINT [FK_PromotionHistory_User] FOREIGN KEY([UpdatedBy])
REFERENCES [dbo].[User] ([UserId])
GO
ALTER TABLE [dbo].[PromotionHistory] CHECK CONSTRAINT [FK_PromotionHistory_User]
GO
ALTER TABLE [dbo].[Staff]  WITH CHECK ADD  CONSTRAINT [FK_Staff_Employee] FOREIGN KEY([EmployeeId])
REFERENCES [dbo].[Employee] ([EmployeeId])
GO
ALTER TABLE [dbo].[Staff] CHECK CONSTRAINT [FK_Staff_Employee]
GO
ALTER TABLE [dbo].[Staff]  WITH CHECK ADD  CONSTRAINT [FK_Staff_User] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([UserId])
GO
ALTER TABLE [dbo].[Staff] CHECK CONSTRAINT [FK_Staff_User]
GO
ALTER TABLE [dbo].[Student]  WITH CHECK ADD  CONSTRAINT [FK_Student_Person] FOREIGN KEY([PersonId])
REFERENCES [dbo].[Person] ([PersonId])
GO
ALTER TABLE [dbo].[Student] CHECK CONSTRAINT [FK_Student_Person]
GO
ALTER TABLE [dbo].[StudentClassSection]  WITH CHECK ADD  CONSTRAINT [FK_StudentClassSection_AcademicYear] FOREIGN KEY([YearId])
REFERENCES [dbo].[AcademicYear] ([YearId])
GO
ALTER TABLE [dbo].[StudentClassSection] CHECK CONSTRAINT [FK_StudentClassSection_AcademicYear]
GO
ALTER TABLE [dbo].[StudentClassSection]  WITH CHECK ADD  CONSTRAINT [FK_StudentClassSection_BaseData] FOREIGN KEY([StatusId])
REFERENCES [dbo].[BaseData] ([Id])
GO
ALTER TABLE [dbo].[StudentClassSection] CHECK CONSTRAINT [FK_StudentClassSection_BaseData]
GO
ALTER TABLE [dbo].[StudentClassSection]  WITH CHECK ADD  CONSTRAINT [FK_StudentClassSection_ClassSection] FOREIGN KEY([ClassSectionId])
REFERENCES [dbo].[ClassSection] ([ClassSectionId])
GO
ALTER TABLE [dbo].[StudentClassSection] CHECK CONSTRAINT [FK_StudentClassSection_ClassSection]
GO
ALTER TABLE [dbo].[StudentClassSection]  WITH CHECK ADD  CONSTRAINT [FK_StudentClassSection_Student] FOREIGN KEY([StudentId])
REFERENCES [dbo].[Student] ([StudentId])
GO
ALTER TABLE [dbo].[StudentClassSection] CHECK CONSTRAINT [FK_StudentClassSection_Student]
GO
ALTER TABLE [dbo].[Teacher]  WITH CHECK ADD  CONSTRAINT [FK_Teacher_Designation] FOREIGN KEY([DesignationId])
REFERENCES [dbo].[Designation] ([DesignationId])
GO
ALTER TABLE [dbo].[Teacher] CHECK CONSTRAINT [FK_Teacher_Designation]
GO
ALTER TABLE [dbo].[Teacher]  WITH CHECK ADD  CONSTRAINT [FK_Teacher_Employee] FOREIGN KEY([EmployeeId])
REFERENCES [dbo].[Employee] ([EmployeeId])
GO
ALTER TABLE [dbo].[Teacher] CHECK CONSTRAINT [FK_Teacher_Employee]
GO
ALTER TABLE [dbo].[TeacherExpertise]  WITH CHECK ADD  CONSTRAINT [FK_TeacherExpertise_Subject] FOREIGN KEY([SubjectId])
REFERENCES [dbo].[Subject] ([SubjectId])
GO
ALTER TABLE [dbo].[TeacherExpertise] CHECK CONSTRAINT [FK_TeacherExpertise_Subject]
GO
ALTER TABLE [dbo].[TeacherExpertise]  WITH CHECK ADD  CONSTRAINT [FK_TeacherExpertise_Teacher] FOREIGN KEY([TeacherId])
REFERENCES [dbo].[Teacher] ([TeacherId])
GO
ALTER TABLE [dbo].[TeacherExpertise] CHECK CONSTRAINT [FK_TeacherExpertise_Teacher]
GO
ALTER TABLE [dbo].[TempPromotionTable]  WITH CHECK ADD  CONSTRAINT [FK_TempPromotionTable_AcademicYear] FOREIGN KEY([CurrentYearId])
REFERENCES [dbo].[AcademicYear] ([YearId])
GO
ALTER TABLE [dbo].[TempPromotionTable] CHECK CONSTRAINT [FK_TempPromotionTable_AcademicYear]
GO
ALTER TABLE [dbo].[TempPromotionTable]  WITH CHECK ADD  CONSTRAINT [FK_TempPromotionTable_Class] FOREIGN KEY([NextClassId])
REFERENCES [dbo].[Class] ([ClassId])
GO
ALTER TABLE [dbo].[TempPromotionTable] CHECK CONSTRAINT [FK_TempPromotionTable_Class]
GO
ALTER TABLE [dbo].[TempPromotionTable]  WITH CHECK ADD  CONSTRAINT [FK_TempPromotionTable_ClassSection] FOREIGN KEY([NextClassSectionId])
REFERENCES [dbo].[ClassSection] ([ClassSectionId])
GO
ALTER TABLE [dbo].[TempPromotionTable] CHECK CONSTRAINT [FK_TempPromotionTable_ClassSection]
GO
ALTER TABLE [dbo].[TempPromotionTable]  WITH CHECK ADD  CONSTRAINT [FK_TempPromotionTable_Student] FOREIGN KEY([StudentId])
REFERENCES [dbo].[Student] ([StudentId])
GO
ALTER TABLE [dbo].[TempPromotionTable] CHECK CONSTRAINT [FK_TempPromotionTable_Student]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_BaseData] FOREIGN KEY([UserTypeId])
REFERENCES [dbo].[BaseData] ([Id])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_BaseData]
GO
USE [master]
GO
ALTER DATABASE [StudentAttendanceSystem] SET  READ_WRITE 
GO
