USE [master]
GO
/****** Object:  Database [AlsoDemo]    Script Date: 17/07/2024 12:19:20 CH ******/
CREATE DATABASE [AlsoDemo]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'AlsoDemo', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\AlsoDemo.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'AlsoDemo_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\AlsoDemo_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [AlsoDemo] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [AlsoDemo].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [AlsoDemo] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [AlsoDemo] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [AlsoDemo] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [AlsoDemo] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [AlsoDemo] SET ARITHABORT OFF 
GO
ALTER DATABASE [AlsoDemo] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [AlsoDemo] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [AlsoDemo] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [AlsoDemo] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [AlsoDemo] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [AlsoDemo] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [AlsoDemo] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [AlsoDemo] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [AlsoDemo] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [AlsoDemo] SET  DISABLE_BROKER 
GO
ALTER DATABASE [AlsoDemo] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [AlsoDemo] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [AlsoDemo] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [AlsoDemo] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [AlsoDemo] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [AlsoDemo] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [AlsoDemo] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [AlsoDemo] SET RECOVERY FULL 
GO
ALTER DATABASE [AlsoDemo] SET  MULTI_USER 
GO
ALTER DATABASE [AlsoDemo] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [AlsoDemo] SET DB_CHAINING OFF 
GO
ALTER DATABASE [AlsoDemo] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [AlsoDemo] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [AlsoDemo] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [AlsoDemo] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'AlsoDemo', N'ON'
GO
ALTER DATABASE [AlsoDemo] SET QUERY_STORE = OFF
GO
USE [AlsoDemo]
GO
/****** Object:  Table [dbo].[assesments]    Script Date: 17/07/2024 12:19:20 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[assesments](
	[aid] [int] NOT NULL,
	[aname] [varchar](150) NOT NULL,
	[weight] [float] NOT NULL,
	[subid] [int] NULL,
 CONSTRAINT [PK_assesments] PRIMARY KEY CLUSTERED 
(
	[aid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[courses]    Script Date: 17/07/2024 12:19:20 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[courses](
	[cid] [int] NOT NULL,
	[cname] [varchar](150) NOT NULL,
	[lid] [int] NOT NULL,
	[subid] [int] NOT NULL,
	[semid] [int] NOT NULL,
 CONSTRAINT [PK_courses] PRIMARY KEY CLUSTERED 
(
	[cid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[exams]    Script Date: 17/07/2024 12:19:20 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[exams](
	[eid] [int] NOT NULL,
	[from] [datetime] NOT NULL,
	[duration] [float] NOT NULL,
	[aid] [int] NOT NULL,
 CONSTRAINT [PK_exams] PRIMARY KEY CLUSTERED 
(
	[eid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[grades]    Script Date: 17/07/2024 12:19:20 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[grades](
	[eid] [int] NOT NULL,
	[sid] [int] NOT NULL,
	[score] [float] NOT NULL,
 CONSTRAINT [PK_grades] PRIMARY KEY CLUSTERED 
(
	[eid] ASC,
	[sid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[lecturers]    Script Date: 17/07/2024 12:19:20 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[lecturers](
	[lid] [int] NOT NULL,
	[lname] [varchar](150) NOT NULL,
 CONSTRAINT [PK_lecturers] PRIMARY KEY CLUSTERED 
(
	[lid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[role]    Script Date: 17/07/2024 12:19:20 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[role](
	[roleid] [int] NOT NULL,
	[rolename] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[roleid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[semester]    Script Date: 17/07/2024 12:19:20 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[semester](
	[semid] [int] NOT NULL,
	[year] [int] NOT NULL,
	[season] [varchar](10) NOT NULL,
	[active] [bit] NOT NULL,
 CONSTRAINT [PK_semester] PRIMARY KEY CLUSTERED 
(
	[semid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[students]    Script Date: 17/07/2024 12:19:20 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[students](
	[sid] [int] NOT NULL,
	[sname] [nvarchar](150) NOT NULL,
 CONSTRAINT [PK_students] PRIMARY KEY CLUSTERED 
(
	[sid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[students_courses]    Script Date: 17/07/2024 12:19:20 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[students_courses](
	[sid] [int] NOT NULL,
	[cid] [int] NOT NULL,
 CONSTRAINT [PK_students_courses] PRIMARY KEY CLUSTERED 
(
	[sid] ASC,
	[cid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[subjects]    Script Date: 17/07/2024 12:19:20 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[subjects](
	[subid] [int] NOT NULL,
	[subname] [varchar](150) NOT NULL,
 CONSTRAINT [PK_subjects] PRIMARY KEY CLUSTERED 
(
	[subid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[training_department]    Script Date: 17/07/2024 12:19:20 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[training_department](
	[tid] [int] NOT NULL,
	[username] [varchar](150) NOT NULL,
 CONSTRAINT [PK_training_department] PRIMARY KEY CLUSTERED 
(
	[tid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[users]    Script Date: 17/07/2024 12:19:20 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[users](
	[username] [varchar](150) NOT NULL,
	[password] [varchar](150) NOT NULL,
	[displayname] [varchar](150) NOT NULL,
	[roleid] [int] NOT NULL,
 CONSTRAINT [PK_users] PRIMARY KEY CLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[users_lecturers]    Script Date: 17/07/2024 12:19:20 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[users_lecturers](
	[username] [varchar](150) NOT NULL,
	[lid] [int] NOT NULL,
	[active] [bit] NOT NULL,
 CONSTRAINT [PK_users_lecturers] PRIMARY KEY CLUSTERED 
(
	[username] ASC,
	[lid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[users_students]    Script Date: 17/07/2024 12:19:20 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[users_students](
	[username] [varchar](150) NOT NULL,
	[sid] [int] NOT NULL,
	[active] [bit] NOT NULL,
 CONSTRAINT [PK_users_students] PRIMARY KEY CLUSTERED 
(
	[username] ASC,
	[sid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[assesments] ([aid], [aname], [weight], [subid]) VALUES (1, N'WS1', 0.05, 1)
INSERT [dbo].[assesments] ([aid], [aname], [weight], [subid]) VALUES (2, N'WS2', 0.05, 1)
INSERT [dbo].[assesments] ([aid], [aname], [weight], [subid]) VALUES (3, N'PT', 0.05, 1)
INSERT [dbo].[assesments] ([aid], [aname], [weight], [subid]) VALUES (4, N'PT2', 0.05, 1)
INSERT [dbo].[assesments] ([aid], [aname], [weight], [subid]) VALUES (5, N'Assignment', 0.4, 1)
INSERT [dbo].[assesments] ([aid], [aname], [weight], [subid]) VALUES (6, N'Final Exam', 0.2, 1)
INSERT [dbo].[assesments] ([aid], [aname], [weight], [subid]) VALUES (7, N'Practical Exam', 0.2, 1)
INSERT [dbo].[assesments] ([aid], [aname], [weight], [subid]) VALUES (8, N'WS1', 0.5, 2)
INSERT [dbo].[assesments] ([aid], [aname], [weight], [subid]) VALUES (9, N'WS2', 0.5, 2)
INSERT [dbo].[assesments] ([aid], [aname], [weight], [subid]) VALUES (10, N'FE', 1, 3)
GO
INSERT [dbo].[courses] ([cid], [cname], [lid], [subid], [semid]) VALUES (1, N'SE1871-PRJ301', 1, 1, 4)
INSERT [dbo].[courses] ([cid], [cname], [lid], [subid], [semid]) VALUES (2, N'SE1871-IOT102', 2, 2, 4)
INSERT [dbo].[courses] ([cid], [cname], [lid], [subid], [semid]) VALUES (3, N'SE1871-PRO192', 1, 3, 4)
INSERT [dbo].[courses] ([cid], [cname], [lid], [subid], [semid]) VALUES (4, N'SE1922-PRJ301', 1, 1, 4)
GO
INSERT [dbo].[exams] ([eid], [from], [duration], [aid]) VALUES (1, CAST(N'2024-06-17T09:00:00.000' AS DateTime), 30, 1)
INSERT [dbo].[exams] ([eid], [from], [duration], [aid]) VALUES (2, CAST(N'2024-06-17T09:00:00.000' AS DateTime), 30, 2)
INSERT [dbo].[exams] ([eid], [from], [duration], [aid]) VALUES (3, CAST(N'2024-06-17T09:00:00.000' AS DateTime), 30, 3)
INSERT [dbo].[exams] ([eid], [from], [duration], [aid]) VALUES (4, CAST(N'2024-06-17T09:00:00.000' AS DateTime), 30, 4)
INSERT [dbo].[exams] ([eid], [from], [duration], [aid]) VALUES (5, CAST(N'2024-06-17T09:00:00.000' AS DateTime), 30, 5)
INSERT [dbo].[exams] ([eid], [from], [duration], [aid]) VALUES (6, CAST(N'2024-06-17T09:00:00.000' AS DateTime), 30, 6)
INSERT [dbo].[exams] ([eid], [from], [duration], [aid]) VALUES (7, CAST(N'2024-06-17T09:00:00.000' AS DateTime), 30, 7)
INSERT [dbo].[exams] ([eid], [from], [duration], [aid]) VALUES (8, CAST(N'2024-06-18T09:00:00.000' AS DateTime), 30, 1)
INSERT [dbo].[exams] ([eid], [from], [duration], [aid]) VALUES (9, CAST(N'2024-06-18T09:00:00.000' AS DateTime), 30, 8)
INSERT [dbo].[exams] ([eid], [from], [duration], [aid]) VALUES (10, CAST(N'2024-06-18T09:00:00.000' AS DateTime), 30, 9)
INSERT [dbo].[exams] ([eid], [from], [duration], [aid]) VALUES (11, CAST(N'2024-06-18T09:00:00.000' AS DateTime), 30, 10)
GO
INSERT [dbo].[grades] ([eid], [sid], [score]) VALUES (1, 1, 8)
INSERT [dbo].[grades] ([eid], [sid], [score]) VALUES (1, 2, 1)
INSERT [dbo].[grades] ([eid], [sid], [score]) VALUES (2, 1, 2)
INSERT [dbo].[grades] ([eid], [sid], [score]) VALUES (3, 2, 9)
GO
INSERT [dbo].[lecturers] ([lid], [lname]) VALUES (1, N'sonnt')
INSERT [dbo].[lecturers] ([lid], [lname]) VALUES (2, N'sonhx')
INSERT [dbo].[lecturers] ([lid], [lname]) VALUES (3, N'sonnt1')
GO
INSERT [dbo].[role] ([roleid], [rolename]) VALUES (1, N'Teacher')
INSERT [dbo].[role] ([roleid], [rolename]) VALUES (2, N'Student')
INSERT [dbo].[role] ([roleid], [rolename]) VALUES (3, N'Training Department')
GO
INSERT [dbo].[semester] ([semid], [year], [season], [active]) VALUES (1, 2023, N'SUMMER', 0)
INSERT [dbo].[semester] ([semid], [year], [season], [active]) VALUES (2, 2023, N'FALL', 0)
INSERT [dbo].[semester] ([semid], [year], [season], [active]) VALUES (3, 2024, N'SPRING', 0)
INSERT [dbo].[semester] ([semid], [year], [season], [active]) VALUES (4, 2024, N'SUMMER', 1)
INSERT [dbo].[semester] ([semid], [year], [season], [active]) VALUES (5, 2024, N'FALL', 0)
GO
INSERT [dbo].[students] ([sid], [sname]) VALUES (1, N'student 1')
INSERT [dbo].[students] ([sid], [sname]) VALUES (2, N'student 2')
INSERT [dbo].[students] ([sid], [sname]) VALUES (3, N'student 3')
INSERT [dbo].[students] ([sid], [sname]) VALUES (4, N'student 4')
INSERT [dbo].[students] ([sid], [sname]) VALUES (5, N'student 5')
INSERT [dbo].[students] ([sid], [sname]) VALUES (6, N'student 6')
INSERT [dbo].[students] ([sid], [sname]) VALUES (9, N'diep')
INSERT [dbo].[students] ([sid], [sname]) VALUES (10, N'diep')
GO
INSERT [dbo].[students_courses] ([sid], [cid]) VALUES (1, 1)
INSERT [dbo].[students_courses] ([sid], [cid]) VALUES (1, 2)
INSERT [dbo].[students_courses] ([sid], [cid]) VALUES (2, 1)
INSERT [dbo].[students_courses] ([sid], [cid]) VALUES (2, 2)
INSERT [dbo].[students_courses] ([sid], [cid]) VALUES (3, 1)
INSERT [dbo].[students_courses] ([sid], [cid]) VALUES (3, 3)
INSERT [dbo].[students_courses] ([sid], [cid]) VALUES (4, 3)
GO
INSERT [dbo].[subjects] ([subid], [subname]) VALUES (1, N'PRJ301')
INSERT [dbo].[subjects] ([subid], [subname]) VALUES (2, N'IOT102')
INSERT [dbo].[subjects] ([subid], [subname]) VALUES (3, N'PRO192')
GO
INSERT [dbo].[training_department] ([tid], [username]) VALUES (1, N'training')
GO
INSERT [dbo].[users] ([username], [password], [displayname], [roleid]) VALUES (N'diepnt', N'123', N'Nguyen Tuan Diep', 2)
INSERT [dbo].[users] ([username], [password], [displayname], [roleid]) VALUES (N'quanth', N'123', N'Tran Hong Quan', 2)
INSERT [dbo].[users] ([username], [password], [displayname], [roleid]) VALUES (N'sonhx', N'123', N'Hoang Xuan Son', 1)
INSERT [dbo].[users] ([username], [password], [displayname], [roleid]) VALUES (N'sonnt', N'123', N'Ngo Tung Son', 1)
INSERT [dbo].[users] ([username], [password], [displayname], [roleid]) VALUES (N'training', N'123', N'Traning Department', 3)
GO
INSERT [dbo].[users_lecturers] ([username], [lid], [active]) VALUES (N'sonhx', 2, 1)
INSERT [dbo].[users_lecturers] ([username], [lid], [active]) VALUES (N'sonnt', 1, 1)
GO
INSERT [dbo].[users_students] ([username], [sid], [active]) VALUES (N'diepnt', 2, 1)
INSERT [dbo].[users_students] ([username], [sid], [active]) VALUES (N'quanth', 1, 1)
GO
ALTER TABLE [dbo].[assesments]  WITH CHECK ADD  CONSTRAINT [FK_assesments_subjects] FOREIGN KEY([subid])
REFERENCES [dbo].[subjects] ([subid])
GO
ALTER TABLE [dbo].[assesments] CHECK CONSTRAINT [FK_assesments_subjects]
GO
ALTER TABLE [dbo].[courses]  WITH CHECK ADD  CONSTRAINT [FK_courses_lecturers] FOREIGN KEY([lid])
REFERENCES [dbo].[lecturers] ([lid])
GO
ALTER TABLE [dbo].[courses] CHECK CONSTRAINT [FK_courses_lecturers]
GO
ALTER TABLE [dbo].[courses]  WITH CHECK ADD  CONSTRAINT [FK_courses_semester] FOREIGN KEY([semid])
REFERENCES [dbo].[semester] ([semid])
GO
ALTER TABLE [dbo].[courses] CHECK CONSTRAINT [FK_courses_semester]
GO
ALTER TABLE [dbo].[courses]  WITH CHECK ADD  CONSTRAINT [FK_courses_subjects] FOREIGN KEY([subid])
REFERENCES [dbo].[subjects] ([subid])
GO
ALTER TABLE [dbo].[courses] CHECK CONSTRAINT [FK_courses_subjects]
GO
ALTER TABLE [dbo].[exams]  WITH CHECK ADD  CONSTRAINT [FK_exams_assesments] FOREIGN KEY([aid])
REFERENCES [dbo].[assesments] ([aid])
GO
ALTER TABLE [dbo].[exams] CHECK CONSTRAINT [FK_exams_assesments]
GO
ALTER TABLE [dbo].[grades]  WITH CHECK ADD  CONSTRAINT [FK_grades_exams] FOREIGN KEY([eid])
REFERENCES [dbo].[exams] ([eid])
GO
ALTER TABLE [dbo].[grades] CHECK CONSTRAINT [FK_grades_exams]
GO
ALTER TABLE [dbo].[grades]  WITH CHECK ADD  CONSTRAINT [FK_grades_students] FOREIGN KEY([sid])
REFERENCES [dbo].[students] ([sid])
GO
ALTER TABLE [dbo].[grades] CHECK CONSTRAINT [FK_grades_students]
GO
ALTER TABLE [dbo].[students_courses]  WITH CHECK ADD  CONSTRAINT [FK_students_courses_courses] FOREIGN KEY([cid])
REFERENCES [dbo].[courses] ([cid])
GO
ALTER TABLE [dbo].[students_courses] CHECK CONSTRAINT [FK_students_courses_courses]
GO
ALTER TABLE [dbo].[students_courses]  WITH CHECK ADD  CONSTRAINT [FK_students_courses_students] FOREIGN KEY([sid])
REFERENCES [dbo].[students] ([sid])
GO
ALTER TABLE [dbo].[students_courses] CHECK CONSTRAINT [FK_students_courses_students]
GO
ALTER TABLE [dbo].[training_department]  WITH CHECK ADD  CONSTRAINT [FK_training_department_users] FOREIGN KEY([username])
REFERENCES [dbo].[users] ([username])
GO
ALTER TABLE [dbo].[training_department] CHECK CONSTRAINT [FK_training_department_users]
GO
ALTER TABLE [dbo].[users]  WITH CHECK ADD  CONSTRAINT [FK_users_Role] FOREIGN KEY([roleid])
REFERENCES [dbo].[role] ([roleid])
GO
ALTER TABLE [dbo].[users] CHECK CONSTRAINT [FK_users_Role]
GO
ALTER TABLE [dbo].[users_lecturers]  WITH CHECK ADD  CONSTRAINT [FK_users_lecturers_lecturers] FOREIGN KEY([lid])
REFERENCES [dbo].[lecturers] ([lid])
GO
ALTER TABLE [dbo].[users_lecturers] CHECK CONSTRAINT [FK_users_lecturers_lecturers]
GO
ALTER TABLE [dbo].[users_lecturers]  WITH CHECK ADD  CONSTRAINT [FK_users_lecturers_users] FOREIGN KEY([username])
REFERENCES [dbo].[users] ([username])
GO
ALTER TABLE [dbo].[users_lecturers] CHECK CONSTRAINT [FK_users_lecturers_users]
GO
ALTER TABLE [dbo].[users_students]  WITH CHECK ADD  CONSTRAINT [FK_users_students_students] FOREIGN KEY([sid])
REFERENCES [dbo].[students] ([sid])
GO
ALTER TABLE [dbo].[users_students] CHECK CONSTRAINT [FK_users_students_students]
GO
ALTER TABLE [dbo].[users_students]  WITH CHECK ADD  CONSTRAINT [FK_users_students_users] FOREIGN KEY([username])
REFERENCES [dbo].[users] ([username])
GO
ALTER TABLE [dbo].[users_students] CHECK CONSTRAINT [FK_users_students_users]
GO
USE [master]
GO
ALTER DATABASE [AlsoDemo] SET  READ_WRITE 
GO
