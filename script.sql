USE [master]
GO
/****** Object:  Database [controlVacaciones]    Script Date: 5/27/2016 3:19:59 PM ******/
CREATE DATABASE [controlVacaciones]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'controlVacaciones', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\controlVacaciones.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'controlVacaciones_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\controlVacaciones_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [controlVacaciones] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [controlVacaciones].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [controlVacaciones] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [controlVacaciones] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [controlVacaciones] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [controlVacaciones] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [controlVacaciones] SET ARITHABORT OFF 
GO
ALTER DATABASE [controlVacaciones] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [controlVacaciones] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [controlVacaciones] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [controlVacaciones] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [controlVacaciones] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [controlVacaciones] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [controlVacaciones] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [controlVacaciones] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [controlVacaciones] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [controlVacaciones] SET  DISABLE_BROKER 
GO
ALTER DATABASE [controlVacaciones] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [controlVacaciones] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [controlVacaciones] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [controlVacaciones] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [controlVacaciones] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [controlVacaciones] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [controlVacaciones] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [controlVacaciones] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [controlVacaciones] SET  MULTI_USER 
GO
ALTER DATABASE [controlVacaciones] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [controlVacaciones] SET DB_CHAINING OFF 
GO
ALTER DATABASE [controlVacaciones] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [controlVacaciones] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [controlVacaciones] SET DELAYED_DURABILITY = DISABLED 
GO
USE [controlVacaciones]
GO
/****** Object:  Table [dbo].[ADMINISTRADORES]    Script Date: 5/27/2016 3:20:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ADMINISTRADORES](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[usuario] [nvarchar](50) NULL,
	[clave] [nvarchar](50) NULL,
 CONSTRAINT [PK_ADMINISTRADORES] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CREDITOS]    Script Date: 5/27/2016 3:20:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CREDITOS](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[FK_Movimiento] [int] NULL,
 CONSTRAINT [PK_CREDITOS_1] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DEBITOS]    Script Date: 5/27/2016 3:20:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DEBITOS](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[FK_Movimiento] [int] NULL,
	[FK_Solicitud] [int] NULL,
 CONSTRAINT [PK_DEBITOS] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[EMPLEADOS]    Script Date: 5/27/2016 3:20:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EMPLEADOS](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[FK_Jefe] [int] NULL,
	[FK_Puesto] [int] NULL,
	[usuario] [nvarchar](50) NULL,
	[clave] [nvarchar](50) NULL,
	[cedula] [nvarchar](50) NULL,
	[nombreCompleto] [nvarchar](50) NULL,
	[apellidoCompleto] [nvarchar](50) NULL,
	[fechaContratacion] [date] NULL,
	[estado] [bit] NULL,
	[email] [nvarchar](50) NULL,
	[saldoVacaciones] [int] NULL,
 CONSTRAINT [PK_EMPLEADOS] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[JEFES]    Script Date: 5/27/2016 3:20:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[JEFES](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[FK_Empleado] [int] NULL,
 CONSTRAINT [PK_JEFES] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[MOVIMIENTOS]    Script Date: 5/27/2016 3:20:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MOVIMIENTOS](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[FK_Tipo_Movimiento] [int] NULL,
	[FK_Admin] [int] NULL,
	[FK_Empleado] [int] NULL,
	[fecha] [date] NOT NULL,
	[nuevoSaldo] [money] NULL,
	[textoEmail] [text] NULL,
	[motivo] [text] NULL,
 CONSTRAINT [PK_CREDITOS] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PROCESOS_MASIVOS]    Script Date: 5/27/2016 3:20:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PROCESOS_MASIVOS](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [nvarchar](50) NULL,
	[fecha] [date] NULL,
	[estado] [bit] NULL,
 CONSTRAINT [PK_PROCESOS_MASIVOS] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PUESTOS]    Script Date: 5/27/2016 3:20:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PUESTOS](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [nvarchar](50) NULL,
	[salario] [money] NULL,
 CONSTRAINT [PK_PUESTOS] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SOLICITUDES]    Script Date: 5/27/2016 3:20:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SOLICITUDES](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[FK_Empleado] [int] NULL,
	[estado] [bit] NULL,
	[fechaCreacion] [date] NULL,
	[fechaInicio] [date] NULL,
	[fechaFin] [date] NULL,
	[descripcion] [text] NULL,
	[saldoDiasVacaciones] [int] NULL,
 CONSTRAINT [PK_SOLICITUDES] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TIPOS_MOVIMIENTOS]    Script Date: 5/27/2016 3:20:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TIPOS_MOVIMIENTOS](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [nvarchar](50) NULL,
 CONSTRAINT [PK_TIPOS_MOVIMIENTOS] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[CREDITOS]  WITH NOCHECK ADD  CONSTRAINT [FK_CREDITOS_MOVIMIENTOS] FOREIGN KEY([FK_Movimiento])
REFERENCES [dbo].[MOVIMIENTOS] ([ID])
GO
ALTER TABLE [dbo].[CREDITOS] CHECK CONSTRAINT [FK_CREDITOS_MOVIMIENTOS]
GO
ALTER TABLE [dbo].[DEBITOS]  WITH NOCHECK ADD  CONSTRAINT [FK_DEBITOS_MOVIMIENTOS] FOREIGN KEY([FK_Movimiento])
REFERENCES [dbo].[MOVIMIENTOS] ([ID])
GO
ALTER TABLE [dbo].[DEBITOS] CHECK CONSTRAINT [FK_DEBITOS_MOVIMIENTOS]
GO
ALTER TABLE [dbo].[DEBITOS]  WITH NOCHECK ADD  CONSTRAINT [FK_DEBITOS_SOLICITUDES] FOREIGN KEY([FK_Solicitud])
REFERENCES [dbo].[SOLICITUDES] ([ID])
GO
ALTER TABLE [dbo].[DEBITOS] CHECK CONSTRAINT [FK_DEBITOS_SOLICITUDES]
GO
ALTER TABLE [dbo].[EMPLEADOS]  WITH CHECK ADD  CONSTRAINT [FK_EMPLEADOS_JEFES] FOREIGN KEY([FK_Jefe])
REFERENCES [dbo].[JEFES] ([ID])
GO
ALTER TABLE [dbo].[EMPLEADOS] CHECK CONSTRAINT [FK_EMPLEADOS_JEFES]
GO
ALTER TABLE [dbo].[EMPLEADOS]  WITH NOCHECK ADD  CONSTRAINT [FK_EMPLEADOS_PUESTOS] FOREIGN KEY([FK_Puesto])
REFERENCES [dbo].[PUESTOS] ([ID])
GO
ALTER TABLE [dbo].[EMPLEADOS] CHECK CONSTRAINT [FK_EMPLEADOS_PUESTOS]
GO
ALTER TABLE [dbo].[JEFES]  WITH CHECK ADD  CONSTRAINT [FK_JEFES_EMPLEADOS] FOREIGN KEY([FK_Empleado])
REFERENCES [dbo].[EMPLEADOS] ([ID])
GO
ALTER TABLE [dbo].[JEFES] CHECK CONSTRAINT [FK_JEFES_EMPLEADOS]
GO
ALTER TABLE [dbo].[MOVIMIENTOS]  WITH NOCHECK ADD  CONSTRAINT [FK_CREDITOS_EMPLEADOS] FOREIGN KEY([FK_Empleado])
REFERENCES [dbo].[EMPLEADOS] ([ID])
GO
ALTER TABLE [dbo].[MOVIMIENTOS] CHECK CONSTRAINT [FK_CREDITOS_EMPLEADOS]
GO
ALTER TABLE [dbo].[MOVIMIENTOS]  WITH CHECK ADD  CONSTRAINT [FK_MOVIMIENTOS_TIPOS_MOVIMIENTOS] FOREIGN KEY([FK_Tipo_Movimiento])
REFERENCES [dbo].[TIPOS_MOVIMIENTOS] ([ID])
GO
ALTER TABLE [dbo].[MOVIMIENTOS] CHECK CONSTRAINT [FK_MOVIMIENTOS_TIPOS_MOVIMIENTOS]
GO
ALTER TABLE [dbo].[SOLICITUDES]  WITH NOCHECK ADD  CONSTRAINT [FK_SOLICITUDES_EMPLEADOS] FOREIGN KEY([FK_Empleado])
REFERENCES [dbo].[EMPLEADOS] ([ID])
GO
ALTER TABLE [dbo].[SOLICITUDES] CHECK CONSTRAINT [FK_SOLICITUDES_EMPLEADOS]
GO
/****** Object:  StoredProcedure [dbo].[borrarRegistros]    Script Date: 5/27/2016 3:20:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[borrarRegistros]
AS
BEGIN
--borra todos los registros de las tablas.
EXEC sp_MSForEachTable 'DISABLE TRIGGER ALL ON ?'
EXEC sp_MSForEachTable 'ALTER TABLE ? NOCHECK CONSTRAINT ALL'
EXEC sp_MSForEachTable 'DELETE FROM ?'
EXEC sp_MSForEachTable 'ALTER TABLE ? CHECK CONSTRAINT ALL'
EXEC sp_MSForEachTable 'ENABLE TRIGGER ALL ON ?'
--reinicia el identity.
EXEC sp_MSforeachtable @command1 = 'DBCC CHECKIDENT(''?'', RESEED, 0)'

END
GO
/****** Object:  StoredProcedure [dbo].[cambiarEstadoSolicitud]    Script Date: 5/27/2016 3:20:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[cambiarEstadoSolicitud]
	-- Add the parameters for the stored procedure here
	@IDSolicitud int,
	@Estado int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE SOLICITUDES SET estado = @Estado
	WHERE ID = @IDSolicitud
END

GO
/****** Object:  StoredProcedure [dbo].[ingresoUsuario]    Script Date: 5/27/2016 3:20:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[ingresoUsuario]
@usuario nvarchar(50),
@clave nvarchar(50)
as
declare
@idUsuario int = 0,
@tipoUsuario int = 0,
@codigoError int
begin

exec @tipoUsuario = obtenerTipoUsuario @usuario 

if(@tipoUsuario < 0)
	begin
	--No existe el usuario.
		set @tipoUsuario = 0
		set @idUsuario = 0
	end
else
	begin
		select 
		   @idUsuario = case @tipoUsuario
		   when 1 then (select ID from ADMINISTRADORES  where usuario = @usuario and clave = @clave )
		   when 2 then (select E.ID from JEFES J inner join EMPLEADOS E on (J.FK_Empleado = E.ID) where (E.usuario = @usuario ) )
		   when 3 then (select ID from EMPLEADOS  where usuario = @usuario)
		   else  -69
		end		
	end

select @codigoError = isnull(@idUsuario,-43)

if(@codigoError = -43)
	begin
		set @tipoUsuario = 0
		set @idUsuario = 0
	end
	
select @tipoUsuario,@idUsuario



end
GO
/****** Object:  StoredProcedure [dbo].[insertarAdministradores]    Script Date: 5/27/2016 3:20:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[insertarAdministradores]
@usuario nvarchar(50),
@clave nvarchar(50)
AS
begin

begin try

insert into ADMINISTRADORES(usuario,clave) values (@usuario, @clave)    

select COUNT(*) from ADMINISTRADORES

end try

begin catch

	return -1

end catch
end


GO
/****** Object:  StoredProcedure [dbo].[insertarCreditos]    Script Date: 5/27/2016 3:20:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[insertarCreditos]
@FK_Movimiento int
AS
begin

begin try

insert into CREDITOS(FK_Movimiento) values (@FK_Movimiento)     -- dado a que el empleado es jefe insertamos su id como empleado

select @FK_Movimiento

end try

begin catch

	return -1

end catch
end


GO
/****** Object:  StoredProcedure [dbo].[insertarDebitos]    Script Date: 5/27/2016 3:20:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[insertarDebitos]
@FK_Movimiento int,
@FK_Solicitud int
AS
begin

begin try

insert into DEBITOS(FK_Movimiento, FK_Solicitud) values (@FK_Movimiento, @FK_Solicitud)    

select COUNT(*) from DEBITOS

end try

begin catch

	return -1

end catch
end


GO
/****** Object:  StoredProcedure [dbo].[insertarEmpleados]    Script Date: 5/27/2016 3:20:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- códigos de error: -2: fecha de contratación inválida, -3: usuario ya existe, -4: transacción no iniciada
CREATE PROCEDURE [dbo].[insertarEmpleados]
@FK_Jefe int = null,
@FK_Puesto int = null,
@nombreUsuario nvarchar(50),
@clave nvarchar(50),
@cedula nvarchar(50),
@nombreCompleto nvarchar(50),
@apellidoCompleto nvarchar(50),
@fechaContratacion date,
@estado bit = 1,   -- estando en 1 es porque esta trabajando
@email nvarchar(50)
AS
DECLARE
@saldoVacaciones int,
@codigoError int = 0,
@existeNombre int = 0
begin



if(@FK_Jefe = 0)
 begin
	select @FK_Jefe = null
 end

 if(@FK_Puesto = 0)
 begin
	select @FK_Puesto = null
 end

 set @existeNombre = (select COUNT(*) from EMPLEADOS where usuario = @nombreUsuario)

 set @existeNombre += (select COUNT(*) from ADMINISTRADORES where usuario = @nombreUsuario)



set @saldoVacaciones = DATEDIFF(month, @fechaContratacion, CONVERT (date, GETDATE())); -- hemos calculado la cantidad de días que tiene el trabajador desde que entro a trabajar hasta la fecha ganando cada mes un día
--print 'saldo de vacaciones ' +  CONVERT (nvarchar, @saldoVacaciones)

-- inicio del control para las validaciones

 if(@existeNombre = 0 )
 begin
		if (@saldoVacaciones >= 0 )  -- se pregunta por si se puso una fecha de contratación mayor a la actual
			begin
				select @codigoError =  COUNT(*) from EMPLEADOS
			end	
		else
			begin
				select -2
				return
			end
 end
 else
 begin
	select -3
	return
 end

if @@TRANCOUNT < 1 and @codigoError >= 0
	begin
		begin transaction
		begin try
			insert into EMPLEADOS(FK_Jefe, FK_Puesto, usuario, clave, cedula, nombreCompleto, apellidoCompleto, fechaContratacion, estado, email, saldoVacaciones)
							values  (@FK_Jefe, @FK_Puesto, @nombreUsuario, @clave, @cedula, @nombreCompleto, @apellidoCompleto, @fechaContratacion, @estado, @email, @saldoVacaciones )
			commit transaction
			select @codigoError
		end try
		begin catch
			select -4
			return
		end catch
	end -- del if
end

GO
/****** Object:  StoredProcedure [dbo].[insertarJefes]    Script Date: 5/27/2016 3:20:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[insertarJefes]
@FK_Empleado int
AS
begin

begin try

insert into JEFES (FK_Empleado) values (@FK_Empleado)     -- dado a que el empleado es jefe insertamos su id como empleado

select @FK_Empleado

end try

begin catch

	return -1

end catch
end


GO
/****** Object:  StoredProcedure [dbo].[insertarMovimientos]    Script Date: 5/27/2016 3:20:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[insertarMovimientos]
@FK_TipoMovimiento int,
@FK_Admin int,
@FK_Empleado int,
@nuevoSaldo money,
@motivo nvarchar(50)
AS
declare
@fecha date,
@textoEmail nvarchar(300)
begin

set @fecha = CONVERT (date, GETDATE())
set @textoEmail = 'La fecha: ' + CONVERT(VARCHAR(10),GETDATE(),10) + ' se ha realizado un ' + (select nombre from TIPOS_MOVIMIENTOS where id = @FK_TipoMovimiento) + ' por parte de '+ (select usuario from ADMINISTRADORES where id = @FK_Admin)+ ' , a su cantidad de dias que ahora es ' + CAST(@nuevoSaldo AS char(20)) + ' debido al siguiente motivo: ' + @motivo + ' , esto fue un comunicado oficial. '
 

begin try

insert into MOVIMIENTOS (FK_Tipo_Movimiento, FK_Admin, FK_Empleado, fecha, nuevoSaldo, textoEmail, motivo) 
				values  (@FK_TipoMovimiento, @FK_Admin, @FK_Empleado, @fecha, @nuevoSaldo, @textoEmail, @motivo)    

select COUNT(*) from PUESTOS

end try

begin catch

	return -1

end catch
end


GO
/****** Object:  StoredProcedure [dbo].[insertarPuestos]    Script Date: 5/27/2016 3:20:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[insertarPuestos]
@nombre nvarchar(50),
@salario int
AS
begin

begin try

insert into PUESTOS(nombre, salario) values (@nombre, @salario)    

select COUNT(*) from PUESTOS

end try

begin catch

	return -1

end catch
end


GO
/****** Object:  StoredProcedure [dbo].[insertarSolicitudes]    Script Date: 5/27/2016 3:20:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[insertarSolicitudes] 
@FK_Empleado int,
@estado bit = 0,
@fechaInicio date,
@fechaFin date,
@descripcion text
AS
DECLARE
@fechaCreación date,
@saldoDiasVacaciones int
begin

set @fechaCreación = CONVERT (date, GETDATE()) -- hemos obtenida la fecha en formato 2016-05-14   // el formato es aa-mm-dd

set @saldoDiasVacaciones = DATEDIFF(day, @fechaInicio, @fechaFin); -- hemos calculado la cantidad de días solicitados

if @@TRANCOUNT < 1
	begin transaction

begin try

if @saldoDiasVacaciones > 0
begin
insert into SOLICITUDES (FK_Empleado, estado, fechaCreacion, fechaInicio, fechaFin, descripcion, saldoDiasVacaciones) 
				values  (@FK_Empleado, @estado, @fechaCreación, @fechaInicio, @fechaFin, @descripcion, @saldoDiasVacaciones)
commit transaction
end

select @saldoDiasVacaciones

end try

begin catch

	return -1

end catch
end


GO
/****** Object:  StoredProcedure [dbo].[insertarTipos_Movimientos]    Script Date: 5/27/2016 3:20:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[insertarTipos_Movimientos]
@nombre nvarchar(50)
AS
begin

begin try

insert into TIPOS_MOVIMIENTOS(nombre) values (@nombre)    

select COUNT(*) from TIPOS_MOVIMIENTOS

end try

begin catch

	return -1

end catch
end


GO
/****** Object:  StoredProcedure [dbo].[obtenerEmpleadosBusqueda]    Script Date: 5/27/2016 3:20:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[obtenerEmpleadosBusqueda]
	-- Add the parameters for the stored procedure here
	@nombre nvarchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SET @nombre = RTRIM(LTRIM(@nombre))
	SET @nombre = '%' + @nombre + '%'

	SELECT E.ID FROM EMPLEADOS E
	WHERE E.usuario LIKE @nombre OR E.cedula LIKE @nombre OR E.nombreCompleto LIKE @nombre OR E.apellidoCompleto LIKE @nombre
END

GO
/****** Object:  StoredProcedure [dbo].[obtenerRegistrosJefes]    Script Date: 5/27/2016 3:20:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[obtenerRegistrosJefes]
as
begin
	select j.ID,e.nombreCompleto, e.apellidoCompleto
	from JEFES j Inner join EMPLEADOS e on j.FK_Empleado = e.ID
end
GO
/****** Object:  StoredProcedure [dbo].[obtenerRegistrosPuestos]    Script Date: 5/27/2016 3:20:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[obtenerRegistrosPuestos]
as
begin
	select ID,nombre,salario 
	from PUESTOS
end
GO
/****** Object:  StoredProcedure [dbo].[obtenerSolicitudes]    Script Date: 5/27/2016 3:20:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[obtenerSolicitudes]
	-- Add the parameters for the stored procedure here
	@IDJefe int,
	@estado int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT S.ID FROM SOLICITUDES S
	INNER JOIN EMPLEADOS E ON S.FK_Empleado = E.ID
	WHERE E.FK_Jefe = @IDJefe AND S.estado = @estado
END
GO
/****** Object:  StoredProcedure [dbo].[obtenerSolicitudValor]    Script Date: 5/27/2016 3:20:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[obtenerSolicitudValor]
	-- Add the parameters for the stored procedure here
	@IDSolicitud int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT E.nombreCompleto, S.estado, S.fechaCreacion, S.fechaInicio, S.fechaFin, S.descripcion FROM SOLICITUDES S
	INNER JOIN EMPLEADOS E ON S.FK_Empleado = E.ID
	WHERE S.ID = @IDSolicitud
END

GO
/****** Object:  StoredProcedure [dbo].[obtenerTipoUsuario]    Script Date: 5/27/2016 3:20:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[obtenerTipoUsuario]
(
@nomUsuario NVARCHAR(50)
)

AS
DECLARE
@tipoUsuario INT
BEGIN
--  1.Admin, 2.Jefe, 3.Empleado, -4.No existe el usuario.

IF EXISTS (SELECT usuario FROM ADMINISTRADORES WHERE usuario = @nomUsuario)
	BEGIN
		print 'El usuario es administrador.'
		RETURN  1
		
	END
ELSE
	BEGIN
		IF EXISTS (SELECT usuario FROM EMPLEADOS e inner join  JEFES j on (e.ID = j.FK_Empleado ) WHERE e.usuario = @nomUsuario)
			BEGIN
				print 'El usuario es jefe.'
				RETURN 2
			END
		ELSE
			BEGIN
				IF EXISTS (SELECT usuario FROM EMPLEADOS WHERE usuario = @nomUsuario)
				BEGIN
					print 'El usuario es empleado.'
					RETURN 3
					
				END
				ELSE
					BEGIN
						print 'No existe el usuario.'
						RETURN -4
						
					END
			END
	END
RETURN @tipoUsuario

END
GO
USE [master]
GO
ALTER DATABASE [controlVacaciones] SET  READ_WRITE 
GO
