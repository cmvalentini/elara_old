USE [master]
GO
/****** Object:  Database [ELARA]    Script Date: 01/08/2020 10:56:41 ******/
CREATE DATABASE [ELARA]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ELARA', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.SERVERCHARLY\MSSQL\DATA\ELARA.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ELARA_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.SERVERCHARLY\MSSQL\DATA\ELARA_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [ELARA] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ELARA].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ELARA] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ELARA] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ELARA] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ELARA] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ELARA] SET ARITHABORT OFF 
GO
ALTER DATABASE [ELARA] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ELARA] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ELARA] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ELARA] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ELARA] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ELARA] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ELARA] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ELARA] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ELARA] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ELARA] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ELARA] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ELARA] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ELARA] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ELARA] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ELARA] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ELARA] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ELARA] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ELARA] SET RECOVERY FULL 
GO
ALTER DATABASE [ELARA] SET  MULTI_USER 
GO
ALTER DATABASE [ELARA] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ELARA] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ELARA] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ELARA] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ELARA] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'ELARA', N'ON'
GO
ALTER DATABASE [ELARA] SET QUERY_STORE = OFF
GO
USE [ELARA]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [ELARA]
GO
/****** Object:  Table [dbo].[Bitacora]    Script Date: 01/08/2020 10:56:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bitacora](
	[BitacoraID] [int] IDENTITY(1,1) NOT NULL,
	[NombreOperacion] [varchar](120) NOT NULL,
	[Descripcion] [varchar](120) NOT NULL,
	[UsuarioID] [int] NOT NULL,
	[Criticidad] [int] NOT NULL,
	[FechayHora] [datetime] NOT NULL,
	[DVH] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[BitacoraID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cliente]    Script Date: 01/08/2020 10:56:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cliente](
	[clienteid] [int] IDENTITY(1,1) NOT NULL,
	[razon_social] [varchar](50) NOT NULL,
	[condicion_fiscal] [varchar](50) NOT NULL,
	[telefono] [varchar](20) NULL,
	[Domicilio] [varchar](100) NOT NULL,
	[Habilitado] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[clienteid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[dvv]    Script Date: 01/08/2020 10:56:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dvv](
	[tabla] [varchar](30) NOT NULL,
	[dvv] [numeric](18, 0) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Idioma]    Script Date: 01/08/2020 10:56:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Idioma](
	[IdiomaID] [int] NOT NULL,
	[Descripcion] [varchar](8) NOT NULL,
	[Seleccionado] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdiomaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[medio]    Script Date: 01/08/2020 10:56:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[medio](
	[medioid] [int] IDENTITY(1,1) NOT NULL,
	[medionombre] [varchar](50) NOT NULL,
	[descripcion] [varchar](150) NULL,
	[iva] [decimal](4, 2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[medioid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OPERACION]    Script Date: 01/08/2020 10:56:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OPERACION](
	[OperacionID] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [varchar](50) NOT NULL,
	[PatenteEscencial] [varchar](2) NULL,
PRIMARY KEY CLUSTERED 
(
	[OperacionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pedido]    Script Date: 01/08/2020 10:56:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pedido](
	[pedidoid] [int] IDENTITY(1,1) NOT NULL,
	[medioid] [int] NOT NULL,
	[ubicacionid] [int] NOT NULL,
	[clienteid] [int] NOT NULL,
	[Preciopedido] [decimal](10, 3) NOT NULL,
	[FechainicioPublicacion] [datetime] NOT NULL,
	[FechafinPublicacion] [datetime] NOT NULL,
	[Impresiones] [int] NOT NULL,
	[Descripcion] [varchar](300) NULL,
	[fechapedido] [datetime] NOT NULL,
	[fechaborrado] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[pedidoid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PerfilOperacion]    Script Date: 01/08/2020 10:56:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PerfilOperacion](
	[OperacionID] [int] NULL,
	[PerfilUsuarioID] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PerfilUsuario]    Script Date: 01/08/2020 10:56:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PerfilUsuario](
	[PerfilUsuarioID] [int] IDENTITY(1,1) NOT NULL,
	[NombrePerfil] [varchar](50) NOT NULL,
	[DescPerfil] [varchar](50) NOT NULL,
	[DVH] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[PerfilUsuarioID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ubicacion]    Script Date: 01/08/2020 10:56:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ubicacion](
	[Ubicacionid] [int] IDENTITY(1,1) NOT NULL,
	[Nombreubicacion] [varchar](30) NOT NULL,
	[Medioid] [int] NOT NULL,
	[Medidas] [varchar](50) NOT NULL,
	[Formato] [varchar](100) NULL,
	[Formula] [varchar](100) NOT NULL,
	[Habilitado] [bit] NOT NULL,
	[precio] [decimal](10, 3) NULL,
PRIMARY KEY CLUSTERED 
(
	[Ubicacionid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 01/08/2020 10:56:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuario](
	[UsuarioID] [int] IDENTITY(1,1) NOT NULL,
	[Usuario] [varchar](80) NOT NULL,
	[Clave] [varchar](120) NOT NULL,
	[Nombre] [varchar](90) NOT NULL,
	[Apellido] [varchar](90) NOT NULL,
	[DNI] [int] NULL,
	[Email] [varchar](70) NOT NULL,
	[Habilitado] [bit] NOT NULL,
	[FlagIntentosLogin] [int] NOT NULL,
	[DVH] [varchar](32) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[UsuarioID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UsuarioFamilia]    Script Date: 01/08/2020 10:56:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UsuarioFamilia](
	[PerfilID] [int] NOT NULL,
	[UsuarioID] [int] NOT NULL,
	[Actual] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[usuariooperacion]    Script Date: 01/08/2020 10:56:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[usuariooperacion](
	[UsuarioID] [int] NOT NULL,
	[OperacionID] [int] NOT NULL,
	[Habilitado] [varchar](2) NOT NULL,
	[DVH] [int] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[PerfilUsuario] ADD  DEFAULT ((0)) FOR [DVH]
GO
ALTER TABLE [dbo].[pedido]  WITH CHECK ADD FOREIGN KEY([clienteid])
REFERENCES [dbo].[cliente] ([clienteid])
GO
ALTER TABLE [dbo].[pedido]  WITH CHECK ADD FOREIGN KEY([medioid])
REFERENCES [dbo].[medio] ([medioid])
GO
ALTER TABLE [dbo].[pedido]  WITH CHECK ADD FOREIGN KEY([ubicacionid])
REFERENCES [dbo].[ubicacion] ([Ubicacionid])
GO
ALTER TABLE [dbo].[PerfilOperacion]  WITH CHECK ADD FOREIGN KEY([OperacionID])
REFERENCES [dbo].[OPERACION] ([OperacionID])
GO
ALTER TABLE [dbo].[PerfilOperacion]  WITH CHECK ADD FOREIGN KEY([PerfilUsuarioID])
REFERENCES [dbo].[PerfilUsuario] ([PerfilUsuarioID])
GO
ALTER TABLE [dbo].[ubicacion]  WITH CHECK ADD FOREIGN KEY([Medioid])
REFERENCES [dbo].[medio] ([medioid])
GO
ALTER TABLE [dbo].[UsuarioFamilia]  WITH CHECK ADD FOREIGN KEY([PerfilID])
REFERENCES [dbo].[PerfilUsuario] ([PerfilUsuarioID])
GO
ALTER TABLE [dbo].[UsuarioFamilia]  WITH CHECK ADD FOREIGN KEY([UsuarioID])
REFERENCES [dbo].[Usuario] ([UsuarioID])
GO
ALTER TABLE [dbo].[usuariooperacion]  WITH CHECK ADD FOREIGN KEY([OperacionID])
REFERENCES [dbo].[OPERACION] ([OperacionID])
GO
ALTER TABLE [dbo].[usuariooperacion]  WITH CHECK ADD FOREIGN KEY([UsuarioID])
REFERENCES [dbo].[Usuario] ([UsuarioID])
GO
/****** Object:  StoredProcedure [dbo].[GrabarPedido]    Script Date: 01/08/2020 10:56:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE procedure [dbo].[GrabarPedido]
  @preciopedido decimal,
  @impresiones int,
  @fechafinpublicacion datetime,
  @fechainiciopublicacion datetime,
  @descripcion varchar(300),
  @nombreubicacion varchar(100),
  @medionombre varchar(100),
  @nombreAgencia varchar(200)

 as
 declare @medioid int
 declare @ubicacionid int
 declare @clienteid int
  
 select @medioid = u.Medioid,@ubicacionid = u.Ubicacionid from medio m inner join ubicacion u
 on u.Medioid = m.medioid
 where m.medionombre like @medionombre
  and u.Nombreubicacion like  @nombreubicacion
  
  select @clienteid = clienteid from cliente
  where razon_social like @nombreAgencia

  insert into pedido(medioid,ubicacionid,clienteid,Preciopedido,FechainicioPublicacion,FechafinPublicacion,Impresiones,Descripcion,fechapedido)
  (select @medioid,@ubicacionid,@clienteid,@preciopedido,@fechainiciopublicacion,@fechafinpublicacion,@impresiones,@descripcion,GETDATE())
 
   ;
 

 
GO
/****** Object:  StoredProcedure [dbo].[RealizarBackup]    Script Date: 01/08/2020 10:56:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[RealizarBackup] 
@CANT INT

AS

IF @CANT = 3
 EXEC RealizarBackup3Partes

 IF @CANT = 5
 EXEC RealizarBackup5Partes
 
 IF @CANT = 10

 EXEC RealizarBackup10Partes
GO
/****** Object:  StoredProcedure [dbo].[RealizarBackup10Partes]    Script Date: 01/08/2020 10:56:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
  CREATE PROCEDURE [dbo].[RealizarBackup10Partes]
  AS
    
 
BEGIN
BACKUP DATABASE ELARA
TO DISK = 'C:\Users\Charly\Desktop\backup\parte1.Bak',
DISK = 'C:\Users\Charly\Desktop\backup\parte2.Bak',
DISK = 'C:\Users\Charly\Desktop\backup\parte3.Bak',
DISK = 'C:\Users\Charly\Desktop\backup\parte4.Bak',
DISK = 'C:\Users\Charly\Desktop\backup\parte5.Bak',
DISK = 'C:\Users\Charly\Desktop\backup\parte6.Bak',
DISK = 'C:\Users\Charly\Desktop\backup\parte7.Bak',
DISK = 'C:\Users\Charly\Desktop\backup\parte8.Bak',
DISK = 'C:\Users\Charly\Desktop\backup\parte9.Bak',
DISK = 'C:\Users\Charly\Desktop\backup\parte10.Bak'


END

GO
/****** Object:  StoredProcedure [dbo].[RealizarBackup3Partes]    Script Date: 01/08/2020 10:56:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[RealizarBackup3Partes] 
 
AS
BEGIN
BACKUP DATABASE ELARA
TO DISK = 'C:\Users\Charly\Desktop\backup\parte1.Bak',
DISK = 'C:\Users\Charly\Desktop\backup\parte2.Bak',
DISK = 'C:\Users\Charly\Desktop\backup\parte3.Bak'
END

 
GO
/****** Object:  StoredProcedure [dbo].[RealizarBackup5Partes]    Script Date: 01/08/2020 10:56:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
  CREATE PROCEDURE [dbo].[RealizarBackup5Partes]
  AS
    
 
BEGIN
BACKUP DATABASE ELARA
TO DISK = 'C:\Users\Charly\Desktop\backup\parte1.Bak',
DISK = 'C:\Users\Charly\Desktop\backup\parte2.Bak',
DISK = 'C:\Users\Charly\Desktop\backup\parte3.Bak',
DISK = 'C:\Users\Charly\Desktop\backup\parte4.Bak',
DISK = 'C:\Users\Charly\Desktop\backup\parte5.Bak'

END

GO
/****** Object:  StoredProcedure [dbo].[SumarFlagIntentos]    Script Date: 01/08/2020 10:56:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



/* ******************
**STORES PROCEDURES**
******************* */
CREATE PROCEDURE [dbo].[SumarFlagIntentos] 
@usuid int
AS

