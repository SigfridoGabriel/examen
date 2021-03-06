USE [master]
GO
/****** Object:  Database [Examen]    Script Date: 13/03/2018 23:47:57 ******/
CREATE DATABASE [Examen]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Examen', FILENAME = N'F:\SQLSERVER2014\Examen.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Examen_log', FILENAME = N'F:\SQLSERVER2014\Examen_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Examen] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Examen].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Examen] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Examen] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Examen] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Examen] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Examen] SET ARITHABORT OFF 
GO
ALTER DATABASE [Examen] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Examen] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Examen] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Examen] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Examen] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Examen] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Examen] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Examen] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Examen] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Examen] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Examen] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Examen] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Examen] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Examen] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Examen] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Examen] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Examen] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Examen] SET RECOVERY FULL 
GO
ALTER DATABASE [Examen] SET  MULTI_USER 
GO
ALTER DATABASE [Examen] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Examen] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Examen] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Examen] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [Examen] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Examen', N'ON'
GO
USE [Examen]
GO
/****** Object:  Table [dbo].[Banco]    Script Date: 13/03/2018 23:47:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Banco](
	[IdBanco] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NULL,
	[Direccion] [varchar](50) NULL,
	[FechaRegistro] [datetime] NULL,
 CONSTRAINT [PK_Banco] PRIMARY KEY CLUSTERED 
(
	[IdBanco] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[OrdenesPago]    Script Date: 13/03/2018 23:47:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[OrdenesPago](
	[IdOrdenPago] [int] IDENTITY(1,1) NOT NULL,
	[IdSucursal] [int] NULL,
	[Monto] [money] NULL,
	[Moneda] [varchar](20) NULL,
	[Estado] [varchar](20) NULL,
	[FechaPago] [datetime] NULL,
 CONSTRAINT [PK_OrdenesPago] PRIMARY KEY CLUSTERED 
(
	[IdOrdenPago] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Sucursales]    Script Date: 13/03/2018 23:47:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Sucursales](
	[IdSucursal] [int] IDENTITY(1,1) NOT NULL,
	[IdBanco] [int] NULL,
	[Nombre] [varchar](50) NULL,
	[Direccion] [varchar](50) NULL,
	[FechaRegistro] [datetime] NULL,
 CONSTRAINT [PK_Sucursales] PRIMARY KEY CLUSTERED 
(
	[IdSucursal] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Banco] ON 

INSERT [dbo].[Banco] ([IdBanco], [Nombre], [Direccion], [FechaRegistro]) VALUES (1, N'BCP', N'Direccion 1', CAST(N'2018-03-13 00:00:00.000' AS DateTime))
INSERT [dbo].[Banco] ([IdBanco], [Nombre], [Direccion], [FechaRegistro]) VALUES (2, N'BBVA Continental', N'Direccion 2', CAST(N'2018-03-13 00:00:00.000' AS DateTime))
INSERT [dbo].[Banco] ([IdBanco], [Nombre], [Direccion], [FechaRegistro]) VALUES (3, N'Interbank', N'Direccion 3', NULL)
SET IDENTITY_INSERT [dbo].[Banco] OFF
SET IDENTITY_INSERT [dbo].[OrdenesPago] ON 

INSERT [dbo].[OrdenesPago] ([IdOrdenPago], [IdSucursal], [Monto], [Moneda], [Estado], [FechaPago]) VALUES (1, 1, 100.0000, N'soles', N'pagada', CAST(N'2018-03-01 00:00:00.000' AS DateTime))
INSERT [dbo].[OrdenesPago] ([IdOrdenPago], [IdSucursal], [Monto], [Moneda], [Estado], [FechaPago]) VALUES (2, 1, 50.0000, N'dolares', N'declinada', CAST(N'2018-03-01 00:00:00.000' AS DateTime))
INSERT [dbo].[OrdenesPago] ([IdOrdenPago], [IdSucursal], [Monto], [Moneda], [Estado], [FechaPago]) VALUES (3, 1, 150.0000, N'soles', N'fallida', CAST(N'2018-03-03 00:00:00.000' AS DateTime))
INSERT [dbo].[OrdenesPago] ([IdOrdenPago], [IdSucursal], [Monto], [Moneda], [Estado], [FechaPago]) VALUES (4, 1, 275.0000, N'dolares', N'anulada', CAST(N'2018-03-04 00:00:00.000' AS DateTime))
INSERT [dbo].[OrdenesPago] ([IdOrdenPago], [IdSucursal], [Monto], [Moneda], [Estado], [FechaPago]) VALUES (5, 2, 52.0000, N'soles', N'pagada', CAST(N'2018-03-07 00:00:00.000' AS DateTime))
INSERT [dbo].[OrdenesPago] ([IdOrdenPago], [IdSucursal], [Monto], [Moneda], [Estado], [FechaPago]) VALUES (6, 2, 789.0000, N'dolares', N'declinada', CAST(N'2018-03-09 00:00:00.000' AS DateTime))
INSERT [dbo].[OrdenesPago] ([IdOrdenPago], [IdSucursal], [Monto], [Moneda], [Estado], [FechaPago]) VALUES (7, 2, 45.0000, N'soles', N'fallida', CAST(N'2018-03-09 00:00:00.000' AS DateTime))
INSERT [dbo].[OrdenesPago] ([IdOrdenPago], [IdSucursal], [Monto], [Moneda], [Estado], [FechaPago]) VALUES (8, 2, 54.0000, N'soles', N'anulada', CAST(N'2018-03-09 00:00:00.000' AS DateTime))
INSERT [dbo].[OrdenesPago] ([IdOrdenPago], [IdSucursal], [Monto], [Moneda], [Estado], [FechaPago]) VALUES (9, 3, 125.0000, N'soles', N'pagada', CAST(N'2018-03-07 00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[OrdenesPago] OFF
SET IDENTITY_INSERT [dbo].[Sucursales] ON 

INSERT [dbo].[Sucursales] ([IdSucursal], [IdBanco], [Nombre], [Direccion], [FechaRegistro]) VALUES (1, 1, N'Sucursal San Juan', N'Direccion 1', CAST(N'2018-03-13 00:00:00.000' AS DateTime))
INSERT [dbo].[Sucursales] ([IdSucursal], [IdBanco], [Nombre], [Direccion], [FechaRegistro]) VALUES (2, 1, N'Sucursal Villa El Salvador', N'Direccion 2', CAST(N'2018-03-13 00:00:00.000' AS DateTime))
INSERT [dbo].[Sucursales] ([IdSucursal], [IdBanco], [Nombre], [Direccion], [FechaRegistro]) VALUES (3, 2, N'Sucursal San Borja', N'Direccion 3', CAST(N'2018-03-13 00:00:00.000' AS DateTime))
INSERT [dbo].[Sucursales] ([IdSucursal], [IdBanco], [Nombre], [Direccion], [FechaRegistro]) VALUES (4, 2, N'Sucursal Ate', N'Direccion 4', CAST(N'2018-03-13 00:00:00.000' AS DateTime))
INSERT [dbo].[Sucursales] ([IdSucursal], [IdBanco], [Nombre], [Direccion], [FechaRegistro]) VALUES (5, 3, N'Sucursal Miraflores', N'Direccion 5', CAST(N'2018-03-13 00:00:00.000' AS DateTime))
INSERT [dbo].[Sucursales] ([IdSucursal], [IdBanco], [Nombre], [Direccion], [FechaRegistro]) VALUES (6, 3, N'Sucursal Chosica', N'Direccion 6', CAST(N'2018-03-13 00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[Sucursales] OFF
/****** Object:  StoredProcedure [dbo].[ObtenerOrdenesPagoSucursal]    Script Date: 13/03/2018 23:47:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Gabriel Osorio
-- Create date: 2018-03-13
-- Description:	Busca las ordenes de pago de
--				una sucursal
-- ============================================= 
CREATE PROCEDURE [dbo].[ObtenerOrdenesPagoSucursal]
	@sucursal	varchar(20)	= NULL,
	@moneda		varchar(20)	= NULL
AS
BEGIN 

	SELECT a.* FROM [dbo].[OrdenesPago] a INNER JOIN [dbo].[Sucursales] b
	on a.IdSucursal = b.IdSucursal
	WHERE nombre = @sucursal and Moneda = @moneda

END 

GO
USE [master]
GO
ALTER DATABASE [Examen] SET  READ_WRITE 
GO
