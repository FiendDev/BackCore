USE [master]
GO
/****** Object:  Database [level]    Script Date: 26-08-2024 12:10:25 ******/
CREATE DATABASE [level]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'level', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\level.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'level_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\level_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [level] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [level].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [level] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [level] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [level] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [level] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [level] SET ARITHABORT OFF 
GO
ALTER DATABASE [level] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [level] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [level] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [level] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [level] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [level] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [level] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [level] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [level] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [level] SET  DISABLE_BROKER 
GO
ALTER DATABASE [level] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [level] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [level] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [level] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [level] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [level] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [level] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [level] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [level] SET  MULTI_USER 
GO
ALTER DATABASE [level] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [level] SET DB_CHAINING OFF 
GO
ALTER DATABASE [level] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [level] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [level] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [level] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [level] SET QUERY_STORE = ON
GO
ALTER DATABASE [level] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [level]
GO
/****** Object:  Table [dbo].[Autor]    Script Date: 26-08-2024 12:10:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Autor](
	[IdAutor] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[rut] [int] NOT NULL,
	[fechaNacimineto] [varchar](50) NOT NULL,
	[email] [varchar](50) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Biblioteca]    Script Date: 26-08-2024 12:10:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Biblioteca](
	[IdBiblioteca] [int] IDENTITY(1,1) NOT NULL,
	[idLibro] [int] NOT NULL,
	[idAutor] [int] NOT NULL,
	[FechaCreacion] [varchar](50) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Libro]    Script Date: 26-08-2024 12:10:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Libro](
	[idLibro] [int] IDENTITY(1,1) NOT NULL,
	[titulo] [varchar](max) NOT NULL,
	[anio] [int] NOT NULL,
	[paginas] [int] NOT NULL,
	[autor] [varchar](50) NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Libro] ON 

INSERT [dbo].[Libro] ([idLibro], [titulo], [anio], [paginas], [autor]) VALUES (1, N'nuevo libro', 2022, 150, N'nuevo autor')
SET IDENTITY_INSERT [dbo].[Libro] OFF
GO
/****** Object:  StoredProcedure [dbo].[sp_libro_crearAutor]    Script Date: 26-08-2024 12:10:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE  [dbo].[sp_libro_crearAutor]

@nombre as varchar(max),
@rut as int,
@fechaNacimineto as varchar(max),
@email as varchar(max)


AS
BEGIN
	
	insert into Libro values (@nombre,@rut,@fechaNacimineto,@email)

END
GO
/****** Object:  StoredProcedure [dbo].[sp_libro_crearLibro]    Script Date: 26-08-2024 12:10:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE  [dbo].[sp_libro_crearLibro]

@titulo as varchar(max),
@anio as int,
@paginas as int,
@autor as varchar(max)

AS
BEGIN
	
	insert into Libro values (@titulo,@anio,@paginas,@autor)

END
GO
/****** Object:  StoredProcedure [dbo].[sp_libro_GetLibro]    Script Date: 26-08-2024 12:10:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_libro_GetLibro]
	
AS
BEGIN
		SELECT  idLibro, titulo, anio, paginas FROM Libro
END
GO
USE [master]
GO
ALTER DATABASE [level] SET  READ_WRITE 
GO