declare @flag int = 0;
BEGIN

  select @flag = FlagIntentosLogin
   from usuario
   where UsuarioID= @usuid
  select @flag = @flag +1;
   update usuario set FlagIntentosLogin = @flag
   where UsuarioID = @usuid
END

/* ******************
**ALGUNOS INSERTS**
******************* */
GO
USE [master]
GO
ALTER DATABASE [ELARA] SET  READ_WRITE 
GO





insert into PerfilUsuario values ('Soporte','Hace Soporte',null)

insert into Idioma values(1,'Español',1)
insert into Idioma values(2,'Ingles',0)

insert into OPERACION(Descripcion,patenteescencial) VALUES	('login','S'),
	('menuusuarios','S'),
	('modificarperfilusuario','S'),
	('calculardigitosverificadores','S'),
	('digitosverificadores','S');
insert into operacion values('HacerRestore','S')
 insert into OPERACION values('ConfigurarIdioma','N')
 insert into operacion values('abmusuario','S')
insert into operacion values('ABMFamilias','S')
insert into operacion values ('consultarbitacora','S')
 insert into OPERACION values ('ABMMedios','S')
 
 insert into operacion values ('BloquearDesbloquearOperacionesaUsuario','S')

insert into OPERACION values('DesbloquearOperacionAUsuariocs','S')

  insert into OPERACION values ('ABMClientes','S')
  insert into OPERACION values ('CrearNegocio','N')


   insert into usuariooperacion(UsuarioID,OperacionID,Habilitado) values (1,1018,'S')
   
