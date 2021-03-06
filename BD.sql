USE [master]
GO
/****** Object:  Database [DemoPractica]    Script Date: 3/07/2017 8:14:23 a. m. ******/
CREATE DATABASE [DemoPractica]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DemoPractica', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\DemoPractica.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'DemoPractica_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\DemoPractica_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [DemoPractica] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DemoPractica].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DemoPractica] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DemoPractica] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DemoPractica] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DemoPractica] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DemoPractica] SET ARITHABORT OFF 
GO
ALTER DATABASE [DemoPractica] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DemoPractica] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DemoPractica] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DemoPractica] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DemoPractica] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DemoPractica] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DemoPractica] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DemoPractica] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DemoPractica] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DemoPractica] SET  ENABLE_BROKER 
GO
ALTER DATABASE [DemoPractica] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DemoPractica] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DemoPractica] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DemoPractica] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DemoPractica] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DemoPractica] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DemoPractica] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DemoPractica] SET RECOVERY FULL 
GO
ALTER DATABASE [DemoPractica] SET  MULTI_USER 
GO
ALTER DATABASE [DemoPractica] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DemoPractica] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DemoPractica] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DemoPractica] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [DemoPractica] SET DELAYED_DURABILITY = DISABLED 
GO
USE [DemoPractica]
GO
/****** Object:  UserDefinedTableType [dbo].[DetalleVenta]    Script Date: 3/07/2017 8:14:23 a. m. ******/
CREATE TYPE [dbo].[DetalleVenta] AS TABLE(
	[IdDetalleVenta] [int] NULL,
	[IdProducto] [int] NULL,
	[IdVenta] [int] NULL,
	[Cantidad] [int] NULL,
	[PrecioUnitario] [decimal](6, 2) NULL,
	[Igv] [money] NULL,
	[SubTotal] [money] NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[TipoDetalleVenta]    Script Date: 3/07/2017 8:14:23 a. m. ******/
CREATE TYPE [dbo].[TipoDetalleVenta] AS TABLE(
	[IdDetalleVenta] [int] NULL,
	[IdProducto] [int] NULL,
	[IdVenta] [int] NULL,
	[Cantidad] [int] NULL,
	[PrecioUnitario] [decimal](6, 2) NULL,
	[Igv] [money] NULL,
	[SubTotal] [money] NULL
)
GO
/****** Object:  Table [dbo].[Cargo]    Script Date: 3/07/2017 8:14:23 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Cargo](
	[IdCargo] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [varchar](30) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdCargo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Categoria]    Script Date: 3/07/2017 8:14:23 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Categoria](
	[IdCategoria] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdCategoria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Cliente]    Script Date: 3/07/2017 8:14:23 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Cliente](
	[IdCliente] [int] IDENTITY(1,1) NOT NULL,
	[DNI] [char](8) NOT NULL,
	[Apellidos] [varchar](50) NOT NULL,
	[Nombres] [varchar](50) NOT NULL,
	[Direccion] [varchar](100) NOT NULL,
	[Telefono] [varchar](12) NULL,
PRIMARY KEY CLUSTERED 
(
	[IdCliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DetalleVenta]    Script Date: 3/07/2017 8:14:23 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DetalleVenta](
	[IdDetalleVenta] [int] IDENTITY(1,1) NOT NULL,
	[IdProducto] [int] NOT NULL,
	[IdVenta] [int] NOT NULL,
	[Cantidad] [int] NOT NULL,
	[PrecioUnitario] [decimal](6, 2) NOT NULL,
	[Igv] [money] NOT NULL,
	[SubTotal] [money] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdDetalleVenta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Empleado]    Script Date: 3/07/2017 8:14:23 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Empleado](
	[IdEmpleado] [int] IDENTITY(1,1) NOT NULL,
	[IdCargo] [int] NOT NULL,
	[Dni] [char](8) NOT NULL,
	[Apellidos] [varchar](30) NOT NULL,
	[Nombres] [varchar](30) NOT NULL,
	[Sexo] [char](1) NOT NULL,
	[FechaNac] [date] NOT NULL,
	[Direccion] [varchar](80) NOT NULL,
	[EstadoCivil] [char](1) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdEmpleado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Producto]    Script Date: 3/07/2017 8:14:23 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Producto](
	[IdProducto] [int] IDENTITY(1,1) NOT NULL,
	[IdCategoria] [int] NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Marca] [varchar](80) NULL,
	[Stock] [int] NOT NULL,
	[PrecioCompra] [decimal](6, 2) NOT NULL,
	[PrecioVenta] [decimal](6, 2) NOT NULL,
	[FechaVencimiento] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdProducto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 3/07/2017 8:14:23 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Usuario](
	[IdUsuario] [int] IDENTITY(1,1) NOT NULL,
	[IdEmpleado] [int] NOT NULL,
	[Usuario] [varchar](20) NOT NULL,
	[Contraseña] [varchar](12) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Venta]    Script Date: 3/07/2017 8:14:23 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Venta](
	[IdVenta] [int] IDENTITY(1,1) NOT NULL,
	[IdEmpleado] [int] NOT NULL,
	[IdCliente] [int] NOT NULL,
	[Serie] [char](5) NOT NULL,
	[NroDocumento] [char](7) NOT NULL,
	[TipoDocumento] [varchar](7) NULL,
	[FechaVenta] [date] NOT NULL,
	[Total] [money] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdVenta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Cargo] ON 

INSERT [dbo].[Cargo] ([IdCargo], [Descripcion]) VALUES (1, N'Administrador')
INSERT [dbo].[Cargo] ([IdCargo], [Descripcion]) VALUES (2, N'Asistente')
INSERT [dbo].[Cargo] ([IdCargo], [Descripcion]) VALUES (3, N'Ayudante')
INSERT [dbo].[Cargo] ([IdCargo], [Descripcion]) VALUES (4, N'Apoyo')
SET IDENTITY_INSERT [dbo].[Cargo] OFF
SET IDENTITY_INSERT [dbo].[Categoria] ON 

INSERT [dbo].[Categoria] ([IdCategoria], [Descripcion]) VALUES (1, N'Bebidas')
INSERT [dbo].[Categoria] ([IdCategoria], [Descripcion]) VALUES (2, N'Carnes')
INSERT [dbo].[Categoria] ([IdCategoria], [Descripcion]) VALUES (3, N'Verduras')
INSERT [dbo].[Categoria] ([IdCategoria], [Descripcion]) VALUES (4, N'MAquinas')
INSERT [dbo].[Categoria] ([IdCategoria], [Descripcion]) VALUES (5, N'dgdfgvfdg')
INSERT [dbo].[Categoria] ([IdCategoria], [Descripcion]) VALUES (6, N'fbvdfbdbgf')
INSERT [dbo].[Categoria] ([IdCategoria], [Descripcion]) VALUES (7, N'dsffdfdf')
INSERT [dbo].[Categoria] ([IdCategoria], [Descripcion]) VALUES (8, N'dfdf')
INSERT [dbo].[Categoria] ([IdCategoria], [Descripcion]) VALUES (9, N'gfhtyjhmj')
INSERT [dbo].[Categoria] ([IdCategoria], [Descripcion]) VALUES (10, N'gfhtyjhmjhjhjhj')
INSERT [dbo].[Categoria] ([IdCategoria], [Descripcion]) VALUES (11, N'Catetest')
INSERT [dbo].[Categoria] ([IdCategoria], [Descripcion]) VALUES (12, N'CategoTest')
INSERT [dbo].[Categoria] ([IdCategoria], [Descripcion]) VALUES (13, N'testoAngel')
INSERT [dbo].[Categoria] ([IdCategoria], [Descripcion]) VALUES (14, N'textAngel')
INSERT [dbo].[Categoria] ([IdCategoria], [Descripcion]) VALUES (15, N'TestAngeloTest')
INSERT [dbo].[Categoria] ([IdCategoria], [Descripcion]) VALUES (16, N'VeranoTest')
INSERT [dbo].[Categoria] ([IdCategoria], [Descripcion]) VALUES (17, N'CateTest12')
SET IDENTITY_INSERT [dbo].[Categoria] OFF
SET IDENTITY_INSERT [dbo].[Cliente] ON 

INSERT [dbo].[Cliente] ([IdCliente], [DNI], [Apellidos], [Nombres], [Direccion], [Telefono]) VALUES (1, N'47660746', N'Vásquez Ventura', N'JuanTest', N'Urb. Santa Rosa', N'996687349')
INSERT [dbo].[Cliente] ([IdCliente], [DNI], [Apellidos], [Nombres], [Direccion], [Telefono]) VALUES (2, N'47878469', N'dfdfd', N'dfdf', N'fdfdf', N'dfdfdf')
INSERT [dbo].[Cliente] ([IdCliente], [DNI], [Apellidos], [Nombres], [Direccion], [Telefono]) VALUES (3, N'47878468', N'test4', N'test4', N'test', N'280793')
INSERT [dbo].[Cliente] ([IdCliente], [DNI], [Apellidos], [Nombres], [Direccion], [Telefono]) VALUES (4, N'47878452', N'Lopez Monzon3', N'Miguel Angel3', N'Pedro Herrera # 370', N'280792')
INSERT [dbo].[Cliente] ([IdCliente], [DNI], [Apellidos], [Nombres], [Direccion], [Telefono]) VALUES (5, N'dfdfdf  ', N'dfdfd', N'dfdf', N'fdfdf', N'dfdfdf')
INSERT [dbo].[Cliente] ([IdCliente], [DNI], [Apellidos], [Nombres], [Direccion], [Telefono]) VALUES (6, N'47878460', N'sdsdsd', N'dsdsdsd', N'dsds', N'sdsdsd')
INSERT [dbo].[Cliente] ([IdCliente], [DNI], [Apellidos], [Nombres], [Direccion], [Telefono]) VALUES (7, N'45218796', N'dsd', N'asasa50', N'dsdssds', N'sdsd')
INSERT [dbo].[Cliente] ([IdCliente], [DNI], [Apellidos], [Nombres], [Direccion], [Telefono]) VALUES (8, N'47878467', N'López Monzón', N'Alvaro', N'Test #370', N'280793')
SET IDENTITY_INSERT [dbo].[Cliente] OFF
SET IDENTITY_INSERT [dbo].[DetalleVenta] ON 

INSERT [dbo].[DetalleVenta] ([IdDetalleVenta], [IdProducto], [IdVenta], [Cantidad], [PrecioUnitario], [Igv], [SubTotal]) VALUES (1, 1, 1, 5, CAST(5.90 AS Decimal(6, 2)), 2.6800, 26.8200)
SET IDENTITY_INSERT [dbo].[DetalleVenta] OFF
SET IDENTITY_INSERT [dbo].[Empleado] ON 

INSERT [dbo].[Empleado] ([IdEmpleado], [IdCargo], [Dni], [Apellidos], [Nombres], [Sexo], [FechaNac], [Direccion], [EstadoCivil]) VALUES (1, 1, N'34004387', N'Silva Terrones', N'Miguel', N'M', CAST(N'1990-11-01' AS Date), N'Urb. Santa Rosa', N'S')
INSERT [dbo].[Empleado] ([IdEmpleado], [IdCargo], [Dni], [Apellidos], [Nombres], [Sexo], [FechaNac], [Direccion], [EstadoCivil]) VALUES (2, 3, N'47878469', N'López Monzón ', N'Miguel', N'F', CAST(N'2017-06-19' AS Date), N'Test', N'V')
INSERT [dbo].[Empleado] ([IdEmpleado], [IdCargo], [Dni], [Apellidos], [Nombres], [Sexo], [FechaNac], [Direccion], [EstadoCivil]) VALUES (3, 4, N'47878459', N'Maqui', N'Hugo', N'M', CAST(N'1975-06-19' AS Date), N'Pedro Herrera # 370', N'C')
INSERT [dbo].[Empleado] ([IdEmpleado], [IdCargo], [Dni], [Apellidos], [Nombres], [Sexo], [FechaNac], [Direccion], [EstadoCivil]) VALUES (4, 1, N'47878450', N'Monzón ', N'William', N'M', CAST(N'1990-07-02' AS Date), N'Desamparados # 370', N'S')
SET IDENTITY_INSERT [dbo].[Empleado] OFF
SET IDENTITY_INSERT [dbo].[Producto] ON 

INSERT [dbo].[Producto] ([IdProducto], [IdCategoria], [Nombre], [Marca], [Stock], [PrecioCompra], [PrecioVenta], [FechaVencimiento]) VALUES (1, 4, N'Gaseosa', N'Pepsi', 0, CAST(4.90 AS Decimal(6, 2)), CAST(5.90 AS Decimal(6, 2)), CAST(N'2013-12-12' AS Date))
INSERT [dbo].[Producto] ([IdProducto], [IdCategoria], [Nombre], [Marca], [Stock], [PrecioCompra], [PrecioVenta], [FechaVencimiento]) VALUES (2, 16, N'Helado', N'Donofrio', 30, CAST(10.00 AS Decimal(6, 2)), CAST(10.00 AS Decimal(6, 2)), CAST(N'2017-06-30' AS Date))
INSERT [dbo].[Producto] ([IdProducto], [IdCategoria], [Nombre], [Marca], [Stock], [PrecioCompra], [PrecioVenta], [FechaVencimiento]) VALUES (3, 1, N'Test20', N'test20', 20, CAST(20.00 AS Decimal(6, 2)), CAST(20.00 AS Decimal(6, 2)), CAST(N'2017-06-13' AS Date))
INSERT [dbo].[Producto] ([IdProducto], [IdCategoria], [Nombre], [Marca], [Stock], [PrecioCompra], [PrecioVenta], [FechaVencimiento]) VALUES (4, 1, N'test45', N'te45', 20, CAST(20.00 AS Decimal(6, 2)), CAST(20.00 AS Decimal(6, 2)), CAST(N'2017-06-14' AS Date))
INSERT [dbo].[Producto] ([IdProducto], [IdCategoria], [Nombre], [Marca], [Stock], [PrecioCompra], [PrecioVenta], [FechaVencimiento]) VALUES (5, 1, N'test205', N'dfdf20', 10, CAST(10.00 AS Decimal(6, 2)), CAST(10.00 AS Decimal(6, 2)), CAST(N'2017-06-16' AS Date))
INSERT [dbo].[Producto] ([IdProducto], [IdCategoria], [Nombre], [Marca], [Stock], [PrecioCompra], [PrecioVenta], [FechaVencimiento]) VALUES (6, 1, N'sdsdsd', N'sdsdsd', 0, CAST(0.00 AS Decimal(6, 2)), CAST(0.00 AS Decimal(6, 2)), CAST(N'2017-06-16' AS Date))
INSERT [dbo].[Producto] ([IdProducto], [IdCategoria], [Nombre], [Marca], [Stock], [PrecioCompra], [PrecioVenta], [FechaVencimiento]) VALUES (7, 1, N'hjuykmthb', N'tgrhtyyhntytyh', 20, CAST(21.00 AS Decimal(6, 2)), CAST(20.00 AS Decimal(6, 2)), CAST(N'2017-06-16' AS Date))
INSERT [dbo].[Producto] ([IdProducto], [IdCategoria], [Nombre], [Marca], [Stock], [PrecioCompra], [PrecioVenta], [FechaVencimiento]) VALUES (8, 1, N'Productotest', N'ProductotestMArca', 10, CAST(10.00 AS Decimal(6, 2)), CAST(20.00 AS Decimal(6, 2)), CAST(N'2017-07-01' AS Date))
SET IDENTITY_INSERT [dbo].[Producto] OFF
SET IDENTITY_INSERT [dbo].[Usuario] ON 

INSERT [dbo].[Usuario] ([IdUsuario], [IdEmpleado], [Usuario], [Contraseña]) VALUES (1, 1, N'Miguelito', N'123456')
INSERT [dbo].[Usuario] ([IdUsuario], [IdEmpleado], [Usuario], [Contraseña]) VALUES (2, 2, N'test', N'123')
SET IDENTITY_INSERT [dbo].[Usuario] OFF
SET IDENTITY_INSERT [dbo].[Venta] ON 

INSERT [dbo].[Venta] ([IdVenta], [IdEmpleado], [IdCliente], [Serie], [NroDocumento], [TipoDocumento], [FechaVenta], [Total]) VALUES (1, 1, 1, N'00001', N'0000001', N'Boleta', CAST(N'2017-06-22' AS Date), 69.5000)
INSERT [dbo].[Venta] ([IdVenta], [IdEmpleado], [IdCliente], [Serie], [NroDocumento], [TipoDocumento], [FechaVenta], [Total]) VALUES (2, 1, 1, N'00001', N'0000002', N'Boleta', CAST(N'2017-06-22' AS Date), 60.0000)
SET IDENTITY_INSERT [dbo].[Venta] OFF
ALTER TABLE [dbo].[DetalleVenta]  WITH CHECK ADD FOREIGN KEY([IdProducto])
REFERENCES [dbo].[Producto] ([IdProducto])
GO
ALTER TABLE [dbo].[DetalleVenta]  WITH CHECK ADD FOREIGN KEY([IdVenta])
REFERENCES [dbo].[Venta] ([IdVenta])
GO
ALTER TABLE [dbo].[Empleado]  WITH CHECK ADD FOREIGN KEY([IdCargo])
REFERENCES [dbo].[Cargo] ([IdCargo])
GO
ALTER TABLE [dbo].[Producto]  WITH CHECK ADD FOREIGN KEY([IdCategoria])
REFERENCES [dbo].[Categoria] ([IdCategoria])
GO
ALTER TABLE [dbo].[Usuario]  WITH CHECK ADD FOREIGN KEY([IdEmpleado])
REFERENCES [dbo].[Empleado] ([IdEmpleado])
GO
ALTER TABLE [dbo].[Venta]  WITH CHECK ADD FOREIGN KEY([IdCliente])
REFERENCES [dbo].[Cliente] ([IdCliente])
GO
ALTER TABLE [dbo].[Venta]  WITH CHECK ADD FOREIGN KEY([IdEmpleado])
REFERENCES [dbo].[Empleado] ([IdEmpleado])
GO
ALTER TABLE [dbo].[Venta]  WITH CHECK ADD CHECK  (([TipoDocumento]='Factura' OR [TipoDocumento]='Boleta'))
GO
/****** Object:  StoredProcedure [dbo].[ActualizarCargo]    Script Date: 3/07/2017 8:14:24 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create Proc [dbo].[ActualizarCargo]
@IdCargo Int,
@Descripcion Varchar(30),
@Mensaje Varchar(100) Out
As Begin
	If(Exists(Select * From Cargo Where Descripcion=@Descripcion))
		Set @Mensaje='No se ha Podido Actualizar los Datos porque ya Existe el cargo. '+@Descripcion
	Else Begin
		If(Not Exists(Select * From Cargo Where IdCargo=@IdCargo))
			Set @Mensaje='El Cargo no se Encuentra Registrado.'
		Else Begin
		Update Cargo Set Descripcion=@Descripcion Where IdCargo=@IdCargo
			Set @Mensaje='Los datos se han Actualizado Correctamente.'
			End
		End
	End


GO
/****** Object:  StoredProcedure [dbo].[ActualizarCategoria]    Script Date: 3/07/2017 8:14:24 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create proc [dbo].[ActualizarCategoria]
@IdC Int,
@Descripcion Varchar(50),
@Mensaje Varchar(50)  Out
As Begin
	If(Not Exists(Select * From Categoria Where IdCategoria=@IdC))
		Set @Mensaje='Categoria no se encuentra Registrada.'
	Else Begin
		Update Categoria Set Descripcion=@Descripcion Where IdCategoria=@IdC
		Set @Mensaje='Se ha Actualizado los Datos Correctamente.'
	End
End


GO
/****** Object:  StoredProcedure [dbo].[ActualizarCliente]    Script Date: 3/07/2017 8:14:24 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create Proc [dbo].[ActualizarCliente]
(@DNI Char(8),
@Apellidos Varchar(50),
@Nombres Varchar(50),
@Direccion Varchar(100),
@Telefono Varchar(12),
@Mensaje Varchar(50) Output
)
As Begin
	If(Not Exists(Select * From Cliente Where Dni=@DNI))
		Set @Mensaje='Los Datos del Cliente no Existen.'
	Else Begin
		Update Cliente Set Apellidos=@Apellidos,Nombres=@Nombres,Direccion=@Direccion,Telefono=@Telefono 
		Where DNI=@DNI
		Set @Mensaje='Registro Actualizado Correctamente.'
		End
	End


GO
/****** Object:  StoredProcedure [dbo].[ActualizarProducto]    Script Date: 3/07/2017 8:14:24 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create Proc [dbo].[ActualizarProducto]
@IdProducto Int,
@IdCategoria Int,
@Nombre Varchar(50),
@Marca Varchar(80),
@Stock Int,
@PrecioCompra Decimal(6,2),
@PrecioVenta Decimal(6,2),
@FechaVencimiento Date,
@Mensaje varchar(50) Out
As Begin
	If(Not Exists(Select * From Producto Where IdProducto=@IdProducto))
		Set @Mensaje='Producto no se encuentra Registrado.'
	Else Begin
		Update Producto Set IdCategoria=@IdCategoria,Nombre=@Nombre,Marca=@Marca,Stock=@Stock,
		PrecioCompra=@PrecioCompra,PrecioVenta=@PrecioVenta,FechaVencimiento=@FechaVencimiento 
		Where IdProducto=@IdProducto
	Set @Mensaje='Registro Actualizado Correctamente.'
	End
End


GO
/****** Object:  StoredProcedure [dbo].[Buscar_Empleado]    Script Date: 3/07/2017 8:14:24 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create proc [dbo].[Buscar_Empleado](
@Datos Varchar(50)
)
As Begin
		Select E.*,C.Descripcion From Cargo C Inner Join Empleado E On C.IdCargo=E.IdCargo
		where E.Nombres like @Datos +'%' or E.Apellidos like @Datos +'%'
End


GO
/****** Object:  StoredProcedure [dbo].[BuscarCargo]    Script Date: 3/07/2017 8:14:24 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


Create Proc [dbo].[BuscarCargo]
@Descripcion varchar(30)
as begin
	Select * From Cargo Where Descripcion=@Descripcion
End


GO
/****** Object:  StoredProcedure [dbo].[BuscarCategoria]    Script Date: 3/07/2017 8:14:24 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create Proc [dbo].[BuscarCategoria]
@Datos Varchar(50)
As Begin
	Select * From Categoria Where Descripcion=@Datos
End


GO
/****** Object:  StoredProcedure [dbo].[DevolverDatosSesion]    Script Date: 3/07/2017 8:14:24 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create Proc [dbo].[DevolverDatosSesion]
@Usuario Varchar(20),
@Contraseña Varchar(12)
As Begin
	Select E.IdEmpleado,E.Apellidos+', '+E.Nombres 
	From Empleado E Inner Join Usuario U On E.IdEmpleado=U.IdEmpleado 
	Where U.Usuario=@Usuario And U.Contraseña=@Contraseña
	End


GO
/****** Object:  StoredProcedure [dbo].[FiltrarDatosCliente]    Script Date: 3/07/2017 8:14:24 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create Proc [dbo].[FiltrarDatosCliente]
@Datos Varchar(80)
As Begin
	Select IdCliente,DNI,Apellidos,Nombres,Direccion,Telefono 
	From Cliente Where Apellidos+' '+ Nombres=@Datos or Apellidos=@Datos or Nombres=@Datos
End


GO
/****** Object:  StoredProcedure [dbo].[FiltrarDatosProducto]    Script Date: 3/07/2017 8:14:24 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create Proc [dbo].[FiltrarDatosProducto]
@Datos Varchar(50)
As Begin
	Select IdProducto,IdCategoria,Nombre,Marca,PrecioCompra,PrecioVenta,Stock,FechaVencimiento 
	From Producto where Nombre=@Datos or Marca=@Datos or Nombre+' '+Marca=@Datos
End


GO
/****** Object:  StoredProcedure [dbo].[GenerarIdEmpleado]    Script Date: 3/07/2017 8:14:24 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create Proc [dbo].[GenerarIdEmpleado]
@IdEmpleado Int Out
As Begin
	Declare @Cant As Int
	If(Not Exists(Select IdEmpleado From Empleado))
		Set @IdEmpleado=1
	Else Begin
		Set @IdEmpleado=(Select Max(IdEmpleado)+1 FROM Empleado)
		End
	End


GO
/****** Object:  StoredProcedure [dbo].[GenerarIdVenta]    Script Date: 3/07/2017 8:14:24 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create Proc [dbo].[GenerarIdVenta]
@IdVenta Int Out
As Begin
	If(Not Exists(Select IdVenta From Venta))
		Set @IdVenta=1
	Else Begin
		Set @IdVenta=(Select Max(IdVenta)+1 FROM Venta)
		End
	End


GO
/****** Object:  StoredProcedure [dbo].[Guardar_Masivo_Situacion_DetalleVenta]    Script Date: 3/07/2017 8:14:24 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Guardar_Masivo_Situacion_DetalleVenta]    

 @NEWID AS INT = 0,                         

 @TABLA_TIPO_DETALLEVENTA AS dbo.TipoDetalleVenta READONLY                          

AS       

  MERGE DetalleVenta AS Target    

  USING (SELECT IdDetalleVenta,IdProducto,IdVenta,Cantidad,

  PrecioUnitario,Igv,SubTotal 

  FROM  @TABLA_TIPO_DETALLEVENTA) AS Source    

  ON (SOURCE.IdDetalleVenta = Target.IdDetalleVenta AND SOURCE.IdVenta = @NEWID)

  WHEN MATCHED THEN    

  UPDATE
  set     
       Target.IdProducto= Source.IdProducto    

      ,Target.IdVenta = Source.IdVenta   

      ,Target.Cantidad = Source.Cantidad 

	  ,Target.PrecioUnitario = Source.PrecioUnitario

	  ,Target.Igv = Source.Igv 

	  ,Target.SubTotal = Source.SubTotal  

  WHEN NOT MATCHED BY TARGET THEN  

  INSERT (

  IdProducto,IdVenta,Cantidad,PrecioUnitario,

  Igv,SubTotal)    

  VALUES (

  Source.IdProducto, @NEWID, Source.Cantidad, Source.PrecioUnitario, 

  Source.Igv , Source.SubTotal);


--select * from Venta


--select * from DetalleVenta

GO
/****** Object:  StoredProcedure [dbo].[IniciarSesion]    Script Date: 3/07/2017 8:14:24 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Proc [dbo].[IniciarSesion]  
@Usuario Varchar(20),
@Contraseña Varchar(12),
@Mensaje Varchar(100) Out
As Begin
	Declare @Empleado Varchar(50)
	Declare @IdEmpleado Varchar(50)
	Declare @ApellidoNombre Varchar(50)
	If(Not Exists(Select Usuario From Usuario Where Usuario=@Usuario))
	begin
		Set @Mensaje='El Nombre de Usuario no Existe.'
	end
	Else
	Begin
		If(Not Exists(Select Contraseña From Usuario Where Contraseña=@Contraseña))
		begin
		Set @Mensaje='Su Contraseña es Incorrecta.'
		end
		Else
		Begin
		Set @Empleado=(Select E.Nombres+', '+E.Apellidos From Empleado E Inner Join Usuario U 
					   On E.IdEmpleado=U.IdEmpleado Where U.Usuario=@Usuario)
		Set @ApellidoNombre=(Select E.Apellidos+', '+ E.Nombres From Empleado E Inner Join Usuario U 
					   On E.IdEmpleado=U.IdEmpleado Where U.Usuario=@Usuario)
		Set @IdEmpleado=(Select E.IdEmpleado From Empleado E Inner Join Usuario U 
					   On E.IdEmpleado=U.IdEmpleado Where U.Usuario=@Usuario)
		Select @ApellidoNombre,@IdEmpleado,Usuario,Contraseña From Usuario Where Usuario=@Usuario And Contraseña=@Contraseña
		Set @Mensaje='Bienvenido Sr(a): '+@Empleado+'.'+'/'+@ApellidoNombre+'/'+@IdEmpleado
		End
	End	
End

GO
/****** Object:  StoredProcedure [dbo].[ListadoEmpleados]    Script Date: 3/07/2017 8:14:24 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Proc [dbo].[ListadoEmpleados]

As Begin

	Select E.*,C.Descripcion,E.Nombres + ' '+ E.Apellidos as NombreApellido From Cargo C Inner Join Empleado E On C.IdCargo=E.IdCargo

End

GO
/****** Object:  StoredProcedure [dbo].[ListadoProductos]    Script Date: 3/07/2017 8:14:24 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--FiltrarDatosProducto 'G'
Create Proc [dbo].[ListadoProductos]
As Begin
	Select IdProducto,IdCategoria,Nombre,Marca,PrecioCompra,PrecioVenta,Stock,FechaVencimiento 
	From Producto
End


GO
/****** Object:  StoredProcedure [dbo].[ListaInformacinEmpleados]    Script Date: 3/07/2017 8:14:24 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create Proc [dbo].[ListaInformacinEmpleados]

@IdEmpleado INT
As Begin

	Select E.*,C.Descripcion,E.Nombres + ' '+ E.Apellidos as NombreApellido From Cargo C Inner Join Empleado E On C.IdCargo=E.IdCargo
	where IdEmpleado=@IdEmpleado

End


GO
/****** Object:  StoredProcedure [dbo].[ListaInformacionEmpleados]    Script Date: 3/07/2017 8:14:24 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create Proc [dbo].[ListaInformacionEmpleados]

@IdEmpleado INT
As Begin

	Select E.*,C.Descripcion,E.Nombres + ' '+ E.Apellidos as NombreApellido From Cargo C Inner Join Empleado E On C.IdCargo=E.IdCargo
	where IdEmpleado=@IdEmpleado

End


GO
/****** Object:  StoredProcedure [dbo].[ListarCargo]    Script Date: 3/07/2017 8:14:24 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


Create Proc [dbo].[ListarCargo]
As Begin
	Select * From Cargo
	End


GO
/****** Object:  StoredProcedure [dbo].[ListarCategoria]    Script Date: 3/07/2017 8:14:24 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create Proc [dbo].[ListarCategoria]
As Begin
	Select * From Categoria
End


GO
/****** Object:  StoredProcedure [dbo].[ListarClientes]    Script Date: 3/07/2017 8:14:24 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


--PROCEDIMIENTOS ALMACENADOS EN SQL SERVER 2012

Create Proc [dbo].[ListarClientes]
As Begin
	Select IdCliente,DNI,Apellidos,Nombres,Direccion,Telefono From Cliente 
   End


GO
/****** Object:  StoredProcedure [dbo].[MantenimientoEmpleados]    Script Date: 3/07/2017 8:14:24 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create Proc [dbo].[MantenimientoEmpleados]
@IdEmpleado Int,
@IdCargo Int,
@Dni Char(8),
@Apellidos Varchar(30),
@Nombres Varchar(30),
@Sexo Char(1),
@FechaNac Date,
@Direccion Varchar(80),
@EstadoCivil Char(1),
@Mensaje Varchar(100) Out
As Begin
	If(Not Exists(Select * From Empleado Where Dni=@Dni))
		Begin
		Insert Empleado Values(@IdCargo,@Dni,@Apellidos,@Nombres,@Sexo,@FechaNac,@Direccion,@EstadoCivil)
			Set @Mensaje='Registrado Correctamente Ok.'
		End
	Else Begin
	If(Exists(Select * From Empleado Where Dni=@Dni))
		Begin
		Update Empleado Set IdCargo=@IdCargo,Dni=@Dni,Apellidos=@Apellidos,Nombres=@Nombres,Sexo=@Sexo,
		FechaNac=@FechaNac,Direccion=@Direccion,EstadoCivil=@EstadoCivil Where IdEmpleado=@IdEmpleado
			Set @Mensaje='Se Actualizaron los Datos Correctamente Ok.'
		End
	End
End


GO
/****** Object:  StoredProcedure [dbo].[Numero Correlativo]    Script Date: 3/07/2017 8:14:24 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[Numero Correlativo]
@TipoDocumento Varchar(7),
@NroCorrelativo Varchar(7)Out
As Begin
	Declare @Cant Int
	If(@TipoDocumento='Factura')
	Begin
	Select @Cant=Count(*)+1 From Venta where TipoDocumento='Factura'
		If @Cant<10
			Set @NroCorrelativo='000000'+Ltrim(Str(@Cant))
		Else
			If @Cant<100
				Set @NroCorrelativo='00000'+Ltrim(Str(@Cant))
			Else
				If @Cant<1000
					Set @NroCorrelativo='0000'+Ltrim(Str(@Cant))
				Else
					If(@Cant<10000)
						Set @NroCorrelativo='000'+LTRIM(STR(@Cant))
					Else
						If(@Cant<100000)
							Set @NroCorrelativo='00'+LTRIM(STR(@Cant))
						Else
							If(@Cant<1000000)
								Set @NroCorrelativo='0'+LTRIM(str(@Cant))
							Else
								If(@Cant<10000000)
									Set @NroCorrelativo=LTRIM(str(@Cant))
	End
	if(@TipoDocumento='Boleta')
	begin
		Select @Cant=Count(*)+1 From Venta where TipoDocumento='Boleta'
		If @Cant<10
			Set @NroCorrelativo='000000'+Ltrim(Str(@Cant))
		Else
			If @Cant<100
				Set @NroCorrelativo='00000'+Ltrim(Str(@Cant))
			Else
				If @Cant<1000
					Set @NroCorrelativo='0000'+Ltrim(Str(@Cant))
				Else
					If(@Cant<10000)
						Set @NroCorrelativo='000'+LTRIM(STR(@Cant))
					Else
						If(@Cant<100000)
							Set @NroCorrelativo='00'+LTRIM(STR(@Cant))
						Else
							If(@Cant<1000000)
								Set @NroCorrelativo='0'+LTRIM(str(@Cant))
							Else
								If(@Cant<10000000)
									Set @NroCorrelativo=LTRIM(STR(@Cant))
			End
	End
GO
/****** Object:  StoredProcedure [dbo].[RegistrarActualizarCargo]    Script Date: 3/07/2017 8:14:24 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Proc [dbo].[RegistrarActualizarCargo]

@IdCargo Int,

@Descripcion Varchar(30),

@Mensaje Varchar(50) Out

As Begin

		If(@IdCargo>0)
		begin
				If(Exists(Select * From Cargo Where Descripcion=@Descripcion))

				Set @Mensaje='No se ha Podido Actualizar los Datos porque ya Existe el cargo. '+@Descripcion

			Else Begin

				If(Not Exists(Select * From Cargo Where IdCargo=@IdCargo))

					Set @Mensaje='El Cargo no se Encuentra Registrado.'

				Else Begin

				Update Cargo Set Descripcion=@Descripcion Where IdCargo=@IdCargo

					Set @Mensaje='Los datos se han Actualizado Correctamente.'

					End

		End
		end
		else
		begin
			If(Exists(Select * From Cargo Where Descripcion=@Descripcion))

				Set @Mensaje='El Cargo ya se Encuentra Registrado.'

			Else Begin

				Insert Cargo values(@Descripcion)

				Set @Mensaje='Registrado Correctamente.'

			End
		end
End


GO
/****** Object:  StoredProcedure [dbo].[RegistrarActualizarCategoria]    Script Date: 3/07/2017 8:14:24 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create proc [dbo].[RegistrarActualizarCategoria]

@IdCategoria Int,

@Descripcion Varchar(50),

@Mensaje Varchar(50)  Out

As Begin

	If(@IdCategoria>0)

		Begin

			If(Not Exists(Select * From Categoria Where IdCategoria=@IdCategoria))

				Set @Mensaje='Categoria no se encuentra Registrada.'

			Else Begin

				Update Categoria Set Descripcion=@Descripcion Where IdCategoria=@IdCategoria

				Set @Mensaje='Se ha Actualizado los Datos Correctamente.'

			End

		End

	Else
		Begin
			If(Exists(Select * From Categoria Where Descripcion=@Descripcion))

				Set @Mensaje='Categoria ya se encuentra Registrada.'

			Else Begin

				Insert Categoria Values(@Descripcion)

				Set @Mensaje='Registrado Correctamente.'

				end

		End

End

GO
/****** Object:  StoredProcedure [dbo].[RegistrarActualizarCliente]    Script Date: 3/07/2017 8:14:24 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Proc [dbo].[RegistrarActualizarCliente]
@Idcliente INT,
@DNI char(8),
@Apellidos Varchar(50),
@Nombres Varchar(50),
@Direccion Varchar(100),
@Telefono Varchar(12),
@Mensaje Varchar(50) Output

As Begin
	If (@Idcliente>0)
		Begin
			If(Not Exists(Select * From Cliente Where Dni=@DNI))
		Begin
			Set @Mensaje='Los Datos del Cliente no Existen.'
		End

		Else 
		Begin
			Update Cliente Set Apellidos=@Apellidos,Nombres=@Nombres,Direccion=@Direccion,Telefono=@Telefono 
			Where DNI=@DNI
			Set @Mensaje='Registro Actualizado Correctamente.'
		End
	End
	Else
		Begin
		If(Exists(Select * From Cliente Where Dni=@DNI))
		Begin
			Set @Mensaje='Los Datos del Cliente ya Existen.'
		End

		Else
		Begin
			Insert Cliente Values(@DNI,@Apellidos,@Nombres,@Direccion,@Telefono)
			Set @Mensaje='Registrado Correctamente.'
		End
	End
End

GO
/****** Object:  StoredProcedure [dbo].[RegistrarActualizarProducto]    Script Date: 3/07/2017 8:14:24 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Proc [dbo].[RegistrarActualizarProducto]

@IdProducto Int,

@IdCategoria Int,

@Nombre Varchar(50),

@Marca Varchar(80),

@Stock Int,

@PrecioCompra Decimal(6,2),

@PrecioVenta Decimal(6,2),

@FechaVencimiento Date,

@Mensaje varchar(50) Out

As Begin

	If(@IdProducto>0)

	Begin
			If(Not Exists(Select * From Producto Where IdProducto=@IdProducto))

				Set @Mensaje='Producto no se encuentra Registrado.'

			Else Begin

				Update Producto Set IdCategoria=@IdCategoria,Nombre=@Nombre,Marca=@Marca,Stock=@Stock,

				PrecioCompra=@PrecioCompra,PrecioVenta=@PrecioVenta,FechaVencimiento=@FechaVencimiento 

				Where IdProducto=@IdProducto

				Set @Mensaje='Registro Actualizado Correctamente.'

		    End
	End

	Else
		Begin
			If(Exists(Select * From Producto Where Nombre=@Nombre And Marca=@Marca))

				Set @Mensaje='Este Producto ya ha sido Registrado.'

			Else Begin

				Insert Producto Values(@IdCategoria,@Nombre,@Marca,@Stock,@PrecioCompra,@PrecioVenta,@FechaVencimiento)

				Set @Mensaje='Registrado Correctamente.'

			End
	End
End


select * from Producto



GO
/****** Object:  StoredProcedure [dbo].[RegistrarCargo]    Script Date: 3/07/2017 8:14:24 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create Proc [dbo].[RegistrarCargo]
@Descripcion Varchar(30),
@Mensaje Varchar(50) Out
As Begin
	If(Exists(Select * From Cargo Where Descripcion=@Descripcion))
		Set @Mensaje='El Cargo ya se Encuentra Registrado.'
	Else Begin
		Insert Cargo values(@Descripcion)
		Set @Mensaje='Registrado Correctamente.'
	End
End


GO
/****** Object:  StoredProcedure [dbo].[RegistrarCategoria]    Script Date: 3/07/2017 8:14:24 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create proc [dbo].[RegistrarCategoria]
@Descripcion Varchar(50),
@Mensaje Varchar(50)  Out
As Begin
	If(Exists(Select * From Categoria Where Descripcion=@Descripcion))
		Set @Mensaje='Categoria ya se encuentra Registrada.'
	Else Begin
		Insert Categoria Values(@Descripcion)
		Set @Mensaje='Registrado Correctamente.'
	End
End


GO
/****** Object:  StoredProcedure [dbo].[RegistrarCliente]    Script Date: 3/07/2017 8:14:24 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create Proc [dbo].[RegistrarCliente]
(@DNI char(8),
@Apellidos Varchar(50),
@Nombres Varchar(50),
@Direccion Varchar(100),
@Telefono Varchar(12),
@Mensaje Varchar(50) Output
)
As Begin
	If(Exists(Select * From Cliente Where Dni=@DNI))
		Set @Mensaje='Los Datos del Cliente ya Existen.'
	Else Begin
		Insert Cliente Values(@DNI,@Apellidos,@Nombres,@Direccion,@Telefono)
		Set @Mensaje='Registrado Correctamente.'
		End
	End


GO
/****** Object:  StoredProcedure [dbo].[RegistrarDetalleVenta]    Script Date: 3/07/2017 8:14:24 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create Proc [dbo].[RegistrarDetalleVenta]
@IdProducto Int,
@IdVenta Int,
@Cantidad Int,
@PrecioUnitario Decimal(6,2),
@Igv Money,
@SubTotal Money,
@Mensaje Varchar(100) Out
As Begin
	Declare @Stock As Int
	Set @Stock=(Select Stock From Producto Where IdProducto=@IdProducto)
	Begin
		Insert DetalleVenta Values(@IdProducto,@IdVenta,@Cantidad,@PrecioUnitario,@Igv,@SubTotal)
			Set @Mensaje='Registrado Correctamente.'
	End
		Update Producto Set Stock=@Stock-@Cantidad Where IdProducto=@IdProducto
End


GO
/****** Object:  StoredProcedure [dbo].[RegistrarMasivoVenta]    Script Date: 3/07/2017 8:14:24 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Proc [dbo].[RegistrarMasivoVenta]



@IdEmpleado Int,



@IdCliente Int,



@Serie Char(5),



@NroDocumento Char(7),



@TipoDocumento Varchar(7),



@FechaVenta Date,



@Total Money,



@Mensaje Varchar(max) Out,



@TABLA_TIPO_DETALLEVENTA AS dbo.TipoDetalleVenta READONLY

AS BEGIN

		BEGIN TRY

		DECLARE @NEWID INT

				BEGIN TRANSACTION     



				INSERT INTO Venta

				(

					IdEmpleado,

					IdCliente,

					Serie,

					NroDocumento,

					TipoDocumento,

					FechaVenta,

					Total

				)

				VALUES

				(

					@IdEmpleado,

					@IdCliente,

					@Serie,

					@NroDocumento,

					@TipoDocumento,

					@FechaVenta,

					@Total

				)

				SET @NEWID = (SELECT SCOPE_IDENTITY())

				EXEC Guardar_Masivo_Situacion_DetalleVenta 

				@NEWID,@TABLA_TIPO_DETALLEVENTA

				Set @Mensaje='Registrado Correctamente.'

				COMMIT TRANSACTION

		END TRY

		BEGIN CATCH

				ROLLBACK TRANSACTION

				  DECLARE @ErrorMessage varchar(max);                                    

				  DECLARE @ErrorSeverity INT;                   

				  DECLARE @ErrorState INT;                                    

					SELECT                                     

				  @ErrorMessage = ERROR_MESSAGE(),      

				  @ErrorSeverity = ERROR_SEVERITY(),                                    

				  @ErrorState = ERROR_STATE();        

					RAISERROR (@ErrorMessage, -- Message text.                                    

				   @ErrorSeverity, -- Severity.                                    

				   @ErrorState -- State.                                    

				   );

				   Set @Mensaje=ERROR_MESSAGE()

		END CATCH        

END

GO
/****** Object:  StoredProcedure [dbo].[RegistrarProducto]    Script Date: 3/07/2017 8:14:24 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create Proc [dbo].[RegistrarProducto]
@IdCategoria Int,
@Nombre Varchar(50),
@Marca Varchar(80),
@Stock Int,
@PrecioCompra Decimal(6,2),
@PrecioVenta Decimal(6,2),
@FechaVencimiento Date,
@Mensaje varchar(50) Out
As Begin
	If(Exists(Select * From Producto Where Nombre=@Nombre And Marca=@Marca))
		Set @Mensaje='Este Producto ya ha sido Registrado.'
	Else Begin
		Insert Producto Values(@IdCategoria,@Nombre,@Marca,@Stock,@PrecioCompra,@PrecioVenta,@FechaVencimiento)
		Set @Mensaje='Registrado Correctamente.'
	End
End


GO
/****** Object:  StoredProcedure [dbo].[RegistrarUsuario]    Script Date: 3/07/2017 8:14:24 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create Proc [dbo].[RegistrarUsuario]
@IdEmpleado Int,
@Usuario Varchar(20),
@Contraseña Varchar(12),
@Mensaje Varchar(50) Out
As Begin
	If(Not Exists(Select * From Empleado Where IdEmpleado=@IdEmpleado))
		Set @Mensaje='Empleado no Registrado Ok.'
	Else Begin
		If(Exists(Select * From Usuario Where IdEmpleado=@IdEmpleado))
			Set @Mensaje='Este Empleado Ya Tiene una Cuenta de Usuario.'
		Else Begin
			If(Exists(Select * From Usuario Where Usuario=@Usuario))
				Set @Mensaje='El Usuario: '+@Usuario+' No está Disponible.'
			Else Begin
				Insert Usuario Values(@IdEmpleado,@Usuario,@Contraseña)
					Set @Mensaje='Usuario Registrado Correctamente.'
				 End
			 End
		 End
   End


GO
/****** Object:  StoredProcedure [dbo].[RegistrarVenta]    Script Date: 3/07/2017 8:14:24 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create Proc [dbo].[RegistrarVenta]
@IdEmpleado Int,
@IdCliente Int,
@Serie Char(5),
@NroDocumento Char(7),
@TipoDocumento Varchar(7),
@FechaVenta Date,
@Total Money,
@Mensaje Varchar(100) Out
As Begin
	Insert Venta Values(@IdEmpleado,@IdCliente,@Serie,@NroDocumento,@TipoDocumento,@FechaVenta,@Total)
		Set @Mensaje='La Venta se ha Generado Correctamente.'
	End


GO
/****** Object:  StoredProcedure [dbo].[Serie Documento]    Script Date: 3/07/2017 8:14:24 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create Proc [dbo].[Serie Documento]
@Serie char(5) out
as begin
Set @Serie='00001'
end


GO
USE [master]
GO
ALTER DATABASE [DemoPractica] SET  READ_WRITE 
GO
