USE [master]
GO

/****** Object:  Database [Event]    Script Date: 01/20/2016 17:20:33 ******/
IF  EXISTS (SELECT name FROM sys.databases WHERE name = N'Event')
DROP DATABASE [Event]
GO

USE [master]
GO

/****** Object:  Database [Event]    Script Date: 01/20/2016 17:20:33 ******/
CREATE DATABASE [Event] ON  PRIMARY 
( NAME = N'Event', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10.MSSQLSERVER\MSSQL\DATA\Event.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Event_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10.MSSQLSERVER\MSSQL\DATA\Event_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO

ALTER DATABASE [Event] SET COMPATIBILITY_LEVEL = 100
GO

IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Event].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO

ALTER DATABASE [Event] SET ANSI_NULL_DEFAULT OFF 
GO

ALTER DATABASE [Event] SET ANSI_NULLS OFF 
GO

ALTER DATABASE [Event] SET ANSI_PADDING OFF 
GO

ALTER DATABASE [Event] SET ANSI_WARNINGS OFF 
GO

ALTER DATABASE [Event] SET ARITHABORT OFF 
GO

ALTER DATABASE [Event] SET AUTO_CLOSE ON 
GO

ALTER DATABASE [Event] SET AUTO_CREATE_STATISTICS ON 
GO

ALTER DATABASE [Event] SET AUTO_SHRINK OFF 
GO

ALTER DATABASE [Event] SET AUTO_UPDATE_STATISTICS ON 
GO

ALTER DATABASE [Event] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO

ALTER DATABASE [Event] SET CURSOR_DEFAULT  GLOBAL 
GO

ALTER DATABASE [Event] SET CONCAT_NULL_YIELDS_NULL OFF 
GO

ALTER DATABASE [Event] SET NUMERIC_ROUNDABORT OFF 
GO

ALTER DATABASE [Event] SET QUOTED_IDENTIFIER OFF 
GO

ALTER DATABASE [Event] SET RECURSIVE_TRIGGERS OFF 
GO

ALTER DATABASE [Event] SET  DISABLE_BROKER 
GO

ALTER DATABASE [Event] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO

ALTER DATABASE [Event] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO

ALTER DATABASE [Event] SET TRUSTWORTHY OFF 
GO

ALTER DATABASE [Event] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO

ALTER DATABASE [Event] SET PARAMETERIZATION SIMPLE 
GO

ALTER DATABASE [Event] SET READ_COMMITTED_SNAPSHOT OFF 
GO

ALTER DATABASE [Event] SET HONOR_BROKER_PRIORITY OFF 
GO

ALTER DATABASE [Event] SET  READ_WRITE 
GO

ALTER DATABASE [Event] SET RECOVERY SIMPLE 
GO

ALTER DATABASE [Event] SET  MULTI_USER 
GO

ALTER DATABASE [Event] SET PAGE_VERIFY CHECKSUM  
GO

ALTER DATABASE [Event] SET DB_CHAINING OFF 
GO


USE [Event]
GO
/****** Object:  Table [dbo].[Event]    Script Date: 01/21/2016 12:56:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Event](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Info] [varchar](50) NOT NULL,
	[Time] [datetime] NOT NULL,
	[Place] [varchar](50) NOT NULL,
	[MaxAttendance] [int] NULL,
	[RequireAttendance] [int] NULL,
	[Vote] [int] NULL,
	[Price] [money] NULL,
 CONSTRAINT [PK_Event] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Category]    Script Date: 01/21/2016 12:56:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Category](
	[ID] [int] NOT NULL,
	[Name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[EventUserRole]    Script Date: 01/21/2016 12:56:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EventUserRole](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Role] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_EventUserRole] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 01/21/2016 12:56:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[User](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Username] [varchar](50) NOT NULL,
	[Password] [varchar](50) NOT NULL,
	[Email] [varchar](50) NOT NULL,
	[Address] [varchar](50) NULL,
	[Phone] [varchar](50) NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[User] ON
INSERT [dbo].[User] ([ID], [Username], [Password], [Email], [Address], [Phone]) VALUES (1, N'sample string 2', N'sample string 3', N'sample string 4', N'sample string 5', N'sample string 6')
SET IDENTITY_INSERT [dbo].[User] OFF
/****** Object:  Table [dbo].[UserCategory]    Script Date: 01/21/2016 12:56:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserCategory](
	[UserID] [int] NOT NULL,
	[CategoryID] [int] NOT NULL,
 CONSTRAINT [PK_UserFavCategory] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC,
	[CategoryID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Notification]    Script Date: 01/21/2016 12:56:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Notification](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Information] [varchar](150) NOT NULL,
	[UserID] [int] NOT NULL,
 CONSTRAINT [PK_Notification] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[EventUser]    Script Date: 01/21/2016 12:56:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EventUser](
	[EventID] [int] NOT NULL,
	[UserID] [int] NOT NULL,
	[RoleID] [int] NOT NULL,
 CONSTRAINT [PK_EventUser] PRIMARY KEY CLUSTERED 
(
	[EventID] ASC,
	[UserID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EventCategory]    Script Date: 01/21/2016 12:56:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EventCategory](
	[EventID] [int] NOT NULL,
	[CategoryID] [int] NOT NULL,
 CONSTRAINT [PK_EventCategory] PRIMARY KEY CLUSTERED 
(
	[EventID] ASC,
	[CategoryID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  ForeignKey [FK_EventCategory_Category]    Script Date: 01/21/2016 12:56:06 ******/