insert into usuario values ('Test','xSwdFW81PYo=','Test','Test',12345,'Test@test.com.ar',1,0,0)

 insert into usuariooperacion(UsuarioID,OperacionID,Habilitado) values (1,1,'S')
insert into usuariooperacion(UsuarioID,OperacionID,Habilitado) values (1,2,'S')
insert into usuariooperacion(UsuarioID,OperacionID,Habilitado) values (1,3,'S')
insert into usuariooperacion(UsuarioID,OperacionID,Habilitado) values (1,4,'S')
insert into usuariooperacion values(1,5,'S',null)
insert into usuariooperacion values (1,6,'S',null)
 insert into usuariooperacion values (1,7,'S',null)
insert into usuariooperacion(UsuarioID,OperacionID,Habilitado) values (1,8,'S')
 insert into usuariooperacion values (1,9,'S',null)
 
 insert into usuariooperacion values (1,13,'S',null)
 
 
insert into usuariooperacion values (1,14,'S',null)

 insert into dvv values ('PerfilUsuario',null)
insert into dvv values ('OperacionUsuario',null)
insert into dvv values ('PerfilOperacion',null)
insert into dvv values ('Operación',null) 
insert into dvv values ('Bitacora',null)
insert into dvv values ('DVV',NULL)
 
insert into usuariooperacion values (1,11,'S',null)
 insert into usuariooperacion values(1,12,'S',null)

 insert into OPERACION values('ABMUbicacion','N')

 insert into usuariooperacion values (1,1017,'S',null)
 
 

 insert into perfiloperacion values
(1,1),
(2,1),
(3,1),
(4,1),
(5,1),
(7,1),
(8,1),
(9,1),
(10,1),
(11,1),
(12,1)

insert into operacion(Descripcion,PatenteEscencial) values ('AltaMedio','S')

insert into usuariooperacion values 
(1,15,'S',null)

insert into operacion(Descripcion,PatenteEscencial) values ('ConsultaOperacion','N')
insert into usuariooperacion values (1,2019,'s',null)

insert into medio(medionombre,descripcion,iva) values 
('Diario Ole','Diario Ole deportivo',10.5)


  insert into ubicacion(Nombreubicacion,Medioid,Medidas,Formato,Formula,Habilitado,precio)
  values ('ROS',1,'4x8','ROS','<!DOCTYPE html><html><head><title>Mi pagina de prueba</title></head> <body></body></html>',
  1,10)
   insert into ubicacion(Nombreubicacion,Medioid,Medidas,Formato,Formula,Habilitado,precio)
  values ('ROS',6,'4x8','ROS','<!DOCTYPE html><html><head><title>Mi pagina de prueba</title></head> <body></body></html>',
  1,10)

    insert into ubicacion(Nombreubicacion,Medioid,Medidas,Formato,Formula,Habilitado,precio)
  values ('LEFT BANNER',1,'2x6','LEFT BANNER','<!DOCTYPE html><html><head><title>Mi pagina de prueba</title></head> <body></body></html>',
  1,15)
     insert into ubicacion(Nombreubicacion,Medioid,Medidas,Formato,Formula,Habilitado,precio)
  values ('RIGHT BANNER',1,'2x6','RIGHT BANNER','<!DOCTYPE html><html><head><title>Mi pagina de prueba</title></head> <body></body></html>',
  1,15)