ALTER TABLE [dbo].[EventCategory]  WITH CHECK ADD  CONSTRAINT [FK_EventCategory_Category] FOREIGN KEY([CategoryID])
REFERENCES [dbo].[Category] ([ID])
GO
ALTER TABLE [dbo].[EventCategory] CHECK CONSTRAINT [FK_EventCategory_Category]
GO
/****** Object:  ForeignKey [FK_EventCategory_Event]    Script Date: 01/21/2016 12:56:06 ******/
ALTER TABLE [dbo].[EventCategory]  WITH CHECK ADD  CONSTRAINT [FK_EventCategory_Event] FOREIGN KEY([EventID])
REFERENCES [dbo].[Event] ([ID])
GO
ALTER TABLE [dbo].[EventCategory] CHECK CONSTRAINT [FK_EventCategory_Event]
GO
/****** Object:  ForeignKey [FK_EventUser_Event]    Script Date: 01/21/2016 12:56:06 ******/
ALTER TABLE [dbo].[EventUser]  WITH CHECK ADD  CONSTRAINT [FK_EventUser_Event] FOREIGN KEY([EventID])
REFERENCES [dbo].[Event] ([ID])
GO
ALTER TABLE [dbo].[EventUser] CHECK CONSTRAINT [FK_EventUser_Event]
GO
/****** Object:  ForeignKey [FK_EventUser_EventUserRole]    Script Date: 01/21/2016 12:56:06 ******/
ALTER TABLE [dbo].[EventUser]  WITH CHECK ADD  CONSTRAINT [FK_EventUser_EventUserRole] FOREIGN KEY([RoleID])
REFERENCES [dbo].[EventUserRole] ([ID])
GO
ALTER TABLE [dbo].[EventUser] CHECK CONSTRAINT [FK_EventUser_EventUserRole]
GO
/****** Object:  ForeignKey [FK_EventUser_User]    Script Date: 01/21/2016 12:56:06 ******/
ALTER TABLE [dbo].[EventUser]  WITH CHECK ADD  CONSTRAINT [FK_EventUser_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([ID])
GO
ALTER TABLE [dbo].[EventUser] CHECK CONSTRAINT [FK_EventUser_User]
GO
/****** Object:  ForeignKey [FK_Notification_User]    Script Date: 01/21/2016 12:56:06 ******/
ALTER TABLE [dbo].[Notification]  WITH CHECK ADD  CONSTRAINT [FK_Notification_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([ID])
GO
ALTER TABLE [dbo].[Notification] CHECK CONSTRAINT [FK_Notification_User]
GO
/****** Object:  ForeignKey [FK_UserCategory_Category]    Script Date: 01/21/2016 12:56:06 ******/
ALTER TABLE [dbo].[UserCategory]  WITH CHECK ADD  CONSTRAINT [FK_UserCategory_Category] FOREIGN KEY([CategoryID])
REFERENCES [dbo].[Category] ([ID])
GO
ALTER TABLE [dbo].[UserCategory] CHECK CONSTRAINT [FK_UserCategory_Category]
GO
/****** Object:  ForeignKey [FK_UserCategory_User]    Script Date: 01/21/2016 12:56:06 ******/
ALTER TABLE [dbo].[UserCategory]  WITH CHECK ADD  CONSTRAINT [FK_UserCategory_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([ID])
GO
ALTER TABLE [dbo].[UserCategory] CHECK CONSTRAINT [FK_UserCategory_User]
GO
