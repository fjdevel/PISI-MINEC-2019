/*********ELIMINACION DE BASE DE DATOS**********/
GO
IF EXISTS(SELECT * from sys.databases where name='PISI')
	EXEC msdb.dbo.sp_delete_database_backuphistory @database_name = N'PISI'
GO

IF EXISTS(SELECT * FROM sys.databases WHERE NAME='master')
	USE [master]
GO

IF EXISTS(SELECT * from sys.databases where name='PISI')
	ALTER DATABASE [PISI] SET  SINGLE_USER WITH ROLLBACK IMMEDIATE
GO

IF EXISTS(SELECT * from sys.databases where name='PISI')
	DROP DATABASE [PISI]
GO

/*********ELIMINACION DE CREDENCIALES DE BASE DE DATOS**********/
GO
IF EXISTS(SELECT * FROM sys.sql_logins WHERE name='PISI_LOGIN' )
	DROP LOGIN [PISI_LOGIN]
GO


/*********CREACION DE BASE DE DATOS**********/
GO
CREATE DATABASE [PISI]
GO
USE [PISI]
GO

/*********CREACION DE USUARIO, ROL Y PERMISOS**********/
GO
CREATE LOGIN PISI_LOGIN WITH PASSWORD = 'PISI2019@';
GO
CREATE USER PISI_USER for login PISI_LOGIN
GO
CREATE ROLE PISI_ROL
GO
GRANT DELETE, INSERT, SELECT, UPDATE, EXECUTE ON SCHEMA::dbo to PISI_ROL
GO
EXEC sp_addrolemember 'PISI_ROL', 'PISI_USER'
GO
/*==============================================================*/
/* DBMS name:      Microsoft SQL Server 2008                    */
/* Created on:     11/06/2019 17:33:17                          */
/*==============================================================*/


if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('TBC_ACTIVIDAD_INICIATIVA') and o.name = 'FK_ACTIVIDAD_PROYECTO_TIPO_INICIATIVA')
alter table TBC_ACTIVIDAD_INICIATIVA
   drop constraint FK_ACTIVIDAD_PROYECTO_TIPO_INICIATIVA
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('TBC_ACTIVIDAD_INICIATIVA') and o.name = 'FK_ACTIVIDAD_INICIATIVA_USUARIO1')
alter table TBC_ACTIVIDAD_INICIATIVA
   drop constraint FK_ACTIVIDAD_INICIATIVA_USUARIO1
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('TBC_ACTIVIDAD_INICIATIVA') and o.name = 'FK_ACTIVIDAD_INICIATIVA_USUARIO2')
alter table TBC_ACTIVIDAD_INICIATIVA
   drop constraint FK_ACTIVIDAD_INICIATIVA_USUARIO2
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('TBC_CAMPOS_INICIATIVA') and o.name = 'FK_TBC_CAMP_REFERENCE_TBC_TIPO')
alter table TBC_CAMPOS_INICIATIVA
   drop constraint FK_TBC_CAMP_REFERENCE_TBC_TIPO
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('TBC_DEPARTAMENTO') and o.name = 'FK_TBC_DEPA_REFERENCE_TB_USUA')
alter table TBC_DEPARTAMENTO
   drop constraint FK_TBC_DEPA_REFERENCE_TB_USUA
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('TBC_DEPARTAMENTO') and o.name = 'FK_TBC_DEPA_REFERENCE_TB_USUAR')
alter table TBC_DEPARTAMENTO
   drop constraint FK_TBC_DEPA_REFERENCE_TB_USUAR
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('TBC_MUNICIPIO') and o.name = 'FK_MUNICIPIO_DEPARTAMENTO')
alter table TBC_MUNICIPIO
   drop constraint FK_MUNICIPIO_DEPARTAMENTO
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('TB_ACTIVIDAD') and o.name = 'FK_ACTIVIDAD_USUARIO')
alter table TB_ACTIVIDAD
   drop constraint FK_ACTIVIDAD_USUARIO
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('TB_ACTIVIDAD') and o.name = 'FK_ACTIVIDAD_USUARIO1')
alter table TB_ACTIVIDAD
   drop constraint FK_ACTIVIDAD_USUARIO1
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('TB_ACTIVIDAD') and o.name = 'FK_TB_ACTIV_REFERENCE_TB_USUAR')
alter table TB_ACTIVIDAD
   drop constraint FK_TB_ACTIV_REFERENCE_TB_USUAR
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('TB_ASIGNACION') and o.name = 'FK_TB_ASIGN_ASIG_TB_PERSO_BENE')
alter table TB_ASIGNACION
   drop constraint FK_TB_ASIGN_ASIG_TB_PERSO_BENE
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('TB_ASIGNACION') and o.name = 'FK_TB_ASIGN_ASIGNACIO_TB_PERSO_CONSUL')
alter table TB_ASIGNACION
   drop constraint FK_TB_ASIGN_ASIGNACIO_TB_PERSO_CONSUL
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('TB_ASIG_CONSULTOR_VINCULACION') and o.name = 'FK_TB_ASIG__REFERENCE_TBC_MUNI')
alter table TB_ASIG_CONSULTOR_VINCULACION
   drop constraint FK_TB_ASIG__REFERENCE_TBC_MUNI
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('TB_ASIG_CONSULTOR_VINCULACION') and o.name = 'FK_TB_ASIG__REFERENCE_TBC_SECT')
alter table TB_ASIG_CONSULTOR_VINCULACION
   drop constraint FK_TB_ASIG__REFERENCE_TBC_SECT
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('TB_ASIG_CONSULTOR_VINCULACION') and o.name = 'FK_TB_ASIG__REFERENCE_TB_PERSO')
alter table TB_ASIG_CONSULTOR_VINCULACION
   drop constraint FK_TB_ASIG__REFERENCE_TB_PERSO
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('TB_BENEFICIARIO') and o.name = 'FK_BENEFICIARIO_ESTADO PROCESO')
alter table TB_BENEFICIARIO
   drop constraint "FK_BENEFICIARIO_ESTADO PROCESO"
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('TB_BENEFICIARIO') and o.name = 'FK_BENEFICIARIO_PERSONA')
alter table TB_BENEFICIARIO
   drop constraint FK_BENEFICIARIO_PERSONA
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('TB_BENEFICIARIO') and o.name = 'FK_BENEFICIARIO_SECTOR_ECONOMICA')
alter table TB_BENEFICIARIO
   drop constraint FK_BENEFICIARIO_SECTOR_ECONOMICA
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('TB_BENEFICIARIO') and o.name = 'FK_BENEFICIARIO_USUARIO1')
alter table TB_BENEFICIARIO
   drop constraint FK_BENEFICIARIO_USUARIO1
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('TB_BENEFICIARIO') and o.name = 'FK_BENEFICIARIO_USUARIO2')
alter table TB_BENEFICIARIO
   drop constraint FK_BENEFICIARIO_USUARIO2
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('TB_CONFIGURACION') and o.name = 'FK_TB_CONFI_REFERENCE_TB_USUAR')
alter table TB_CONFIGURACION
   drop constraint FK_TB_CONFI_REFERENCE_TB_USUAR
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('TB_DETALLE_INICIATIVA') and o.name = 'FK_TB_DETAL_REFERENCE_TB_PROYE')
alter table TB_DETALLE_INICIATIVA
   drop constraint FK_TB_DETAL_REFERENCE_TB_PROYE
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('TB_DETALLE_INICIATIVA') and o.name = 'FK_TB_DETAL_REFERENCE_TBC_CAMP')
alter table TB_DETALLE_INICIATIVA
   drop constraint FK_TB_DETAL_REFERENCE_TBC_CAMP
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('TB_DOCUMENTO') and o.name = 'FK_DOCUMENTO_BENEFICIARIO')
alter table TB_DOCUMENTO
   drop constraint FK_DOCUMENTO_BENEFICIARIO
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('TB_EJECUCION') and o.name = 'FK_EJECUCION_PROYECTO_ACTIVIDAD')
alter table TB_EJECUCION
   drop constraint FK_EJECUCION_PROYECTO_ACTIVIDAD
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('TB_NOTIFICACION') and o.name = 'FK_NOTIFICACION_USUARIO')
alter table TB_NOTIFICACION
   drop constraint FK_NOTIFICACION_USUARIO
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('TB_NOTIFICACION') and o.name = 'FK_TB_NOTIF_REFERENCE_TB_USUAR')
alter table TB_NOTIFICACION
   drop constraint FK_TB_NOTIF_REFERENCE_TB_USUAR
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('TB_NOTIFICACION') and o.name = 'FK_TB_NOTIF_REFERENCE_TBC_ESTA')
alter table TB_NOTIFICACION
   drop constraint FK_TB_NOTIF_REFERENCE_TBC_ESTA
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('TB_OBSERVACION') and o.name = 'FK_TB_OBSER_REFERENCE_TBC_ESTA')
alter table TB_OBSERVACION
   drop constraint FK_TB_OBSER_REFERENCE_TBC_ESTA
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('TB_PERMISO') and o.name = 'FK_PERMISO_RECURSO')
alter table TB_PERMISO
   drop constraint FK_PERMISO_RECURSO
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('TB_PERMISO') and o.name = 'FK_PERSMISO_ROL')
alter table TB_PERMISO
   drop constraint FK_PERSMISO_ROL
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('TB_PERMISO') and o.name = 'FK_PERMISO_USUARIO1')
alter table TB_PERMISO
   drop constraint FK_PERMISO_USUARIO1
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('TB_PERMISO') and o.name = 'FK_PERMISO_USUARIO2')
alter table TB_PERMISO
   drop constraint FK_PERMISO_USUARIO2
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('TB_PERSONA') and o.name = 'FK_PERSONA_MUNICIPIO')
alter table TB_PERSONA
   drop constraint FK_PERSONA_MUNICIPIO
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('TB_PERSONA') and o.name = 'FK_PERSONA_USUARIO1')
alter table TB_PERSONA
   drop constraint FK_PERSONA_USUARIO1
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('TB_PERSONA') and o.name = 'FK_PERSONA_USUARIO2')
alter table TB_PERSONA
   drop constraint FK_PERSONA_USUARIO2
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('TB_PROBLEMA') and o.name = 'FK_PROBLEMA_BENEFICIARIO')
alter table TB_PROBLEMA
   drop constraint FK_PROBLEMA_BENEFICIARIO
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('TB_PROBLEMA') and o.name = 'FK_PROBLEMA_ESTADO_PROCESO')
alter table TB_PROBLEMA
   drop constraint FK_PROBLEMA_ESTADO_PROCESO
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('TB_PROBLEMA') and o.name = 'FK_TB_PROBL_REFERENCE_TB_USUAR')
alter table TB_PROBLEMA
   drop constraint FK_TB_PROBL_REFERENCE_TB_USUAR
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('TB_PROPUESTA') and o.name = 'FK_PROPUESTA_ESTADO_PROCESO')
alter table TB_PROPUESTA
   drop constraint FK_PROPUESTA_ESTADO_PROCESO
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('TB_PROPUESTA') and o.name = 'FK_PROPUESTA_PROBLEMA')
alter table TB_PROPUESTA
   drop constraint FK_PROPUESTA_PROBLEMA
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('TB_PROPUESTA') and o.name = 'FK_PROPUESTA_TIPO_INICIATIVA')
alter table TB_PROPUESTA
   drop constraint FK_PROPUESTA_TIPO_INICIATIVA
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('TB_PROPUESTA') and o.name = 'FK_PROPUESTA_USUARIO')
alter table TB_PROPUESTA
   drop constraint FK_PROPUESTA_USUARIO
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('TB_PROPUESTA') and o.name = 'FK_USUARIO_CREA')
alter table TB_PROPUESTA
   drop constraint FK_USUARIO_CREA
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('TB_PROPUESTA') and o.name = 'FK_USUARIO_ACTUALIZA')
alter table TB_PROPUESTA
   drop constraint FK_USUARIO_ACTUALIZA
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('TB_PROYECTO') and o.name = 'FK_PROYECTO_PROBLEMA')
alter table TB_PROYECTO
   drop constraint FK_PROYECTO_PROBLEMA
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('TB_PROYECTO') and o.name = 'FK_PROYECTO_TIPO_INICIATIVA')
alter table TB_PROYECTO
   drop constraint FK_PROYECTO_TIPO_INICIATIVA
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('TB_PROYECTO') and o.name = 'FK_PROYECTO_USUARIO1')
alter table TB_PROYECTO
   drop constraint FK_PROYECTO_USUARIO1
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('TB_PROYECTO') and o.name = 'FK_PROYECTO_USUARIO2')
alter table TB_PROYECTO
   drop constraint FK_PROYECTO_USUARIO2
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('TB_PROYECTO') and o.name = 'FK_TB_PROYE_REFERENCE_TBC_ESTA')
alter table TB_PROYECTO
   drop constraint FK_TB_PROYE_REFERENCE_TBC_ESTA
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('TB_PROYECTO') and o.name = 'FK_TB_PROYE_REFERENCE_TB_PROPU')
alter table TB_PROYECTO
   drop constraint FK_TB_PROYE_REFERENCE_TB_PROPU
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('TB_PROYECTO_ACTIVIDAD') and o.name = 'FK_ACTIVIDAD_INICIATIVA_ACTIVIDAD_PROYECTO')
alter table TB_PROYECTO_ACTIVIDAD
   drop constraint FK_ACTIVIDAD_INICIATIVA_ACTIVIDAD_PROYECTO
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('TB_PROYECTO_ACTIVIDAD') and o.name = 'FK_PROYECTO_ACTIVIDAD_PROYECTO')
alter table TB_PROYECTO_ACTIVIDAD
   drop constraint FK_PROYECTO_ACTIVIDAD_PROYECTO
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('TB_PROYECTO_ACTIVIDAD') and o.name = 'FK_PROYECTO_ACTIVIDAD_USUARIO1')
alter table TB_PROYECTO_ACTIVIDAD
   drop constraint FK_PROYECTO_ACTIVIDAD_USUARIO1
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('TB_PROYECTO_ACTIVIDAD') and o.name = 'FK_PROYECTO_ACTIVIDAD_USUARIO2')
alter table TB_PROYECTO_ACTIVIDAD
   drop constraint FK_PROYECTO_ACTIVIDAD_USUARIO2
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('TB_RECURSO') and o.name = 'FK_RECURSO_USUARIO1')
alter table TB_RECURSO
   drop constraint FK_RECURSO_USUARIO1
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('TB_RECURSO') and o.name = 'FK_RECURSO_USUARIO2')
alter table TB_RECURSO
   drop constraint FK_RECURSO_USUARIO2
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('TB_ROL') and o.name = 'FK_ROL_USUARIO1')
alter table TB_ROL
   drop constraint FK_ROL_USUARIO1
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('TB_ROL') and o.name = 'FK_ROL_USUARIO2')
alter table TB_ROL
   drop constraint FK_ROL_USUARIO2
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('TB_SOLICITUD_SEGUIMIENTO') and o.name = 'FK_SOLICITUD_SEGUIMIENTO_USUARIO1')
alter table TB_SOLICITUD_SEGUIMIENTO
   drop constraint FK_SOLICITUD_SEGUIMIENTO_USUARIO1
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('TB_SOLICITUD_SEGUIMIENTO') and o.name = 'FK_SOLICITUD_SEGUIMIENTO_USUARIO2')
alter table TB_SOLICITUD_SEGUIMIENTO
   drop constraint FK_SOLICITUD_SEGUIMIENTO_USUARIO2
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('TB_SOLICITUD_SEGUIMIENTO') and o.name = 'FK_SOLICITUD_SEGUIMIENTO_PROYECTO')
alter table TB_SOLICITUD_SEGUIMIENTO
   drop constraint FK_SOLICITUD_SEGUIMIENTO_PROYECTO
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('TB_USUARIO') and o.name = 'FK_USUARIO_PERSONA')
alter table TB_USUARIO
   drop constraint FK_USUARIO_PERSONA
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('TB_USUARIO') and o.name = 'FK_USUARIO_ROL')
alter table TB_USUARIO
   drop constraint FK_USUARIO_ROL
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('TB_USUARIO') and o.name = 'FK_USUARIO_USUARIO1')
alter table TB_USUARIO
   drop constraint FK_USUARIO_USUARIO1
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('TB_USUARIO') and o.name = 'FK_USUARIO_USUARIO2')
alter table TB_USUARIO
   drop constraint FK_USUARIO_USUARIO2
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('TBC_ACTIVIDAD_INICIATIVA')
            and   name  = 'IDXPK_ID_ACTIVIDAD_INICIATIVA'
            and   indid > 0
            and   indid < 255)
   drop index TBC_ACTIVIDAD_INICIATIVA.IDXPK_ID_ACTIVIDAD_INICIATIVA
go

if exists (select 1
            from  sysobjects
           where  id = object_id('TBC_ACTIVIDAD_INICIATIVA')
            and   type = 'U')
   drop table TBC_ACTIVIDAD_INICIATIVA
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('TBC_CAMPOS_INICIATIVA')
            and   name  = 'INDEX_1'
            and   indid > 0
            and   indid < 255)
   drop index TBC_CAMPOS_INICIATIVA.INDEX_1
go

if exists (select 1
            from  sysobjects
           where  id = object_id('TBC_CAMPOS_INICIATIVA')
            and   type = 'U')
   drop table TBC_CAMPOS_INICIATIVA
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('TBC_DEPARTAMENTO')
            and   name  = 'IDXPK_ID_DEPARTAMENTO'
            and   indid > 0
            and   indid < 255)
   drop index TBC_DEPARTAMENTO.IDXPK_ID_DEPARTAMENTO
go

if exists (select 1
            from  sysobjects
           where  id = object_id('TBC_DEPARTAMENTO')
            and   type = 'U')
   drop table TBC_DEPARTAMENTO
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('TBC_ESTADO_PROCESO')
            and   name  = 'IDX_CODIGO_ESTADO_PROCESO'
            and   indid > 0
            and   indid < 255)
   drop index TBC_ESTADO_PROCESO.IDX_CODIGO_ESTADO_PROCESO
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('TBC_ESTADO_PROCESO')
            and   name  = 'IDXPK_ID_ESTADO_PROCESO'
            and   indid > 0
            and   indid < 255)
   drop index TBC_ESTADO_PROCESO.IDXPK_ID_ESTADO_PROCESO
go

if exists (select 1
            from  sysobjects
           where  id = object_id('TBC_ESTADO_PROCESO')
            and   type = 'U')
   drop table TBC_ESTADO_PROCESO
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('TBC_MUNICIPIO')
            and   name  = 'IDXFK_ID_DEPARTAMENTO'
            and   indid > 0
            and   indid < 255)
   drop index TBC_MUNICIPIO.IDXFK_ID_DEPARTAMENTO
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('TBC_MUNICIPIO')
            and   name  = 'IDXPK_ID_MUNICIPIO'
            and   indid > 0
            and   indid < 255)
   drop index TBC_MUNICIPIO.IDXPK_ID_MUNICIPIO
go

if exists (select 1
            from  sysobjects
           where  id = object_id('TBC_MUNICIPIO')
            and   type = 'U')
   drop table TBC_MUNICIPIO
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('TBC_SECTOR_ECONOMICO')
            and   name  = 'IDXPK_ID_SECTOR_ECONOMICO'
            and   indid > 0
            and   indid < 255)
   drop index TBC_SECTOR_ECONOMICO.IDXPK_ID_SECTOR_ECONOMICO
go

if exists (select 1
            from  sysobjects
           where  id = object_id('TBC_SECTOR_ECONOMICO')
            and   type = 'U')
   drop table TBC_SECTOR_ECONOMICO
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('TBC_TIPO_INICIATIVA')
            and   name  = 'IDXPK_ID_TIPO_INICIATIVA'
            and   indid > 0
            and   indid < 255)
   drop index TBC_TIPO_INICIATIVA.IDXPK_ID_TIPO_INICIATIVA
go

if exists (select 1
            from  sysobjects
           where  id = object_id('TBC_TIPO_INICIATIVA')
            and   type = 'U')
   drop table TBC_TIPO_INICIATIVA
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('TB_ACTIVIDAD')
            and   name  = 'IDXPK_ID_ACTIVIDAD'
            and   indid > 0
            and   indid < 255)
   drop index TB_ACTIVIDAD.IDXPK_ID_ACTIVIDAD
go

if exists (select 1
            from  sysobjects
           where  id = object_id('TB_ACTIVIDAD')
            and   type = 'U')
   drop table TB_ACTIVIDAD
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('TB_ASIGNACION')
            and   name  = 'IDXPK_ID_PERSONA_CONSULTOR'
            and   indid > 0
            and   indid < 255)
   drop index TB_ASIGNACION.IDXPK_ID_PERSONA_CONSULTOR
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('TB_ASIGNACION')
            and   name  = 'IDXPK_ID_PERSONA_BENEFICIARIO'
            and   indid > 0
            and   indid < 255)
   drop index TB_ASIGNACION.IDXPK_ID_PERSONA_BENEFICIARIO
go

if exists (select 1
            from  sysobjects
           where  id = object_id('TB_ASIGNACION')
            and   type = 'U')
   drop table TB_ASIGNACION
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('TB_ASIG_CONSULTOR_VINCULACION')
            and   name  = 'IDXFK_ID_MUNICIPIO'
            and   indid > 0
            and   indid < 255)
   drop index TB_ASIG_CONSULTOR_VINCULACION.IDXFK_ID_MUNICIPIO
go

if exists (select 1
            from  sysobjects
           where  id = object_id('TB_ASIG_CONSULTOR_VINCULACION')
            and   type = 'U')
   drop table TB_ASIG_CONSULTOR_VINCULACION
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('TB_BENEFICIARIO')
            and   name  = 'IDXFK_ID_PERSONA'
            and   indid > 0
            and   indid < 255)
   drop index TB_BENEFICIARIO.IDXFK_ID_PERSONA
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('TB_BENEFICIARIO')
            and   name  = 'IDXFK_ID_ESTADO_PROCESO'
            and   indid > 0
            and   indid < 255)
   drop index TB_BENEFICIARIO.IDXFK_ID_ESTADO_PROCESO
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('TB_BENEFICIARIO')
            and   name  = 'IDXPK_ID_BENEFICIARIO'
            and   indid > 0
            and   indid < 255)
   drop index TB_BENEFICIARIO.IDXPK_ID_BENEFICIARIO
go

if exists (select 1
            from  sysobjects
           where  id = object_id('TB_BENEFICIARIO')
            and   type = 'U')
   drop table TB_BENEFICIARIO
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('TB_CONFIGURACION')
            and   name  = 'INDEX_1'
            and   indid > 0
            and   indid < 255)
   drop index TB_CONFIGURACION.INDEX_1
go

if exists (select 1
            from  sysobjects
           where  id = object_id('TB_CONFIGURACION')
            and   type = 'U')
   drop table TB_CONFIGURACION
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('TB_DETALLE_INICIATIVA')
            and   name  = 'INDEX_1'
            and   indid > 0
            and   indid < 255)
   drop index TB_DETALLE_INICIATIVA.INDEX_1
go

if exists (select 1
            from  sysobjects
           where  id = object_id('TB_DETALLE_INICIATIVA')
            and   type = 'U')
   drop table TB_DETALLE_INICIATIVA
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('TB_DOCUMENTO')
            and   name  = 'IDXPK_ID_DOCUMENTO'
            and   indid > 0
            and   indid < 255)
   drop index TB_DOCUMENTO.IDXPK_ID_DOCUMENTO
go

if exists (select 1
            from  sysobjects
           where  id = object_id('TB_DOCUMENTO')
            and   type = 'U')
   drop table TB_DOCUMENTO
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('TB_EJECUCION')
            and   name  = 'IDXPK_ID_EJECUCION'
            and   indid > 0
            and   indid < 255)
   drop index TB_EJECUCION.IDXPK_ID_EJECUCION
go

if exists (select 1
            from  sysobjects
           where  id = object_id('TB_EJECUCION')
            and   type = 'U')
   drop table TB_EJECUCION
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('TB_NOTIFICACION')
            and   name  = 'IDXFK_ID_USUARIO'
            and   indid > 0
            and   indid < 255)
   drop index TB_NOTIFICACION.IDXFK_ID_USUARIO
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('TB_NOTIFICACION')
            and   name  = 'IDX_LEIDO'
            and   indid > 0
            and   indid < 255)
   drop index TB_NOTIFICACION.IDX_LEIDO
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('TB_NOTIFICACION')
            and   name  = 'IDXPK_ID_NOTIFICACION'
            and   indid > 0
            and   indid < 255)
   drop index TB_NOTIFICACION.IDXPK_ID_NOTIFICACION
go

if exists (select 1
            from  sysobjects
           where  id = object_id('TB_NOTIFICACION')
            and   type = 'U')
   drop table TB_NOTIFICACION
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('TB_OBSERVACION')
            and   name  = 'INDX_ENTIDAD'
            and   indid > 0
            and   indid < 255)
   drop index TB_OBSERVACION.INDX_ENTIDAD
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('TB_OBSERVACION')
            and   name  = 'INDX_ID'
            and   indid > 0
            and   indid < 255)
   drop index TB_OBSERVACION.INDX_ID
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('TB_OBSERVACION')
            and   name  = 'INDX_ID_ESTADO_PROCESO'
            and   indid > 0
            and   indid < 255)
   drop index TB_OBSERVACION.INDX_ID_ESTADO_PROCESO
go

if exists (select 1
            from  sysobjects
           where  id = object_id('TB_OBSERVACION')
            and   type = 'U')
   drop table TB_OBSERVACION
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('TB_PERMISO')
            and   name  = 'IDX_FECHA_BORRADO'
            and   indid > 0
            and   indid < 255)
   drop index TB_PERMISO.IDX_FECHA_BORRADO
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('TB_PERMISO')
            and   name  = 'IDXPK_ID_ROL_ID_RECURSO'
            and   indid > 0
            and   indid < 255)
   drop index TB_PERMISO.IDXPK_ID_ROL_ID_RECURSO
go

if exists (select 1
            from  sysobjects
           where  id = object_id('TB_PERMISO')
            and   type = 'U')
   drop table TB_PERMISO
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('TB_PERSONA')
            and   name  = 'IDXFK_ID_MUNICIPIO'
            and   indid > 0
            and   indid < 255)
   drop index TB_PERSONA.IDXFK_ID_MUNICIPIO
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('TB_PERSONA')
            and   name  = 'IDX_FECHA_BORRADO'
            and   indid > 0
            and   indid < 255)
   drop index TB_PERSONA.IDX_FECHA_BORRADO
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('TB_PERSONA')
            and   name  = 'IDX_CORREO_E'
            and   indid > 0
            and   indid < 255)
   drop index TB_PERSONA.IDX_CORREO_E
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('TB_PERSONA')
            and   name  = 'IDXPK_ID_PERSONA'
            and   indid > 0
            and   indid < 255)
   drop index TB_PERSONA.IDXPK_ID_PERSONA
go

if exists (select 1
            from  sysobjects
           where  id = object_id('TB_PERSONA')
            and   type = 'U')
   drop table TB_PERSONA
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('TB_PROBLEMA')
            and   name  = 'IDXPK_ID_PROBLEMA'
            and   indid > 0
            and   indid < 255)
   drop index TB_PROBLEMA.IDXPK_ID_PROBLEMA
go

if exists (select 1
            from  sysobjects
           where  id = object_id('TB_PROBLEMA')
            and   type = 'U')
   drop table TB_PROBLEMA
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('TB_PROPUESTA')
            and   name  = 'IDXPK_ID_PROPUESTA'
            and   indid > 0
            and   indid < 255)
   drop index TB_PROPUESTA.IDXPK_ID_PROPUESTA
go

if exists (select 1
            from  sysobjects
           where  id = object_id('TB_PROPUESTA')
            and   type = 'U')
   drop table TB_PROPUESTA
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('TB_PROYECTO')
            and   name  = 'IDXPK_ID_PROYECTO'
            and   indid > 0
            and   indid < 255)
   drop index TB_PROYECTO.IDXPK_ID_PROYECTO
go

if exists (select 1
            from  sysobjects
           where  id = object_id('TB_PROYECTO')
            and   type = 'U')
   drop table TB_PROYECTO
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('TB_PROYECTO_ACTIVIDAD')
            and   name  = 'IDXPK_ID_PROYECTO_ACTIVIDAD'
            and   indid > 0
            and   indid < 255)
   drop index TB_PROYECTO_ACTIVIDAD.IDXPK_ID_PROYECTO_ACTIVIDAD
go

if exists (select 1
            from  sysobjects
           where  id = object_id('TB_PROYECTO_ACTIVIDAD')
            and   type = 'U')
   drop table TB_PROYECTO_ACTIVIDAD
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('TB_RECURSO')
            and   name  = 'IDX_URL_RECURSO'
            and   indid > 0
            and   indid < 255)
   drop index TB_RECURSO.IDX_URL_RECURSO
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('TB_RECURSO')
            and   name  = 'IDX_FECHA_BORRADO'
            and   indid > 0
            and   indid < 255)
   drop index TB_RECURSO.IDX_FECHA_BORRADO
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('TB_RECURSO')
            and   name  = 'IDXPK_ID_RECURSO'
            and   indid > 0
            and   indid < 255)
   drop index TB_RECURSO.IDXPK_ID_RECURSO
go

if exists (select 1
            from  sysobjects
           where  id = object_id('TB_RECURSO')
            and   type = 'U')
   drop table TB_RECURSO
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('TB_ROL')
            and   name  = 'IDX_FECHA_BORRADO'
            and   indid > 0
            and   indid < 255)
   drop index TB_ROL.IDX_FECHA_BORRADO
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('TB_ROL')
            and   name  = 'IDX_NOMBRE'
            and   indid > 0
            and   indid < 255)
   drop index TB_ROL.IDX_NOMBRE
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('TB_ROL')
            and   name  = 'IDXPK_ID_ROL'
            and   indid > 0
            and   indid < 255)
   drop index TB_ROL.IDXPK_ID_ROL
go

if exists (select 1
            from  sysobjects
           where  id = object_id('TB_ROL')
            and   type = 'U')
   drop table TB_ROL
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('TB_SOLICITUD_SEGUIMIENTO')
            and   name  = 'IDXPK_ID_SOLICITUD_SEGUIMIENTO'
            and   indid > 0
            and   indid < 255)
   drop index TB_SOLICITUD_SEGUIMIENTO.IDXPK_ID_SOLICITUD_SEGUIMIENTO
go

if exists (select 1
            from  sysobjects
           where  id = object_id('TB_SOLICITUD_SEGUIMIENTO')
            and   type = 'U')
   drop table TB_SOLICITUD_SEGUIMIENTO
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('TB_USUARIO')
            and   name  = 'IDXFK_ID_ROL'
            and   indid > 0
            and   indid < 255)
   drop index TB_USUARIO.IDXFK_ID_ROL
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('TB_USUARIO')
            and   name  = 'IDXFK_ID_PERSONA'
            and   indid > 0
            and   indid < 255)
   drop index TB_USUARIO.IDXFK_ID_PERSONA
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('TB_USUARIO')
            and   name  = 'IDX_FECHA_BORRADO'
            and   indid > 0
            and   indid < 255)
   drop index TB_USUARIO.IDX_FECHA_BORRADO
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('TB_USUARIO')
            and   name  = 'IDXPK_ID_USUARIO'
            and   indid > 0
            and   indid < 255)
   drop index TB_USUARIO.IDXPK_ID_USUARIO
go

if exists (select 1
            from  sysobjects
           where  id = object_id('TB_USUARIO')
            and   type = 'U')
   drop table TB_USUARIO
go

/*==============================================================*/
/* Table: TBC_ACTIVIDAD_INICIATIVA                              */
/*==============================================================*/
create table TBC_ACTIVIDAD_INICIATIVA (
   ID_ACTIVIDAD_INICIATIVA int                  identity,
   ID_TIPO_INICIATIVA   int                  not null,
   USUARIO_CREA         int                  null,
   USUARIO_ACTUALIZA    int                  null,
   COD_ACTIVIDAD_PROY   char(4)              not null,
   DESCRIPCION          varchar(4096)        not null,
   FECHA_CREA           datetime             null,
   FECHA_ACTUALIZA      datetime             null,
   FECHA_BORRADO        datetime             null,
   constraint PK_TBC_ACTIVIDAD_INICIATIVA primary key (ID_ACTIVIDAD_INICIATIVA)
)
go

/*==============================================================*/
/* Index: IDXPK_ID_ACTIVIDAD_INICIATIVA                         */
/*==============================================================*/
create index IDXPK_ID_ACTIVIDAD_INICIATIVA on TBC_ACTIVIDAD_INICIATIVA (
ID_ACTIVIDAD_INICIATIVA ASC
)
go

/*==============================================================*/
/* Table: TBC_CAMPOS_INICIATIVA                                 */
/*==============================================================*/
CREATE TABLE [dbo].[TBC_CAMPOS_INICIATIVA](
	[ID_CAMPO] [int] IDENTITY(1,1) NOT NULL,
	[ID_TIPO_INICIATIVA] [int] NULL,
	[NOMBRE_CAMPO] [varchar](150) NULL,
	[USUARIO_CREA] [int] NULL,
	[USUARIO_ACTUALIZA] [int] NULL,
	[FECHA_CREA] [datetime] NULL,
	[FECHA_ACTUALIZA] [datetime] NULL,
	[FECHA_BORRADO] [datetime] NULL,
 CONSTRAINT [PK_TBC_CAMPOS_INICIATIVA] PRIMARY KEY CLUSTERED 
(
	[ID_CAMPO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
go

/*==============================================================*/
/* Index: INDEX_1                                               */
/*==============================================================*/
create index INDEX_1 on TBC_CAMPOS_INICIATIVA (
ID_CAMPO ASC
)
go

/*==============================================================*/
/* Table: TBC_DEPARTAMENTO                                      */
/*==============================================================*/
create table TBC_DEPARTAMENTO (
   ID_DEPARTAMENTO      int                  identity,
   ID_USUARIO_CREA      int                  null,
   ID_USUARIO_ACTUALIZA int                  null,
   COD_DEPARTAMENTO     char(2)              not null,
   NOMBRE_DEPTO         varchar(16)          not null,
   FECHA_CREA           datetime             null,
   FECHA_ACTUALIZA      datetime             null,
   FECHA_BORRADO        datetime             null,
   constraint PK_TBC_DEPARTAMENTO primary key (ID_DEPARTAMENTO)
)
go

/*==============================================================*/
/* Index: IDXPK_ID_DEPARTAMENTO                                 */
/*==============================================================*/
create index IDXPK_ID_DEPARTAMENTO on TBC_DEPARTAMENTO (
ID_DEPARTAMENTO ASC
)
go

/*==============================================================*/
/* Table: TBC_ESTADO_PROCESO                                    */
/*==============================================================*/
CREATE TABLE [dbo].[TBC_ESTADO_PROCESO](
	[ID_ESTADO_PROCESO] [int] IDENTITY(1,1) NOT NULL,
	[CODIGO_ESTADO_PROCESO] [varchar](6) NOT NULL,
	[DESCRIPCION_ESTADO_PROCESO] [varchar](64) NOT NULL,
	[ICONO_ESTADO_PROCESO] [varchar](50) NULL,
	[COLOR_ESTADO_PROCESO] [varchar](50) NULL,
	[USUARIO_CREA] [int] NULL,
	[USUARIO_ACTUALIZA] [int] NULL,
	[FECHA_CREA] [datetime] NULL,
	[FECHA_ACTUALIZA] [datetime] NULL,
	[FECHA_BORRADO] [datetime] NULL,
 CONSTRAINT [PK_TBC_ESTADO_PROCESO] PRIMARY KEY CLUSTERED 
(
	[ID_ESTADO_PROCESO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
go

/*==============================================================*/
/* Index: IDXPK_ID_ESTADO_PROCESO                               */
/*==============================================================*/
create index IDXPK_ID_ESTADO_PROCESO on TBC_ESTADO_PROCESO (
ID_ESTADO_PROCESO ASC
)
go

/*==============================================================*/
/* Index: IDX_CODIGO_ESTADO_PROCESO                             */
/*==============================================================*/
create index IDX_CODIGO_ESTADO_PROCESO on TBC_ESTADO_PROCESO (
CODIGO_ESTADO_PROCESO ASC
)
go

/*==============================================================*/
/* Table: TBC_MUNICIPIO                                         */
/*==============================================================*/
CREATE TABLE [dbo].[TBC_MUNICIPIO](
	[ID_MUNICIPIO] [int] IDENTITY(1,1) NOT NULL,
	[ID_DEPARTAMENTO] [int] NULL,
	[COD_MUNICIPIO] [char](4) NOT NULL,
	[NOMBRE_MUNIC] [varchar](32) NOT NULL,
	[USUARIO_CREA] [int] NULL,
	[USUARIO_ACTUALIZA] [int] NULL,
	[FECHA_CREA] [datetime] NULL,
	[FECHA_ACTUALIZA] [datetime] NULL,
	[FECHA_BORRADO] [datetime] NULL,
 CONSTRAINT [PK_TBC_MUNICIPIO] PRIMARY KEY CLUSTERED 
(
	[ID_MUNICIPIO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
go

/*==============================================================*/
/* Index: IDXPK_ID_MUNICIPIO                                    */
/*==============================================================*/
create index IDXPK_ID_MUNICIPIO on TBC_MUNICIPIO (
ID_MUNICIPIO ASC
)
go

/*==============================================================*/
/* Index: IDXFK_ID_DEPARTAMENTO                                 */
/*==============================================================*/
create index IDXFK_ID_DEPARTAMENTO on TBC_MUNICIPIO (
ID_DEPARTAMENTO ASC
)
go

/*==============================================================*/
/* Table: TBC_SECTOR_ECONOMICO                                  */
/*==============================================================*/
CREATE TABLE [dbo].[TBC_SECTOR_ECONOMICO](
	[ID_SECTOR_ECONOMICO] [int] IDENTITY(1,1) NOT NULL,
	[COD_SECTOR_ECONOMICO] [char](6) NOT NULL,
	[NOMBRE_SECTOR] [varchar](16) NOT NULL,
	[USUARIO_CREA] [int] NULL,
	[USUARIO_ACTUALIZA] [int] NULL,
	[FECHA_CREA] [datetime] NULL,
	[FECHA_ACTUALIZA] [datetime] NULL,
	[FECHA_BORRADO] [datetime] NULL,
 CONSTRAINT [PK_TBC_SECTOR_ECONOMICO] PRIMARY KEY CLUSTERED 
(
	[ID_SECTOR_ECONOMICO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
go

/*==============================================================*/
/* Index: IDXPK_ID_SECTOR_ECONOMICO                             */
/*==============================================================*/
create index IDXPK_ID_SECTOR_ECONOMICO on TBC_SECTOR_ECONOMICO (
ID_SECTOR_ECONOMICO ASC
)
go

/*==============================================================*/
/* Table: TBC_TIPO_INICIATIVA                                   */
/*==============================================================*/
CREATE TABLE [dbo].[TBC_TIPO_INICIATIVA](
	[ID_TIPO_INICIATIVA] [int] IDENTITY(1,1) NOT NULL,
	[NOMBRE] [varchar](32) NOT NULL,
	[CODIGO_TIPO_INICIATVA] [varchar](5) NOT NULL,
	[USUARIO_CREA] [int] NULL,
	[USUARIO_ACTUALIZA] [int] NULL,
	[FECHA_CREA] [datetime] NULL,
	[FECHA_ACTUALIZA] [datetime] NULL,
	[FECHA_BORRADO] [datetime] NULL,
 CONSTRAINT [PK_TBC_TIPO_INICIATIVA] PRIMARY KEY CLUSTERED 
(
	[ID_TIPO_INICIATIVA] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
go

/*==============================================================*/
/* Index: IDXPK_ID_TIPO_INICIATIVA                              */
/*==============================================================*/
create index IDXPK_ID_TIPO_INICIATIVA on TBC_TIPO_INICIATIVA (
ID_TIPO_INICIATIVA ASC
)
go

/*==============================================================*/
/* Table: TB_ACTIVIDAD                                          */
/*==============================================================*/
create table TB_ACTIVIDAD (
   ID_ACTIVIDAD         int                  identity,
   ID_USUARIO_CONSULTOR int                  null,
   USUARIO_CREA         int                  null,
   ID_USUARIO_BENEFICIARIO int                  null,
   FECHA                datetime             not null,
   HORA                 datetime             not null,
   DIRECCION            varchar(1024)        null,
   DESCRIPCION          varchar(2048)        null,
   FECHA_CREA           datetime             null,
   FECHA_ACTUALIZA      datetime             null,
   FECHA_BORRADO        datetime             null,
   constraint PK_TB_ACTIVIDAD primary key (ID_ACTIVIDAD)
)
go

/*==============================================================*/
/* Index: IDXPK_ID_ACTIVIDAD                                    */
/*==============================================================*/
create index IDXPK_ID_ACTIVIDAD on TB_ACTIVIDAD (
ID_ACTIVIDAD ASC
)
go

/*==============================================================*/
/* Table: TB_ASIGNACION                                         */
/*==============================================================*/
create table TB_ASIGNACION (
   ID_PERSONA_BENEFICIARIO int                  not null,
   ID_PERSONA_CONSULTOR int                  not null,
   FECHA_ASIGNACION     datetime             null,
   constraint PK_TB_ASIGNACION primary key (ID_PERSONA_BENEFICIARIO, ID_PERSONA_CONSULTOR)
)
go

/*==============================================================*/
/* Index: IDXPK_ID_PERSONA_BENEFICIARIO                         */
/*==============================================================*/
create index IDXPK_ID_PERSONA_BENEFICIARIO on TB_ASIGNACION (
ID_PERSONA_BENEFICIARIO ASC
)
go

/*==============================================================*/
/* Index: IDXPK_ID_PERSONA_CONSULTOR                            */
/*==============================================================*/
create index IDXPK_ID_PERSONA_CONSULTOR on TB_ASIGNACION (
ID_PERSONA_CONSULTOR ASC
)
go

/*==============================================================*/
/* Table: TB_ASIG_CONSULTOR_VINCULACION                         */
/*==============================================================*/
create table TB_ASIG_CONSULTOR_VINCULACION (
   ID_ASIG_CONSULTOR_VINCULACION int                  identity,
   ID_MUNICIPIO         int                  null,
   ID_SECTOR_ECONOMICO  int                  null,
   ID_PERSONA           int                  null,
   constraint PK_TB_ASIG_CONSULTOR_VINCULACI primary key (ID_ASIG_CONSULTOR_VINCULACION)
)
go

/*==============================================================*/
/* Index: IDXFK_ID_MUNICIPIO                                    */
/*==============================================================*/
create index IDXFK_ID_MUNICIPIO on TB_ASIG_CONSULTOR_VINCULACION (
ID_MUNICIPIO ASC
)
go

/*==============================================================*/
/* Table: TB_BENEFICIARIO                                       */
/*==============================================================*/
create table TB_BENEFICIARIO (
   ID_BENEFICIARIO      int                  identity,
   ID_SECTOR_ECONOMICO  int                  null,
   ID_PERSONA           int                  null,
   ID_ESTADO_PROCESO    int                  null,
   USUARIO_CREA         int                  null,
   USUARIO_ACTUALIZA    int                  null,
   CODIGO_BENEFICIARIO  varchar(25)          not null,
   TIPO_PERSONA         smallint             not null default 0,
   DUI                  char(10)             not null,
   NIT                  char(14)             not null,
   LAT                  char(12)        null,
   LONG                 char(12)        null,
   FECHA_CREA           datetime             null,
   FECHA_ACTUALIZA      datetime             null,
   FECHA_BORRADO        datetime             null,
   EXISTEN_ACTIVOS      bit                  null,
   MAS_ANIOS_EN_LUGAR   bit                  null,
   PUEDE_COMPROBAR_VENTAS bit                  null,
   MEDIO_CONTACTO       varchar(25)          null,
   INFO_COMPLEMENTARIA  varchar(200)         null,
   constraint PK_TB_BENEFICIARIO primary key (ID_BENEFICIARIO)
)
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('TB_BENEFICIARIO')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'TIPO_PERSONA')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'TB_BENEFICIARIO', 'column', 'TIPO_PERSONA'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '0 PARA PERSONAS NATURALES
   1 PARA PERSONAS JURIDICAS',
   'user', @CurrentUser, 'table', 'TB_BENEFICIARIO', 'column', 'TIPO_PERSONA'
go

/*==============================================================*/
/* Index: IDXPK_ID_BENEFICIARIO                                 */
/*==============================================================*/
create index IDXPK_ID_BENEFICIARIO on TB_BENEFICIARIO (
ID_BENEFICIARIO ASC
)
go

/*==============================================================*/
/* Index: IDXFK_ID_ESTADO_PROCESO                               */
/*==============================================================*/
create index IDXFK_ID_ESTADO_PROCESO on TB_BENEFICIARIO (
ID_ESTADO_PROCESO ASC
)
go

/*==============================================================*/
/* Index: IDXFK_ID_PERSONA                                      */
/*==============================================================*/
create index IDXFK_ID_PERSONA on TB_BENEFICIARIO (
ID_PERSONA ASC
)
go

/*==============================================================*/
/* Table: TB_CONFIGURACION                                      */
/*==============================================================*/
create table TB_CONFIGURACION (
   ID_CONFIGURACION     int                  identity,
   ID_USUARIO           int                  null,
   PARAMETRO            varchar(50)          not null,
   VALOR                varchar(50)          not null,
   CODIGO_CONFIGURACION varchar(50)          null,
   FECHA_CREA           datetime             null,
   FECHA_ACTUALIZA      datetime             null,
   FECHA_ELIMINA        timestamp            null,
   constraint PK_TB_CONFIGURACION primary key (ID_CONFIGURACION)
)
go

/*==============================================================*/
/* Index: INDEX_1                                               */
/*==============================================================*/
create index INDEX_1 on TB_CONFIGURACION (
ID_CONFIGURACION ASC
)
go

/*==============================================================*/
/* Table: TB_DETALLE_INICIATIVA                                 */
/*==============================================================*/
create table TB_DETALLE_INICIATIVA (
   ID_PROYECTO          int                  null,
   ID_CAMPO             int                  null,
   VALOR                text                 null,
   ID_DETALLE_INICIATIVA int                  identity,
   constraint PK_TB_DETALLE_INICIATIVA primary key (ID_DETALLE_INICIATIVA)
)
go

/*==============================================================*/
/* Index: INDEX_1                                               */
/*==============================================================*/
create index INDEX_1 on TB_DETALLE_INICIATIVA (
ID_DETALLE_INICIATIVA ASC
)
go

/*==============================================================*/
/* Table: TB_DOCUMENTO                                          */
/*==============================================================*/
create table TB_DOCUMENTO (
   ID_DOCUMENTO         int                  identity,
   ID_BENEFICIARIO      int                  not null,
   DIRECCION            varchar(2048)        not null,
   FECHA_CREA           datetime             null,
   FECHA_ACTUALIZA      datetime             null,
   FECHA_BORRADO        datetime             null,
   NOMBRE_DOCUMENTO     varchar(100)         null,
   constraint PK_TB_DOCUMENTO primary key (ID_DOCUMENTO)
)
go

/*==============================================================*/
/* Index: IDXPK_ID_DOCUMENTO                                    */
/*==============================================================*/
create index IDXPK_ID_DOCUMENTO on TB_DOCUMENTO (
ID_DOCUMENTO ASC
)
go

/*==============================================================*/
/* Table: TB_EJECUCION                                          */
/*==============================================================*/
create table TB_EJECUCION (
   ID_EJECUCION         int                  identity,
   ID_PROYECTO_ACTIVIDAD int                  not null,
   DESCRIPCION          varchar(4096)        not null,
   MONTO_EJECUTADO		decimal(18,2)		not null,
   FECHA                datetime             not null default getdate(),
   SEMANA_INICIO        datetime             not null,
   SEMANA_FIN           datetime             not null
   constraint PK_TB_EJECUCION primary key (ID_EJECUCION)
)
go

/*==============================================================*/
/* Index: IDXPK_ID_EJECUCION                                    */
/*==============================================================*/
create index IDXPK_ID_EJECUCION on TB_EJECUCION (
ID_EJECUCION ASC
)
go

/*==============================================================*/
/* Table: TB_NOTIFICACION                                       */
/*==============================================================*/
create table TB_NOTIFICACION (
   ID_NOTIFICACION      int                  identity,
   ID_USUARIO           int                  null,
   USUARIO_CREA         int                  null,
   ID_ESTADO_PROCESO    int                  null,
   LEIDO                smallint             not null default 0,
   FECHA_CREA           datetime             null,
   constraint PK_TB_NOTIFICACION primary key (ID_NOTIFICACION)
)
go

/*==============================================================*/
/* Index: IDXPK_ID_NOTIFICACION                                 */
/*==============================================================*/
create index IDXPK_ID_NOTIFICACION on TB_NOTIFICACION (
ID_NOTIFICACION ASC
)
go

/*==============================================================*/
/* Index: IDX_LEIDO                                             */
/*==============================================================*/
create index IDX_LEIDO on TB_NOTIFICACION (
LEIDO ASC
)
go

/*==============================================================*/
/* Index: IDXFK_ID_USUARIO                                      */
/*==============================================================*/
create index IDXFK_ID_USUARIO on TB_NOTIFICACION (
ID_USUARIO ASC
)
go

/*==============================================================*/
/* Table: TB_OBSERVACION                                        */
/*==============================================================*/
create table TB_OBSERVACION (
   ID_OBSERVACION       int                  identity,
   ID_ESTADO_PROCESO    int                  not null,
   DESCRIPCION          varchar(4096)        not null,
   ENTIDAD              varchar(128)         not null,
   ID                   int                  not null,
   FECHA                datetime             not null,
   RESUELTO             smallint             not null default 1,
   constraint PK_TB_OBSERVACION primary key nonclustered (ID_OBSERVACION)
)
go

/*==============================================================*/
/* Index: INDX_ID_ESTADO_PROCESO                                */
/*==============================================================*/
create index INDX_ID_ESTADO_PROCESO on TB_OBSERVACION (
ID_ESTADO_PROCESO ASC
)
go

/*==============================================================*/
/* Index: INDX_ID                                               */
/*==============================================================*/
create index INDX_ID on TB_OBSERVACION (
ID ASC
)
go

/*==============================================================*/
/* Index: INDX_ENTIDAD                                          */
/*==============================================================*/
create index INDX_ENTIDAD on TB_OBSERVACION (
ENTIDAD ASC
)
go

/*==============================================================*/
/* Table: TB_PERMISO                                            */
/*==============================================================*/
create table TB_PERMISO (
   ID_ROL               int                  not null,
   ID_RECURSO           int                  not null,
   USUARIO_CREA         int                  null,
   USUARIO_ACTUALIZA    int                  null,
   FECHA_CREA           datetime             null,
   FECHA_ACTUALIZA      datetime             null,
   FECHA_BORRADO        datetime             null,
   constraint PK_TB_PERMISO primary key (ID_ROL, ID_RECURSO)
)
go

/*==============================================================*/
/* Index: IDXPK_ID_ROL_ID_RECURSO                               */
/*==============================================================*/
create index IDXPK_ID_ROL_ID_RECURSO on TB_PERMISO (
ID_ROL ASC,
ID_RECURSO ASC
)
go

/*==============================================================*/
/* Index: IDX_FECHA_BORRADO                                     */
/*==============================================================*/
create index IDX_FECHA_BORRADO on TB_PERMISO (
FECHA_BORRADO ASC
)
go

/*==============================================================*/
/* Table: TB_PERSONA                                            */
/*==============================================================*/
create table TB_PERSONA (
   ID_PERSONA           int                  identity,
   USUARIO_CREA         int                  null,
   USUARIO_ACTUALIZA    int                  null,
   ID_MUNICIPIO         int                  null,
   NOMBRES              varchar(64)          not null,
   APELLIDOS            varchar(64)          not null,
   CORREO_E             varchar(32)          not null,
   DIRECCION            varchar(200)         null,
   TEL_FIJO             char(9)              null,
   TEL_CEL              char(9)              null,
   FECHA_CREA           datetime             null,
   FECHA_ACTUALIZA      datetime             null,
   FECHA_BORRADO        datetime             null,
   constraint PK_TB_PERSONA primary key (ID_PERSONA)
)
go

/*==============================================================*/
/* Index: IDXPK_ID_PERSONA                                      */
/*==============================================================*/
create index IDXPK_ID_PERSONA on TB_PERSONA (
ID_PERSONA ASC
)
go

/*==============================================================*/
/* Index: IDX_CORREO_E                                          */
/*==============================================================*/
create unique index IDX_CORREO_E on TB_PERSONA (
CORREO_E ASC
)
go

/*==============================================================*/
/* Index: IDX_FECHA_BORRADO                                     */
/*==============================================================*/
create index IDX_FECHA_BORRADO on TB_PERSONA (
FECHA_BORRADO ASC
)
go

/*==============================================================*/
/* Index: IDXFK_ID_MUNICIPIO                                    */
/*==============================================================*/
create index IDXFK_ID_MUNICIPIO on TB_PERSONA (
ID_MUNICIPIO ASC
)
go

/*==============================================================*/
/* Table: TB_PROBLEMA                                           */
/*==============================================================*/
create table TB_PROBLEMA (
   ID_PROBLEMA          int                  identity,
   ID_BENEFICIARIO      int                  not null,
   ID_ESTADO_PROCESO    int                  null,
   USUARIO_ACTUALIZA    int                  null,
   MERCADO              varchar(500)         not null,
   CANT_EMPLEADOS       int                  not null,
   REQUIERE_APOYO       bit                  not null default 0,
   NOMBRE_PROBLEMA      varchar(500)         null,
   DESCRIPCION_NEGOCIO  varchar(2000)        null,
   VENTA_DIA            varchar(200)         null,
   VENTA_MES            decimal(8,2)         null,
   DESCRIPCION_PROBLEMA varchar(2000)        null,
   DESCRIPCION_OTRO_PROBLEMA varchar(2000)        null,
   FECHA_CREA           datetime             null,
   FECHA_ACTUALIZA      datetime             null,
   FECHA_BORRADO        datetime             null,
   constraint PK_TB_PROBLEMA primary key (ID_PROBLEMA)
)
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('TB_PROBLEMA')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'REQUIERE_APOYO')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'TB_PROBLEMA', 'column', 'REQUIERE_APOYO'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '0 REQUIERE APOYO
   1 NO REQUIERE',
   'user', @CurrentUser, 'table', 'TB_PROBLEMA', 'column', 'REQUIERE_APOYO'
go

/*==============================================================*/
/* Index: IDXPK_ID_PROBLEMA                                     */
/*==============================================================*/
create index IDXPK_ID_PROBLEMA on TB_PROBLEMA (
ID_PROBLEMA ASC
)
go

/*==============================================================*/
/* Table: TB_PROPUESTA                                          */
/*==============================================================*/
create table TB_PROPUESTA (
   ID_PROPUESTA         int                  identity,
   ID_PROBLEMA          int                  not null,
   ID_USUARIO_FORMULA   int                  not null,
   ID_ESTADO_PROCESO    int                  null,
   ID_TIPO_INICIATIVA   int                  null,
   ID_USUARIO_CREA      int                  null,
   ID_USUARIO_ACTUALIZA int                  null,
   FECHA_CREA           datetime             null,
   FECHA_ACTUALIZA      datetime             null,
   FECHA_BORRADO        datetime             null,
   SOLUCION_ASISTENCIA  text                 null,
   SOLUCION_ADOPCION    text                 null,
   SOLUCION_INNOVACION  text                 null,
   COMPONENTES_BASICOS  text                 null,
   INFORMACION_ADICIONAL text                 null,
   PRESUPUESTO_CONTRAPARTIDA text                 null,
   constraint PK_TB_PROPUESTA primary key (ID_PROPUESTA)
)
go

/*==============================================================*/
/* Index: IDXPK_ID_PROPUESTA                                    */
/*==============================================================*/
create index IDXPK_ID_PROPUESTA on TB_PROPUESTA (
ID_PROPUESTA ASC
)
go

/*==============================================================*/
/* Table: TB_PROYECTO                                           */
/*==============================================================*/
create table TB_PROYECTO (
   ID_PROYECTO          int                  identity,
   COD_PROYECTO         char(7)              not null,
   ID_PROBLEMA          int                  not null,
   ID_TIPO_INICIATIVA   int                  not null,
   USUARIO_CREA         int                  null,
   USUARIO_ACTUALIZA    int                  null,
   ID_PROPUESTA         int                  null,
   ID_ESTADO_PROCESO    int                  null,
   FECHA_CREA           datetime             null,
   FECHA_ACTUALIZA      datetime             null,
   FECHA_BORRADO        datetime             null,
   MONTO                decimal(18,2)        null,
   constraint PK_TB_PROYECTO primary key (ID_PROYECTO)
)
go

/*==============================================================*/
/* Index: IDXPK_ID_PROYECTO                                     */
/*==============================================================*/
create index IDXPK_ID_PROYECTO on TB_PROYECTO (
ID_PROYECTO ASC
)
go

/*==============================================================*/
/* Table: TB_PROYECTO_ACTIVIDAD                                 */
/*==============================================================*/
create table TB_PROYECTO_ACTIVIDAD (
   ID_PROYECTO_ACTIVIDAD int                  identity,
   ID_ACTIVIDAD_INICIATIVA int                  not null,
   ID_PROYECTO          int                  not null,
   USUARIO_CREA         int                  null,
   USUARIO_ACTUALIZA    int                  null,
   PORCENTAJE_AVANCE    int                  not null,
   FECHA_CREA           datetime             null,
   FECHA_ACTUALIZA      datetime             null,
   FECHA_BORRADO        datetime             null,
   constraint PK_TB_PROYECTO_ACTIVIDAD primary key (ID_PROYECTO_ACTIVIDAD)
)
go

/*==============================================================*/
/* Index: IDXPK_ID_PROYECTO_ACTIVIDAD                           */
/*==============================================================*/
create index IDXPK_ID_PROYECTO_ACTIVIDAD on TB_PROYECTO_ACTIVIDAD (
ID_PROYECTO_ACTIVIDAD ASC,
ID_ACTIVIDAD_INICIATIVA ASC
)
go

/*==============================================================*/
/* Table: TB_RECURSO                                            */
/*==============================================================*/
create table TB_RECURSO (
   ID_RECURSO           int                  identity,
   USUARIO_CREA         int                  null,
   USUARIO_ACTUALIZA    int                  null,
   URL_RECURSO          varchar(512)         not null,
   NOMBRE               varchar(64)          not null,
   FECHA_CREA           datetime             null,
   FECHA_ACTUALIZA      datetime             null,
   FECHA_BORRADO        datetime             null,
   constraint PK_TB_RECURSO primary key (ID_RECURSO)
)
go

/*==============================================================*/
/* Index: IDXPK_ID_RECURSO                                      */
/*==============================================================*/
create index IDXPK_ID_RECURSO on TB_RECURSO (
ID_RECURSO ASC
)
go

/*==============================================================*/
/* Index: IDX_FECHA_BORRADO                                     */
/*==============================================================*/
create index IDX_FECHA_BORRADO on TB_RECURSO (
FECHA_BORRADO ASC
)
go

/*==============================================================*/
/* Index: IDX_URL_RECURSO                                       */
/*==============================================================*/
create index IDX_URL_RECURSO on TB_RECURSO (
URL_RECURSO ASC
)
go

/*==============================================================*/
/* Table: TB_ROL                                                */
/*==============================================================*/
create table TB_ROL (
   ID_ROL               int                  identity,
   USUARIO_CREA         int                  null,
   USUARIO_ACTUALIZA    int                  null,
   NOMBRE               varchar(32)          not null,
   DESCRIPCION          varchar(64)          not null,
   FECHA_CREA           datetime             null,
   FECHA_ACTUALIZA      datetime             null,
   FECHA_BORRADO        datetime             null,
   constraint PK_TB_ROL primary key (ID_ROL)
)
go

/*==============================================================*/
/* Index: IDXPK_ID_ROL                                          */
/*==============================================================*/
create index IDXPK_ID_ROL on TB_ROL (
ID_ROL ASC
)
go

/*==============================================================*/
/* Index: IDX_NOMBRE                                            */
/*==============================================================*/
create index IDX_NOMBRE on TB_ROL (
NOMBRE ASC
)
go

/*==============================================================*/
/* Index: IDX_FECHA_BORRADO                                     */
/*==============================================================*/
create index IDX_FECHA_BORRADO on TB_ROL (
FECHA_BORRADO ASC
)
go

/*==============================================================*/
/* Table: TB_SOLICITUD_SEGUIMIENTO                              */
/*==============================================================*/
create table TB_SOLICITUD_SEGUIMIENTO (
   ID_SOLICITUD_SEGUIMIENTO int                  identity,
   ID_PROYECTO          int                  null,
   USUARIO_CREA         int                  null,
   USUARIO_ACTUALIZA    int                  null,
   FECHA                datetime             not null default getdate(),
   DESCRIPCION          varchar(4096)        not null,
   FECHA_CREA           datetime             null,
   FECHA_ACTUALIZA      datetime             null,
   FECHA_BORRADO        datetime             null,
   constraint PK_TB_SOLICITUD_SEGUIMIENTO primary key (ID_SOLICITUD_SEGUIMIENTO)
)
go

/*==============================================================*/
/* Index: IDXPK_ID_SOLICITUD_SEGUIMIENTO                        */
/*==============================================================*/
create index IDXPK_ID_SOLICITUD_SEGUIMIENTO on TB_SOLICITUD_SEGUIMIENTO (
ID_SOLICITUD_SEGUIMIENTO ASC
)
go

/*==============================================================*/
/* Table: TB_USUARIO                                            */
/*==============================================================*/
create table TB_USUARIO (
   ID_USUARIO           int                  identity,
   ID_ROL               int                  not null,
   ID_PERSONA           int                  null,
   USUARIO_CREA         int                  null,
   USUARIO_ACTUALIZA    int                  null,
   NOMBRE_USUARIO       varchar(16)          not null,
   CONTRASENA           varchar(64)          null,
   ID_SESION            varchar(80)          null,
   FECHA_CREA           datetime             null,
   FECHA_ACTUALIZA      datetime             null,
   FECHA_BORRADO        datetime             null,
   constraint PK_TB_USUARIO primary key (ID_USUARIO)
)
go

/*==============================================================*/
/* Index: IDXPK_ID_USUARIO                                      */
/*==============================================================*/
create index IDXPK_ID_USUARIO on TB_USUARIO (
ID_USUARIO ASC
)
go

/*==============================================================*/
/* Index: IDX_FECHA_BORRADO                                     */
/*==============================================================*/
create index IDX_FECHA_BORRADO on TB_USUARIO (
FECHA_BORRADO ASC
)
go

/*==============================================================*/
/* Index: IDXFK_ID_PERSONA                                      */
/*==============================================================*/
create index IDXFK_ID_PERSONA on TB_USUARIO (
ID_PERSONA ASC
)
go

/*==============================================================*/
/* Index: IDXFK_ID_ROL                                          */
/*==============================================================*/
create index IDXFK_ID_ROL on TB_USUARIO (
ID_ROL ASC
)
go

alter table TBC_ACTIVIDAD_INICIATIVA
   add constraint FK_ACTIVIDAD_PROYECTO_TIPO_INICIATIVA foreign key (ID_TIPO_INICIATIVA)
      references TBC_TIPO_INICIATIVA (ID_TIPO_INICIATIVA)
go

alter table TBC_ACTIVIDAD_INICIATIVA
   add constraint FK_ACTIVIDAD_INICIATIVA_USUARIO1 foreign key (USUARIO_CREA)
      references TB_USUARIO (ID_USUARIO)
go

alter table TBC_ACTIVIDAD_INICIATIVA
   add constraint FK_ACTIVIDAD_INICIATIVA_USUARIO2 foreign key (USUARIO_ACTUALIZA)
      references TB_USUARIO (ID_USUARIO)
go

alter table TBC_CAMPOS_INICIATIVA
   add constraint FK_TBC_CAMP_REFERENCE_TBC_TIPO foreign key (ID_TIPO_INICIATIVA)
      references TBC_TIPO_INICIATIVA (ID_TIPO_INICIATIVA)
go

alter table TBC_DEPARTAMENTO
   add constraint FK_TBC_DEPA_REFERENCE_TB_USUA foreign key (ID_USUARIO_CREA)
      references TB_USUARIO (ID_USUARIO)
go

alter table TBC_DEPARTAMENTO
   add constraint FK_TBC_DEPA_REFERENCE_TB_USUAR foreign key (ID_USUARIO_ACTUALIZA)
      references TB_USUARIO (ID_USUARIO)
go

alter table TBC_MUNICIPIO
   add constraint FK_MUNICIPIO_DEPARTAMENTO foreign key (ID_DEPARTAMENTO)
      references TBC_DEPARTAMENTO (ID_DEPARTAMENTO)
go

alter table TB_ACTIVIDAD
   add constraint FK_ACTIVIDAD_USUARIO foreign key (ID_USUARIO_CONSULTOR)
      references TB_USUARIO (ID_USUARIO)
go

alter table TB_ACTIVIDAD
   add constraint FK_ACTIVIDAD_USUARIO1 foreign key (USUARIO_CREA)
      references TB_USUARIO (ID_USUARIO)
go

alter table TB_ACTIVIDAD
   add constraint FK_TB_ACTIV_REFERENCE_TB_USUAR foreign key (ID_USUARIO_BENEFICIARIO)
      references TB_USUARIO (ID_USUARIO)
go

alter table TB_ASIGNACION
   add constraint FK_TB_ASIGN_ASIG_TB_PERSO_BENE foreign key (ID_PERSONA_BENEFICIARIO)
      references TB_PERSONA (ID_PERSONA)
go

alter table TB_ASIGNACION
   add constraint FK_TB_ASIGN_ASIGNACIO_TB_PERSO_CONSUL foreign key (ID_PERSONA_CONSULTOR)
      references TB_PERSONA (ID_PERSONA)
go

alter table TB_ASIG_CONSULTOR_VINCULACION
   add constraint FK_TB_ASIG__REFERENCE_TBC_MUNI foreign key (ID_MUNICIPIO)
      references TBC_MUNICIPIO (ID_MUNICIPIO)
go

alter table TB_ASIG_CONSULTOR_VINCULACION
   add constraint FK_TB_ASIG__REFERENCE_TBC_SECT foreign key (ID_SECTOR_ECONOMICO)
      references TBC_SECTOR_ECONOMICO (ID_SECTOR_ECONOMICO)
go

alter table TB_ASIG_CONSULTOR_VINCULACION
   add constraint FK_TB_ASIG__REFERENCE_TB_PERSO foreign key (ID_PERSONA)
      references TB_PERSONA (ID_PERSONA)
go

alter table TB_BENEFICIARIO
   add constraint "FK_BENEFICIARIO_ESTADO PROCESO" foreign key (ID_ESTADO_PROCESO)
      references TBC_ESTADO_PROCESO (ID_ESTADO_PROCESO)
go

alter table TB_BENEFICIARIO
   add constraint FK_BENEFICIARIO_PERSONA foreign key (ID_PERSONA)
      references TB_PERSONA (ID_PERSONA)
go

alter table TB_BENEFICIARIO
   add constraint FK_BENEFICIARIO_SECTOR_ECONOMICA foreign key (ID_SECTOR_ECONOMICO)
      references TBC_SECTOR_ECONOMICO (ID_SECTOR_ECONOMICO)
go

alter table TB_BENEFICIARIO
   add constraint FK_BENEFICIARIO_USUARIO1 foreign key (USUARIO_CREA)
      references TB_USUARIO (ID_USUARIO)
go

alter table TB_BENEFICIARIO
   add constraint FK_BENEFICIARIO_USUARIO2 foreign key (USUARIO_ACTUALIZA)
      references TB_USUARIO (ID_USUARIO)
go

alter table TB_CONFIGURACION
   add constraint FK_TB_CONFI_REFERENCE_TB_USUAR foreign key (ID_USUARIO)
      references TB_USUARIO (ID_USUARIO)
go

alter table TB_DETALLE_INICIATIVA
   add constraint FK_TB_DETAL_REFERENCE_TB_PROYE foreign key (ID_PROYECTO)
      references TB_PROYECTO (ID_PROYECTO)
go

alter table TB_DETALLE_INICIATIVA
   add constraint FK_TB_DETAL_REFERENCE_TBC_CAMP foreign key (ID_CAMPO)
      references TBC_CAMPOS_INICIATIVA (ID_CAMPO)
go

alter table TB_DOCUMENTO
   add constraint FK_DOCUMENTO_BENEFICIARIO foreign key (ID_BENEFICIARIO)
      references TB_BENEFICIARIO (ID_BENEFICIARIO)
go

alter table TB_EJECUCION
   add constraint FK_EJECUCION_PROYECTO_ACTIVIDAD foreign key (ID_PROYECTO_ACTIVIDAD)
      references TB_PROYECTO_ACTIVIDAD (ID_PROYECTO_ACTIVIDAD)
go

alter table TB_NOTIFICACION
   add constraint FK_NOTIFICACION_USUARIO foreign key (ID_USUARIO)
      references TB_USUARIO (ID_USUARIO)
go

alter table TB_NOTIFICACION
   add constraint FK_TB_NOTIF_REFERENCE_TB_USUAR foreign key (USUARIO_CREA)
      references TB_USUARIO (ID_USUARIO)
go

alter table TB_NOTIFICACION
   add constraint FK_TB_NOTIF_REFERENCE_TBC_ESTA foreign key (ID_ESTADO_PROCESO)
      references TBC_ESTADO_PROCESO (ID_ESTADO_PROCESO)
go

alter table TB_OBSERVACION
   add constraint FK_TB_OBSER_REFERENCE_TBC_ESTA foreign key (ID_ESTADO_PROCESO)
      references TBC_ESTADO_PROCESO (ID_ESTADO_PROCESO)
go

alter table TB_PERMISO
   add constraint FK_PERMISO_RECURSO foreign key (ID_RECURSO)
      references TB_RECURSO (ID_RECURSO)
go

alter table TB_PERMISO
   add constraint FK_PERSMISO_ROL foreign key (ID_ROL)
      references TB_ROL (ID_ROL)
go

alter table TB_PERMISO
   add constraint FK_PERMISO_USUARIO1 foreign key (USUARIO_CREA)
      references TB_USUARIO (ID_USUARIO)
go

alter table TB_PERMISO
   add constraint FK_PERMISO_USUARIO2 foreign key (USUARIO_ACTUALIZA)
      references TB_USUARIO (ID_USUARIO)
go

alter table TB_PERSONA
   add constraint FK_PERSONA_MUNICIPIO foreign key (ID_MUNICIPIO)
      references TBC_MUNICIPIO (ID_MUNICIPIO)
go

alter table TB_PERSONA
   add constraint FK_PERSONA_USUARIO1 foreign key (USUARIO_CREA)
      references TB_USUARIO (ID_USUARIO)
go

alter table TB_PERSONA
   add constraint FK_PERSONA_USUARIO2 foreign key (USUARIO_ACTUALIZA)
      references TB_USUARIO (ID_USUARIO)
go

alter table TB_PROBLEMA
   add constraint FK_PROBLEMA_BENEFICIARIO foreign key (ID_BENEFICIARIO)
      references TB_BENEFICIARIO (ID_BENEFICIARIO)
go

alter table TB_PROBLEMA
   add constraint FK_PROBLEMA_ESTADO_PROCESO foreign key (ID_ESTADO_PROCESO)
      references TBC_ESTADO_PROCESO (ID_ESTADO_PROCESO)
go

alter table TB_PROBLEMA
   add constraint FK_TB_PROBL_REFERENCE_TB_USUAR foreign key (USUARIO_ACTUALIZA)
      references TB_USUARIO (ID_USUARIO)
go

alter table TB_PROPUESTA
   add constraint FK_PROPUESTA_ESTADO_PROCESO foreign key (ID_ESTADO_PROCESO)
      references TBC_ESTADO_PROCESO (ID_ESTADO_PROCESO)
go

alter table TB_PROPUESTA
   add constraint FK_PROPUESTA_PROBLEMA foreign key (ID_PROBLEMA)
      references TB_PROBLEMA (ID_PROBLEMA)
go

alter table TB_PROPUESTA
   add constraint FK_PROPUESTA_TIPO_INICIATIVA foreign key (ID_TIPO_INICIATIVA)
      references TBC_TIPO_INICIATIVA (ID_TIPO_INICIATIVA)
go

alter table TB_PROPUESTA
   add constraint FK_PROPUESTA_USUARIO foreign key (ID_USUARIO_FORMULA)
      references TB_USUARIO (ID_USUARIO)
go

alter table TB_PROPUESTA
   add constraint FK_USUARIO_CREA foreign key (ID_USUARIO_CREA)
      references TB_USUARIO (ID_USUARIO)
go

alter table TB_PROPUESTA
   add constraint FK_USUARIO_ACTUALIZA foreign key (ID_USUARIO_ACTUALIZA)
      references TB_USUARIO (ID_USUARIO)
go

alter table TB_PROYECTO
   add constraint FK_PROYECTO_PROBLEMA foreign key (ID_PROBLEMA)
      references TB_PROBLEMA (ID_PROBLEMA)
go

alter table TB_PROYECTO
   add constraint FK_PROYECTO_TIPO_INICIATIVA foreign key (ID_TIPO_INICIATIVA)
      references TBC_TIPO_INICIATIVA (ID_TIPO_INICIATIVA)
go

alter table TB_PROYECTO
   add constraint FK_PROYECTO_USUARIO1 foreign key (USUARIO_CREA)
      references TB_USUARIO (ID_USUARIO)
go

alter table TB_PROYECTO
   add constraint FK_PROYECTO_USUARIO2 foreign key (USUARIO_ACTUALIZA)
      references TB_USUARIO (ID_USUARIO)
go

alter table TB_PROYECTO
   add constraint FK_TB_PROYE_REFERENCE_TBC_ESTA foreign key (ID_ESTADO_PROCESO)
      references TBC_ESTADO_PROCESO (ID_ESTADO_PROCESO)
go

alter table TB_PROYECTO
   add constraint FK_TB_PROYE_REFERENCE_TB_PROPU foreign key (ID_PROPUESTA)
      references TB_PROPUESTA (ID_PROPUESTA)
go

alter table TB_PROYECTO_ACTIVIDAD
   add constraint FK_ACTIVIDAD_INICIATIVA_ACTIVIDAD_PROYECTO foreign key (ID_ACTIVIDAD_INICIATIVA)
      references TBC_ACTIVIDAD_INICIATIVA (ID_ACTIVIDAD_INICIATIVA)
go

alter table TB_PROYECTO_ACTIVIDAD
   add constraint FK_PROYECTO_ACTIVIDAD_PROYECTO foreign key (ID_PROYECTO)
      references TB_PROYECTO (ID_PROYECTO)
go

alter table TB_PROYECTO_ACTIVIDAD
   add constraint FK_PROYECTO_ACTIVIDAD_USUARIO1 foreign key (USUARIO_CREA)
      references TB_USUARIO (ID_USUARIO)
go

alter table TB_PROYECTO_ACTIVIDAD
   add constraint FK_PROYECTO_ACTIVIDAD_USUARIO2 foreign key (USUARIO_ACTUALIZA)
      references TB_USUARIO (ID_USUARIO)
go

alter table TB_RECURSO
   add constraint FK_RECURSO_USUARIO1 foreign key (USUARIO_ACTUALIZA)
      references TB_USUARIO (ID_USUARIO)
go

alter table TB_RECURSO
   add constraint FK_RECURSO_USUARIO2 foreign key (USUARIO_CREA)
      references TB_USUARIO (ID_USUARIO)
go

alter table TB_ROL
   add constraint FK_ROL_USUARIO1 foreign key (USUARIO_CREA)
      references TB_USUARIO (ID_USUARIO)
go

alter table TB_ROL
   add constraint FK_ROL_USUARIO2 foreign key (USUARIO_ACTUALIZA)
      references TB_USUARIO (ID_USUARIO)
go

alter table TB_SOLICITUD_SEGUIMIENTO
   add constraint FK_SOLICITUD_SEGUIMIENTO_USUARIO1 foreign key (USUARIO_CREA)
      references TB_USUARIO (ID_USUARIO)
go

alter table TB_SOLICITUD_SEGUIMIENTO
   add constraint FK_SOLICITUD_SEGUIMIENTO_USUARIO2 foreign key (USUARIO_ACTUALIZA)
      references TB_USUARIO (ID_USUARIO)
go

alter table TB_SOLICITUD_SEGUIMIENTO
   add constraint FK_SOLICITUD_SEGUIMIENTO_PROYECTO foreign key (ID_PROYECTO)
      references TB_PROYECTO (ID_PROYECTO)
go

alter table TB_USUARIO
   add constraint FK_USUARIO_PERSONA foreign key (ID_PERSONA)
      references TB_PERSONA (ID_PERSONA)
go

alter table TB_USUARIO
   add constraint FK_USUARIO_ROL foreign key (ID_ROL)
      references TB_ROL (ID_ROL)
go

alter table TB_USUARIO
   add constraint FK_USUARIO_USUARIO1 foreign key (USUARIO_CREA)
      references TB_USUARIO (ID_USUARIO)
go

alter table TB_USUARIO
   add constraint FK_USUARIO_USUARIO2 foreign key (USUARIO_ACTUALIZA)
      references TB_USUARIO (ID_USUARIO)
go






/* Cambios en presupuesto */
if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('TB_DISTRIBUCION_PRESUPUESTO') and o.name = 'FK_PROYECTO_DISTRIBUCION')
alter table TB_DISTRIBUCION_PRESUPUESTO
   drop constraint FK_PROYECTO_DISTRIBUCION
go

if exists (select 1
            from  sysobjects
           where  id = object_id('TB_DISTRIBUCION_PRESUPUESTO')
            and   type = 'U')
   drop table TB_DISTRIBUCION_PRESUPUESTO
go

/*==============================================================*/
/* Table: TB_DISTRIBUCION_PRESUPUESTO                           */
/*==============================================================*/
create table TB_DISTRIBUCION_PRESUPUESTO (
   ID_DISTRIBUCION_PRESUPUESTO int                  identity,
   ID_PROYECTO          int                  null,
   COFINANCIADO         decimal(18,2)        not null,
   ESPECIES             decimal(18,2)        not null,
   EFECTIVO             decimal(18,2)        not null,
   constraint PK_TB_DISTRIBUCION_PRESUPUESTO primary key (ID_DISTRIBUCION_PRESUPUESTO)
)
go

alter table TB_DISTRIBUCION_PRESUPUESTO
   add constraint FK_PROYECTO_DISTRIBUCION foreign key (ID_PROYECTO)
      references TB_PROYECTO (ID_PROYECTO)

GO

CREATE TABLE [dbo].[TBC_CRITERIO_EVAL_TECNICA](
	[ID_CRITERIO_EVAL_TECNICO] [int] IDENTITY(1,1) NOT NULL,
	[ID_CRITERIO_EVAL_TECNICO_SUP] [int] NULL,
	[CRITERIO] [varchar](1024) NULL,
	[TIPO_EVAL] [char](3) NULL,
	[USUARIO_CREA] [int] NULL,
	[USUARIO_ACTUALIZA] [int] NULL,
	[FECHA_CREA] [datetime] NULL,
	[FECHA_ACTUALIZA] [datetime] NULL,
	[FECHA_BORRADO] [datetime] NULL,
 CONSTRAINT [PK_TBC_CRITERIO_EVAL_TECNICA] PRIMARY KEY CLUSTERED 
(
	[ID_CRITERIO_EVAL_TECNICO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[TBC_CAMPO_CRITERIO_EVAL](
	[ID_CAMPO_CRITERIO_EVAL] [int] IDENTITY(1,1) NOT NULL,
	[ID_CRITERIO_EVAL_TECNICO] [int] NULL,
	[CAMPO] [varchar](2048) NOT NULL,
	[PUNTAJE_MAX] [smallint] NOT NULL,
	[USUARIO_CREA] [int] NULL,
	[USUARIO_ACTUALIZA] [int] NULL,
	[FECHA_CREA] [datetime] NULL,
	[FECHA_ACTUALIZA] [datetime] NULL,
	[FECHA_BORRADO] [datetime] NULL,
 CONSTRAINT [PK_TBC_CAMPO_CRITERIO_EVAL] PRIMARY KEY CLUSTERED 
(
	[ID_CAMPO_CRITERIO_EVAL] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[TB_RESULTADO_EVAL_TECNICA](
	[ID_RESULTADO_EVAL_TECNICA] [int] IDENTITY(1,1) NOT NULL,
	[ID_CAMPO_CRITERIO_EVAL] [int] NULL,
	[ID_PROYECTO] [int] NULL,
	[PUNTAJE] [smallint] NOT NULL,
	[ID_PERSONA] [int] NOT NULL
 CONSTRAINT [PK_TB_RESULTADO_EVAL_TECNICA] PRIMARY KEY CLUSTERED 
(
	[ID_RESULTADO_EVAL_TECNICA] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[TBC_CAMPO_CRITERIO_EVAL]  WITH CHECK ADD  CONSTRAINT [FK_CAMPO_CRITERIO_CRITERIO_EVAL] FOREIGN KEY([ID_CRITERIO_EVAL_TECNICO])
REFERENCES [dbo].[TBC_CRITERIO_EVAL_TECNICA] ([ID_CRITERIO_EVAL_TECNICO])
GO
ALTER TABLE [dbo].[TBC_CAMPO_CRITERIO_EVAL] CHECK CONSTRAINT [FK_CAMPO_CRITERIO_CRITERIO_EVAL]
GO
ALTER TABLE [dbo].[TBC_CRITERIO_EVAL_TECNICA]  WITH CHECK ADD  CONSTRAINT [FK_CRITERIO_EVAL_CRITERIO_EVAL] FOREIGN KEY([ID_CRITERIO_EVAL_TECNICO_SUP])
REFERENCES [dbo].[TBC_CRITERIO_EVAL_TECNICA] ([ID_CRITERIO_EVAL_TECNICO])
GO
ALTER TABLE [dbo].[TBC_CRITERIO_EVAL_TECNICA] CHECK CONSTRAINT [FK_CRITERIO_EVAL_CRITERIO_EVAL]
GO


ALTER TABLE [dbo].[TB_RESULTADO_EVAL_TECNICA]  WITH CHECK ADD  CONSTRAINT [FK_RESULTADO_EVAL_CAMPO_CRITERIO] FOREIGN KEY([ID_CAMPO_CRITERIO_EVAL])
REFERENCES [dbo].[TBC_CAMPO_CRITERIO_EVAL] ([ID_CAMPO_CRITERIO_EVAL])
GO

ALTER TABLE [dbo].[TB_RESULTADO_EVAL_TECNICA] CHECK CONSTRAINT [FK_RESULTADO_EVAL_CAMPO_CRITERIO]
GO

ALTER TABLE [dbo].[TB_RESULTADO_EVAL_TECNICA]  WITH CHECK ADD  CONSTRAINT [FK_RESULTADO_EVAL_PROYECTO] FOREIGN KEY([ID_PROYECTO])
REFERENCES [dbo].[TB_PROYECTO] ([ID_PROYECTO])
GO

ALTER TABLE [dbo].[TB_RESULTADO_EVAL_TECNICA] CHECK CONSTRAINT [FK_RESULTADO_EVAL_PROYECTO]
GO
alter table TB_RESULTADO_EVAL_TECNICA add FOREIGN KEY (ID_PERSONA) references TB_PERSONA(ID_PERSONA);
go
/**************DATOS SEMILLA BASE DE DATOS******************/
/* TABLA ESTADO_PROCESO */
INSERT INTO TBC_ESTADO_PROCESO(CODIGO_ESTADO_PROCESO,DESCRIPCION_ESTADO_PROCESO,ICONO_ESTADO_PROCESO,COLOR_ESTADO_PROCESO) VALUES('B01','Persona requiere ayuda para registrarse','fas fa-portrait text-white','bg-info');
INSERT INTO TBC_ESTADO_PROCESO(CODIGO_ESTADO_PROCESO,DESCRIPCION_ESTADO_PROCESO,ICONO_ESTADO_PROCESO,COLOR_ESTADO_PROCESO) VALUES('B02','Beneficiario Registrado, Pendiente de validación','fas fa-exclamation-circle text-white','bg-warning');
INSERT INTO TBC_ESTADO_PROCESO(CODIGO_ESTADO_PROCESO,DESCRIPCION_ESTADO_PROCESO,ICONO_ESTADO_PROCESO,COLOR_ESTADO_PROCESO) VALUES('B03','Registro de Beneficiario con observación','fas fa-exclamation-circle text-white','bg-warning');
INSERT INTO TBC_ESTADO_PROCESO(CODIGO_ESTADO_PROCESO,DESCRIPCION_ESTADO_PROCESO,ICONO_ESTADO_PROCESO,COLOR_ESTADO_PROCESO) VALUES('B04','Registro de Beneficiario Denegado','fas fa-exclamation-circle text-white','bg-danger');
INSERT INTO TBC_ESTADO_PROCESO(CODIGO_ESTADO_PROCESO,DESCRIPCION_ESTADO_PROCESO,ICONO_ESTADO_PROCESO,COLOR_ESTADO_PROCESO) VALUES('B05','Registro Validado','fas fa-user-check text-white','bg-success');
INSERT INTO TBC_ESTADO_PROCESO(CODIGO_ESTADO_PROCESO,DESCRIPCION_ESTADO_PROCESO,ICONO_ESTADO_PROCESO,COLOR_ESTADO_PROCESO) VALUES('B06','Beneficiario es elegible','fas fa-user-check text-white','bg-success');
INSERT INTO TBC_ESTADO_PROCESO(CODIGO_ESTADO_PROCESO,DESCRIPCION_ESTADO_PROCESO,ICONO_ESTADO_PROCESO,COLOR_ESTADO_PROCESO) VALUES('B07','Beneficiario no es elegible','fas fa-exclamation-circle text-white','bg-danger');
INSERT INTO TBC_ESTADO_PROCESO(CODIGO_ESTADO_PROCESO,DESCRIPCION_ESTADO_PROCESO,ICONO_ESTADO_PROCESO,COLOR_ESTADO_PROCESO) VALUES('P01','Problema Registrado pendiente de Aprobación','fas fa-clipboard-check text-white','bg-info');
INSERT INTO TBC_ESTADO_PROCESO(CODIGO_ESTADO_PROCESO,DESCRIPCION_ESTADO_PROCESO,ICONO_ESTADO_PROCESO,COLOR_ESTADO_PROCESO) VALUES('P02','Problema Publicado','fas fa-check-square text-white','bg-success');
INSERT INTO TBC_ESTADO_PROCESO(CODIGO_ESTADO_PROCESO,DESCRIPCION_ESTADO_PROCESO,ICONO_ESTADO_PROCESO,COLOR_ESTADO_PROCESO) VALUES('P03','Problema Observado','fas fa-exclamation-circle text-white','bg-warning');
INSERT INTO TBC_ESTADO_PROCESO(CODIGO_ESTADO_PROCESO,DESCRIPCION_ESTADO_PROCESO,ICONO_ESTADO_PROCESO,COLOR_ESTADO_PROCESO) VALUES('P04','Observación de Problema Resuelto','fas fa-exclamation-circle text-white','bg-success'); 
INSERT INTO TBC_ESTADO_PROCESO(CODIGO_ESTADO_PROCESO,DESCRIPCION_ESTADO_PROCESO,ICONO_ESTADO_PROCESO,COLOR_ESTADO_PROCESO) VALUES('S01','Propuesta de solución presentada','fas fa-clipboard text-white','bg-info'); 
INSERT INTO TBC_ESTADO_PROCESO(CODIGO_ESTADO_PROCESO,DESCRIPCION_ESTADO_PROCESO,ICONO_ESTADO_PROCESO,COLOR_ESTADO_PROCESO) VALUES('S02','Propuesta de solución Aceptada pendiente de formular iniciativa','fas fa-clipboard text-white','bg-success'); 
INSERT INTO TBC_ESTADO_PROCESO(CODIGO_ESTADO_PROCESO,DESCRIPCION_ESTADO_PROCESO,ICONO_ESTADO_PROCESO,COLOR_ESTADO_PROCESO) VALUES('S03','Propuesta de solución Rechazada','fas fa-clipboard text-white','bg-danger'); 
INSERT INTO TBC_ESTADO_PROCESO(CODIGO_ESTADO_PROCESO,DESCRIPCION_ESTADO_PROCESO,ICONO_ESTADO_PROCESO,COLOR_ESTADO_PROCESO) VALUES('PY01','Iniciativa Pendiente de Formulación','fas fa-clipboard text-white','bg-info'); 
INSERT INTO TBC_ESTADO_PROCESO(CODIGO_ESTADO_PROCESO,DESCRIPCION_ESTADO_PROCESO,ICONO_ESTADO_PROCESO,COLOR_ESTADO_PROCESO) VALUES('PY02','Iniciativa Formulada Pendiente de aceptación por el beneficiario','fas fa-clipboard text-white','bg-info'); 
INSERT INTO TBC_ESTADO_PROCESO(CODIGO_ESTADO_PROCESO,DESCRIPCION_ESTADO_PROCESO,ICONO_ESTADO_PROCESO,COLOR_ESTADO_PROCESO) VALUES('PY03','Iniciativa Aceptada','fas fa-clipboard text-white','bg-success'); 
INSERT INTO TBC_ESTADO_PROCESO(CODIGO_ESTADO_PROCESO,DESCRIPCION_ESTADO_PROCESO,ICONO_ESTADO_PROCESO,COLOR_ESTADO_PROCESO) VALUES('PY04','Iniciativa Observada','fas fa-clipboard text-white','bg-info'); 
INSERT INTO TBC_ESTADO_PROCESO(CODIGO_ESTADO_PROCESO,DESCRIPCION_ESTADO_PROCESO,ICONO_ESTADO_PROCESO,COLOR_ESTADO_PROCESO) VALUES('PY05','Proyecto con Contrapartida Verificada','fas fa-clipboard text-white','bg-info'); 
INSERT INTO TBC_ESTADO_PROCESO(CODIGO_ESTADO_PROCESO,DESCRIPCION_ESTADO_PROCESO,ICONO_ESTADO_PROCESO,COLOR_ESTADO_PROCESO) VALUES('PY06','Proyecto Aprobado en Filtro Técnico','fas fa-clipboard text-white','bg-info'); 
INSERT INTO TBC_ESTADO_PROCESO(CODIGO_ESTADO_PROCESO,DESCRIPCION_ESTADO_PROCESO,ICONO_ESTADO_PROCESO,COLOR_ESTADO_PROCESO) VALUES('PY07','Iniciativa Observada en Filtro Técnico','fas fa-clipboard text-white','bg-info'); 
INSERT INTO TBC_ESTADO_PROCESO(CODIGO_ESTADO_PROCESO,DESCRIPCION_ESTADO_PROCESO,ICONO_ESTADO_PROCESO,COLOR_ESTADO_PROCESO) VALUES('PY08','Iniciativa Aprobada por el Comité de Evaluación','fas fa-clipboard text-white','bg-info'); 
INSERT INTO TBC_ESTADO_PROCESO(CODIGO_ESTADO_PROCESO,DESCRIPCION_ESTADO_PROCESO,ICONO_ESTADO_PROCESO,COLOR_ESTADO_PROCESO) VALUES('PY09','Iniciativa Observada por el Comité de Evaluación','fas fa-clipboard text-white','bg-info'); 
INSERT INTO TBC_ESTADO_PROCESO(CODIGO_ESTADO_PROCESO,DESCRIPCION_ESTADO_PROCESO,ICONO_ESTADO_PROCESO,COLOR_ESTADO_PROCESO) VALUES('PY10','Iniciativa Ratificada','fas fa-clipboard text-white','bg-info'); 
INSERT INTO TBC_ESTADO_PROCESO(CODIGO_ESTADO_PROCESO,DESCRIPCION_ESTADO_PROCESO,ICONO_ESTADO_PROCESO,COLOR_ESTADO_PROCESO) VALUES('PY11','Iniciativa Facturada','fas fa-clipboard text-white','bg-info'); 
INSERT INTO TBC_ESTADO_PROCESO(CODIGO_ESTADO_PROCESO,DESCRIPCION_ESTADO_PROCESO,ICONO_ESTADO_PROCESO,COLOR_ESTADO_PROCESO) VALUES('PY12','Proyecto Finalizado','fas fa-clipboard text-white','bg-success'); 
INSERT INTO TBC_ESTADO_PROCESO(CODIGO_ESTADO_PROCESO,DESCRIPCION_ESTADO_PROCESO,ICONO_ESTADO_PROCESO,COLOR_ESTADO_PROCESO) VALUES('IF01','Asignacion de Municipio y sector economico','far fa-address-card text-white','bg-info'); 
INSERT INTO TBC_ESTADO_PROCESO(CODIGO_ESTADO_PROCESO,DESCRIPCION_ESTADO_PROCESO,ICONO_ESTADO_PROCESO,COLOR_ESTADO_PROCESO) VALUES('IF02','Formulador pendiente de validacion','far fa-address-card text-white','bg-info'); 
INSERT INTO TBC_ESTADO_PROCESO(CODIGO_ESTADO_PROCESO,DESCRIPCION_ESTADO_PROCESO,ICONO_ESTADO_PROCESO,COLOR_ESTADO_PROCESO) VALUES('IF03','Beneficiario Asignado','far fa-address-card text-white','bg-success'); 
INSERT INTO TBC_ESTADO_PROCESO(CODIGO_ESTADO_PROCESO,DESCRIPCION_ESTADO_PROCESO,ICONO_ESTADO_PROCESO,COLOR_ESTADO_PROCESO) VALUES('IF04','Cita agendada','far fa-calendar-alt text-white','bg-info'); 
INSERT INTO TBC_ESTADO_PROCESO(CODIGO_ESTADO_PROCESO,DESCRIPCION_ESTADO_PROCESO,ICONO_ESTADO_PROCESO,COLOR_ESTADO_PROCESO) VALUES('IF05','Observacion Resuelta','far fa-check-circle text-white','bg-success'); 
INSERT INTO TBC_ESTADO_PROCESO(CODIGO_ESTADO_PROCESO,DESCRIPCION_ESTADO_PROCESO,ICONO_ESTADO_PROCESO,COLOR_ESTADO_PROCESO) VALUES('IF06','Nueva Solicitud de seguimiento','far fa-check-circle text-white','bg-success'); 
INSERT INTO TBC_ESTADO_PROCESO(CODIGO_ESTADO_PROCESO,DESCRIPCION_ESTADO_PROCESO,ICONO_ESTADO_PROCESO,COLOR_ESTADO_PROCESO) VALUES('PY13','Iniciativa en progreso','far fa-check-circle text-white','bg-success'); 

/* TABLA ROL */
INSERT INTO TB_ROL(NOMBRE, DESCRIPCION) VALUES('Administrador', 'Administrador del sistema');		--1
INSERT INTO TB_ROL(NOMBRE, DESCRIPCION) VALUES('Beneficiario', '');									--2
INSERT INTO TB_ROL(NOMBRE, DESCRIPCION) VALUES('Consultor', 'Consultor de vinculación');			--3
INSERT INTO TB_ROL(NOMBRE, DESCRIPCION) VALUES('Formulador', '');									--4
INSERT INTO TB_ROL(NOMBRE, DESCRIPCION) VALUES('Coordinador', 'Coordinador de iniciativas');		--5
INSERT INTO TB_ROL(NOMBRE, DESCRIPCION) VALUES('Comité evaluador', 'Evaluador de casos');			--6
INSERT INTO TB_ROL(NOMBRE, DESCRIPCION) VALUES('Presidente', 'Presidente del comite');			--7

/* TABLA TBC_DEPARTAMENTO */
INSERT [dbo].[TBC_DEPARTAMENTO] ([COD_DEPARTAMENTO], [NOMBRE_DEPTO]) VALUES (N'01', N'Sonsonate')			--1
INSERT [dbo].[TBC_DEPARTAMENTO] ([COD_DEPARTAMENTO], [NOMBRE_DEPTO]) VALUES (N'02', N'Ahuachapan')			--2
INSERT [dbo].[TBC_DEPARTAMENTO] ([COD_DEPARTAMENTO], [NOMBRE_DEPTO]) VALUES (N'03', N'La Unión')			--3
INSERT [dbo].[TBC_DEPARTAMENTO] ([COD_DEPARTAMENTO], [NOMBRE_DEPTO]) VALUES (N'04', N'Usulután')			--4

/* TABLA TBC_MUNICIPIO */
INSERT [dbo].[TBC_MUNICIPIO] ([ID_DEPARTAMENTO], [COD_MUNICIPIO], [NOMBRE_MUNIC]) VALUES (1, N'0101', N'Sonsonate')
INSERT [dbo].[TBC_MUNICIPIO] ([ID_DEPARTAMENTO], [COD_MUNICIPIO], [NOMBRE_MUNIC]) VALUES (1, N'0102', N'Acajutla')
INSERT [dbo].[TBC_MUNICIPIO] ([ID_DEPARTAMENTO], [COD_MUNICIPIO], [NOMBRE_MUNIC]) VALUES (1, N'0103', N'Cuisnahuat')
INSERT [dbo].[TBC_MUNICIPIO] ([ID_DEPARTAMENTO], [COD_MUNICIPIO], [NOMBRE_MUNIC]) VALUES (1, N'0104', N'Ishuatán')
INSERT [dbo].[TBC_MUNICIPIO] ([ID_DEPARTAMENTO], [COD_MUNICIPIO], [NOMBRE_MUNIC]) VALUES (1, N'0105', N'Izalco')
INSERT [dbo].[TBC_MUNICIPIO] ([ID_DEPARTAMENTO], [COD_MUNICIPIO], [NOMBRE_MUNIC]) VALUES (1, N'0106', N'Juayúa')
INSERT [dbo].[TBC_MUNICIPIO] ([ID_DEPARTAMENTO], [COD_MUNICIPIO], [NOMBRE_MUNIC]) VALUES (1, N'0107', N'Nahuizalco')
INSERT [dbo].[TBC_MUNICIPIO] ([ID_DEPARTAMENTO], [COD_MUNICIPIO], [NOMBRE_MUNIC]) VALUES (1, N'0108', N'Nahuilingo')
INSERT [dbo].[TBC_MUNICIPIO] ([ID_DEPARTAMENTO], [COD_MUNICIPIO], [NOMBRE_MUNIC]) VALUES (1, N'0109', N'Salcoatitán')
INSERT [dbo].[TBC_MUNICIPIO] ([ID_DEPARTAMENTO], [COD_MUNICIPIO], [NOMBRE_MUNIC]) VALUES (1, N'0110', N'San Antonio del Monte')
INSERT [dbo].[TBC_MUNICIPIO] ([ID_DEPARTAMENTO], [COD_MUNICIPIO], [NOMBRE_MUNIC]) VALUES (1, N'0111', N'San Julián')
INSERT [dbo].[TBC_MUNICIPIO] ([ID_DEPARTAMENTO], [COD_MUNICIPIO], [NOMBRE_MUNIC]) VALUES (1, N'0112', N'Santa Catarina Masahuat')
INSERT [dbo].[TBC_MUNICIPIO] ([ID_DEPARTAMENTO], [COD_MUNICIPIO], [NOMBRE_MUNIC]) VALUES (1, N'0113', N'Santo Domingo de Guzmán')
INSERT [dbo].[TBC_MUNICIPIO] ([ID_DEPARTAMENTO], [COD_MUNICIPIO], [NOMBRE_MUNIC]) VALUES (1, N'0114', N'Sonzacate')

INSERT [dbo].[TBC_MUNICIPIO] ([ID_DEPARTAMENTO], [COD_MUNICIPIO], [NOMBRE_MUNIC]) VALUES (2, N'0201', N'Apaneca')					--15
INSERT [dbo].[TBC_MUNICIPIO] ([ID_DEPARTAMENTO], [COD_MUNICIPIO], [NOMBRE_MUNIC]) VALUES (2, N'0202', N'Guaymango')					--16
INSERT [dbo].[TBC_MUNICIPIO] ([ID_DEPARTAMENTO], [COD_MUNICIPIO], [NOMBRE_MUNIC]) VALUES (2, N'0203', N'Jujutla')					--17
INSERT [dbo].[TBC_MUNICIPIO] ([ID_DEPARTAMENTO], [COD_MUNICIPIO], [NOMBRE_MUNIC]) VALUES (2, N'0204', N'San Francisco Menéndez')	--15

INSERT [dbo].[TBC_MUNICIPIO] ([ID_DEPARTAMENTO], [COD_MUNICIPIO], [NOMBRE_MUNIC]) VALUES (3, N'0301', N'Conchagua')					--16
INSERT [dbo].[TBC_MUNICIPIO] ([ID_DEPARTAMENTO], [COD_MUNICIPIO], [NOMBRE_MUNIC]) VALUES (3, N'0302', N'El Carmen')					--17
INSERT [dbo].[TBC_MUNICIPIO] ([ID_DEPARTAMENTO], [COD_MUNICIPIO], [NOMBRE_MUNIC]) VALUES (3, N'0303', N'Intipucá')					--18
INSERT [dbo].[TBC_MUNICIPIO] ([ID_DEPARTAMENTO], [COD_MUNICIPIO], [NOMBRE_MUNIC]) VALUES (3, N'0304', N'La Unión')					--19
INSERT [dbo].[TBC_MUNICIPIO] ([ID_DEPARTAMENTO], [COD_MUNICIPIO], [NOMBRE_MUNIC]) VALUES (3, N'0305', N'Meanguera del Golfo')		--20
INSERT [dbo].[TBC_MUNICIPIO] ([ID_DEPARTAMENTO], [COD_MUNICIPIO], [NOMBRE_MUNIC]) VALUES (3, N'0306', N'Pasaquina')					--21
INSERT [dbo].[TBC_MUNICIPIO] ([ID_DEPARTAMENTO], [COD_MUNICIPIO], [NOMBRE_MUNIC]) VALUES (3, N'0307', N'San Alejo')					--22
INSERT [dbo].[TBC_MUNICIPIO] ([ID_DEPARTAMENTO], [COD_MUNICIPIO], [NOMBRE_MUNIC]) VALUES (3, N'0308', N'Santa Rosa de Lima')		--23

INSERT [dbo].[TBC_MUNICIPIO] ([ID_DEPARTAMENTO], [COD_MUNICIPIO], [NOMBRE_MUNIC]) VALUES (4, N'0401', N'Jiquilisco')				--24
INSERT [dbo].[TBC_MUNICIPIO] ([ID_DEPARTAMENTO], [COD_MUNICIPIO], [NOMBRE_MUNIC]) VALUES (4, N'0402', N'San Agustín')				--25
INSERT [dbo].[TBC_MUNICIPIO] ([ID_DEPARTAMENTO], [COD_MUNICIPIO], [NOMBRE_MUNIC]) VALUES (4, N'0403', N'Puerto el triunfo')			--26
INSERT [dbo].[TBC_MUNICIPIO] ([ID_DEPARTAMENTO], [COD_MUNICIPIO], [NOMBRE_MUNIC]) VALUES (4, N'0404', N'San Dionisio')				--27

/* TABLA TBC_SECTOR_ECONOMICO */
INSERT [dbo].[TBC_SECTOR_ECONOMICO] ([COD_SECTOR_ECONOMICO], [NOMBRE_SECTOR]) VALUES (N'01', N'Pesca Artesanal')			--1
INSERT [dbo].[TBC_SECTOR_ECONOMICO] ([COD_SECTOR_ECONOMICO], [NOMBRE_SECTOR]) VALUES (N'02', N'Agroindustria')				--2
INSERT [dbo].[TBC_SECTOR_ECONOMICO] ([COD_SECTOR_ECONOMICO], [NOMBRE_SECTOR]) VALUES (N'03', N'Turismo')					--3
INSERT [dbo].[TBC_SECTOR_ECONOMICO] ([COD_SECTOR_ECONOMICO], [NOMBRE_SECTOR]) VALUES (N'03', N'Acuicultura')				--4

/* TABLA TB_PERSONA */
INSERT INTO TB_PERSONA(NOMBRES, APELLIDOS, CORREO_E) VALUES('admin', 'admin', 'administrador@minec.gob.sv');


/* TABLA TB_USUARIO */
INSERT INTO TB_USUARIO(ID_ROL, ID_PERSONA, NOMBRE_USUARIO, CONTRASENA) VALUES(1, 1, 'Administrador', '2A6521BFCED37D03F210D1A3E00195916F4FC8FAC237013D672E0734E1A221B8'); --contraseña = PISI2019

/* TABLA TB_RECURSO */
--Administrador
INSERT INTO TB_RECURSO(NOMBRE, URL_RECURSO, USUARIO_CREA) VALUES('Administrar Usuarios', 'Administrar/Usuarios', 1)		--1
INSERT INTO TB_RECURSO(NOMBRE, URL_RECURSO, USUARIO_CREA) VALUES('Administrar Recursos', 'Administrar/Recursos', 1)		--2
INSERT INTO TB_RECURSO(NOMBRE, URL_RECURSO, USUARIO_CREA) VALUES('Administrar Roles', 'Administrar/Roles', 1)			--3
INSERT INTO TB_RECURSO(NOMBRE, URL_RECURSO, USUARIO_CREA) VALUES('Notificaciones', 'Administracion/Notificaciones', 1)	--4

--Beneficiario
INSERT INTO TB_RECURSO(NOMBRE, URL_RECURSO, USUARIO_CREA) VALUES('Consultar Beneficiario', 'Beneficiario/Consultar/Beneficiario', 1)			--5
INSERT INTO TB_RECURSO(NOMBRE, URL_RECURSO, USUARIO_CREA) VALUES('Datos Beneficiario', 'Beneficiario/Documentacion/[\d]+', 1)					--6
INSERT INTO TB_RECURSO(NOMBRE, URL_RECURSO, USUARIO_CREA) VALUES('DatosComplementariosBeneficiario', 'Beneficiario/AgregarInformacion/[\d]+', 1)	--7
INSERT INTO TB_RECURSO(NOMBRE, URL_RECURSO, USUARIO_CREA) VALUES('Registro del Problema', 'Beneficiario/Registro/Problema', 1)					--8

--Calendario
INSERT INTO TB_RECURSO(NOMBRE, URL_RECURSO, USUARIO_CREA) VALUES('Programar Cita', 'CalendarioProgramarCita/[\d]+', 1)		--9

--Casos
INSERT INTO TB_RECURSO(NOMBRE, URL_RECURSO, USUARIO_CREA) VALUES('Datos Problema Ingresado', 'Casos/ProblemaIngresado/[\d]+', 1)		--10
INSERT INTO TB_RECURSO(NOMBRE, URL_RECURSO, USUARIO_CREA) VALUES('Consultar Casos', 'Casos/Consulta', 1)									--11
INSERT INTO TB_RECURSO(NOMBRE, URL_RECURSO, USUARIO_CREA) VALUES('Consultar Propuestas', 'Casos/Consulta/Propuestas', 1)					--12
INSERT INTO TB_RECURSO(NOMBRE, URL_RECURSO, USUARIO_CREA) VALUES('Consultar Mis Casos', 'Casos/Consulta/MisCasos', 1)						--13

--Formulador
INSERT INTO TB_RECURSO(NOMBRE, URL_RECURSO, USUARIO_CREA) VALUES('Formular Solucion', 'Formulacion/Solucion/[\d]+/[\d]+', 1)					--14
INSERT INTO TB_RECURSO(NOMBRE, URL_RECURSO, USUARIO_CREA) VALUES('Ver Propuesta de Solucion', 'Formulacion/Propuesta/Solucion/[\d]+', 1)					--15
INSERT INTO TB_RECURSO(NOMBRE, URL_RECURSO, USUARIO_CREA) VALUES('Consultar Iniciativa', 'Formulacion/Consultar/Iniciativa', 1)									--16
INSERT INTO TB_RECURSO(NOMBRE, URL_RECURSO, USUARIO_CREA) VALUES('Detalle Iniciativa', 'Formulacion/Detalle/Iniciativa/[\d]+/[\d]+', 1)		--17
INSERT INTO TB_RECURSO(NOMBRE, URL_RECURSO, USUARIO_CREA) VALUES('Filtro Tecnico', 'Formulacion/FiltroTecnico/[\d]+', 1)								--18
INSERT INTO TB_RECURSO(NOMBRE, URL_RECURSO, USUARIO_CREA) VALUES('Evaluar Iniciativa', 'Formulacion/Evaluar/Iniciativa/[\d]+', 1)						--19
INSERT INTO TB_RECURSO(NOMBRE, URL_RECURSO, USUARIO_CREA) VALUES('Formular Iniciativa Adopcion', 'Formulacion/Iniciativa/Adopcion/[\d]+', 1)				--20
INSERT INTO TB_RECURSO(NOMBRE, URL_RECURSO, USUARIO_CREA) VALUES('Formular Iniciativa Innovacion', 'Formulacion/Iniciativa/Innovacion/[\d]+', 1)			--21
INSERT INTO TB_RECURSO(NOMBRE, URL_RECURSO, USUARIO_CREA) VALUES('Formular Iniciativa Asistencia', 'Formulacion/Iniciativa/Asistencia/[\d]+', 1)			--22
INSERT INTO TB_RECURSO(NOMBRE, URL_RECURSO, USUARIO_CREA) VALUES('Ver Propuesta Ratificada', 'Formulacion/Propuesta/Ratificada/[\d]+', 1)				--23
INSERT INTO TB_RECURSO(NOMBRE, URL_RECURSO, USUARIO_CREA) VALUES('Cartera de Beneficiarios', 'Beneficiario/Consultar', 1)					--24


--Beneficiario
INSERT INTO TB_RECURSO(NOMBRE, URL_RECURSO, USUARIO_CREA) VALUES('ConsultarPersonasRegistroAyuda', 'Beneficiario/Consultar/Persona', 1)			--25
INSERT INTO TB_RECURSO(NOMBRE, URL_RECURSO, USUARIO_CREA) VALUES('DatosComplementariosBeneficiario2', 'Beneficiario/AgregarInformacion2/[\d]+', 1)	--26
INSERT INTO TB_RECURSO(NOMBRE, URL_RECURSO, USUARIO_CREA) VALUES('DatosComplementariosBeneficiario', 'Beneficiario/AgregarInformacion/[\d]+', 1)	--27

INSERT INTO TB_RECURSO(NOMBRE, URL_RECURSO, USUARIO_CREA) VALUES('Consultar casos Publicados', 'Casos/Consulta/Publicados', 1)						--28

--Experiencia de Formulador
INSERT INTO TB_RECURSO(NOMBRE, URL_RECURSO, USUARIO_CREA) VALUES('Experiencia de Formulador', 'Formulador/Experiencia', 1)					--29
INSERT INTO TB_RECURSO(NOMBRE, URL_RECURSO, USUARIO_CREA) VALUES('Editar Problema', 'Beneficiario/Editar/Problema/[\d]+', 1)					--30
INSERT INTO TB_RECURSO(NOMBRE, URL_RECURSO, USUARIO_CREA) VALUES('Consultar mis iniciativas beneficiario', 'Formulacion/Consultar/MisIniciativa', 1)	--31				--30
INSERT INTO TB_RECURSO(NOMBRE, URL_RECURSO, USUARIO_CREA) VALUES('Formular Iniciativa Integral', 'Formulacion/Iniciativa/Integral/[\d]+', 1) --32
INSERT INTO TB_RECURSO(NOMBRE, URL_RECURSO, USUARIO_CREA) VALUES('Detalle Iniciativa Adopcion', 'Formulacion/Detalle/Iniciativa/Adopcion/[\d]+', 1) --33
INSERT INTO TB_RECURSO(NOMBRE, URL_RECURSO, USUARIO_CREA) VALUES('Facturar Proyecto', 'Formulacion/Facturar/Iniciativa/[\d]+', 1) --34
INSERT INTO TB_RECURSO(NOMBRE, URL_RECURSO, USUARIO_CREA) VALUES('Detalle Iniciativa Asistencia', 'Formulacion/Detalle/Iniciativa/Asistencia/[\d]+', 1) --35

INSERT INTO TB_RECURSO(NOMBRE, URL_RECURSO, USUARIO_CREA) VALUES('MonitorearIniciativa', 'Formulacion/Monitorear/Iniciativa/[\d]+', 1) --36
INSERT INTO TB_RECURSO(NOMBRE, URL_RECURSO, USUARIO_CREA) VALUES('Detalle Iniciativa Innovacion', 'Formulacion/Detalle/Iniciativa/Innovacion/[\d]+', 1) --37
INSERT INTO TB_RECURSO(NOMBRE, URL_RECURSO, USUARIO_CREA) VALUES('Reporte Iniciativas', 'Administrar/ReporteIniciativa', 1)		--38
INSERT INTO TB_RECURSO(NOMBRE, URL_RECURSO, USUARIO_CREA) VALUES('Lista Departamentos', 'Administrar/Departamentos', 1)		--39
INSERT INTO TB_RECURSO(NOMBRE, URL_RECURSO, USUARIO_CREA) VALUES('Registro Departamento', 'Administrar/RegistroDepartamento', 1)		--40
INSERT INTO TB_RECURSO(NOMBRE, URL_RECURSO, USUARIO_CREA) VALUES('Administrar Evaluadores', 'Administrar/Evaluadores', 1)		--41
INSERT INTO TB_RECURSO(NOMBRE, URL_RECURSO, USUARIO_CREA) VALUES('Revisar Iniciativa', 'Formulacion/Evaluar/Iniciativa/[\d]+/Persona/[\d]+', 1)		--42

INSERT INTO TB_RECURSO(NOMBRE, URL_RECURSO, USUARIO_CREA) VALUES('Catalogo Actividad Iniciativa', 'Administrar/ActividadIniciativa', 1)		--43
INSERT INTO TB_RECURSO(NOMBRE, URL_RECURSO, USUARIO_CREA) VALUES('Catalogo Departamentos', 'Administrar/Departamentos', 1)		--44
INSERT INTO TB_RECURSO(NOMBRE, URL_RECURSO, USUARIO_CREA) VALUES('Catalogo Estado Proceso', 'Administrar/EstadoProceso', 1)		--45
INSERT INTO TB_RECURSO(NOMBRE, URL_RECURSO, USUARIO_CREA) VALUES('Catalogo Municipio', 'Administrar/Municipios', 1)		--46
INSERT INTO TB_RECURSO(NOMBRE, URL_RECURSO, USUARIO_CREA) VALUES('Catalogo Sector Economico', 'Administrar/SectorEconomico', 1)		--47
INSERT INTO TB_RECURSO(NOMBRE, URL_RECURSO, USUARIO_CREA) VALUES('Catalogo Tipo Iniciativa', 'Administrar/TipoIniciativas', 1)		--48
INSERT INTO TB_RECURSO(NOMBRE, URL_RECURSO, USUARIO_CREA) VALUES('Catalogo Criterios Evaluacion', 'Administrar/CriteriosEvaluacion', 1)		--49
INSERT INTO TB_RECURSO(NOMBRE, URL_RECURSO, USUARIO_CREA) VALUES('Catalogo Evaluacion Tecnica', 'Administrar/EvaluacionTecnica', 1)		--50
INSERT INTO TB_RECURSO(NOMBRE, URL_RECURSO, USUARIO_CREA) VALUES('Catalogo Campo Iniciativa', 'Administrar/CamposIniciativa', 1)		--51
INSERT INTO TB_RECURSO(NOMBRE, URL_RECURSO, USUARIO_CREA) VALUES('AsignacionConsultor', 'Administrar/Asignaciones', 1)		--52
INSERT INTO TB_RECURSO(NOMBRE, URL_RECURSO, USUARIO_CREA) VALUES('Detalle Iniciativa iNTEGRAL', 'Formulacion/Detalle/Iniciativa/Integral/[\d]+', 1) --53
INSERT INTO TB_RECURSO(NOMBRE, URL_RECURSO, USUARIO_CREA) VALUES('Seguimiento del proyecto', 'Formulacion/Documentar/Avances/[\d]+', 1) --54
INSERT INTO TB_RECURSO(NOMBRE, URL_RECURSO, USUARIO_CREA) VALUES('Administrar Formuladores', 'Administrar/Formuladores', 1) --55
INSERT INTO TB_RECURSO(NOMBRE, URL_RECURSO, USUARIO_CREA) VALUES('Editar Iniciativa Adopcion', 'Editar/Iniciativa/Adopcion/[\d]+', 1)	--56
INSERT INTO TB_RECURSO(NOMBRE, URL_RECURSO, USUARIO_CREA) VALUES('Editar Iniciativa asistencia', 'Editar/Iniciativa/Asistencia/[\d]+', 1)	--57
INSERT INTO TB_RECURSO(NOMBRE, URL_RECURSO, USUARIO_CREA) VALUES('Editar Iniciativa innovacion', 'Editar/Iniciativa/Innovacion/[\d]+', 1)	--58
INSERT INTO TB_RECURSO(NOMBRE, URL_RECURSO, USUARIO_CREA) VALUES('Editar Iniciativa integral', 'Editar/Iniciativa/Integral/[\d]+', 1)	--59
INSERT INTO TB_RECURSO(NOMBRE, URL_RECURSO, USUARIO_CREA) VALUES('Consultar Citas', 'Calendario/Consultar', 1)	--60
INSERT INTO TB_RECURSO(NOMBRE, URL_RECURSO, USUARIO_CREA) VALUES('Ver experiencia formulador', 'Formulacion/Experiencia/[\d]+', 1)	--61
INSERT INTO TB_RECURSO(NOMBRE, URL_RECURSO, USUARIO_CREA) VALUES('Manual', 'ManualDeUsuario', 1)	--62


/* TABLA TB_PERMISO */
INSERT INTO TB_PERMISO(ID_ROL, ID_RECURSO, USUARIO_CREA) VALUES(7, 41, 1)
INSERT INTO TB_PERMISO(ID_ROL, ID_RECURSO, USUARIO_CREA) VALUES(7, 42, 1)
INSERT INTO TB_PERMISO(ID_ROL, ID_RECURSO, USUARIO_CREA) VALUES(4, 28, 1)

INSERT INTO TB_PERMISO(ID_ROL, ID_RECURSO, USUARIO_CREA) VALUES(2, 30, 1)
INSERT INTO TB_PERMISO(ID_ROL, ID_RECURSO, USUARIO_CREA) VALUES(2, 31, 1)
INSERT INTO TB_PERMISO(ID_ROL, ID_RECURSO, USUARIO_CREA) VALUES(2, 32, 1)
INSERT INTO TB_PERMISO(ID_ROL, ID_RECURSO, USUARIO_CREA) VALUES(4, 32, 1)
INSERT INTO TB_PERMISO(ID_ROL, ID_RECURSO, USUARIO_CREA) VALUES(2, 20, 1)
INSERT INTO TB_PERMISO(ID_ROL, ID_RECURSO, USUARIO_CREA) VALUES(2, 21, 1)
INSERT INTO TB_PERMISO(ID_ROL, ID_RECURSO, USUARIO_CREA) VALUES(2, 22, 1)
INSERT INTO TB_PERMISO(ID_ROL, ID_RECURSO, USUARIO_CREA) VALUES(2, 33, 1)
INSERT INTO TB_PERMISO(ID_ROL, ID_RECURSO, USUARIO_CREA) VALUES(3, 33, 1)
INSERT INTO TB_PERMISO(ID_ROL, ID_RECURSO, USUARIO_CREA) VALUES(4, 33, 1)
INSERT INTO TB_PERMISO(ID_ROL, ID_RECURSO, USUARIO_CREA) VALUES(5, 33, 1)
INSERT INTO TB_PERMISO(ID_ROL, ID_RECURSO, USUARIO_CREA) VALUES(6, 33, 1)
INSERT INTO TB_PERMISO(ID_ROL, ID_RECURSO, USUARIO_CREA) VALUES(5, 34, 1)
INSERT INTO TB_PERMISO(ID_ROL, ID_RECURSO, USUARIO_CREA) VALUES(2, 35, 1)
INSERT INTO TB_PERMISO(ID_ROL, ID_RECURSO, USUARIO_CREA) VALUES(3, 35, 1)
INSERT INTO TB_PERMISO(ID_ROL, ID_RECURSO, USUARIO_CREA) VALUES(4, 35, 1)
INSERT INTO TB_PERMISO(ID_ROL, ID_RECURSO, USUARIO_CREA) VALUES(5, 35, 1)
INSERT INTO TB_PERMISO(ID_ROL, ID_RECURSO, USUARIO_CREA) VALUES(7, 36, 1)
INSERT INTO TB_PERMISO(ID_ROL, ID_RECURSO, USUARIO_CREA) VALUES(2, 37, 1)
INSERT INTO TB_PERMISO(ID_ROL, ID_RECURSO, USUARIO_CREA) VALUES(3, 37, 1)
INSERT INTO TB_PERMISO(ID_ROL, ID_RECURSO, USUARIO_CREA) VALUES(4, 37, 1)
INSERT INTO TB_PERMISO(ID_ROL, ID_RECURSO, USUARIO_CREA) VALUES(5, 37, 1)
INSERT INTO TB_PERMISO(ID_ROL, ID_RECURSO, USUARIO_CREA) VALUES(5, 52, 1)
INSERT INTO TB_PERMISO(ID_ROL, ID_RECURSO, USUARIO_CREA) VALUES(2, 53, 1)
INSERT INTO TB_PERMISO(ID_ROL, ID_RECURSO, USUARIO_CREA) VALUES(3, 53, 1)
INSERT INTO TB_PERMISO(ID_ROL, ID_RECURSO, USUARIO_CREA) VALUES(4, 53, 1)
INSERT INTO TB_PERMISO(ID_ROL, ID_RECURSO, USUARIO_CREA) VALUES(5, 53, 1)
INSERT INTO TB_PERMISO(ID_ROL, ID_RECURSO, USUARIO_CREA) VALUES(2, 54, 1)
INSERT INTO TB_PERMISO(ID_ROL, ID_RECURSO, USUARIO_CREA) VALUES(5, 55, 1)
INSERT INTO TB_PERMISO(ID_ROL, ID_RECURSO, USUARIO_CREA) VALUES(4, 56, 1)
INSERT INTO TB_PERMISO(ID_ROL, ID_RECURSO, USUARIO_CREA) VALUES(4, 57, 1)
INSERT INTO TB_PERMISO(ID_ROL, ID_RECURSO, USUARIO_CREA) VALUES(4, 58, 1)
INSERT INTO TB_PERMISO(ID_ROL, ID_RECURSO, USUARIO_CREA) VALUES(4, 59, 1)
INSERT INTO TB_PERMISO(ID_ROL, ID_RECURSO, USUARIO_CREA) VALUES(2, 59, 1)
INSERT INTO TB_PERMISO(ID_ROL, ID_RECURSO, USUARIO_CREA) VALUES(3, 60, 1)
INSERT INTO TB_PERMISO(ID_ROL, ID_RECURSO, USUARIO_CREA) VALUES(2, 60, 1)
INSERT INTO TB_PERMISO(ID_ROL, ID_RECURSO, USUARIO_CREA) VALUES(5, 61, 1)
INSERT INTO TB_PERMISO(ID_ROL, ID_RECURSO, USUARIO_CREA) VALUES(1, 62, 1)
INSERT INTO TB_PERMISO(ID_ROL, ID_RECURSO, USUARIO_CREA) VALUES(2, 62, 1)
INSERT INTO TB_PERMISO(ID_ROL, ID_RECURSO, USUARIO_CREA) VALUES(3, 62, 1)
INSERT INTO TB_PERMISO(ID_ROL, ID_RECURSO, USUARIO_CREA) VALUES(4, 62, 1)
INSERT INTO TB_PERMISO(ID_ROL, ID_RECURSO, USUARIO_CREA) VALUES(5, 62, 1)
INSERT INTO TB_PERMISO(ID_ROL, ID_RECURSO, USUARIO_CREA) VALUES(6, 62, 1)
INSERT INTO TB_PERMISO(ID_ROL, ID_RECURSO, USUARIO_CREA) VALUES(7, 62, 1)


--ROLES:	1:ADMIN		2:BENEFICIARIO		3:CONSULTOR		4:FORMULADOR		5:COORDINADOR		6:EVALUADOR  7:presidente
--PRESIDENTE
INSERT INTO TB_PERMISO(ID_ROL, ID_RECURSO, USUARIO_CREA) VALUES(7, 16, 1)

INSERT INTO TB_PERMISO(ID_ROL, ID_RECURSO, USUARIO_CREA) VALUES(5, 24, 1)
INSERT INTO TB_PERMISO(ID_ROL, ID_RECURSO, USUARIO_CREA) VALUES(3, 27, 1)
--ADMINISTRADOR
INSERT INTO TB_PERMISO(ID_ROL, ID_RECURSO, USUARIO_CREA) VALUES(1, 1, 1)
INSERT INTO TB_PERMISO(ID_ROL, ID_RECURSO, USUARIO_CREA) VALUES(1, 2, 1)
INSERT INTO TB_PERMISO(ID_ROL, ID_RECURSO, USUARIO_CREA) VALUES(1, 3, 1)

INSERT INTO TB_PERMISO(ID_ROL, ID_RECURSO, USUARIO_CREA) VALUES(1, 43, 1)
INSERT INTO TB_PERMISO(ID_ROL, ID_RECURSO, USUARIO_CREA) VALUES(1, 44, 1)
INSERT INTO TB_PERMISO(ID_ROL, ID_RECURSO, USUARIO_CREA) VALUES(1, 45, 1)
INSERT INTO TB_PERMISO(ID_ROL, ID_RECURSO, USUARIO_CREA) VALUES(1, 46, 1)
INSERT INTO TB_PERMISO(ID_ROL, ID_RECURSO, USUARIO_CREA) VALUES(1, 47, 1)
INSERT INTO TB_PERMISO(ID_ROL, ID_RECURSO, USUARIO_CREA) VALUES(1, 48, 1)
INSERT INTO TB_PERMISO(ID_ROL, ID_RECURSO, USUARIO_CREA) VALUES(1, 49, 1)
INSERT INTO TB_PERMISO(ID_ROL, ID_RECURSO, USUARIO_CREA) VALUES(1, 50, 1)
INSERT INTO TB_PERMISO(ID_ROL, ID_RECURSO, USUARIO_CREA) VALUES(1, 51, 1)
INSERT INTO TB_PERMISO(ID_ROL, ID_RECURSO, USUARIO_CREA) VALUES(1, 4, 1)
INSERT INTO TB_PERMISO(ID_ROL, ID_RECURSO, USUARIO_CREA) VALUES(2, 4, 1)
INSERT INTO TB_PERMISO(ID_ROL, ID_RECURSO, USUARIO_CREA) VALUES(3, 4, 1)
INSERT INTO TB_PERMISO(ID_ROL, ID_RECURSO, USUARIO_CREA) VALUES(4, 4, 1)
INSERT INTO TB_PERMISO(ID_ROL, ID_RECURSO, USUARIO_CREA) VALUES(5, 4, 1)
INSERT INTO TB_PERMISO(ID_ROL, ID_RECURSO, USUARIO_CREA) VALUES(6, 4, 1)
INSERT INTO TB_PERMISO(ID_ROL, ID_RECURSO, USUARIO_CREA) VALUES(1, 38, 1)
INSERT INTO TB_PERMISO(ID_ROL, ID_RECURSO, USUARIO_CREA) VALUES(1, 39, 1)
INSERT INTO TB_PERMISO(ID_ROL, ID_RECURSO, USUARIO_CREA) VALUES(1, 40, 1)
--BENEFICIARIO
INSERT INTO TB_PERMISO(ID_ROL, ID_RECURSO, USUARIO_CREA) VALUES(2, 5, 1)
INSERT INTO TB_PERMISO(ID_ROL, ID_RECURSO, USUARIO_CREA) VALUES(3, 5, 1)
INSERT INTO TB_PERMISO(ID_ROL, ID_RECURSO, USUARIO_CREA) VALUES(5, 5, 1)
INSERT INTO TB_PERMISO(ID_ROL, ID_RECURSO, USUARIO_CREA) VALUES(2, 6, 1)
INSERT INTO TB_PERMISO(ID_ROL, ID_RECURSO, USUARIO_CREA) VALUES(3, 6, 1)
INSERT INTO TB_PERMISO(ID_ROL, ID_RECURSO, USUARIO_CREA) VALUES(5, 6, 1)
INSERT INTO TB_PERMISO(ID_ROL, ID_RECURSO, USUARIO_CREA) VALUES(2, 7, 1)
INSERT INTO TB_PERMISO(ID_ROL, ID_RECURSO, USUARIO_CREA) VALUES(2, 8, 1)

INSERT INTO TB_PERMISO(ID_ROL, ID_RECURSO, USUARIO_CREA) VALUES(3, 25, 1)
INSERT INTO TB_PERMISO(ID_ROL, ID_RECURSO, USUARIO_CREA) VALUES(3, 26, 1)

INSERT INTO TB_PERMISO(ID_ROL, ID_RECURSO, USUARIO_CREA) VALUES(5, 25, 1)

--CALENDARIO
INSERT INTO TB_PERMISO(ID_ROL, ID_RECURSO, USUARIO_CREA) VALUES(3, 9, 1)

--CASOS
INSERT INTO TB_PERMISO(ID_ROL, ID_RECURSO, USUARIO_CREA) VALUES(2, 10, 1)
INSERT INTO TB_PERMISO(ID_ROL, ID_RECURSO, USUARIO_CREA) VALUES(3, 10, 1)
INSERT INTO TB_PERMISO(ID_ROL, ID_RECURSO, USUARIO_CREA) VALUES(4, 10, 1)
INSERT INTO TB_PERMISO(ID_ROL, ID_RECURSO, USUARIO_CREA) VALUES(5, 10, 1)

INSERT INTO TB_PERMISO(ID_ROL, ID_RECURSO, USUARIO_CREA) VALUES(2, 11, 1)
INSERT INTO TB_PERMISO(ID_ROL, ID_RECURSO, USUARIO_CREA) VALUES(3, 11, 1)
INSERT INTO TB_PERMISO(ID_ROL, ID_RECURSO, USUARIO_CREA) VALUES(4, 11, 1)
INSERT INTO TB_PERMISO(ID_ROL, ID_RECURSO, USUARIO_CREA) VALUES(5, 11, 1)
INSERT INTO TB_PERMISO(ID_ROL, ID_RECURSO, USUARIO_CREA) VALUES(2, 12, 1)
INSERT INTO TB_PERMISO(ID_ROL, ID_RECURSO, USUARIO_CREA) VALUES(3, 12, 1)
INSERT INTO TB_PERMISO(ID_ROL, ID_RECURSO, USUARIO_CREA) VALUES(4, 12, 1)
INSERT INTO TB_PERMISO(ID_ROL, ID_RECURSO, USUARIO_CREA) VALUES(5, 12, 1)

INSERT INTO TB_PERMISO(ID_ROL, ID_RECURSO, USUARIO_CREA) VALUES(2, 13, 1)
INSERT INTO TB_PERMISO(ID_ROL, ID_RECURSO, USUARIO_CREA) VALUES(3, 13, 1)
INSERT INTO TB_PERMISO(ID_ROL, ID_RECURSO, USUARIO_CREA) VALUES(4, 13, 1)

INSERT INTO TB_PERMISO(ID_ROL, ID_RECURSO, USUARIO_CREA) VALUES(4, 14, 1)

INSERT INTO TB_PERMISO(ID_ROL, ID_RECURSO, USUARIO_CREA) VALUES(2, 15, 1)
INSERT INTO TB_PERMISO(ID_ROL, ID_RECURSO, USUARIO_CREA) VALUES(3, 15, 1)
INSERT INTO TB_PERMISO(ID_ROL, ID_RECURSO, USUARIO_CREA) VALUES(4, 15, 1)
INSERT INTO TB_PERMISO(ID_ROL, ID_RECURSO, USUARIO_CREA) VALUES(5, 15, 1)

INSERT INTO TB_PERMISO(ID_ROL, ID_RECURSO, USUARIO_CREA) VALUES(2, 16, 1)
INSERT INTO TB_PERMISO(ID_ROL, ID_RECURSO, USUARIO_CREA) VALUES(3, 16, 1)
INSERT INTO TB_PERMISO(ID_ROL, ID_RECURSO, USUARIO_CREA) VALUES(4, 16, 1)
INSERT INTO TB_PERMISO(ID_ROL, ID_RECURSO, USUARIO_CREA) VALUES(5, 16, 1)
INSERT INTO TB_PERMISO(ID_ROL, ID_RECURSO, USUARIO_CREA) VALUES(6, 16, 1)

INSERT INTO TB_PERMISO(ID_ROL, ID_RECURSO, USUARIO_CREA) VALUES(2, 17, 1)
INSERT INTO TB_PERMISO(ID_ROL, ID_RECURSO, USUARIO_CREA) VALUES(3, 17, 1)
INSERT INTO TB_PERMISO(ID_ROL, ID_RECURSO, USUARIO_CREA) VALUES(4, 17, 1)
INSERT INTO TB_PERMISO(ID_ROL, ID_RECURSO, USUARIO_CREA) VALUES(5, 17, 1)
INSERT INTO TB_PERMISO(ID_ROL, ID_RECURSO, USUARIO_CREA) VALUES(6, 17, 1)

INSERT INTO TB_PERMISO(ID_ROL, ID_RECURSO, USUARIO_CREA) VALUES(5, 18, 1)

INSERT INTO TB_PERMISO(ID_ROL, ID_RECURSO, USUARIO_CREA) VALUES(6, 19, 1)

INSERT INTO TB_PERMISO(ID_ROL, ID_RECURSO, USUARIO_CREA) VALUES(4, 20, 1)
INSERT INTO TB_PERMISO(ID_ROL, ID_RECURSO, USUARIO_CREA) VALUES(4, 21, 1)
INSERT INTO TB_PERMISO(ID_ROL, ID_RECURSO, USUARIO_CREA) VALUES(4, 22, 1)

INSERT INTO TB_PERMISO(ID_ROL, ID_RECURSO, USUARIO_CREA) VALUES(4, 23, 1)
INSERT INTO TB_PERMISO(ID_ROL, ID_RECURSO, USUARIO_CREA) VALUES(5, 23, 1)

--EXPERIENCIA DE FORMULADOR
INSERT INTO TB_PERMISO(ID_ROL, ID_RECURSO, USUARIO_CREA) VALUES(4, 29, 1)
GO
/* TABLA TBC_TIPO_INICIATIVA */
SET IDENTITY_INSERT [dbo].[TBC_TIPO_INICIATIVA] ON 
GO
INSERT [dbo].[TBC_TIPO_INICIATIVA] ([ID_TIPO_INICIATIVA], [NOMBRE], [CODIGO_TIPO_INICIATVA]) VALUES (1, N'Adopcion', N'ADPN')
GO
INSERT [dbo].[TBC_TIPO_INICIATIVA] ([ID_TIPO_INICIATIVA], [NOMBRE], [CODIGO_TIPO_INICIATVA]) VALUES (2, N'Asistencia', N'ASTC')
GO
INSERT [dbo].[TBC_TIPO_INICIATIVA] ([ID_TIPO_INICIATIVA], [NOMBRE], [CODIGO_TIPO_INICIATVA]) VALUES (3, N'Innovacion', N'INNV')
GO
INSERT [dbo].[TBC_TIPO_INICIATIVA] ([ID_TIPO_INICIATIVA], [NOMBRE], [CODIGO_TIPO_INICIATVA]) VALUES (4, N'Integral', N'INTG')
GO
SET IDENTITY_INSERT [dbo].[TBC_TIPO_INICIATIVA] OFF
GO
INSERT INTO TB_CONFIGURACION(PARAMETRO,VALOR,CODIGO_CONFIGURACION) VALUES ('Numero de evaluadores del comite',1,'NO_EVAL')
GO 
SET IDENTITY_INSERT [dbo].[TBC_CAMPOS_INICIATIVA] ON
go
--INSERT CAMPOS INICIATIVA
--Adopcion
INSERT INTO TBC_CAMPOS_INICIATIVA(ID_CAMPO,ID_TIPO_INICIATIVA,NOMBRE_CAMPO) VALUES(1,1,'Planteamiento del Problema u oportunidad a ser aprovechada')
INSERT INTO TBC_CAMPOS_INICIATIVA(ID_CAMPO,ID_TIPO_INICIATIVA,NOMBRE_CAMPO) VALUES(2,1,'Planteamiento descriptivo de la solucion o Problema u oportunidad')
INSERT INTO TBC_CAMPOS_INICIATIVA(ID_CAMPO,ID_TIPO_INICIATIVA,NOMBRE_CAMPO) VALUES(3,1,'Descripción de la Relevancia')
INSERT INTO TBC_CAMPOS_INICIATIVA(ID_CAMPO,ID_TIPO_INICIATIVA,NOMBRE_CAMPO) VALUES(4,1,'Incrementos esperados en ventas')
INSERT INTO TBC_CAMPOS_INICIATIVA(ID_CAMPO,ID_TIPO_INICIATIVA,NOMBRE_CAMPO) VALUES(5,1,'Incrementos en ventas o mejora')
INSERT INTO TBC_CAMPOS_INICIATIVA(ID_CAMPO,ID_TIPO_INICIATIVA,NOMBRE_CAMPO) VALUES(6,1,'Ejecucion Solo')
INSERT INTO TBC_CAMPOS_INICIATIVA(ID_CAMPO,ID_TIPO_INICIATIVA,NOMBRE_CAMPO) VALUES(7,1,'Ejecucion Asistida')
INSERT INTO TBC_CAMPOS_INICIATIVA(ID_CAMPO,ID_TIPO_INICIATIVA,NOMBRE_CAMPO) VALUES(8,1,'Descripción de la Adopción o incorporación Tecnológica')
INSERT INTO TBC_CAMPOS_INICIATIVA(ID_CAMPO,ID_TIPO_INICIATIVA,NOMBRE_CAMPO) VALUES(9,1,'Efectos esperados sobre el problema')
INSERT INTO TBC_CAMPOS_INICIATIVA(ID_CAMPO,ID_TIPO_INICIATIVA,NOMBRE_CAMPO) VALUES(10,1,'Efectos esperados sobre  el negocio')
INSERT INTO TBC_CAMPOS_INICIATIVA(ID_CAMPO,ID_TIPO_INICIATIVA,NOMBRE_CAMPO) VALUES(11,1,'Justificacion de la tecnologia propuesta')
INSERT INTO TBC_CAMPOS_INICIATIVA(ID_CAMPO,ID_TIPO_INICIATIVA,NOMBRE_CAMPO) VALUES(12,1,'Incrementos esperados en el margen de utilidad')
INSERT INTO TBC_CAMPOS_INICIATIVA(ID_CAMPO,ID_TIPO_INICIATIVA,NOMBRE_CAMPO) VALUES(13,1,'Incremento en la producción actual')
INSERT INTO TBC_CAMPOS_INICIATIVA(ID_CAMPO,ID_TIPO_INICIATIVA,NOMBRE_CAMPO) VALUES(14,1,'Como se colocara el nuevo volumen en el mercado')
INSERT INTO TBC_CAMPOS_INICIATIVA(ID_CAMPO,ID_TIPO_INICIATIVA,NOMBRE_CAMPO) VALUES(15,1,'Reducir el tiempo de procesos productivos con métodos y/o tecnologías alternativas a las utilizadas en la actualidad')
INSERT INTO TBC_CAMPOS_INICIATIVA(ID_CAMPO,ID_TIPO_INICIATIVA,NOMBRE_CAMPO) VALUES(16,1,'Disminuir el consumo de energía o combustible en la producción, recolección, procesos y entrega de los bienes actuales')
INSERT INTO TBC_CAMPOS_INICIATIVA(ID_CAMPO,ID_TIPO_INICIATIVA,NOMBRE_CAMPO) VALUES(17,1,'Reducir el consumo de materia prima con tecnología no utilizada actualmente por el beneficiario')
INSERT INTO TBC_CAMPOS_INICIATIVA(ID_CAMPO,ID_TIPO_INICIATIVA,NOMBRE_CAMPO) VALUES(18,1,'Otros a ser considerados Descripcion')
INSERT INTO TBC_CAMPOS_INICIATIVA(ID_CAMPO,ID_TIPO_INICIATIVA,NOMBRE_CAMPO) VALUES(19,1,'Componentes o tecnología Adicional  necesaria para el funcionamiento de la tecnología')
--fondepro
INSERT INTO TBC_CAMPOS_INICIATIVA(ID_CAMPO,ID_TIPO_INICIATIVA,NOMBRE_CAMPO) VALUES(20,1,'Descripción de monto Fondepro')
INSERT INTO TBC_CAMPOS_INICIATIVA(ID_CAMPO,ID_TIPO_INICIATIVA,NOMBRE_CAMPO) VALUES(21,1,'Adopción o incorporación Tecnológica')
INSERT INTO TBC_CAMPOS_INICIATIVA(ID_CAMPO,ID_TIPO_INICIATIVA,NOMBRE_CAMPO) VALUES(22,1,'Componentes acciones y/o tecnología Adicional necesaria para la Adquisición, internación, instalación y/o el funcionamiento de la tecnología')
INSERT INTO TBC_CAMPOS_INICIATIVA(ID_CAMPO,ID_TIPO_INICIATIVA,NOMBRE_CAMPO) VALUES(23,1,'Otros a ser considerados')
-- descripcion de contrapartida
INSERT INTO TBC_CAMPOS_INICIATIVA(ID_CAMPO,ID_TIPO_INICIATIVA,NOMBRE_CAMPO) VALUES(24,1,'Descripcion del monto en especies')
INSERT INTO TBC_CAMPOS_INICIATIVA(ID_CAMPO,ID_TIPO_INICIATIVA,NOMBRE_CAMPO) VALUES(25,1,'Monto especies')
INSERT INTO TBC_CAMPOS_INICIATIVA(ID_CAMPO,ID_TIPO_INICIATIVA,NOMBRE_CAMPO) VALUES(26,1,'Descripcion del monto en efectivo')
INSERT INTO TBC_CAMPOS_INICIATIVA(ID_CAMPO,ID_TIPO_INICIATIVA,NOMBRE_CAMPO) VALUES(27,1,'Monto Efectivo')
INSERT INTO TBC_CAMPOS_INICIATIVA(ID_CAMPO,ID_TIPO_INICIATIVA,NOMBRE_CAMPO) VALUES(184,1,'Monto Contra partida Beneficiario')


INSERT INTO TBC_CAMPOS_INICIATIVA(ID_CAMPO,ID_TIPO_INICIATIVA,NOMBRE_CAMPO) VALUES(28,1,'fecha inicio')
INSERT INTO TBC_CAMPOS_INICIATIVA(ID_CAMPO,ID_TIPO_INICIATIVA,NOMBRE_CAMPO) VALUES(29,1,'La tecnología se encuentra disponible localmente')
INSERT INTO TBC_CAMPOS_INICIATIVA(ID_CAMPO,ID_TIPO_INICIATIVA,NOMBRE_CAMPO) VALUES(30,1,'cronograma')
--Asistencia
INSERT INTO TBC_CAMPOS_INICIATIVA(ID_CAMPO,ID_TIPO_INICIATIVA,NOMBRE_CAMPO) VALUES(31,2,'Planteamiento del Problema u oportunidad a ser aprovechada')
INSERT INTO TBC_CAMPOS_INICIATIVA(ID_CAMPO,ID_TIPO_INICIATIVA,NOMBRE_CAMPO) VALUES(32,2,'Planteamiento descriptivo de la solucion o Problema u oportunidad')
INSERT INTO TBC_CAMPOS_INICIATIVA(ID_CAMPO,ID_TIPO_INICIATIVA,NOMBRE_CAMPO) VALUES(33,2,'Descripción de la Relevancia')
INSERT INTO TBC_CAMPOS_INICIATIVA(ID_CAMPO,ID_TIPO_INICIATIVA,NOMBRE_CAMPO) VALUES(34,2,'Incrementos esperados en ventas')
INSERT INTO TBC_CAMPOS_INICIATIVA(ID_CAMPO,ID_TIPO_INICIATIVA,NOMBRE_CAMPO) VALUES(35,2,'Incrementos en ventas o mejora')
INSERT INTO TBC_CAMPOS_INICIATIVA(ID_CAMPO,ID_TIPO_INICIATIVA,NOMBRE_CAMPO) VALUES(36,2,'Ejecucion Solo')
INSERT INTO TBC_CAMPOS_INICIATIVA(ID_CAMPO,ID_TIPO_INICIATIVA,NOMBRE_CAMPO) VALUES(37,2,'Ejecucion Asistida')
INSERT INTO TBC_CAMPOS_INICIATIVA(ID_CAMPO,ID_TIPO_INICIATIVA,NOMBRE_CAMPO) VALUES(38,2,'Metodologia Sugerida')
INSERT INTO TBC_CAMPOS_INICIATIVA(ID_CAMPO,ID_TIPO_INICIATIVA,NOMBRE_CAMPO) VALUES(39,2,'el conocimiento se encuentra disponible localmente')
INSERT INTO TBC_CAMPOS_INICIATIVA(ID_CAMPO,ID_TIPO_INICIATIVA,NOMBRE_CAMPO) VALUES(40,2,'Debe venir alguien y atender el tema localmente ')
INSERT INTO TBC_CAMPOS_INICIATIVA(ID_CAMPO,ID_TIPO_INICIATIVA,NOMBRE_CAMPO) VALUES(41,2,'Debe alguien de la iniciativa ir y recibir el entrenamiento o transferencia')
INSERT INTO TBC_CAMPOS_INICIATIVA(ID_CAMPO,ID_TIPO_INICIATIVA,NOMBRE_CAMPO) VALUES(42,2,'MIXTA')
INSERT INTO TBC_CAMPOS_INICIATIVA(ID_CAMPO,ID_TIPO_INICIATIVA,NOMBRE_CAMPO) VALUES(43,2,'Duracion en dias')
INSERT INTO TBC_CAMPOS_INICIATIVA(ID_CAMPO,ID_TIPO_INICIATIVA,NOMBRE_CAMPO) VALUES(44,2,'Locacion')
INSERT INTO TBC_CAMPOS_INICIATIVA(ID_CAMPO,ID_TIPO_INICIATIVA,NOMBRE_CAMPO) VALUES(45,2,'Require de recursos tecnicos adicionales')
INSERT INTO TBC_CAMPOS_INICIATIVA(ID_CAMPO,ID_TIPO_INICIATIVA,NOMBRE_CAMPO) VALUES(46,2,'existe necesidad de conocimiento previo para que sea asimilada de forma correcta')
INSERT INTO TBC_CAMPOS_INICIATIVA(ID_CAMPO,ID_TIPO_INICIATIVA,NOMBRE_CAMPO) VALUES(47,2,'Describa los requerimientos previos')
INSERT INTO TBC_CAMPOS_INICIATIVA(ID_CAMPO,ID_TIPO_INICIATIVA,NOMBRE_CAMPO) VALUES(48,2,'Tiene el beneficiario o cumple con los anteriores')
INSERT INTO TBC_CAMPOS_INICIATIVA(ID_CAMPO,ID_TIPO_INICIATIVA,NOMBRE_CAMPO) VALUES(49,2,'Componentes o insumos necesarios para lograr el impacto de la asistencia tecnica y/o la transferenica de conocimiento')
INSERT INTO TBC_CAMPOS_INICIATIVA(ID_CAMPO,ID_TIPO_INICIATIVA,NOMBRE_CAMPO) VALUES(50,2,'Efectos esperados sobre el problema')
INSERT INTO TBC_CAMPOS_INICIATIVA(ID_CAMPO,ID_TIPO_INICIATIVA,NOMBRE_CAMPO) VALUES(51,2,'Efectos esperados sobre  el negocio')
INSERT INTO TBC_CAMPOS_INICIATIVA(ID_CAMPO,ID_TIPO_INICIATIVA,NOMBRE_CAMPO) VALUES(52,2,'Incrementos esperados en el margen de utilidad')
INSERT INTO TBC_CAMPOS_INICIATIVA(ID_CAMPO,ID_TIPO_INICIATIVA,NOMBRE_CAMPO) VALUES(53,2,'Reducir el tiempo de procesos productivos con métodos y/o tecnologías alternativas a las utilizadas en la actualidad')
INSERT INTO TBC_CAMPOS_INICIATIVA(ID_CAMPO,ID_TIPO_INICIATIVA,NOMBRE_CAMPO) VALUES(54,2,'Disminuir el consumo de energía o combustible en la producción, recolección, procesos y entrega de los bienes actuales')
INSERT INTO TBC_CAMPOS_INICIATIVA(ID_CAMPO,ID_TIPO_INICIATIVA,NOMBRE_CAMPO) VALUES(55,2,'Reducir el consumo de materia prima con tecnología no utilizada actualmente por el beneficiario')
INSERT INTO TBC_CAMPOS_INICIATIVA(ID_CAMPO,ID_TIPO_INICIATIVA,NOMBRE_CAMPO) VALUES(56,2,'Otros a ser considerados ')

INSERT INTO TBC_CAMPOS_INICIATIVA(ID_CAMPO,ID_TIPO_INICIATIVA,NOMBRE_CAMPO) VALUES(57,2,'Descripción de contrapartida')
INSERT INTO TBC_CAMPOS_INICIATIVA(ID_CAMPO,ID_TIPO_INICIATIVA,NOMBRE_CAMPO) VALUES(58,2,'Asistenica Tecnica y/o Transferencia tecnologica')
INSERT INTO TBC_CAMPOS_INICIATIVA(ID_CAMPO,ID_TIPO_INICIATIVA,NOMBRE_CAMPO) VALUES(59,2,'Recursos Adicionales para la Asistencia tecnica o transferecia de conocimiento')
INSERT INTO TBC_CAMPOS_INICIATIVA(ID_CAMPO,ID_TIPO_INICIATIVA,NOMBRE_CAMPO) VALUES(60,2,'Otros a ser considerados')
INSERT INTO TBC_CAMPOS_INICIATIVA(ID_CAMPO,ID_TIPO_INICIATIVA,NOMBRE_CAMPO) VALUES(61,2,'Descripcion del monto en especies')
INSERT INTO TBC_CAMPOS_INICIATIVA(ID_CAMPO,ID_TIPO_INICIATIVA,NOMBRE_CAMPO) VALUES(62,2,'Monto especies')
INSERT INTO TBC_CAMPOS_INICIATIVA(ID_CAMPO,ID_TIPO_INICIATIVA,NOMBRE_CAMPO) VALUES(63,2,'Descripcion del monto en efectivo')
INSERT INTO TBC_CAMPOS_INICIATIVA(ID_CAMPO,ID_TIPO_INICIATIVA,NOMBRE_CAMPO) VALUES(64,2,'Monto Efectivo')
INSERT INTO TBC_CAMPOS_INICIATIVA(ID_CAMPO,ID_TIPO_INICIATIVA,NOMBRE_CAMPO) VALUES(185,2,'Monto Contra partida Beneficiario')
INSERT INTO TBC_CAMPOS_INICIATIVA(ID_CAMPO,ID_TIPO_INICIATIVA,NOMBRE_CAMPO) VALUES(65,2,'fecha inicio')
INSERT INTO TBC_CAMPOS_INICIATIVA(ID_CAMPO,ID_TIPO_INICIATIVA,NOMBRE_CAMPO) VALUES(66,2,'cronograma')
--Innovacion
INSERT INTO TBC_CAMPOS_INICIATIVA(ID_CAMPO,ID_TIPO_INICIATIVA,NOMBRE_CAMPO) VALUES(67,3,'Planteamiento del Problema u oportunidad a ser aprovechada')
INSERT INTO TBC_CAMPOS_INICIATIVA(ID_CAMPO,ID_TIPO_INICIATIVA,NOMBRE_CAMPO) VALUES(68,3,'Planteamiento descriptivo de la solucion o Problema u oportunidad')
INSERT INTO TBC_CAMPOS_INICIATIVA(ID_CAMPO,ID_TIPO_INICIATIVA,NOMBRE_CAMPO) VALUES(69,3,'Descripción de la Relevancia')
INSERT INTO TBC_CAMPOS_INICIATIVA(ID_CAMPO,ID_TIPO_INICIATIVA,NOMBRE_CAMPO) VALUES(70,3,'Incrementos esperados en ventas')
INSERT INTO TBC_CAMPOS_INICIATIVA(ID_CAMPO,ID_TIPO_INICIATIVA,NOMBRE_CAMPO) VALUES(71,3,'Incrementos en ventas o mejora')
INSERT INTO TBC_CAMPOS_INICIATIVA(ID_CAMPO,ID_TIPO_INICIATIVA,NOMBRE_CAMPO) VALUES(72,3,'Ejecucion Solo')
INSERT INTO TBC_CAMPOS_INICIATIVA(ID_CAMPO,ID_TIPO_INICIATIVA,NOMBRE_CAMPO) VALUES(73,3,'Ejecucion Asistida')
INSERT INTO TBC_CAMPOS_INICIATIVA(ID_CAMPO,ID_TIPO_INICIATIVA,NOMBRE_CAMPO) VALUES(74,3,'Producto')
INSERT INTO TBC_CAMPOS_INICIATIVA(ID_CAMPO,ID_TIPO_INICIATIVA,NOMBRE_CAMPO) VALUES(75,3,'Proceso')
INSERT INTO TBC_CAMPOS_INICIATIVA(ID_CAMPO,ID_TIPO_INICIATIVA,NOMBRE_CAMPO) VALUES(76,3,'Modelo de comercializacion')
INSERT INTO TBC_CAMPOS_INICIATIVA(ID_CAMPO,ID_TIPO_INICIATIVA,NOMBRE_CAMPO) VALUES(77,3,'Los insumos para el desarrollo se encuentra disponible localmente')
INSERT INTO TBC_CAMPOS_INICIATIVA(ID_CAMPO,ID_TIPO_INICIATIVA,NOMBRE_CAMPO) VALUES(78,3,'Describa genericamente los insumos necesarios')
INSERT INTO TBC_CAMPOS_INICIATIVA(ID_CAMPO,ID_TIPO_INICIATIVA,NOMBRE_CAMPO) VALUES(79,3,'el proyecto requerira de insumos de parte del  beneficiario')
INSERT INTO TBC_CAMPOS_INICIATIVA(ID_CAMPO,ID_TIPO_INICIATIVA,NOMBRE_CAMPO) VALUES(80,3,'Describalos')
INSERT INTO TBC_CAMPOS_INICIATIVA(ID_CAMPO,ID_TIPO_INICIATIVA,NOMBRE_CAMPO) VALUES(81,3,'Debe venir alguien y atender el tema localmente')
INSERT INTO TBC_CAMPOS_INICIATIVA(ID_CAMPO,ID_TIPO_INICIATIVA,NOMBRE_CAMPO) VALUES(82,3,'Debe alguien de la iniciativa ir y recibir el entrenamiento o transferencia')
INSERT INTO TBC_CAMPOS_INICIATIVA(ID_CAMPO,ID_TIPO_INICIATIVA,NOMBRE_CAMPO) VALUES(83,3,'MIXTA')
INSERT INTO TBC_CAMPOS_INICIATIVA(ID_CAMPO,ID_TIPO_INICIATIVA,NOMBRE_CAMPO) VALUES(84,3,'Duracion en dias')
INSERT INTO TBC_CAMPOS_INICIATIVA(ID_CAMPO,ID_TIPO_INICIATIVA,NOMBRE_CAMPO) VALUES(85,3,'Locacion')
INSERT INTO TBC_CAMPOS_INICIATIVA(ID_CAMPO,ID_TIPO_INICIATIVA,NOMBRE_CAMPO) VALUES(86,3,'Requiere de recursos tecnicos adicionales')
INSERT INTO TBC_CAMPOS_INICIATIVA(ID_CAMPO,ID_TIPO_INICIATIVA,NOMBRE_CAMPO) VALUES(87,3,'existe necesidad de conocimiento previo para que sea asimilada de forma correcta')
INSERT INTO TBC_CAMPOS_INICIATIVA(ID_CAMPO,ID_TIPO_INICIATIVA,NOMBRE_CAMPO) VALUES(88,3,'Describa los requerimientos previos')
INSERT INTO TBC_CAMPOS_INICIATIVA(ID_CAMPO,ID_TIPO_INICIATIVA,NOMBRE_CAMPO) VALUES(89,3,'Tiene el beneficiario o cumple con los anteriores')
INSERT INTO TBC_CAMPOS_INICIATIVA(ID_CAMPO,ID_TIPO_INICIATIVA,NOMBRE_CAMPO) VALUES(90,3,'Componentes o insumos necesarios para lograr el impacto de la asistencia tecnica y/o la transferenica de conocimiento')
INSERT INTO TBC_CAMPOS_INICIATIVA(ID_CAMPO,ID_TIPO_INICIATIVA,NOMBRE_CAMPO) VALUES(91,3,'Efectos esperados sobre el problema')
INSERT INTO TBC_CAMPOS_INICIATIVA(ID_CAMPO,ID_TIPO_INICIATIVA,NOMBRE_CAMPO) VALUES(92,3,'Efectos esperados sobre  el negocio')
INSERT INTO TBC_CAMPOS_INICIATIVA(ID_CAMPO,ID_TIPO_INICIATIVA,NOMBRE_CAMPO) VALUES(93,3,'Incrementos esperados en el margen de utilidad')
INSERT INTO TBC_CAMPOS_INICIATIVA(ID_CAMPO,ID_TIPO_INICIATIVA,NOMBRE_CAMPO) VALUES(94,3,'Reducir el tiempo de procesos productivos con métodos y/o tecnologías alternativas a las utilizadas en la actualidad')
INSERT INTO TBC_CAMPOS_INICIATIVA(ID_CAMPO,ID_TIPO_INICIATIVA,NOMBRE_CAMPO) VALUES(95,3,'Disminuir el consumo de energía o combustible en la producción, recolección, procesos y entrega de los bienes actuales')
INSERT INTO TBC_CAMPOS_INICIATIVA(ID_CAMPO,ID_TIPO_INICIATIVA,NOMBRE_CAMPO) VALUES(96,3,'Reducir el consumo de materia prima con tecnología no utilizada actualmente por el beneficiario')
INSERT INTO TBC_CAMPOS_INICIATIVA(ID_CAMPO,ID_TIPO_INICIATIVA,NOMBRE_CAMPO) VALUES(97,3,'Descripcion Otros a ser considerados')
INSERT INTO TBC_CAMPOS_INICIATIVA(ID_CAMPO,ID_TIPO_INICIATIVA,NOMBRE_CAMPO) VALUES(98,3,'Descripción de contrapartida')
INSERT INTO TBC_CAMPOS_INICIATIVA(ID_CAMPO,ID_TIPO_INICIATIVA,NOMBRE_CAMPO) VALUES(99,3,'Iniciativa de Proyecto de Innovación y o desarrollo Tecnológico')
INSERT INTO TBC_CAMPOS_INICIATIVA(ID_CAMPO,ID_TIPO_INICIATIVA,NOMBRE_CAMPO) VALUES(100,3,'Recursos Adicionales para el Proyecto de Innovación y o desarrollo Tecnológico')
INSERT INTO TBC_CAMPOS_INICIATIVA(ID_CAMPO,ID_TIPO_INICIATIVA,NOMBRE_CAMPO) VALUES(101,3,'Otros a ser considerados')
INSERT INTO TBC_CAMPOS_INICIATIVA(ID_CAMPO,ID_TIPO_INICIATIVA,NOMBRE_CAMPO) VALUES(102,3,'Descripcion del monto en especies')
INSERT INTO TBC_CAMPOS_INICIATIVA(ID_CAMPO,ID_TIPO_INICIATIVA,NOMBRE_CAMPO) VALUES(103,3,'Monto especies')
INSERT INTO TBC_CAMPOS_INICIATIVA(ID_CAMPO,ID_TIPO_INICIATIVA,NOMBRE_CAMPO) VALUES(104,3,'Descripcion del monto en efectivo')
INSERT INTO TBC_CAMPOS_INICIATIVA(ID_CAMPO,ID_TIPO_INICIATIVA,NOMBRE_CAMPO) VALUES(105,3,'Monto Efectivo')
INSERT INTO TBC_CAMPOS_INICIATIVA(ID_CAMPO,ID_TIPO_INICIATIVA,NOMBRE_CAMPO) VALUES(186,3,'Monto Contra partida Beneficiario')
INSERT INTO TBC_CAMPOS_INICIATIVA(ID_CAMPO,ID_TIPO_INICIATIVA,NOMBRE_CAMPO) VALUES(106,3,'fecha inicio')
INSERT INTO TBC_CAMPOS_INICIATIVA(ID_CAMPO,ID_TIPO_INICIATIVA,NOMBRE_CAMPO) VALUES(107,3,'cronograma')
--Integral
INSERT INTO TBC_CAMPOS_INICIATIVA(ID_CAMPO,ID_TIPO_INICIATIVA,NOMBRE_CAMPO) VALUES(108,4,'Planteamiento del Problema u oportunidad a ser aprovechada')
INSERT INTO TBC_CAMPOS_INICIATIVA(ID_CAMPO,ID_TIPO_INICIATIVA,NOMBRE_CAMPO) VALUES(109,4,'Planteamiento descriptivo de la solucion o Problema u oportunidad')
INSERT INTO TBC_CAMPOS_INICIATIVA(ID_CAMPO,ID_TIPO_INICIATIVA,NOMBRE_CAMPO) VALUES(110,4,'Descripción de la Relevancia')
INSERT INTO TBC_CAMPOS_INICIATIVA(ID_CAMPO,ID_TIPO_INICIATIVA,NOMBRE_CAMPO) VALUES(111,4,'Incrementos esperados en ventas')
INSERT INTO TBC_CAMPOS_INICIATIVA(ID_CAMPO,ID_TIPO_INICIATIVA,NOMBRE_CAMPO) VALUES(112,4,'Incrementos en ventas o mejora')
INSERT INTO TBC_CAMPOS_INICIATIVA(ID_CAMPO,ID_TIPO_INICIATIVA,NOMBRE_CAMPO) VALUES(113,4,'Ejecucion Solo')
INSERT INTO TBC_CAMPOS_INICIATIVA(ID_CAMPO,ID_TIPO_INICIATIVA,NOMBRE_CAMPO) VALUES(114,4,'Ejecucion Asistida')
INSERT INTO TBC_CAMPOS_INICIATIVA(ID_CAMPO,ID_TIPO_INICIATIVA,NOMBRE_CAMPO) VALUES(115,4,'Descripción de la Adopción o incorporación Tecnológica')
INSERT INTO TBC_CAMPOS_INICIATIVA(ID_CAMPO,ID_TIPO_INICIATIVA,NOMBRE_CAMPO) VALUES(116,4,'Efectos esperados sobre el problema')
INSERT INTO TBC_CAMPOS_INICIATIVA(ID_CAMPO,ID_TIPO_INICIATIVA,NOMBRE_CAMPO) VALUES(117,4,'Efectos esperados sobre  el negocio')
INSERT INTO TBC_CAMPOS_INICIATIVA(ID_CAMPO,ID_TIPO_INICIATIVA,NOMBRE_CAMPO) VALUES(118,4,'Justificacion de la tecnologia propuesta')
INSERT INTO TBC_CAMPOS_INICIATIVA(ID_CAMPO,ID_TIPO_INICIATIVA,NOMBRE_CAMPO) VALUES(119,4,'Incrementos esperados en el margen de utilidad')
INSERT INTO TBC_CAMPOS_INICIATIVA(ID_CAMPO,ID_TIPO_INICIATIVA,NOMBRE_CAMPO) VALUES(120,4,'Incremento en la producción actual')
INSERT INTO TBC_CAMPOS_INICIATIVA(ID_CAMPO,ID_TIPO_INICIATIVA,NOMBRE_CAMPO) VALUES(121,4,'Como se colocara el nuevo volumen en el mercado')
INSERT INTO TBC_CAMPOS_INICIATIVA(ID_CAMPO,ID_TIPO_INICIATIVA,NOMBRE_CAMPO) VALUES(122,4,'Reducir el tiempo de procesos productivos con métodos y/o tecnologías alternativas a las utilizadas en la actualidad')
INSERT INTO TBC_CAMPOS_INICIATIVA(ID_CAMPO,ID_TIPO_INICIATIVA,NOMBRE_CAMPO) VALUES(123,4,'Disminuir el consumo de energía o combustible en la producción, recolección, procesos y entrega de los bienes actuales')
INSERT INTO TBC_CAMPOS_INICIATIVA(ID_CAMPO,ID_TIPO_INICIATIVA,NOMBRE_CAMPO) VALUES(124,4,'Reducir el consumo de materia prima con tecnología no utilizada actualmente por el beneficiario')
INSERT INTO TBC_CAMPOS_INICIATIVA(ID_CAMPO,ID_TIPO_INICIATIVA,NOMBRE_CAMPO) VALUES(125,4,'Otros a ser considerados')
INSERT INTO TBC_CAMPOS_INICIATIVA(ID_CAMPO,ID_TIPO_INICIATIVA,NOMBRE_CAMPO) VALUES(126,4,'Componentes o tecnología Adicional  necesaria para el funcionamiento de la tecnología')
INSERT INTO TBC_CAMPOS_INICIATIVA(ID_CAMPO,ID_TIPO_INICIATIVA,NOMBRE_CAMPO) VALUES(127,4,'Metodologia Sugerida')
INSERT INTO TBC_CAMPOS_INICIATIVA(ID_CAMPO,ID_TIPO_INICIATIVA,NOMBRE_CAMPO) VALUES(128,4,'el conocimiento se encuentra disponible localmente')
INSERT INTO TBC_CAMPOS_INICIATIVA(ID_CAMPO,ID_TIPO_INICIATIVA,NOMBRE_CAMPO) VALUES(129,4,'Debe venir alguien y atender el tema localmente ')
INSERT INTO TBC_CAMPOS_INICIATIVA(ID_CAMPO,ID_TIPO_INICIATIVA,NOMBRE_CAMPO) VALUES(130,4,'Debe alguien de la iniciativa ir y recibir el entrenamiento o transferencia')
INSERT INTO TBC_CAMPOS_INICIATIVA(ID_CAMPO,ID_TIPO_INICIATIVA,NOMBRE_CAMPO) VALUES(131,4,'MIXTA')
INSERT INTO TBC_CAMPOS_INICIATIVA(ID_CAMPO,ID_TIPO_INICIATIVA,NOMBRE_CAMPO) VALUES(132,4,'Duracion en dias')
INSERT INTO TBC_CAMPOS_INICIATIVA(ID_CAMPO,ID_TIPO_INICIATIVA,NOMBRE_CAMPO) VALUES(133,4,'Locacion')
INSERT INTO TBC_CAMPOS_INICIATIVA(ID_CAMPO,ID_TIPO_INICIATIVA,NOMBRE_CAMPO) VALUES(134,4,'Require de recursos tecnicos adicionales')
INSERT INTO TBC_CAMPOS_INICIATIVA(ID_CAMPO,ID_TIPO_INICIATIVA,NOMBRE_CAMPO) VALUES(135,4,'existe necesidad de conocimiento previo para que sea asimilada de forma correcta')
INSERT INTO TBC_CAMPOS_INICIATIVA(ID_CAMPO,ID_TIPO_INICIATIVA,NOMBRE_CAMPO) VALUES(136,4,'Describa los requerimientos previos')
INSERT INTO TBC_CAMPOS_INICIATIVA(ID_CAMPO,ID_TIPO_INICIATIVA,NOMBRE_CAMPO) VALUES(137,4,'Tiene el beneficiario o cumple con los anteriores')
INSERT INTO TBC_CAMPOS_INICIATIVA(ID_CAMPO,ID_TIPO_INICIATIVA,NOMBRE_CAMPO) VALUES(138,4,'Componentes o insumos necesarios para lograr el impacto de la asistencia tecnica y/o la transferenica de conocimiento')
INSERT INTO TBC_CAMPOS_INICIATIVA(ID_CAMPO,ID_TIPO_INICIATIVA,NOMBRE_CAMPO) VALUES(139,4,'Efectos esperados sobre el problema')
INSERT INTO TBC_CAMPOS_INICIATIVA(ID_CAMPO,ID_TIPO_INICIATIVA,NOMBRE_CAMPO) VALUES(140,4,'Efectos esperados sobre  el negocio')
INSERT INTO TBC_CAMPOS_INICIATIVA(ID_CAMPO,ID_TIPO_INICIATIVA,NOMBRE_CAMPO) VALUES(141,4,'Incrementos esperados en el margen de utilidad')
INSERT INTO TBC_CAMPOS_INICIATIVA(ID_CAMPO,ID_TIPO_INICIATIVA,NOMBRE_CAMPO) VALUES(142,4,'Reducir el tiempo de procesos productivos con métodos y/o tecnologías alternativas a las utilizadas en la actualidad')
INSERT INTO TBC_CAMPOS_INICIATIVA(ID_CAMPO,ID_TIPO_INICIATIVA,NOMBRE_CAMPO) VALUES(143,4,'Disminuir el consumo de energía o combustible en la producción, recolección, procesos y entrega de los bienes actuales')
INSERT INTO TBC_CAMPOS_INICIATIVA(ID_CAMPO,ID_TIPO_INICIATIVA,NOMBRE_CAMPO) VALUES(144,4,'Reducir el consumo de materia prima con tecnología no utilizada actualmente por el beneficiario')
INSERT INTO TBC_CAMPOS_INICIATIVA(ID_CAMPO,ID_TIPO_INICIATIVA,NOMBRE_CAMPO) VALUES(145,4,'Otros a ser considerados ')
INSERT INTO TBC_CAMPOS_INICIATIVA(ID_CAMPO,ID_TIPO_INICIATIVA,NOMBRE_CAMPO) VALUES(146,4,'Producto')
INSERT INTO TBC_CAMPOS_INICIATIVA(ID_CAMPO,ID_TIPO_INICIATIVA,NOMBRE_CAMPO) VALUES(147,4,'Proceso')
INSERT INTO TBC_CAMPOS_INICIATIVA(ID_CAMPO,ID_TIPO_INICIATIVA,NOMBRE_CAMPO) VALUES(148,4,'Modelo de comercializacion')
INSERT INTO TBC_CAMPOS_INICIATIVA(ID_CAMPO,ID_TIPO_INICIATIVA,NOMBRE_CAMPO) VALUES(149,4,'Los insumos para el desarrollo se encuentra disponible localmente')
INSERT INTO TBC_CAMPOS_INICIATIVA(ID_CAMPO,ID_TIPO_INICIATIVA,NOMBRE_CAMPO) VALUES(150,4,'Describa genericamente los insumos necesarios')
INSERT INTO TBC_CAMPOS_INICIATIVA(ID_CAMPO,ID_TIPO_INICIATIVA,NOMBRE_CAMPO) VALUES(151,4,'el proyecto requerira de insumos de parte del  beneficiario')
INSERT INTO TBC_CAMPOS_INICIATIVA(ID_CAMPO,ID_TIPO_INICIATIVA,NOMBRE_CAMPO) VALUES(152,4,'Describalos')
INSERT INTO TBC_CAMPOS_INICIATIVA(ID_CAMPO,ID_TIPO_INICIATIVA,NOMBRE_CAMPO) VALUES(153,4,'Debe venir alguien y atender el tema localmente')
INSERT INTO TBC_CAMPOS_INICIATIVA(ID_CAMPO,ID_TIPO_INICIATIVA,NOMBRE_CAMPO) VALUES(154,4,'Debe alguien de la iniciativa ir y recibir el entrenamiento o transferencia')
INSERT INTO TBC_CAMPOS_INICIATIVA(ID_CAMPO,ID_TIPO_INICIATIVA,NOMBRE_CAMPO) VALUES(155,4,'MIXTA')
INSERT INTO TBC_CAMPOS_INICIATIVA(ID_CAMPO,ID_TIPO_INICIATIVA,NOMBRE_CAMPO) VALUES(156,4,'Duracion en dias')
INSERT INTO TBC_CAMPOS_INICIATIVA(ID_CAMPO,ID_TIPO_INICIATIVA,NOMBRE_CAMPO) VALUES(157,4,'Locacion')
INSERT INTO TBC_CAMPOS_INICIATIVA(ID_CAMPO,ID_TIPO_INICIATIVA,NOMBRE_CAMPO) VALUES(158,4,'Requiere de recursos tecnicos adicionales')
INSERT INTO TBC_CAMPOS_INICIATIVA(ID_CAMPO,ID_TIPO_INICIATIVA,NOMBRE_CAMPO) VALUES(159,4,'existe necesidad de conocimiento previo para que sea asimilada de forma correcta')
INSERT INTO TBC_CAMPOS_INICIATIVA(ID_CAMPO,ID_TIPO_INICIATIVA,NOMBRE_CAMPO) VALUES(160,4,'Describa los requerimientos previos')
INSERT INTO TBC_CAMPOS_INICIATIVA(ID_CAMPO,ID_TIPO_INICIATIVA,NOMBRE_CAMPO) VALUES(161,4,'Tiene el beneficiario o cumple con los anteriores')
INSERT INTO TBC_CAMPOS_INICIATIVA(ID_CAMPO,ID_TIPO_INICIATIVA,NOMBRE_CAMPO) VALUES(162,4,'Componentes o insumos necesarios para lograr el impacto de la asistencia tecnica y/o la transferenica de conocimiento')
INSERT INTO TBC_CAMPOS_INICIATIVA(ID_CAMPO,ID_TIPO_INICIATIVA,NOMBRE_CAMPO) VALUES(163,4,'Efectos esperados sobre el problema')
INSERT INTO TBC_CAMPOS_INICIATIVA(ID_CAMPO,ID_TIPO_INICIATIVA,NOMBRE_CAMPO) VALUES(164,4,'Efectos esperados sobre  el negocio')
INSERT INTO TBC_CAMPOS_INICIATIVA(ID_CAMPO,ID_TIPO_INICIATIVA,NOMBRE_CAMPO) VALUES(165,4,'Incrementos esperados en el margen de utilidad')
INSERT INTO TBC_CAMPOS_INICIATIVA(ID_CAMPO,ID_TIPO_INICIATIVA,NOMBRE_CAMPO) VALUES(166,4,'Reducir el tiempo de procesos productivos con métodos y/o tecnologías alternativas a las utilizadas en la actualidad')
INSERT INTO TBC_CAMPOS_INICIATIVA(ID_CAMPO,ID_TIPO_INICIATIVA,NOMBRE_CAMPO) VALUES(167,4,'Disminuir el consumo de energía o combustible en la producción, recolección, procesos y entrega de los bienes actuales')
INSERT INTO TBC_CAMPOS_INICIATIVA(ID_CAMPO,ID_TIPO_INICIATIVA,NOMBRE_CAMPO) VALUES(168,4,'Reducir el consumo de materia prima con tecnología no utilizada actualmente por el beneficiario')
INSERT INTO TBC_CAMPOS_INICIATIVA(ID_CAMPO,ID_TIPO_INICIATIVA,NOMBRE_CAMPO) VALUES(169,4,'Descripcion Otros a ser considerados')
INSERT INTO TBC_CAMPOS_INICIATIVA(ID_CAMPO,ID_TIPO_INICIATIVA,NOMBRE_CAMPO) VALUES(170,4,'Descripción de contrapartida')

INSERT INTO TBC_CAMPOS_INICIATIVA(ID_CAMPO,ID_TIPO_INICIATIVA,NOMBRE_CAMPO) VALUES(171,4,'Adopción o incorporación Tecnológica')
INSERT INTO TBC_CAMPOS_INICIATIVA(ID_CAMPO,ID_TIPO_INICIATIVA,NOMBRE_CAMPO) VALUES(172,4,'Recursos Adicionales  para la  Adopcion')
INSERT INTO TBC_CAMPOS_INICIATIVA(ID_CAMPO,ID_TIPO_INICIATIVA,NOMBRE_CAMPO) VALUES(173,4,'Asistenica Tecnica y/o Transferencia tecnologica')
INSERT INTO TBC_CAMPOS_INICIATIVA(ID_CAMPO,ID_TIPO_INICIATIVA,NOMBRE_CAMPO) VALUES(174,4,'Recursos Adicionales  para la  Asistencia tecnica o transferecia de conocimiento')
INSERT INTO TBC_CAMPOS_INICIATIVA(ID_CAMPO,ID_TIPO_INICIATIVA,NOMBRE_CAMPO) VALUES(175,4,'Proyecto de innovacion tecnologica')
INSERT INTO TBC_CAMPOS_INICIATIVA(ID_CAMPO,ID_TIPO_INICIATIVA,NOMBRE_CAMPO) VALUES(176,4,'Recursos Adicionales  para la  Innovacion')
INSERT INTO TBC_CAMPOS_INICIATIVA(ID_CAMPO,ID_TIPO_INICIATIVA,NOMBRE_CAMPO) VALUES(177,4,'otros a ser considerados')

INSERT INTO TBC_CAMPOS_INICIATIVA(ID_CAMPO,ID_TIPO_INICIATIVA,NOMBRE_CAMPO) VALUES(178,4,'Descripcion del monto en especies')
INSERT INTO TBC_CAMPOS_INICIATIVA(ID_CAMPO,ID_TIPO_INICIATIVA,NOMBRE_CAMPO) VALUES(179,4,'Monto especies')
INSERT INTO TBC_CAMPOS_INICIATIVA(ID_CAMPO,ID_TIPO_INICIATIVA,NOMBRE_CAMPO) VALUES(180,4,'Descripcion del monto en efectivo')
INSERT INTO TBC_CAMPOS_INICIATIVA(ID_CAMPO,ID_TIPO_INICIATIVA,NOMBRE_CAMPO) VALUES(181,4,'Monto Efectivo')
INSERT INTO TBC_CAMPOS_INICIATIVA(ID_CAMPO,ID_TIPO_INICIATIVA,NOMBRE_CAMPO) VALUES(187,4,'Monto Contra partida Beneficiario')
INSERT INTO TBC_CAMPOS_INICIATIVA(ID_CAMPO,ID_TIPO_INICIATIVA,NOMBRE_CAMPO) VALUES(182,4,'fecha inicio')
INSERT INTO TBC_CAMPOS_INICIATIVA(ID_CAMPO,ID_TIPO_INICIATIVA,NOMBRE_CAMPO) VALUES(183,4,'cronograma')
Go
SET IDENTITY_INSERT [dbo].[TBC_CAMPOS_INICIATIVA] OFF
GO
SET IDENTITY_INSERT [dbo].[TBC_ACTIVIDAD_INICIATIVA] ON
INSERT INTO TBC_ACTIVIDAD_INICIATIVA(ID_ACTIVIDAD_INICIATIVA,ID_TIPO_INICIATIVA,USUARIO_CREA,COD_ACTIVIDAD_PROY,DESCRIPCION,FECHA_CREA) VALUES(1,1,1,'ADO1','Adopción o incorporación Tecnológica',GETDATE())
INSERT INTO TBC_ACTIVIDAD_INICIATIVA(ID_ACTIVIDAD_INICIATIVA,ID_TIPO_INICIATIVA,USUARIO_CREA,COD_ACTIVIDAD_PROY,DESCRIPCION,FECHA_CREA) VALUES(2,1,1,'ADO2','Componentes acciones y/o tecnología Adicional necesaria para la Adquisición, internación, instalación y/o el funcionamiento de la tecnología',GETDATE())
INSERT INTO TBC_ACTIVIDAD_INICIATIVA(ID_ACTIVIDAD_INICIATIVA,ID_TIPO_INICIATIVA,USUARIO_CREA,COD_ACTIVIDAD_PROY,DESCRIPCION,FECHA_CREA) VALUES(3,1,1,'ADO3','Otros a ser considerados ',GETDATE())
INSERT INTO TBC_ACTIVIDAD_INICIATIVA(ID_ACTIVIDAD_INICIATIVA,ID_TIPO_INICIATIVA,USUARIO_CREA,COD_ACTIVIDAD_PROY,DESCRIPCION,FECHA_CREA) VALUES(4,1,1,'ADO4','Monto Contra partida Beneficiario',GETDATE())
INSERT INTO TBC_ACTIVIDAD_INICIATIVA(ID_ACTIVIDAD_INICIATIVA,ID_TIPO_INICIATIVA,USUARIO_CREA,COD_ACTIVIDAD_PROY,DESCRIPCION,FECHA_CREA) VALUES(5,2,1,'ASI1','Asistenica Tecnica y/o Transferencia tecnologica',GETDATE())
INSERT INTO TBC_ACTIVIDAD_INICIATIVA(ID_ACTIVIDAD_INICIATIVA,ID_TIPO_INICIATIVA,USUARIO_CREA,COD_ACTIVIDAD_PROY,DESCRIPCION,FECHA_CREA) VALUES(6,2,1,'ASI2','Recursos Adicionales para la Asistencia tecnica o transferecia de conocimiento',GETDATE())
INSERT INTO TBC_ACTIVIDAD_INICIATIVA(ID_ACTIVIDAD_INICIATIVA,ID_TIPO_INICIATIVA,USUARIO_CREA,COD_ACTIVIDAD_PROY,DESCRIPCION,FECHA_CREA) VALUES(7,2,1,'ASI3','Otros a ser considerados',GETDATE())
INSERT INTO TBC_ACTIVIDAD_INICIATIVA(ID_ACTIVIDAD_INICIATIVA,ID_TIPO_INICIATIVA,USUARIO_CREA,COD_ACTIVIDAD_PROY,DESCRIPCION,FECHA_CREA) VALUES(8,2,1,'ASI4','Monto Contra partida Beneficiario',GETDATE())
INSERT INTO TBC_ACTIVIDAD_INICIATIVA(ID_ACTIVIDAD_INICIATIVA,ID_TIPO_INICIATIVA,USUARIO_CREA,COD_ACTIVIDAD_PROY,DESCRIPCION,FECHA_CREA) VALUES(9,3,1,'INN1','Iniciativa de Proyecto de Innovación y o desarrollo Tecnológico',GETDATE())
INSERT INTO TBC_ACTIVIDAD_INICIATIVA(ID_ACTIVIDAD_INICIATIVA,ID_TIPO_INICIATIVA,USUARIO_CREA,COD_ACTIVIDAD_PROY,DESCRIPCION,FECHA_CREA) VALUES(10,3,1,'INN2','Recursos Adicionales para el Proyecto de Innovación y o desarrollo Tecnológico',GETDATE())
INSERT INTO TBC_ACTIVIDAD_INICIATIVA(ID_ACTIVIDAD_INICIATIVA,ID_TIPO_INICIATIVA,USUARIO_CREA,COD_ACTIVIDAD_PROY,DESCRIPCION,FECHA_CREA) VALUES(11,3,1,'INN3','Otros a ser considerados',GETDATE())
INSERT INTO TBC_ACTIVIDAD_INICIATIVA(ID_ACTIVIDAD_INICIATIVA,ID_TIPO_INICIATIVA,USUARIO_CREA,COD_ACTIVIDAD_PROY,DESCRIPCION,FECHA_CREA) VALUES(12,3,1,'INN4','Monto Contra partida Beneficiario',GETDATE())
INSERT INTO TBC_ACTIVIDAD_INICIATIVA(ID_ACTIVIDAD_INICIATIVA,ID_TIPO_INICIATIVA,USUARIO_CREA,COD_ACTIVIDAD_PROY,DESCRIPCION,FECHA_CREA) VALUES(13,4,1,'INT1','Adopción o incorporación Tecnológica',GETDATE())
INSERT INTO TBC_ACTIVIDAD_INICIATIVA(ID_ACTIVIDAD_INICIATIVA,ID_TIPO_INICIATIVA,USUARIO_CREA,COD_ACTIVIDAD_PROY,DESCRIPCION,FECHA_CREA) VALUES(14,4,1,'INT2','Recursos Adicionales  para la  Adopcion',GETDATE())
INSERT INTO TBC_ACTIVIDAD_INICIATIVA(ID_ACTIVIDAD_INICIATIVA,ID_TIPO_INICIATIVA,USUARIO_CREA,COD_ACTIVIDAD_PROY,DESCRIPCION,FECHA_CREA) VALUES(15,4,1,'INT3','Asistenica Tecnica y/o Transferencia tecnologica',GETDATE())
INSERT INTO TBC_ACTIVIDAD_INICIATIVA(ID_ACTIVIDAD_INICIATIVA,ID_TIPO_INICIATIVA,USUARIO_CREA,COD_ACTIVIDAD_PROY,DESCRIPCION,FECHA_CREA) VALUES(16,4,1,'INT4','Recursos Adicionales  para la  Asistencia tecnica o transferecia de conocimiento',GETDATE())
INSERT INTO TBC_ACTIVIDAD_INICIATIVA(ID_ACTIVIDAD_INICIATIVA,ID_TIPO_INICIATIVA,USUARIO_CREA,COD_ACTIVIDAD_PROY,DESCRIPCION,FECHA_CREA) VALUES(17,4,1,'INT5','Proyecto de innovacion tecnologica',GETDATE())
INSERT INTO TBC_ACTIVIDAD_INICIATIVA(ID_ACTIVIDAD_INICIATIVA,ID_TIPO_INICIATIVA,USUARIO_CREA,COD_ACTIVIDAD_PROY,DESCRIPCION,FECHA_CREA) VALUES(18,4,1,'INT6','Recursos Adicionales  para la  Innovacion',GETDATE())
INSERT INTO TBC_ACTIVIDAD_INICIATIVA(ID_ACTIVIDAD_INICIATIVA,ID_TIPO_INICIATIVA,USUARIO_CREA,COD_ACTIVIDAD_PROY,DESCRIPCION,FECHA_CREA) VALUES(19,4,1,'INT7','otros a ser considerados',GETDATE())
INSERT INTO TBC_ACTIVIDAD_INICIATIVA(ID_ACTIVIDAD_INICIATIVA,ID_TIPO_INICIATIVA,USUARIO_CREA,COD_ACTIVIDAD_PROY,DESCRIPCION,FECHA_CREA) VALUES(20,4,1,'INT8','Monto Contra partida Beneficiario',GETDATE())

GO
SET IDENTITY_INSERT [dbo].[TBC_ACTIVIDAD_INICIATIVA] OFF
GO
/* CAMBIOS EN EXPERIENCIA Y FORMULADOR */
if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('TB_EXPERIENCIA') and o.name = 'FK_EXPERIENCIA_FORMULADOR')
alter table TB_EXPERIENCIA
   drop constraint FK_EXPERIENCIA_FORMULADOR
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('TB_EXPERIENCIA') and o.name = 'FK_EXPERIENCIA_USUARIO1')
alter table TB_EXPERIENCIA
   drop constraint FK_EXPERIENCIA_USUARIO1
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('TB_EXPERIENCIA') and o.name = 'FK_EXPERIENCIA_USUARIO2')
alter table TB_EXPERIENCIA
   drop constraint FK_EXPERIENCIA_USUARIO2
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('TB_FORMULADOR') and o.name = 'FK_FORMULADOR_PERSONA')
alter table TB_FORMULADOR
   drop constraint FK_FORMULADOR_PERSONA
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('TB_FORMULADOR') and o.name = 'FK_FORMULADOR_USUARIO1')
alter table TB_FORMULADOR
   drop constraint FK_FORMULADOR_USUARIO1
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('TB_FORMULADOR') and o.name = 'FK_FORMULADOR_USUARIO2')
alter table TB_FORMULADOR
   drop constraint FK_FORMULADOR_USUARIO2
go
if exists (select 1
            from  sysobjects
           where  id = object_id('TB_EXPERIENCIA')
            and   type = 'U')
   drop table TB_EXPERIENCIA
go

if exists (select 1
            from  sysobjects
           where  id = object_id('TB_FORMULADOR')
            and   type = 'U')
   drop table TB_FORMULADOR
go
/*==============================================================*/
/* Table: TB_EXPERIENCIA                                        */
/*==============================================================*/
create table TB_EXPERIENCIA (
   ID_EXPERIENCIA       int                  identity,
   ID_FORMULADOR        int                  null,
   INSTITUCION          varchar(1024)        not null,
   CARGO                varchar(1024)        not null,
   TIEMPO               varchar(64)          not null,
   PROYECTO             varchar(2048)        not null,
   USUARIO_CREA         int                  null,
   USUARIO_ACTUALIZA    int                  null,
   FECHA_CREA           datetime             null,
   FECHA_ACTUALIZA      datetime             null,
   FECHA_BORRADO        datetime             null,
   constraint PK_TB_EXPERIENCIA primary key (ID_EXPERIENCIA)
)
go

/*==============================================================*/
/* Table: TB_FORMULADOR                                         */
/*==============================================================*/
create table TB_FORMULADOR (
   ID_FORMULADOR        int                  identity,
   ID_PERSONA           int                  null,
   GRADO_ACADEMICO      varchar(64)          not null,
   ANIOS_EXPERIENCIA    int                  not null,
   ACTIVO               smallint             not null,
   USUARIO_CREA         int                  null,
   USUARIO_ACTUALIZA    int                  null,
   FECHA_CREA           datetime             null,
   FECHA_ACTUALIZA      datetime             null,
   FECHA_BORRADO        datetime             null,
   constraint PK_TB_FORMULADOR primary key (ID_FORMULADOR)
)
go
alter table TB_EXPERIENCIA
   add constraint FK_EXPERIENCIA_FORMULADOR foreign key (ID_FORMULADOR)
      references TB_FORMULADOR (ID_FORMULADOR)
go

alter table TB_EXPERIENCIA
   add constraint FK_EXPERIENCIA_USUARIO1 foreign key (USUARIO_CREA)
      references TB_USUARIO (ID_USUARIO)
go

alter table TB_EXPERIENCIA
   add constraint FK_EXPERIENCIA_USUARIO2 foreign key (USUARIO_ACTUALIZA)
      references TB_USUARIO (ID_USUARIO)
go

alter table TB_FORMULADOR
   add constraint FK_FORMULADOR_PERSONA foreign key (ID_PERSONA)
      references TB_PERSONA (ID_PERSONA)
go


alter table TB_FORMULADOR
   add constraint FK_FORMULADOR_USUARIO1 foreign key (USUARIO_CREA)
      references TB_USUARIO (ID_USUARIO)
go

alter table TB_FORMULADOR
   add constraint FK_FORMULADOR_USUARIO2 foreign key (USUARIO_ACTUALIZA)
      references TB_USUARIO (ID_USUARIO)
go





/**************FUNCIONES Y PROCEDIMIENTOS BASE DE DATOS******************/
GO

/***
	OBJETO: FUNCTION [DBO].[FN_AUTENTICAR]
	DESCRIPCION: FUNCION QUE COMPRUEBA SI EL CORREO Y LA CONTRASE�A INTRODUCIDOS SON CORRECTOS
	FECHA DE CREACION: 30/04/2019
	FECHA DE ACTUALIZACION: 12/05/2019
***/
GO
CREATE FUNCTION FN_AUTENTICAR (@CORREO_E VARCHAR(32), @CONTRASENA VARCHAR(64)) RETURNS SMALLINT
AS
BEGIN
	DECLARE @ID_PERSONA VARCHAR(32) --VARIABLE USADA PARA COMPROBAR SI EL CORREO INGRESADO ESTA REGISTRADO
	DECLARE @RES INT				--VARIABLE QUE ALMACENA EL RESULTADO DE COMPROBAR SI LA CONTRASEÑA ES CORRECTA

	SET @ID_PERSONA = (SELECT ID_PERSONA FROM TB_PERSONA WHERE CORREO_E = @CORREO_E AND FECHA_BORRADO IS NULL)	--BUSCANDO UNA PERSONA CON EL CORREO INGRESADO

	IF @ID_PERSONA IS NOT NULL
		BEGIN
			SET @RES = (SELECT COUNT(*) FROM TB_USUARIO WHERE ID_PERSONA = @ID_PERSONA AND CONTRASENA = @CONTRASENA AND FECHA_BORRADO IS NULL)	--COMPROBANDO LA CONTRASEÑA

			IF @RES = 1
				BEGIN
					RETURN 1;
				END
		END
	RETURN 0	--SI EL CORREO O CONTRASEÑA SON INCORRECTOS, DEVUELVE CERO
END

GO

/***
	OBJETO: FUNCTION [DBO].[FN_ROL_HAS_RECURSO]
	DESCRIPCION: FUNCION QUE COMPRUEBA SI EL ROL ESPECIFICADO POSEE UN RECURSO DETERMINADO
	FECHA DE CREACION: 05/05/2019
	FECHA DE ACTUALIZACION:
***/
CREATE FUNCTION FN_ROL_HAS_RECURSO (@ID_ROL INT, @ID_RECURSO INT) RETURNS SMALLINT
AS
BEGIN
	DECLARE @RES INT				--VARIABLE QUE ALMACENA EL RESULTADO DE LA COMPROBACIÓN

	SET @RES = (SELECT COUNT(*) FROM TB_PERMISO WHERE ID_ROL = @ID_ROL AND ID_RECURSO = @ID_RECURSO)	--BUSCANDO SI EL RECURSO ESTÁ ASIGNADO AL ROL
		
	IF @RES = 1
		BEGIN
			RETURN 1
		END
		
	RETURN 0	--SI EL CORREO O CONTRASEÑA SON INCORRECTOS, DEVUELVE CERO
END

GO

/***
	OBJETO: FUNCTION [DBO].[FN_TB_USUARIO_GetIdSesion]
	DESCRIPCION: FUNCION QUE DEVUELVE EL VALOR DEL CAMPO ID_SESION DEL USUARIO
	FECHA DE CREACION: 12/05/2019
	FECHA DE ACTUALIZACION: 
***/
CREATE FUNCTION FN_TB_USUARIO_GetIdSesion (@ID_USUARIO INT) RETURNS VARCHAR(80)
AS
BEGIN
	RETURN (SELECT ID_SESION FROM TB_USUARIO WHERE ID_USUARIO = @ID_USUARIO AND FECHA_BORRADO IS NULL)
END

GO

/************************************************************************************
									VISTAS
*************************************************************************************/
GO

CREATE VIEW [dbo].[VIEW_DETALLE_BENEFICIARIO_CONSULTOR]
AS
				SELECT 
				B.ID_BENEFICIARIO,
				PB.NOMBRES + ' ' + PB.APELLIDOS AS NOMBRE_BENEFICIARIO, 
				PB.ID_PERSONA ID_PERSONA_BENEFICIARIO, 
				ISNULL(PC.NOMBRES + ' ' + PC.APELLIDOS, 'SIN ASIGNAR') AS NOMBRE_CONSULTOR_ASIGNADO, 
				PC.ID_PERSONA ID_PERSONA_CONSULTOR, 
				PB.DIRECCION AS DIRECCION,
                A.FECHA_ASIGNACION AS FECHA_ASIGNACION, 
				D.NOMBRE_DEPTO AS DEPARTAMENTO, 
				M.NOMBRE_MUNIC AS MUNICIPIO,
				PB.TEL_CEL + ' / ' + PB.TEL_FIJO TELEFONOS_CONTACTO,
				PB.CORREO_E,
				EP.DESCRIPCION_ESTADO_PROCESO,
				EP.CODIGO_ESTADO_PROCESO
				FROM dbo.TB_PERSONA AS PB 
				LEFT JOIN dbo.TB_ASIGNACION AS A ON A.ID_PERSONA_BENEFICIARIO = PB.ID_PERSONA 
				LEFT JOIN dbo.TB_PERSONA AS PC ON PC.ID_PERSONA = A.ID_PERSONA_CONSULTOR 
				INNER JOIN dbo.TBC_MUNICIPIO AS M ON M.ID_MUNICIPIO = PB.ID_MUNICIPIO 
				INNER JOIN dbo.TBC_DEPARTAMENTO AS D ON D.ID_DEPARTAMENTO = M.ID_DEPARTAMENTO
				INNER JOIN dbo.TB_BENEFICIARIO AS B ON B.ID_PERSONA = PB.ID_PERSONA
				INNER JOIN TBC_ESTADO_PROCESO AS EP ON EP.ID_ESTADO_PROCESO = B.ID_ESTADO_PROCESO
				WHERE PB.DIRECCION IS NOT NULL OR LEN(PB.DIRECCION) > 0

GO

CREATE VIEW [dbo].[VIEW_DETALLE_PERSONAS_REGISTRO_AYUDA]
AS
				SELECT 
				PB.NOMBRES + ' ' + PB.APELLIDOS AS NOMBRE_PERSONA, 
				PB.ID_PERSONA, 
				ISNULL(PC.NOMBRES + ' ' + PC.APELLIDOS, 'SIN ASIGNAR') AS NOMBRE_CONSULTOR_ASIGNADO, 
				PC.ID_PERSONA AS ID_CONSULTOR, 
				PB.DIRECCION AS DIRECCION,
                PB.FECHA_CREA AS FECHA_ASIGNACION, 
				D.NOMBRE_DEPTO AS DEPARTAMENTO, 
				M.NOMBRE_MUNIC AS MUNICIPIO,
				PB.TEL_CEL AS CELULAR,
				PB.TEL_FIJO AS FIJO,
				PB.CORREO_E AS CORREO
				FROM dbo.TB_PERSONA AS PB 
				LEFT JOIN dbo.TB_ASIGNACION AS A ON A.ID_PERSONA_BENEFICIARIO = PB.ID_PERSONA 
				LEFT JOIN dbo.TB_PERSONA AS PC ON PC.ID_PERSONA = A.ID_PERSONA_CONSULTOR 
				INNER JOIN dbo.TBC_MUNICIPIO AS M ON M.ID_MUNICIPIO = PB.ID_MUNICIPIO 
				INNER JOIN dbo.TBC_DEPARTAMENTO AS D ON D.ID_DEPARTAMENTO = M.ID_DEPARTAMENTO
				WHERE PB.DIRECCION IS NULL OR LEN(PB.DIRECCION) = 0

GO

/***
	OBJETO: PROCEDURE [DBO].[VIEW_DETALLE_BENEFICIARIO]
	DESCRIPCION: VISTA DE LOS DETALLES DEL BENEFICIARIO
	FECHA DE CREACION: 23/05/2019
	FECHA DE ACTUALIZACION: 
***/
CREATE VIEW VIEW_DETALLE_BENEFICIARIO
AS
	SELECT        
		dbo.TB_BENEFICIARIO.ID_BENEFICIARIO, 
		dbo.TB_BENEFICIARIO.ID_PERSONA,
		dbo.TB_PERSONA.NOMBRES, 
		dbo.TB_PERSONA.APELLIDOS,
		dbo.TB_BENEFICIARIO.DUI,
		dbo.TB_BENEFICIARIO.NIT,
		dbo.TB_PERSONA.TEL_FIJO,
		dbo.TB_PERSONA.TEL_CEL, 
		dbo.TB_PERSONA.DIRECCION,
		dbo.TB_BENEFICIARIO.LAT,
		dbo.TB_BENEFICIARIO.LONG,
		dbo.TB_BENEFICIARIO.MAS_ANIOS_EN_LUGAR,
		dbo.TBC_MUNICIPIO.NOMBRE_MUNIC AS MUNICIPIO, 
		dbo.TBC_ESTADO_PROCESO.DESCRIPCION_ESTADO_PROCESO AS ESTADO_PROCESO,
		TBC_SECTOR_ECONOMICO.NOMBRE_SECTOR,
		(
		SELECT 
			(PER.NOMBRES + ' ' + PER.APELLIDOS) 'NOMBRE_CONSULTOR'
		FROM
			TB_PERSONA PER
			JOIN
				TB_ASIGNACION CONS
				ON
				CONS.ID_PERSONA_CONSULTOR = PER.ID_PERSONA
		WHERE
			CONS.ID_PERSONA_BENEFICIARIO = PER.ID_PERSONA
		) 'NOMBRE_CONSULTOR'
	FROM
		dbo.TB_PERSONA 
		INNER JOIN
			dbo.TB_BENEFICIARIO
			ON
			dbo.TB_PERSONA.ID_PERSONA = dbo.TB_BENEFICIARIO.ID_PERSONA
		INNER JOIN
			dbo.TBC_MUNICIPIO 
			ON
			dbo.TB_PERSONA.ID_MUNICIPIO = dbo.TBC_MUNICIPIO.ID_MUNICIPIO 
		INNER JOIN
			dbo.TBC_ESTADO_PROCESO 
			ON 
			dbo.TB_BENEFICIARIO.ID_ESTADO_PROCESO = dbo.TBC_ESTADO_PROCESO.ID_ESTADO_PROCESO
		JOIN
			TBC_SECTOR_ECONOMICO
			ON
			TB_BENEFICIARIO.ID_SECTOR_ECONOMICO = TBC_SECTOR_ECONOMICO.ID_SECTOR_ECONOMICO

GO

/***
	OBJETO: PROCEDURE [DBO].[SP_DETALLE_USUARIO]
	DESCRIPCION: PROCEDIMIENTO PARA CONSULTAR LOS DETALLES DE TODOS LOS BENEFICIARIOS
	FECHA DE CREACION: 23/05/2019
	FECHA DE ACTUALIZACION: 
***/
CREATE PROCEDURE SP_VIEW_DETALLE_BENEFICIARIO_GetAll
AS
	SELECT * FROM VIEW_DETALLE_BENEFICIARIO
GO

/***
	OBJETO: PROCEDURE [DBO].[SP_VIEW_DETALLEBENEFICIARIO_GetByIdBeneficiario]
	DESCRIPCION: PROCEDIMIENTO PARA CONSULTAR LOS DETALLES DEL BENEFICIARIO
	FECHA DE CREACION: 23/05/2019
	FECHA DE ACTUALIZACION: 
***/
CREATE PROCEDURE SP_VIEW_DETALLE_BENEFICIARIO_GetByIdBeneficiario
	@ID_BENEFICIARIO INT
AS
	SELECT 
		* 
	FROM 
		VIEW_DETALLE_BENEFICIARIO 
	WHERE
		ID_BENEFICIARIO = @ID_BENEFICIARIO
GO


/***
	OBJETO: PROCEDURE [DBO].[SP_DETALLE_PROBLEMA]
	DESCRIPCION: PROCEDIMIENTO PARA CONSULTAR UN PROBLEMA Y SUS DETALLES
	FECHA DE CREACION: 23/05/2019
	FECHA DE ACTUALIZACION: 
***/
CREATE VIEW VIEW_DETALLE_PROBLEMA
AS
	SELECT
		PROB.ID_PROBLEMA,
		PROB.ID_BENEFICIARIO,
		PROB.ID_ESTADO_PROCESO,
		PROB.MERCADO,
		PROB.CANT_EMPLEADOS,
		PROB.REQUIERE_APOYO,
		PROB.DESCRIPCION_NEGOCIO,
		PROB.NOMBRE_PROBLEMA,
		PROB.VENTA_DIA,
		PROB.VENTA_MES,
		PROB.DESCRIPCION_PROBLEMA,
		PROB.DESCRIPCION_OTRO_PROBLEMA,
		EST.DESCRIPCION_ESTADO_PROCESO 'NOMBRE_ESTADO',
		(PER.NOMBRES + ' ' + PER.APELLIDOS) 'NOMBRE_BENEFICIARIO',
		DATEDIFF(DAY, PROB.FECHA_ACTUALIZA, GETDATE()) 'DIAS_ACTUALIZA',	--SE ASUME QUE LA FECHA DE ACTUALIZACION ES LA QUE REFLEJA LOS CAMBIOS DE ESTADO DEL PROBLEMA
		DATEDIFF(DAY, PROB.FECHA_CREA, GETDATE())  'DIAS_CREA',
		PROB.FECHA_CREA,
		PROB.FECHA_ACTUALIZA,
		BEN.ID_PERSONA,
		OBS.ID_OBSERVACION,
		OBS.DESCRIPCION 'OBSERVACION_DESCRIPCION',
		OBS.FECHA 'OBSERVACION_FECHA',
		OBS.RESUELTO 'OBSERVACION_RESUELTO',
		OBS.ID_ESTADO_PROCESO 'OBSERVACION_ESTADO'
	FROM
		TB_PROBLEMA PROB
		JOIN
			TB_BENEFICIARIO BEN
			ON
			PROB.ID_BENEFICIARIO = BEN.ID_BENEFICIARIO
		JOIN
			TB_PERSONA PER
			ON
			PER.ID_PERSONA = BEN.ID_PERSONA
		JOIN
			TBC_ESTADO_PROCESO EST
			ON
			EST.ID_ESTADO_PROCESO = PROB.ID_ESTADO_PROCESO
		LEFT JOIN
			TB_OBSERVACION OBS
			ON
			OBS.ENTIDAD = 'TB_PROBLEMA'
			AND
			OBS.ID = PROB.ID_PROBLEMA
			AND
			OBS.RESUELTO = 0
			
GO

/***
	OBJETO: VIEW [DBO].[VIEW_DETALLE_FORMULADOR]
	DESCRIPCION: VISTA DE LA INFORMACION DEL FORMULADOR
	FECHA DE CREACION: 02/06/2019
	FECHA DE ACTUALIZACION: 02/06/2019
***/
CREATE VIEW [dbo].[VIEW_DETALLE_FORMULADOR]
AS
	SELECT
		TB_PERSONA.ID_PERSONA,
		TB_PERSONA.ID_MUNICIPIO,
		TB_PERSONA.NOMBRES,
		TB_PERSONA.APELLIDOS,
		TB_PERSONA.CORREO_E,
		TB_PERSONA.DIRECCION,
		TB_PERSONA.TEL_FIJO,
		TB_PERSONA.TEL_CEL,
		TB_FORMULADOR.ID_FORMULADOR,
		TB_FORMULADOR.GRADO_ACADEMICO,
		TB_FORMULADOR.ANIOS_EXPERIENCIA,
		TB_FORMULADOR.ACTIVO,
		TB_EXPERIENCIA.ID_EXPERIENCIA,
		TB_EXPERIENCIA.INSTITUCION,
		TB_EXPERIENCIA.CARGO,
		TB_EXPERIENCIA.TIEMPO,
		TB_EXPERIENCIA.PROYECTO
	FROM
		dbo.TB_PERSONA 
	LEFT JOIN 
		dbo.TB_FORMULADOR
		ON
		dbo.TB_PERSONA.ID_PERSONA = dbo.TB_FORMULADOR.ID_PERSONA
	LEFT JOIN 
		dbo.TB_EXPERIENCIA
		ON
		dbo.TB_FORMULADOR.ID_FORMULADOR = dbo.TB_EXPERIENCIA.ID_FORMULADOR

GO


/************************************************************************************
						PROCEDIMIENTOS ALMACENADOS
*************************************************************************************/
GO

/********************************* PROCEDIMIENTOS SIN TABLAS ESPECÍFICA ********************************/
GO

/***
	OBJETO: PROCEDURE [DBO].[SP_DETALLE_USUARIO]
	DESCRIPCION: PROCEDIMIENTO PARA CONSULTAR LOS DATOS BASICOS DEL USUARIO Y EL NOMBRE DEL ROL
	FECHA DE CREACION: 14/05/2019
	FECHA DE ACTUALIZACION: 
***/
CREATE PROCEDURE SP_DETALLE_USUARIO
	@ID_USUARIO INT
AS
	SELECT
		TB_USUARIO.ID_USUARIO, 
		TB_USUARIO.ID_PERSONA, 
		TB_USUARIO.ID_ROL, 
		TB_ROL.NOMBRE AS 'NOMBRE_ROL',
		TB_USUARIO.ID_SESION
	FROM            
		TB_USUARIO 
		INNER JOIN
			TB_ROL 
		ON 
			TB_USUARIO.ID_ROL = TB_ROL.ID_ROL
	WHERE
		TB_USUARIO.ID_USUARIO = @ID_USUARIO

GO

/********************************* TABLA TB_PROBLEMA ********************************/
GO

/***
	OBJETO: PROCEDURE [DBO].[SP_TB_PROBLEMA_InsertProblema]
	DESCRIPCION: PROCEDIMIENTO PARA INGRESAR UN PROBLEMA QUE RETORNA EL ID DEL REGISTROS INGRESADO
	FECHA DE CREACION: 07/05/2019
	FECHA DE ACTUALIZACION: 21/05/2019
***/
CREATE PROCEDURE [dbo].[SP_TB_PROBLEMA_InsertProblema]
	@IdBeneficiario int,
	@IdEstadoProceso int,
	@Mercado varchar(500),
	@CantEmpleados int,
	@RequiereApoyo bit,
	@NombreProblema varchar(500),
	@DescripcionNegocio varchar(2000),
	@VentaDia varchar(200),
	@VentaMes decimal(8,2),
	@DescripcionProblema varchar(2000),
	@DescripcionOtroProblema varchar(2000)
AS
	BEGIN TRY
		BEGIN TRANSACTION
			INSERT INTO
				[dbo].[TB_PROBLEMA](
					[ID_BENEFICIARIO],
					[ID_ESTADO_PROCESO],
					[MERCADO],
					[CANT_EMPLEADOS],
					[REQUIERE_APOYO],
					[NOMBRE_PROBLEMA],
					[DESCRIPCION_NEGOCIO],
					[VENTA_DIA],
					[VENTA_MES],
					[DESCRIPCION_PROBLEMA],
					[DESCRIPCION_OTRO_PROBLEMA], 
					FECHA_CREA
					) 
			VALUES( 
				@IdBeneficiario,
				@IdEstadoProceso,
				@Mercado,
				@CantEmpleados,
				@RequiereApoyo,
				@NombreProblema,
				@DescripcionNegocio,
				@VentaDia,
				@VentaMes,
				@DescripcionProblema,
				@DescripcionOtroProblema,
				GETDATE()
				);

		SELECT
			SCOPE_IDENTITY() 'IDENTITY',
			ERROR_NUMBER() 'ERROR_NUMBER',
			ERROR_MESSAGE() 'ERROR_MESSAGE',
			ERROR_PROCEDURE() 'ERROR_PROCEDURE',
			ERROR_LINE() 'ERROR_LINE';

		COMMIT TRANSACTION;

	END TRY
	BEGIN CATCH
		SELECT
			SCOPE_IDENTITY() 'IDENTITY',
			ERROR_NUMBER() 'ERROR_NUMBER',
			ERROR_MESSAGE() 'ERROR_MESSAGE',
			ERROR_PROCEDURE() 'ERROR_PROCEDURE',
			ERROR_LINE() 'ERROR_LINE';
	END CATCH

	GO


/***
	OBJETO: PROCEDURE [DBO].[SP_TB_PROBLEMA_TieneBeneficiarioAsociado]
	DESCRIPCION: PROCEDIMIENTO PARA VERIFICAR SI UN BENEFICIARIO YA INGRESO UN PROBLEMA
	FECHA DE CREACION: 17/05/2019
	FECHA DE ACTUALIZACION: 
***/
CREATE PROCEDURE [dbo].[SP_TB_PROBLEMA_TieneBeneficiarioAsociado]
	@IdBeneficiario INT
AS
	SELECT 
		COUNT(*) 
	FROM 
		TB_PROBLEMA
	WHERE 
		ID_BENEFICIARIO = @IdBeneficiario

GO

/***
	OBJETO: PROCEDURE [DBO].[SP_TB_PROBLEMA_UPDATE_ID_ESTADO_PROCESO]
	DESCRIPCION: PROCEDIMIENTO PARA ACTUALIZAR EL ESTADO DEL PROCESO DE UN PROBLEMA
	FECHA DE CREACION: 23/05/2019
	FECHA DE ACTUALIZACION: 
***/
CREATE PROCEDURE SP_TB_PROBLEMA_UPDATE_ID_ESTADO_PROCESO
	@ID_PROBLEMA INT,
	@CODIGO_ESTADO_PROCESO varchar(6),
	@USUARIO_ACTUALIZA INT
AS
	BEGIN TRY
		BEGIN TRANSACTION

			UPDATE 
				TB_PROBLEMA
			SET
				ID_ESTADO_PROCESO = (
					SELECT
						ID_ESTADO_PROCESO
					FROM
						TBC_ESTADO_PROCESO
					WHERE
						CODIGO_ESTADO_PROCESO = @CODIGO_ESTADO_PROCESO
				),
				@ID_PROBLEMA = ID_PROBLEMA, 
				USUARIO_ACTUALIZA = @USUARIO_ACTUALIZA,
				FECHA_ACTUALIZA = GETDATE()
			WHERE
				ID_PROBLEMA = @ID_PROBLEMA;

		SELECT
			'IDENTITY' = @ID_PROBLEMA,
			ERROR_NUMBER() 'ERROR_NUMBER',
			ERROR_MESSAGE() 'ERROR_MESSAGE',
			ERROR_PROCEDURE() 'ERROR_PROCEDURE',
			ERROR_LINE() 'ERROR_LINE';

		COMMIT TRANSACTION		--CONFIRMANDO LA TRANSACCIÓN
	END TRY
	BEGIN CATCH
		SELECT
			'IDENTITY' = NULL,
			ERROR_NUMBER() 'ERROR_NUMBER',
			ERROR_MESSAGE() 'ERROR_MESSAGE',
			ERROR_PROCEDURE() 'ERROR_PROCEDURE',
			ERROR_LINE() 'ERROR_LINE';

		ROLLBACK TRANSACTION;	--REVIRTIENDO LA TRANSACCIÓN
	END CATCH
GO

/***
	OBJETO: PROCEDURE [DBO].[SP_VIEW_DETALLE_PROBLEMA_GetByIdProblema]
	DESCRIPCION: PROCEDIMIENTO PARA OBTENER UN PROBLEMA POR SU ID
	FECHA DE CREACION: 23/05/2019
	FECHA DE ACTUALIZACION: 
***/
CREATE PROCEDURE SP_VIEW_DETALLE_PROBLEMA_GetByIdProblema
	@ID_PROBLEMA INT
AS
	SELECT 
		*
	FROM 
		VIEW_DETALLE_PROBLEMA
	WHERE 
		ID_PROBLEMA = @ID_PROBLEMA
GO

/***
	OBJETO: PROCEDURE [DBO].[SP_VIEW_DETALLE_PROBLEMA_GetByIdBeneficiario]
	DESCRIPCION: PROCEDIMIENTO PARA OBTENER UN PROBLEMA A PARTIR DEL ID DEL BENEFICIARIO
	FECHA DE CREACION: 23/05/2019
	FECHA DE ACTUALIZACION: 
***/
CREATE PROCEDURE SP_VIEW_DETALLE_PROBLEMA_GetByIdBeneficiario
	@ID_BENEFICIARIO INT
AS
	SELECT 
		* 
	FROM 
		VIEW_DETALLE_PROBLEMA
	WHERE 
		ID_BENEFICIARIO = @ID_BENEFICIARIO

GO

/***
	OBJETO: PROCEDURE [DBO].[SP_VIEW_DETALLE_PROBLEMA_GetNotResolved]
	DESCRIPCION: PROCEDIMIENTO PARA OBTENER TODOS LOS PROBLEMAS APROBADOS, CON OBSERVACIONES O SIN PROPUESTAS ACEPTADAS
	FECHA DE CREACION: 23/05/2019
	FECHA DE ACTUALIZACION: 
***/
CREATE PROCEDURE SP_VIEW_DETALLE_PROBLEMA_GetNotResolved
AS
	SELECT 
		*
	FROM 
		VIEW_DETALLE_PROBLEMA
	WHERE
		ID_ESTADO_PROCESO IN (
			SELECT
				ID_ESTADO_PROCESO
			FROM
				TBC_ESTADO_PROCESO
			WHERE
				CODIGO_ESTADO_PROCESO IN ('P02')
		)

GO

/***
	OBJETO: PROCEDURE [DBO].[SP_VIEW_DETALLE_PROBLEMA_GetByIdPersonaConsultor]
	DESCRIPCION: PROCEDIMIENTO PARA OBTENER EL DETALLE DE LOS PROBLEMAS PARA UN CONSULTOR
	FECHA DE CREACION: 27/05/2019
	FECHA DE ACTUALIZACION: 
***/
CREATE PROCEDURE SP_VIEW_DETALLE_PROBLEMA_GetByIdPersonaConsultor
	@ID_PERSONA_CONSULTOR INT
AS
	SELECT 
		*
	FROM 
		VIEW_DETALLE_PROBLEMA
	WHERE
		ID_PERSONA IN (
			SELECT
				ID_PERSONA_BENEFICIARIO
			FROM
				TB_ASIGNACION WHERE ID_PERSONA_CONSULTOR = @ID_PERSONA_CONSULTOR
		)
GO

/***
	OBJETO: PROCEDURE [DBO].[SP_VIEW_DETALLE_PROBLEMA_GetAll]
	DESCRIPCION: PROCEDIMIENTO PARA OBTENER TODOS LOS PROBLEMAS
	FECHA DE CREACION: 23/05/2019
	FECHA DE ACTUALIZACION: 
***/
CREATE PROCEDURE SP_VIEW_DETALLE_PROBLEMA_GetAll
AS
	SELECT 
		*
	FROM
		VIEW_DETALLE_PROBLEMA
GO


/***
	OBJETO: PROCEDURE [DBO].[SP_VIEW_DETALLE_FORMULADOR_GetByIdPersona]
	DESCRIPCION: PROCEDIMIENTO PARA RECUPERAR EL DETALLE DE UN FORMULADOR
	FECHA DE CREACION: 02/06/2019
	FECHA DE ACTUALIZACION: 02/06/2019
***/
CREATE PROCEDURE [dbo].[SP_VIEW_DETALLE_FORMULADOR_GetByIdPersona]
	@ID_PERSONA       INT
  
AS
	SELECT 
		* 
	FROM 
		VIEW_DETALLE_FORMULADOR
	WHERE 
		ID_PERSONA = @ID_PERSONA;

GO

/********************************* TABLA TB_PROPUESTA *********************************/
GO

-- =============================================
-- Author:		Yohalmo Diaz
-- Create date: 22/05/2019
-- Description:	Obtiene las propuestas segun el Id del beneficiario
-- =============================================
CREATE PROCEDURE SP_TB_PROPUESTA_ObtenerPropuestasXIdBeneficiario
	@IdBeneficiario INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	IF @IdBeneficiario = 0
	BEGIN
		SELECT 
		PB.NOMBRE_PROBLEMA,
		PP.ID_PROPUESTA,
		(SELECT p.NOMBRES + ' ' + p.APELLIDOS
			FROM TB_BENEFICIARIO b 
			INNER JOIN TB_PERSONA p ON p.ID_PERSONA = b.ID_PERSONA 
			WHERE b.ID_BENEFICIARIO = PB.ID_BENEFICIARIO) AS NOMBRE_BENEFICIARIO,
		p.NOMBRES + ' ' + p.APELLIDOS AS NOMBRE_FORMULADOR, 
		PP.FECHA_CREA AS FECHA_PRESENTA, 
		PP.FECHA_ACTUALIZA AS ULTIMA_ACTUALIZA,
		EP.DESCRIPCION_ESTADO_PROCESO AS ETAPA
		FROM TB_PROPUESTA PP
		INNER JOIN TB_USUARIO U ON U.ID_USUARIO = PP.ID_USUARIO_FORMULA
		INNER JOIN TB_PERSONA P ON P.ID_PERSONA = U.ID_PERSONA
		INNER JOIN TB_PROBLEMA PB ON PB.ID_PROBLEMA = PP.ID_PROBLEMA
		INNER JOIN TBC_ESTADO_PROCESO EP ON PB.ID_ESTADO_PROCESO = EP.ID_ESTADO_PROCESO
	END
	ELSE
	BEGIN
		SELECT 
		PB.NOMBRE_PROBLEMA,
		PP.ID_PROPUESTA,
		(SELECT  p.NOMBRES + ' ' + p.APELLIDOS
			FROM TB_BENEFICIARIO b 
			INNER JOIN TB_PERSONA p ON p.ID_PERSONA = b.ID_PERSONA 
			WHERE b.ID_BENEFICIARIO = @IdBeneficiario) AS NOMBRE_BENEFICIARIO,
		p.NOMBRES + ' ' + p.APELLIDOS AS NOMBRE_FORMULADOR, 
		PP.FECHA_CREA AS FECHA_PRESENTA, 
		PP.FECHA_ACTUALIZA AS ULTIMA_ACTUALIZA,
		EP.DESCRIPCION_ESTADO_PROCESO AS ETAPA
		FROM TB_PROPUESTA PP
		INNER JOIN TB_USUARIO U ON U.ID_USUARIO = PP.ID_USUARIO_FORMULA
		INNER JOIN TB_PERSONA P ON P.ID_PERSONA = U.ID_PERSONA
		INNER JOIN TB_PROBLEMA PB ON PB.ID_PROBLEMA = PP.ID_PROBLEMA
		INNER JOIN TBC_ESTADO_PROCESO AS EP ON PB.ID_ESTADO_PROCESO = EP.ID_ESTADO_PROCESO
		WHERE PB.ID_BENEFICIARIO = @IdBeneficiario
	END
	
END

GO
CREATE PROCEDURE [dbo].[SP_TB_PROPUESTA_BuscarPropuestaXId]
	@IdPropuesta INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	
		SELECT
		P.NOMBRES + ' ' + P.APELLIDOS AS NOMBRE_FORMULADOR, 
		PP.*,
		TI.NOMBRE AS NOMBRE_INICIATIVA
		FROM TB_PROPUESTA PP
		INNER JOIN TB_USUARIO U ON U.ID_USUARIO = PP.ID_USUARIO_FORMULA
		INNER JOIN TB_PERSONA P ON P.ID_PERSONA = U.ID_PERSONA
		INNER JOIN TBC_TIPO_INICIATIVA TI ON TI.ID_TIPO_INICIATIVA = PP.ID_TIPO_INICIATIVA
		WHERE PP.ID_PROPUESTA = @IdPropuesta
	
END

/********************************* TABLA TB_PERSONA *********************************/
GO
/***
	OBJETO: PROCEDURE [DBO].[SP_TB_PERSONA_UpdatePersona]
	DESCRIPCION: PROCEDIMIENTO PARA ACTUALIZAR UNA PERSONA
	FECHA DE CREACION: 29/05/2019
***/
CREATE PROCEDURE [dbo].[SP_TB_PERSONA_UpdatePersona]
	@NOMBRES VARCHAR(64),
	@APELLIDOS  VARCHAR(64),
	@CORREO_E VARCHAR(32),
	@TEL_FIJO CHAR(9),
	@TEL_CEL CHAR(9),
	@ID_MUNICIPIO INT,
	@DIRECCION VARCHAR(200),
	@USUARIO_ACTUALIZA INT,
	@IdPersona INT
AS
BEGIN TRY
	BEGIN TRANSACTION

		UPDATE [dbo].[TB_PERSONA]
			   SET 
				   [USUARIO_ACTUALIZA] = @USUARIO_ACTUALIZA
				  ,[ID_MUNICIPIO] = @ID_MUNICIPIO
				  ,[NOMBRES] = @NOMBRES
				  ,[APELLIDOS] = @APELLIDOS
				  ,[CORREO_E] = @CORREO_E
				  ,[DIRECCION] = @DIRECCION
				  ,[TEL_FIJO] = @TEL_FIJO
				  ,[TEL_CEL] = @TEL_CEL
				  ,[FECHA_ACTUALIZA] = GETDATE()
			 WHERE ID_PERSONA = @IdPersona

		SELECT
			@IdPersona 'IDENTITY',
			ERROR_NUMBER() 'ERROR_NUMBER',
			ERROR_MESSAGE() 'ERROR_MESSAGE',
			ERROR_PROCEDURE() 'ERROR_PROCEDURE',
			ERROR_LINE() 'ERROR_LINE';
	COMMIT TRANSACTION
END TRY
BEGIN CATCH
	SELECT
		SCOPE_IDENTITY() 'IDENTITY',
		ERROR_NUMBER() 'ERROR_NUMBER',
		ERROR_MESSAGE() 'ERROR_MESSAGE',
		ERROR_PROCEDURE() 'ERROR_PROCEDURE',
		ERROR_LINE() 'ERROR_LINE';
	ROLLBACK TRANSACTION;
END CATCH
GO

/***
	OBJETO: PROCEDURE [DBO].[SP_TB_PERSONA_GetAll]
	DESCRIPCION: PROCEDIMIENTO PARA EXTRAER TODAS LAS PERSONAS, EXCLUYENDO LOS BORRADOS
	FECHA DE CREACION: 05/05/2019
	FECHA DE ACTUALIZACION:
***/
CREATE PROCEDURE SP_TB_PERSONA_GetAll
AS
	SELECT 
		* 
	FROM 
		TB_PERSONA 
	WHERE
		FECHA_BORRADO IS NULL;
GO

/***
	OBJETO: PROCEDURE [DBO].[SP_TB_PERSONA_GetAllWithDeleted]
	DESCRIPCION: PROCEDIMIENTO PARA EXTRAER TODAS LAS PERSONAS, EXCLUYENDO LOS BORRADOS
	FECHA DE CREACION: 05/05/2019
	FECHA DE ACTUALIZACION:
***/
CREATE PROCEDURE SP_TB_PERSONA_GetAllWithDeleted
AS
	SELECT 
		* 
	FROM 
		TB_PERSONA
GO

/***
	OBJETO: PROCEDURE [DBO].[SP_TB_PERSONA_GetByIdPersona]
	DESCRIPCION: PROCEDIMIENTO PARA BUSCAR UNA PERSONA A TRAV�S DE SU ID
	FECHA DE CREACION: 30/04/2019
	FECHA DE ACTUALIZACION: 05/05/2019
***/
CREATE PROCEDURE SP_TB_PERSONA_GetByIdPersona
	@ID_PERSONA INT
AS
	SELECT P.*,D.ID_DEPARTAMENTO
	FROM 
		TB_PERSONA AS P INNER JOIN TBC_MUNICIPIO AS M ON M.ID_MUNICIPIO = P.ID_MUNICIPIO
		INNER JOIN TBC_DEPARTAMENTO AS D ON D.ID_DEPARTAMENTO = M.ID_DEPARTAMENTO
	WHERE 
		P.ID_PERSONA = @ID_PERSONA
		AND
		P.FECHA_BORRADO IS NULL;

GO
/***
	OBJETO: PROCEDURE [DBO].[SP_TB_PERSONA_GetByIdPersona]
	DESCRIPCION: PROCEDIMIENTO PARA BUSCAR UNA PERSONA A TRAV�S DE SU ID
	FECHA DE CREACION: 30/04/2019
	FECHA DE ACTUALIZACION: 05/05/2019
***/
CREATE PROCEDURE SP_TB_PERSONA_GetByIdPersonaFormulador
	@ID_PERSONA INT
AS
	SELECT P.*
	FROM 
		TB_PERSONA AS P
	WHERE 
		P.ID_PERSONA = @ID_PERSONA
		AND
		P.FECHA_BORRADO IS NULL;

GO

/***
	OBJETO: PROCEDURE [DBO].[SP_TB_PERSONA_GetByCorreoE]
	DESCRIPCION: PROCEDIMIENTO PARA BUSCAR UNA PERSONA A TRAV�S DE SU CORREO ELECTR�NICO
	FECHA DE CREACION: 30/04/2019
	FECHA DE ACTUALIZACION: 05/05/2019
***/
CREATE PROCEDURE SP_TB_PERSONA_GetByCorreoE
	@CORREO_E VARCHAR(32)
AS
	SELECT 
		*
	FROM 
		TB_PERSONA 
	WHERE 
		CORREO_E = @CORREO_E

GO

/***
	OBJETO: PROCEDURE [DBO].[SP_TB_PERSONA_EsCorreoUnico]
	DESCRIPCION: PROCEDIMIENTO PARA EVALUAR SI UN CORREO ES UNICO O NO
	FECHA DE CREACION: 17/05/2019
	FECHA DE ACTUALIZACION: 
***/
CREATE PROCEDURE [dbo].[SP_TB_PERSONA_EsCorreoUnico]
	@CORREO_E VARCHAR(32)
AS
	SELECT 
		COUNT(*) 
	FROM 
		TB_PERSONA 
	WHERE 
		CORREO_E = @CORREO_E 

GO

/***
	OBJETO: PROCEDURE [DBO].[SP_TB_PERSONA_GetDeleted]
	DESCRIPCION: PROCEDIMIENTO PARA OBTENER TODOS LOS REGISTROS DESACTIVADOS
	FECHA DE CREACION: 03/05/2019
	FECHA DE ACTUALIZACION: 
***/
CREATE PROCEDURE SP_TB_PERSONA_GetDeleted
AS
	SELECT 
		* 
	FROM 
		TB_PERSONA 
	WHERE 
		FECHA_BORRADO IS NOT NULL

GO

/***
	OBJETO: PROCEDURE [DBO].[SP_TB_PERSONA_UPDATE]
	DESCRIPCION: PROCEDIMIENTO PARA ACTUALIAR UNA PERSONA
	FECHA DE CREACION: 07/05/2019
	FECHA DE ACTUALIZACION: 21/05/2019
***/
CREATE PROCEDURE SP_TB_PERSONA_UPDATE
	@ID_PERSONA INT,
	@ID_MUNICIPIO INT,
	@NOMBRES VARCHAR(64),
	@TEL_FIJO char(9),
	@TEL_CEL char(9),
	@APELLIDOS VARCHAR(64),
	@CORREO_E VARCHAR(32),
	@USUARIO_ACTUALIZA INT
AS
	BEGIN TRY
		BEGIN TRANSACTION

			UPDATE 
				TB_PERSONA
			SET
				ID_MUNICIPIO = @ID_MUNICIPIO, NOMBRES = @NOMBRES, APELLIDOS = @APELLIDOS, CORREO_E = @CORREO_E, TEL_FIJO = @TEL_FIJO, TEL_CEL = @TEL_CEL, USUARIO_ACTUALIZA = @USUARIO_ACTUALIZA, FECHA_ACTUALIZA = GETDATE()
			WHERE
				ID_PERSONA = @ID_PERSONA;

		SELECT
			'IDENTITY' = @ID_PERSONA,
			ERROR_NUMBER() 'ERROR_NUMBER',
			ERROR_MESSAGE() 'ERROR_MESSAGE',
			ERROR_PROCEDURE() 'ERROR_PROCEDURE',
			ERROR_LINE() 'ERROR_LINE';

		COMMIT TRANSACTION		--CONFIRMANDO LA TRANSACCIÓN
	END TRY
	BEGIN CATCH
		SELECT
			'IDENTITY' = NULL,
			ERROR_NUMBER() 'ERROR_NUMBER',
			ERROR_MESSAGE() 'ERROR_MESSAGE',
			ERROR_PROCEDURE() 'ERROR_PROCEDURE',
			ERROR_LINE() 'ERROR_LINE';

		ROLLBACK TRANSACTION;	--REVIRTIENDO LA TRANSACCIÓN
	END CATCH

GO

/***
	OBJETO: PROCEDURE [DBO].[SP_TB_PERSONA_DELETE_SOFT]
	DESCRIPCION: PROCEDIMIENTO PARA DESACTIVAR UNA PERSONA
	FECHA DE CREACION: 07/05/2019
	FECHA DE ACTUALIZACION:
***/
CREATE PROCEDURE SP_TB_PERSONA_DELETE_SOFT
	@ID_PERSONA INT,
	@USUARIO_ACTUALIZA INT
AS
	DECLARE @FECHA DATETIME;
	SET @FECHA = GETDATE();

	BEGIN TRY
		BEGIN TRANSACTION
				
			UPDATE
				TB_PERSONA
			SET
				FECHA_BORRADO = @FECHA, FECHA_ACTUALIZA = @FECHA, USUARIO_ACTUALIZA = @USUARIO_ACTUALIZA
			WHERE
				ID_PERSONA = @ID_PERSONA;

			SELECT
				'IDENTITY' = @ID_PERSONA,
				ERROR_NUMBER() 'ERROR_NUMBER',
				ERROR_MESSAGE() 'ERROR_MESSAGE',
				ERROR_PROCEDURE() 'ERROR_PROCEDURE',
				ERROR_LINE() 'ERROR_LINE';
		COMMIT TRANSACTION		--CONFIRMANDO LA TRANSACCIÓN
	END TRY
	BEGIN CATCH
			SELECT
				'IDENTITY' = NULL,
				ERROR_NUMBER() 'ERROR_NUMBER',
				ERROR_MESSAGE() 'ERROR_MESSAGE',
				ERROR_PROCEDURE() 'ERROR_PROCEDURE',
				ERROR_LINE() 'ERROR_LINE';
		ROLLBACK TRANSACTION	--REVIRTIENDO LA TRANSACCIÓN
	END CATCH

GO

/***
	OBJETO: PROCEDURE [DBO].[SP_TB_PERSONA_RestoreById]
	DESCRIPCION: PROCEDIMIENTO PARA REACTIVAR UNA PERSONA
	FECHA DE CREACION: 07/05/2019
	FECHA DE ACTUALIZACION:
***/
CREATE PROCEDURE SP_TB_PERSONA_RestoreById
	@ID_PERSONA INT,
	@USUARIO_ACTUALIZA INT
AS
	BEGIN TRY
		BEGIN TRANSACTION
				
			UPDATE
				TB_PERSONA
			SET
				FECHA_BORRADO = NULL, USUARIO_ACTUALIZA = @USUARIO_ACTUALIZA, FECHA_ACTUALIZA = GETDATE()
			WHERE
				ID_PERSONA = @ID_PERSONA;

			SELECT
				'IDENTITY' = @ID_PERSONA,
				ERROR_NUMBER() 'ERROR_NUMBER',
				ERROR_MESSAGE() 'ERROR_MESSAGE',
				ERROR_PROCEDURE() 'ERROR_PROCEDURE',
				ERROR_LINE() 'ERROR_LINE';

		COMMIT TRANSACTION		--CONFIRMANDO LA TRANSACCIÓN
	END TRY
	BEGIN CATCH
		SELECT
			'IDENTITY' = NULL,
			ERROR_NUMBER() 'ERROR_NUMBER',
			ERROR_MESSAGE() 'ERROR_MESSAGE',
			ERROR_PROCEDURE() 'ERROR_PROCEDURE',
			ERROR_LINE() 'ERROR_LINE';

		ROLLBACK TRANSACTION	--REVIRTIENDO LA TRANSACCIÓN
	END CATCH

GO

/***
	OBJETO: PROCEDURE [DBO].[SP_TB_PERSONA_DELETE_HARD]
	DESCRIPCION: PROCEDIMIENTO PARA ELIMINAR UN USUARIO
	FECHA DE CREACION: 07/05/2019
	FECHA DE ACTUALIZACION: 
***/
CREATE PROCEDURE SP_TB_PERSONA_DELETE_HARD
	@ID_PERSONA INT
AS
	BEGIN TRY
		BEGIN TRANSACTION
				
			DELETE FROM
				TB_PERSONA
			WHERE
				ID_PERSONA = @ID_PERSONA;
				
			SELECT
				'IDENTITY' = @ID_PERSONA,
				ERROR_NUMBER() 'ERROR_NUMBER',
				ERROR_MESSAGE() 'ERROR_MESSAGE',
				ERROR_PROCEDURE() 'ERROR_PROCEDURE',
				ERROR_LINE() 'ERROR_LINE';

		COMMIT TRANSACTION		--CONFIRMANDO LA TRANSACCIÓN
	END TRY
	BEGIN CATCH

		SELECT
			'IDENTITY' = NULL,
			ERROR_NUMBER() 'ERROR_NUMBER',
			ERROR_MESSAGE() 'ERROR_MESSAGE',
			ERROR_PROCEDURE() 'ERROR_PROCEDURE',
			ERROR_LINE() 'ERROR_LINE';
		ROLLBACK TRANSACTION	--REVIRTIENDO LA TRANSACCIÓN
	END CATCH

GO

/***
	OBJETO: PROCEDURE [DBO].[SP_TB_PERSONA_InsertPersona]
	DESCRIPCION: PROCEDIMIENTO PARA INSERTAR UNA PERSONA
	FECHA DE CREACION: 02/05/2019
	FECHA DE ACTUALIZACION: 09/05/2019
***/
CREATE PROCEDURE [dbo].[SP_TB_PERSONA_InsertPersona]
	@NOMBRES VARCHAR(64),
	@APELLIDOS  VARCHAR(64),
	@CORREO_E VARCHAR(32),
	@TEL_FIJO CHAR(9),
	@TEL_CEL CHAR(9),
	@ID_MUNICIPIO INT,
	@DIRECCION VARCHAR(200),
	@USUARIO_CREA INT
AS
BEGIN TRY
	BEGIN TRANSACTION

		IF @USUARIO_CREA IS NOT NULL
			INSERT INTO
				TB_PERSONA(NOMBRES, APELLIDOS, CORREO_E, ID_MUNICIPIO, USUARIO_CREA, FECHA_CREA, DIRECCION, TEL_FIJO, TEL_CEL) 
			VALUES
				(@NOMBRES, @APELLIDOS, @CORREO_E, @ID_MUNICIPIO, @USUARIO_CREA, GETDATE(), @DIRECCION, @TEL_FIJO, @TEL_CEL);
		ELSE
			INSERT INTO
				TB_PERSONA(NOMBRES, APELLIDOS, CORREO_E, ID_MUNICIPIO, FECHA_CREA, DIRECCION, TEL_FIJO, TEL_CEL) 
			VALUES
				(@NOMBRES, @APELLIDOS, @CORREO_E, @ID_MUNICIPIO, GETDATE(), @DIRECCION, @TEL_FIJO, @TEL_CEL);


		SELECT
			SCOPE_IDENTITY() 'IDENTITY',
			ERROR_NUMBER() 'ERROR_NUMBER',
			ERROR_MESSAGE() 'ERROR_MESSAGE',
			ERROR_PROCEDURE() 'ERROR_PROCEDURE',
			ERROR_LINE() 'ERROR_LINE';
	COMMIT TRANSACTION
END TRY
BEGIN CATCH
	SELECT
		SCOPE_IDENTITY() 'IDENTITY',
		ERROR_NUMBER() 'ERROR_NUMBER',
		ERROR_MESSAGE() 'ERROR_MESSAGE',
		ERROR_PROCEDURE() 'ERROR_PROCEDURE',
		ERROR_LINE() 'ERROR_LINE';
	ROLLBACK TRANSACTION;
END CATCH

GO
-- =============================================
-- Author:		YOHALMO DIAZ
-- Create date: 29/Mayo/2019
-- Description:	OBTIENE TODAS LAS PERSONAS QUE FUERON ASIGNADAS A UN CONSULTOR EN EL REGISTRO CON AYUDA
-- =============================================
CREATE PROCEDURE SP_TB_PERSONA_ObtenerPersonasXConsultorAsignado
	@Validados int,
	@IdConsultor int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    IF @Validados = 1 AND @IdConsultor != 0
		SELECT * FROM VIEW_DETALLE_PERSONAS_REGISTRO_AYUDA v
		WHERE v.ID_CONSULTOR = @IdConsultor AND (v.DIRECCION IS NOT NULL AND LEN(v.DIRECCION) = 0)
	ELSE
		SELECT * FROM VIEW_DETALLE_PERSONAS_REGISTRO_AYUDA v
		WHERE v.DIRECCION IS NULL
END
GO
-- =============================================
-- Author:		YOHALMO DIAZ
-- Create date: 02/06/2019
-- Description:	OBTIENE TODOS LOS CONSULTORES
-- =============================================
CREATE PROCEDURE SP_TB_PERSONA_ObtenerConsultores
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	SELECT P.ID_PERSONA ID_CONSULTOR, P.NOMBRES+' '+P.APELLIDOS NOMBRE_CONSULTOR, M.NOMBRE_MUNIC, D.NOMBRE_DEPTO FROM TB_PERSONA P
    INNER JOIN TB_USUARIO U ON U.ID_PERSONA = P.ID_PERSONA
	INNER JOIN TB_ROL R ON R.ID_ROL = U.ID_ROL
	INNER JOIN TBC_MUNICIPIO M ON M.ID_MUNICIPIO = P.ID_MUNICIPIO
	INNER JOIN TBC_DEPARTAMENTO D ON D.ID_DEPARTAMENTO = M.ID_DEPARTAMENTO
	WHERE R.NOMBRE = 'Consultor'
END
go
-- =============================================
-- Author:		YOHALMO DIAZ
-- Create date: 02/06/2019
-- Description:	
-- =============================================
CREATE PROCEDURE SP_TB_PERSONA_ObtenerSectoresMuniXConsultores
	@IdPersona int,
	@Opcion int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	IF @Opcion = 0
		SELECT DISTINCT AC.ID_SECTOR_ECONOMICO ID_RESULT
		FROM TB_ASIG_CONSULTOR_VINCULACION AC
		INNER JOIN TBC_SECTOR_ECONOMICO SE ON SE.ID_SECTOR_ECONOMICO = AC.ID_SECTOR_ECONOMICO
		WHERE AC.ID_PERSONA = @IdPersona
	ELSE
		SELECT DISTINCT AC.ID_MUNICIPIO ID_RESULT
		FROM TB_ASIG_CONSULTOR_VINCULACION AC
		INNER JOIN TBC_SECTOR_ECONOMICO SE ON SE.ID_SECTOR_ECONOMICO = AC.ID_SECTOR_ECONOMICO
		WHERE AC.ID_PERSONA = @IdPersona
END

/********************************* TABLA TB_ACTIVIDAD *********************************/
GO
/***
	OBJETO: PROCEDURE [DBO].[SP_TB_ACTIVIDAD_InsertCita]
	DESCRIPCION: PROCEDIMIENTO PARA OBTENER LAS CITAS POR CONSULTOR Y BENEFICIARIO
***/
CREATE PROCEDURE [dbo].[SP_TB_ACTIVIDAD_ConsultarCitaConsultorBeneficiario]
	@IdUsuarioBeneficiario int,
	@IdUsuarioConsultor int
AS
	SELECT * FROM TB_ACTIVIDAD
	WHERE ID_USUARIO_BENEFICIARIO = @IdUsuarioBeneficiario AND ID_USUARIO_CONSULTOR = @IdUsuarioConsultor
GO
/***
	OBJETO: PROCEDURE [DBO].[SP_TB_ACTIVIDAD_InsertCita]
	DESCRIPCION: PROCEDIMIENTO PARA INSERTAR UNA CITA
	FECHA DE CREACION: 14/05/2019
	FECHA DE ACTUALIZACION: 
***/
CREATE PROCEDURE [dbo].[SP_TB_ACTIVIDAD_InsertCita]
	@IdUsuarioBeneficiario int,
	@IdUsuarioConsultor int,
	@Fecha datetime,
	@Hora datetime,
	@Direccion varchar(1024),
	@Descripcion varchar(2048),
	@USUARIO_CREA INT
AS
BEGIN TRY
	INSERT [dbo].[TB_ACTIVIDAD](
		[ID_USUARIO_BENEFICIARIO],
		[ID_USUARIO_CONSULTOR], 
		[FECHA],
		[HORA], 
		[DIRECCION], 
		[DESCRIPCION],
		USUARIO_CREA, 
		FECHA_CREA
		) 
	VALUES (
		@IdUsuarioBeneficiario,
		@IdUsuarioConsultor, 
		@Fecha,
		@Hora, 
		@Direccion, 
		@Descripcion,
		@USUARIO_CREA,
		GETDATE()
		);

	SELECT
		SCOPE_IDENTITY() 'IDENTITY',
		ERROR_NUMBER() 'ERROR_NUMBER',
		ERROR_MESSAGE() 'ERROR_MESSAGE',
		ERROR_PROCEDURE() 'ERROR_PROCEDURE',
		ERROR_LINE() 'ERROR_LINE';
		
	COMMIT TRANSACTION;
END TRY
BEGIN CATCH
	SELECT
		SCOPE_IDENTITY() 'IDENTITY',
		ERROR_NUMBER() 'ERROR_NUMBER',
		ERROR_MESSAGE() 'ERROR_MESSAGE',
		ERROR_PROCEDURE() 'ERROR_PROCEDURE',
		ERROR_LINE() 'ERROR_LINE';

		ROLLBACK TRANSACTION
END CATCH
GO

/********************************* TABLA TB_USUARIO *********************************/

/***
	OBJETO: PROCEDURE [DBO].[SP_TB_USUARIO_EsNombreUsuarioUnico]
	DESCRIPCION: PROCEDIMIENTO PARA EVALUAR SI UN CORREO ES UNICO O NO
	FECHA DE CREACION: 29/05/2019
***/
CREATE PROCEDURE [dbo].[SP_TB_USUARIO_EsNombreUsuarioUnico]
	@CORREO_E VARCHAR(32)
AS
	SELECT 
		COUNT(*) 
	FROM 
		TB_USUARIO 
	WHERE 
		NOMBRE_USUARIO = @CORREO_E 


GO

/***
	OBJETO: PROCEDURE [DBO].[SP_TB_USUARIO_GetAll]
	DESCRIPCION: PROCEDIMIENTO PARA LISTAR TODOS LOS USUARIOS, EXCEPTUANDO LOS BORRADOS
	FECHA DE CREACION: 30/04/2019
	FECHA DE ACTUALIZACION: 05/05/2019
***/
CREATE PROCEDURE SP_TB_USUARIO_GetAll
AS
	SELECT 
		* 
	FROM 
		TB_USUARIO
	WHERE
		FECHA_BORRADO IS NULL;
GO

/***
	OBJETO: PROCEDURE [DBO].[SP_TB_USUARIO_GetAllByRol]
	DESCRIPCION: PROCEDIMIENTO PARA LISTAR TODOS LOS USUARIOS POR ROL, EXCEPTUANDO LOS BORRADOS
	FECHA DE CREACION: 30/04/2019
	FECHA DE ACTUALIZACION: 05/05/2019
***/
CREATE PROCEDURE SP_TB_USUARIO_GetAllByRol
@rol varchar(30)
AS
	SELECT 
		U.*
	FROM 
		TB_USUARIO AS U
		INNER JOIN TB_ROL AS R ON U.ID_ROL = R.ID_ROL
	WHERE
		U.FECHA_BORRADO IS NULL AND R.NOMBRE= @rol;
GO
/***
	OBJETO: PROCEDURE [DBO].[SP_TB_USUARIO_GetAll]
	DESCRIPCION: PROCEDIMIENTO PARA LISTAR TODOS LOS USUARIOS
	FECHA DE CREACION: 30/04/2019
	FECHA DE ACTUALIZACION: 05/05/2019
***/
CREATE PROCEDURE SP_TB_USUARIO_GetAllWithDeleted
AS
	SELECT 
		* 
	FROM 
		TB_USUARIO

GO

/***
	OBJETO: PROCEDURE [DBO].[SP_TB_USUARIO_GetByIdPersona]
	DESCRIPCION: PROCEDIMIENTO PARA BUSCAR UNA PERSONA A TRAV�S DE SU CORREO ELECTR�NICO
	FECHA DE CREACION: 30/04/2019
	FECHA DE ACTUALIZACION: 05/05/2019
***/
CREATE PROCEDURE SP_TB_USUARIO_GetByIdPersona
	@ID_PERSONA INT
AS
	SELECT 
		* 
	FROM 
		TB_USUARIO 
	WHERE 
		ID_PERSONA = @ID_PERSONA
		AND
		FECHA_BORRADO IS NULL;

GO

/***
	OBJETO: PROCEDURE [DBO].[SP_TB_USUARIO_GetByIdUsuario]
	DESCRIPCION: PROCEDIMIENTO PARA BUSCAR UN USUARIO A PARTIR DE SU ID
	FECHA DE CREACION: 30/04/2019
	FECHA DE ACTUALIZACION: 05/05/2019
***/
CREATE PROCEDURE SP_TB_USUARIO_GetByIdUsuario
	@ID_USUARIO INT
AS
	SELECT 
		* 
	FROM 
		TB_USUARIO 
	WHERE 
		ID_USUARIO = @ID_USUARIO
		AND
		FECHA_BORRADO IS NULL;

GO

/***
	OBJETO: PROCEDURE [DBO].[SP_TB_USUARIO_GetByIdRol]
	DESCRIPCION: PROCEDIMIENTO PARA BUSCAR TODOS LOS USUARIOS QUE POSEEN EL ROL ESPECIFICADO
	FECHA DE CREACION: 20/05/2019
	FECHA DE ACTUALIZACION:
***/
CREATE PROCEDURE SP_TB_USUARIO_GetByIdRol
	@ID_ROL INT
AS
	SELECT 
		* 
	FROM 
		TB_USUARIO 
	WHERE 
		ID_ROL = @ID_ROL
		AND
		FECHA_BORRADO IS NULL;

GO

/***
	OBJETO: PROCEDURE [DBO].[SP_TB_USUARIO_GetDeleted]
	DESCRIPCION: PROCEDIMIENTO PARA EXTRAER LOS REGISTROS DESACTIVADOS
	FECHA DE CREACION: 03/05/2019
	FECHA DE ACTUALIZACION: 05/05/2019
***/
CREATE PROCEDURE SP_TB_USUARIO_GetDeleted
AS
	SELECT 
		* 
	FROM 
		TB_USUARIO 
	WHERE 
		FECHA_BORRADO IS NOT NULL;

GO

/***
	OBJETO: PROCEDURE [DBO].[SP_TB_USUARIO_INSERT]
	DESCRIPCION: PROCEDIMIENTO PARA INSERTAR UN USUARIO NUEVO
	FECHA DE CREACION: 02/05/2019
	FECHA DE ACTUALIZACION: 03/05/2019
***/
CREATE PROCEDURE SP_TB_USUARIO_INSERT
	@ID_ROL INT,
	@ID_PERSONA INT,
	@NOMBRE_USUARIO VARCHAR(16),
	@CONTRASENA VARCHAR(64),
	@USUARIO_CREA INT
AS
	BEGIN TRY
		BEGIN TRANSACTION

			INSERT 
				TB_USUARIO(ID_ROL, ID_PERSONA, NOMBRE_USUARIO, CONTRASENA, USUARIO_CREA, FECHA_CREA) 
			VALUES
				(@ID_ROL, @ID_PERSONA, @NOMBRE_USUARIO, @CONTRASENA, @USUARIO_CREA, GETDATE());
			
			SELECT
				SCOPE_IDENTITY() 'IDENTITY',
				ERROR_NUMBER() 'ERROR_NUMBER',
				ERROR_MESSAGE() 'ERROR_MESSAGE',
				ERROR_PROCEDURE() 'ERROR_PROCEDURE',
				ERROR_LINE() 'ERROR_LINE';
		COMMIT TRANSACTION		--CONFIRMANDO LA TRANSACCIÓN
	END TRY
	BEGIN CATCH
		SELECT
			SCOPE_IDENTITY() 'IDENTITY',
			ERROR_NUMBER() 'ERROR_NUMBER',
			ERROR_MESSAGE() 'ERROR_MESSAGE',
			ERROR_PROCEDURE() 'ERROR_PROCEDURE',
			ERROR_LINE() 'ERROR_LINE';
		ROLLBACK TRANSACTION;	--REVIRTIENDO LA TRANSACCIÓN
	END CATCH

GO

/***
	OBJETO: PROCEDURE [DBO].[SP_TB_USUARIO_UPDATE]
	DESCRIPCION: PROCEDIMIENTO PARA ACTUALIAR UN USUARIO
	FECHA DE CREACION: 03/05/2019
	FECHA DE ACTUALIZACION: 05/05/2019
***/
CREATE PROCEDURE SP_TB_USUARIO_UPDATE
	@ID_USUARIO INT,
	@ID_ROL INT,
	@ID_PERSONA INT,
	@NOMBRE_USUARIO VARCHAR(16),
	@CONTRASENA VARCHAR(64), 
	@USUARIO_ACTUALIZA INT
AS
	BEGIN TRY
		BEGIN TRANSACTION

			IF @CONTRASENA IS NOT NULL
				UPDATE 
					TB_USUARIO
				SET
					ID_ROL = @ID_ROL, ID_PERSONA = @ID_PERSONA, NOMBRE_USUARIO = @NOMBRE_USUARIO, CONTRASENA = @CONTRASENA, USUARIO_ACTUALIZA = @USUARIO_ACTUALIZA, FECHA_ACTUALIZA = GETDATE()
				WHERE
					ID_USUARIO = @ID_USUARIO;
			ELSE
				UPDATE 
					TB_USUARIO
				SET
					ID_ROL = @ID_ROL, ID_PERSONA = @ID_PERSONA, NOMBRE_USUARIO = @NOMBRE_USUARIO, USUARIO_ACTUALIZA = @USUARIO_ACTUALIZA, FECHA_ACTUALIZA = GETDATE()
				WHERE
					ID_USUARIO = @ID_USUARIO;

			SELECT
				'IDENTITY' = @ID_USUARIO,
				ERROR_NUMBER() 'ERROR_NUMBER',
				ERROR_MESSAGE() 'ERROR_MESSAGE',
				ERROR_PROCEDURE() 'ERROR_PROCEDURE',
				ERROR_LINE() 'ERROR_LINE';

		COMMIT TRANSACTION		--CONFIRMANDO LA TRANSACCIÓN
	END TRY
	BEGIN CATCH
		SELECT
			'IDENTITY' = NULL,
			ERROR_NUMBER() 'ERROR_NUMBER',
			ERROR_MESSAGE() 'ERROR_MESSAGE',
			ERROR_PROCEDURE() 'ERROR_PROCEDURE',
			ERROR_LINE() 'ERROR_LINE';
		ROLLBACK TRANSACTION;	--REVIRTIENDO LA TRANSACCIÓN
	END CATCH

GO

/***
	OBJETO: PROCEDURE [DBO].[SP_TB_USUARIO_UPDATE_AUTENTICADO]
	DESCRIPCION: PROCEDIMIENTO PARA MARCAR A UN USUARIO CUANDO INICIA O CIERRA SESION. SI @ESTADO = 1: SESION INICIADA; SI @ESTADO = 0: SESION CERRADA
	FECHA DE CREACION: 12/05/2019
	FECHA DE ACTUALIZACION:
***/
CREATE PROCEDURE SP_TB_USUARIO_UPDATE_AUTENTICADO 
	@ID_USUARIO INT,
	@ID_SESION VARCHAR(80),
	@ESTADO SMALLINT
AS
	BEGIN TRY
		BEGIN TRANSACTION
			IF @ESTADO = 1
				BEGIN
					UPDATE 
						TB_USUARIO 
					SET 
						ID_SESION = @ID_SESION
					WHERE
						ID_USUARIO = @ID_USUARIO;	--INDICANDO QUE EL USUARIO HA INICIADO SU SESION
				END
			ELSE
				BEGIN
					UPDATE 
						TB_USUARIO 
					SET 
						ID_SESION = NULL
					WHERE 
						ID_USUARIO = @ID_USUARIO;	--INDICANDO QUE EL USUARIO HA CERRADO SU SESION
				END

			SELECT
				'IDENTITY' = @ID_USUARIO,
				ERROR_NUMBER() 'ERROR_NUMBER',
				ERROR_MESSAGE() 'ERROR_MESSAGE',
				ERROR_PROCEDURE() 'ERROR_PROCEDURE',
				ERROR_LINE() 'ERROR_LINE';
		COMMIT TRANSACTION;
	END TRY
	BEGIN CATCH
		SELECT
			'IDENTITY' = NULL,
			ERROR_NUMBER() 'ERROR_NUMBER',
			ERROR_MESSAGE() 'ERROR_MESSAGE',
			ERROR_PROCEDURE() 'ERROR_PROCEDURE',
			ERROR_LINE() 'ERROR_LINE';
		ROLLBACK TRANSACTION;
	END CATCH
		
GO

/***
	OBJETO: PROCEDURE [DBO].[SP_TB_USUARIO_DELETE_SOFT]
	DESCRIPCION: PROCEDIMIENTO PARA DESACTIVAR UN USUARIO
	FECHA DE CREACION: 03/05/2019
	FECHA DE ACTUALIZACION: 05/05/2019
***/
CREATE PROCEDURE SP_TB_USUARIO_DELETE_SOFT
	@ID_USUARIO INT,
	@USUARIO_ACTUALIZA INT
AS
	DECLARE @FECHA DATETIME;
	SET @FECHA = GETDATE();

	BEGIN TRY
		BEGIN TRANSACTION
				
			UPDATE
				TB_USUARIO
			SET
				FECHA_BORRADO = @FECHA, FECHA_ACTUALIZA = @FECHA, USUARIO_ACTUALIZA = @USUARIO_ACTUALIZA
			WHERE
				ID_USUARIO = @ID_USUARIO;

			SELECT
				'IDENTITY' = @ID_USUARIO,
				ERROR_NUMBER() 'ERROR_NUMBER',
				ERROR_MESSAGE() 'ERROR_MESSAGE',
				ERROR_PROCEDURE() 'ERROR_PROCEDURE',
				ERROR_LINE() 'ERROR_LINE';
		COMMIT TRANSACTION		--CONFIRMANDO LA TRANSACCIÓN
	END TRY
	BEGIN CATCH
		SELECT
			'IDENTITY' = NULL,
			ERROR_NUMBER() 'ERROR_NUMBER',
			ERROR_MESSAGE() 'ERROR_MESSAGE',
			ERROR_PROCEDURE() 'ERROR_PROCEDURE',
			ERROR_LINE() 'ERROR_LINE';
		ROLLBACK TRANSACTION	--REVIRTIENDO LA TRANSACCIÓN
	END CATCH

GO

/***
	OBJETO: PROCEDURE [DBO].[SP_TB_USUARIO_RestoreById]
	DESCRIPCION: PROCEDIMIENTO PARA DESACTIVAR UN USUARIO
	FECHA DE CREACION: 03/05/2019
	FECHA DE ACTUALIZACION: 05/05/2019
***/
CREATE PROCEDURE SP_TB_USUARIO_RestoreById
	@ID_USUARIO INT,
	@USUARIO_ACTUALIZA INT
AS
	BEGIN TRY
		BEGIN TRANSACTION
				
			UPDATE
				TB_USUARIO
			SET
				FECHA_BORRADO = NULL, USUARIO_ACTUALIZA = @USUARIO_ACTUALIZA, FECHA_ACTUALIZA = GETDATE()
			WHERE
				ID_USUARIO = @ID_USUARIO;
					
			SELECT
				'IDENTITY' = @ID_USUARIO,
				ERROR_NUMBER() 'ERROR_NUMBER',
				ERROR_MESSAGE() 'ERROR_MESSAGE',
				ERROR_PROCEDURE() 'ERROR_PROCEDURE',
				ERROR_LINE() 'ERROR_LINE';
		COMMIT TRANSACTION		--CONFIRMANDO LA TRANSACCIÓN
	END TRY
	BEGIN CATCH
		SELECT
			'IDENTITY' = NULL,
			ERROR_NUMBER() 'ERROR_NUMBER',
			ERROR_MESSAGE() 'ERROR_MESSAGE',
			ERROR_PROCEDURE() 'ERROR_PROCEDURE',
			ERROR_LINE() 'ERROR_LINE';
		ROLLBACK TRANSACTION	--REVIRTIENDO LA TRANSACCIÓN
	END CATCH

GO

/***
	OBJETO: PROCEDURE [DBO].[SP_TB_USUARIO_DELETE_HARD]
	DESCRIPCION: PROCEDIMIENTO PARA ELIMINAR UN USUARIO
	FECHA DE CREACION: 03/05/2019
	FECHA DE ACTUALIZACION: 
***/
CREATE PROCEDURE SP_TB_USUARIO_DELETE_HARD
	@ID_USUARIO INT
AS
	BEGIN TRY
		BEGIN TRANSACTION
				
			DELETE FROM
				TB_USUARIO
			WHERE
				ID_USUARIO = @ID_USUARIO;
					
			SELECT
				'IDENTITY' = @ID_USUARIO,
				ERROR_NUMBER() 'ERROR_NUMBER',
				ERROR_MESSAGE() 'ERROR_MESSAGE',
				ERROR_PROCEDURE() 'ERROR_PROCEDURE',
				ERROR_LINE() 'ERROR_LINE';
		COMMIT TRANSACTION		--CONFIRMANDO LA TRANSACCIÓN
	END TRY
	BEGIN CATCH
		SELECT
			'IDENTITY' = NULL,
			ERROR_NUMBER() 'ERROR_NUMBER',
			ERROR_MESSAGE() 'ERROR_MESSAGE',
			ERROR_PROCEDURE() 'ERROR_PROCEDURE',
			ERROR_LINE() 'ERROR_LINE';
		ROLLBACK TRANSACTION	--REVIRTIENDO LA TRANSACCIÓN
	END CATCH

GO


/********************************* TABLA TB_ROL *********************************/
GO

/***
	OBJETO: PROCEDURE [DBO].[SP_TB_ROL_GetAll]
	DESCRIPCION: PROCEDIMIENTO PARA EXTRAER TODOS LOS ROLES, EXCLUYENDO LOS BORRADOS
	FECHA DE CREACION: 05/05/2019
	FECHA DE ACTUALIZACION:
***/
CREATE PROCEDURE SP_TB_ROL_GetAll
AS
	SELECT 
		* 
	FROM 
		TB_ROL 
	WHERE
		FECHA_BORRADO IS NULL;
GO

/***
	OBJETO: PROCEDURE [DBO].[SP_TB_ROL_GetAllWithDeleted]
	DESCRIPCION: PROCEDIMIENTO PARA EXTRAER TODOS LOS REGISTROS, INCLUYENDO LOS BORRADOS
	FECHA DE CREACION: 05/05/2019
	FECHA DE ACTUALIZACION:
***/
CREATE PROCEDURE SP_TB_ROL_GetAllWithDeleted
AS
	SELECT 
		* 
	FROM 
		TB_ROL
GO

/***
	OBJETO: PROCEDURE [DBO].[SP_TB_ROL_GetByIdRol]
	DESCRIPCION: PROCEDIMIENTO PARA BUSCAR UN ROL A PARTIR DE SU ID
	FECHA DE CREACION: 30/04/2019
	FECHA DE ACTUALIZACION: 03/05/2019
***/
CREATE PROCEDURE SP_TB_ROL_GetByIdRol
	@ID_ROL INT
AS
	SELECT 
		* 
	FROM 
		TB_ROL 
	WHERE 
		ID_ROL = @ID_ROL 
		AND 
		FECHA_BORRADO IS NULL;
GO

/***
	OBJETO: PROCEDURE [DBO].[SP_TB_ROL_GetByNombre]
	DESCRIPCION: PROCEDIMIENTO PARA BUSCAR UN ROL A PARTIR DE SU NOMBRE
	FECHA DE CREACION: 02/05/2019
	FECHA DE ACTUALIZACION: 03/05/2019
***/
CREATE PROCEDURE SP_TB_ROL_GetByNombre
	@NOMBRE VARCHAR(32)
AS
	SELECT 
		* 
	FROM 
		TB_ROL 
	WHERE 
		NOMBRE = @NOMBRE
		AND
		FECHA_BORRADO IS NULL;

GO

/***
	OBJETO: PROCEDURE [DBO].[SP_TB_ROL_GetDeleted]
	DESCRIPCION: PROCEDIMIENTO PARA EXTRAER LOS ROLES QUE HAN SIDO ELIMINADOS
	FECHA DE CREACION: 03/05/2019
	FECHA DE ACTUALIZACION: 05/05/2019
***/
CREATE PROCEDURE SP_TB_ROL_GetDeleted
AS
	SELECT 
		* 
	FROM 
		TB_ROL 
	WHERE
		FECHA_BORRADO IS NOT NULL;

GO

/***
	OBJETO: PROCEDURE [DBO].[SP_TB_ROL_INSERT]
	DESCRIPCION: PROCEDIMIENTO PARA INSERTAR UN ROL NUEVO
	FECHA DE CREACION: 03/05/2019
	FECHA DE ACTUALIZACION: 05/05/2019
***/
CREATE PROCEDURE SP_TB_ROL_INSERT
	@NOMBRE VARCHAR(32),
	@DESCRIPCION VARCHAR(64),
	@USUARIO_CREA INT
AS
	BEGIN TRY
		BEGIN TRANSACTION

			INSERT INTO 
				TB_ROL(NOMBRE, DESCRIPCION, USUARIO_CREA, FECHA_CREA) 
			VALUES
				(@NOMBRE, @DESCRIPCION, @USUARIO_CREA, GETDATE());

			SELECT
				SCOPE_IDENTITY() 'IDENTITY',
				ERROR_NUMBER() 'ERROR_NUMBER',
				ERROR_MESSAGE() 'ERROR_MESSAGE',
				ERROR_PROCEDURE() 'ERROR_PROCEDURE',
				ERROR_LINE() 'ERROR_LINE';
		COMMIT TRANSACTION		--CONFIRMANDO LA TRANSACCIÓN
	END TRY
	BEGIN CATCH
		SELECT
			SCOPE_IDENTITY() 'IDENTITY',
			ERROR_NUMBER() 'ERROR_NUMBER',
			ERROR_MESSAGE() 'ERROR_MESSAGE',
			ERROR_PROCEDURE() 'ERROR_PROCEDURE',
			ERROR_LINE() 'ERROR_LINE';
		ROLLBACK TRANSACTION	--REVIRTIENDO LA TRANSACCIÓN
	END CATCH

GO

/***
	OBJETO: PROCEDURE [DBO].[SP_TB_ROL_UPDATE]
	DESCRIPCION: PROCEDIMIENTO PARA ACTUALIZAR UN ROL
	FECHA DE CREACION: 03/05/2019
	FECHA DE ACTUALIZACION: 05/05/2019
***/
CREATE PROCEDURE SP_TB_ROL_UPDATE
	@ID_ROL INT,
	@NOMBRE VARCHAR(32),
	@DESCRIPCION VARCHAR(64),
	@USUARIO_ACTUALIZA INT
AS
	BEGIN TRY
		BEGIN TRANSACTION
				
			UPDATE
				TB_ROL 
			SET
				NOMBRE = @NOMBRE, 
				DESCRIPCION = @DESCRIPCION, 
				USUARIO_ACTUALIZA = @USUARIO_ACTUALIZA, 
				FECHA_ACTUALIZA = GETDATE()
			WHERE
				ID_ROL = @ID_ROL;
		SELECT
			'IDENTITY' = @ID_ROL,
			ERROR_NUMBER() 'ERROR_NUMBER',
			ERROR_MESSAGE() 'ERROR_MESSAGE',
			ERROR_PROCEDURE() 'ERROR_PROCEDURE',
			ERROR_LINE() 'ERROR_LINE';
		COMMIT TRANSACTION		--CONFIRMANDO LA TRANSACCIÓN
	END TRY
	BEGIN CATCH
		SELECT
			'IDENTITY' = NULL,
			ERROR_NUMBER() 'ERROR_NUMBER',
			ERROR_MESSAGE() 'ERROR_MESSAGE',
			ERROR_PROCEDURE() 'ERROR_PROCEDURE',
			ERROR_LINE() 'ERROR_LINE';
		ROLLBACK TRANSACTION	--REVIRTIENDO LA TRANSACCIÓN
	END CATCH

GO

/***
	OBJETO: PROCEDURE [DBO].[SP_TB_ROL_DELETE_SOFT]
	DESCRIPCION: PROCEDIMIENTO PARA DESACTIVAR UN ROL
	FECHA DE CREACION: 03/05/2019
	FECHA DE ACTUALIZACION: 05/05/2019
***/
CREATE PROCEDURE SP_TB_ROL_DELETE_SOFT
	@ID_ROL INT,
	@USUARIO_ACTUALIZA INT
AS
	DECLARE @FECHA DATETIME;
	SET @FECHA = GETDATE();

	BEGIN TRY
		BEGIN TRANSACTION
				
			UPDATE
				TB_ROL
			SET
				@USUARIO_ACTUALIZA = @USUARIO_ACTUALIZA, 
				FECHA_ACTUALIZA = @FECHA, 
				FECHA_BORRADO = @FECHA
			WHERE
				ID_ROL = @ID_ROL;

		SELECT
			'IDENTITY' = @ID_ROL,
			ERROR_NUMBER() 'ERROR_NUMBER',
			ERROR_MESSAGE() 'ERROR_MESSAGE',
			ERROR_PROCEDURE() 'ERROR_PROCEDURE',
			ERROR_LINE() 'ERROR_LINE';
		COMMIT TRANSACTION;		--CONFIRMANDO LA TRANSACCIÓN
	END TRY
	BEGIN CATCH
		SELECT
			'IDENTITY' = NULL,
			ERROR_NUMBER() 'ERROR_NUMBER',
			ERROR_MESSAGE() 'ERROR_MESSAGE',
			ERROR_PROCEDURE() 'ERROR_PROCEDURE',
			ERROR_LINE() 'ERROR_LINE';

		ROLLBACK TRANSACTION	--REVIRTIENDO LA TRANSACCIÓN
	END CATCH

GO

/***
	OBJETO: PROCEDURE [DBO].[SP_TB_ROL_RestoreById]
	DESCRIPCION: PROCEDIMIENTO PARA RESTAURAR UN ROL
	FECHA DE CREACION: 03/05/2019
	FECHA DE ACTUALIZACION: 
***/
CREATE PROCEDURE SP_TB_ROL_RestoreById
	@ID_ROL INT,
	@USUARIO_ACTUALIZA INT
AS
	BEGIN TRY
		BEGIN TRANSACTION
				
			UPDATE						--INSERTANDO EL NUEVO ROL
				TB_ROL 
			SET
				USUARIO_ACTUALIZA = @USUARIO_ACTUALIZA, 
				FECHA_ACTUALIZA = GETDATE(), 
				FECHA_BORRADO = NULL
			WHERE
				ID_ROL = @ID_ROL;
			
		SELECT
			'IDENTITY' = @ID_ROL,
			ERROR_NUMBER() 'ERROR_NUMBER',
			ERROR_MESSAGE() 'ERROR_MESSAGE',
			ERROR_PROCEDURE() 'ERROR_PROCEDURE',
			ERROR_LINE() 'ERROR_LINE';
		COMMIT TRANSACTION		--CONFIRMANDO LA TRANSACCIÓN
	END TRY
	BEGIN CATCH
		SELECT
			'IDENTITY' = NULL,
			ERROR_NUMBER() 'ERROR_NUMBER',
			ERROR_MESSAGE() 'ERROR_MESSAGE',
			ERROR_PROCEDURE() 'ERROR_PROCEDURE',
			ERROR_LINE() 'ERROR_LINE';
		ROLLBACK TRANSACTION	--REVIRTIENDO LA TRANSACCIÓN
	END CATCH

GO

/***
	OBJETO: PROCEDURE [DBO].[SP_TB_ROL_DELETE_HARD]
	DESCRIPCION: PROCEDIMIENTO PARA ELIMINAR UN ROL
	FECHA DE CREACION: 03/05/2019
	FECHA DE ACTUALIZACION: 
***/
CREATE PROCEDURE SP_TB_ROL_DELETE_HARD
	@ID_ROL INT
AS
	BEGIN TRY
		BEGIN TRANSACTION
				
			DELETE FROM
				TB_ROL
			WHERE
				ID_ROL = @ID_ROL

		SELECT
			'IDENTITY' = @ID_ROL,
			ERROR_NUMBER() 'ERROR_NUMBER',
			ERROR_MESSAGE() 'ERROR_MESSAGE',
			ERROR_PROCEDURE() 'ERROR_PROCEDURE',
			ERROR_LINE() 'ERROR_LINE';
		COMMIT TRANSACTION		--CONFIRMANDO LA TRANSACCIÓN
	END TRY
	BEGIN CATCH
		SELECT
			'IDENTITY' = NULL,
			ERROR_NUMBER() 'ERROR_NUMBER',
			ERROR_MESSAGE() 'ERROR_MESSAGE',
			ERROR_PROCEDURE() 'ERROR_PROCEDURE',
			ERROR_LINE() 'ERROR_LINE';
		ROLLBACK TRANSACTION	--REVIRTIENDO LA TRANSACCIÓN
	END CATCH

GO


/********************************* TABLA TB_BENEFICIARIO *********************************/
GO

GO

/***
	OBJETO: PROCEDURE [DBO].[SP_TB_BENEFICIARIO_InsertBeneficiario]
	DESCRIPCION: PROCEDIMIENTO PARA INSERTAR UN BENEFICIARIO
	FECHA DE CREACION: 02/05/2019
	FECHA DE ACTUALIZACION: 
***/
CREATE PROCEDURE [dbo].[SP_TB_BENEFICIARIO_InsertBeneficiario]
	@IdSector int,
	@IdPersona int,
	@IdEstadoProceso int,
	@CODIGO_BENEFICIARIO char(7),
	@TipoPersona smallint,
	@Dui char(10),
	@Nit char(14),
	@USUARIO_CREA INT
AS
	BEGIN TRY
		BEGIN TRANSACTION
			INSERT INTO
				TB_BENEFICIARIO(
				ID_SECTOR_ECONOMICO, 
				ID_PERSONA, 
				ID_ESTADO_PROCESO, 
				CODIGO_BENEFICIARIO, 
				TIPO_PERSONA, 
				DUI, 
				NIT, 
				USUARIO_CREA, 
				FECHA_CREA
				)
			VALUES(
				@IdSector, 
				@IdPersona,
				@IdEstadoProceso,
				@CODIGO_BENEFICIARIO,
				@TipoPersona,
				@Dui,
				@Nit,
				@USUARIO_CREA,
				GETDATE()
				)

				
		SELECT
			SCOPE_IDENTITY() 'IDENTITY',
			ERROR_NUMBER() 'ERROR_NUMBER',
			ERROR_MESSAGE() 'ERROR_MESSAGE',
			ERROR_PROCEDURE() 'ERROR_PROCEDURE',
			ERROR_LINE() 'ERROR_LINE';
		COMMIT TRANSACTION		--CONFIRMANDO LA TRANSACCIÓN
	END TRY
	BEGIN CATCH
		SELECT
			SCOPE_IDENTITY() 'IDENTITY',
			ERROR_NUMBER() 'ERROR_NUMBER',
			ERROR_MESSAGE() 'ERROR_MESSAGE',
			ERROR_PROCEDURE() 'ERROR_PROCEDURE',
			ERROR_LINE() 'ERROR_LINE';
		ROLLBACK TRANSACTION
	END CATCH

GO

/***
	OBJETO: PROCEDURE [DBO].[SP_TB_BENEFICIARIO_GetByIdPersona]
	DESCRIPCION: PROCEDIMIENTO PARA BUSCAR UN BENEFICIARIO POR SU ID DE PERSONA
	FECHA DE CREACION: 07/05/2019
	FECHA DE ACTUALIZACION: 
***/
CREATE PROCEDURE [dbo].[SP_TB_BENEFICIARIO_GetByIdPersona]
	@ID_PERSONA INT
AS
	SELECT 
		* 
	FROM 
		TB_BENEFICIARIO
	WHERE 
		ID_PERSONA = @ID_PERSONA;

GO
CREATE PROCEDURE SP_TB_BENEFICIARIO_GetByIdUsuario
 @user int
 AS
 SELECT B.ID_ESTADO_PROCESO,B.ID_BENEFICIARIO FROM
 TB_BENEFICIARIO AS B INNER JOIN TB_PERSONA AS P ON P.ID_PERSONA = B.ID_PERSONA
 INNER JOIN TB_USUARIO AS U ON U.ID_PERSONA = P.ID_PERSONA
 WHERE U.ID_USUARIO = @user
GO
/***
	OBJETO: PROCEDURE [DBO].[SP_TB_BENEFICIARIO_ObterPorEstadoProceso]
	DESCRIPCION: PROCEDIMIENTO PARA OBTENER TODOS LOS BENEFICIARIOS SEGUN SU ESTADO DE PROCESO
	FECHA DE CREACION: 08/05/2019
	FECHA DE ACTUALIZACION: 
	***/
CREATE PROCEDURE [dbo].[SP_TB_BENEFICIARIO_ObterPorEstadoProceso]
	@CodEstadoProceso CHAR(7)
AS

	IF @CodEstadoProceso = ''
		BEGIN
			SELECT *
			FROM VIEW_DETALLE_BENEFICIARIO_CONSULTOR
		END
	ELSE
		BEGIN
			SELECT *
			FROM VIEW_DETALLE_BENEFICIARIO_CONSULTOR
			WHERE CODIGO_ESTADO_PROCESO =  @CodEstadoProceso;
		END

GO

/***
	OBJETO: PROCEDURE [DBO].[SP_TB_BENEFICIARIO_GetById]
	DESCRIPCION: PROCEDIMIENTO PARA BUSCAR UN BENEFICIARIO POR SU ID
	FECHA DE CREACION: 09/05/2019
	FECHA DE ACTUALIZACION: 
***/
CREATE PROCEDURE [dbo].[SP_TB_BENEFICIARIO_GetById]
	@ID INT
AS
	SELECT P.ID_PERSONA ID_PERSONA_BENEFICIARIO, P.[NOMBRES], P.[APELLIDOS], P.[DIRECCION], P.[CORREO_E], B.[TIPO_PERSONA], P.[TEL_FIJO], P.[TEL_CEL], B.[DUI], B.[NIT], D.[NOMBRE_DEPTO], D.ID_DEPARTAMENTO, M.[NOMBRE_MUNIC], M.ID_MUNICIPIO, SE.[NOMBRE_SECTOR], SE.ID_SECTOR_ECONOMICO, EP.[CODIGO_ESTADO_PROCESO], PC.ID_PERSONA ID_PERSONA_CONSULTOR, PC.NOMBRES+' '+PC.APELLIDOS NOMBRE_CONSULTOR_ASIGNADO
	FROM TB_BENEFICIARIO AS B 
	INNER JOIN TB_PERSONA AS P ON P.[ID_PERSONA] = B.[ID_PERSONA]
	INNER JOIN TBC_MUNICIPIO AS M ON M.[ID_MUNICIPIO] = P.[ID_MUNICIPIO]
	INNER JOIN TBC_DEPARTAMENTO AS D ON D.[ID_DEPARTAMENTO] = M.[ID_DEPARTAMENTO]
	INNER JOIN TBC_SECTOR_ECONOMICO AS SE ON SE.[ID_SECTOR_ECONOMICO] = B.[ID_SECTOR_ECONOMICO]
	INNER JOIN TBC_ESTADO_PROCESO AS EP ON EP.[ID_ESTADO_PROCESO] = B.[ID_ESTADO_PROCESO]
	INNER JOIN TB_ASIGNACION AS A ON A.ID_PERSONA_BENEFICIARIO = B.ID_PERSONA
	LEFT JOIN TB_PERSONA AS PC ON PC.ID_PERSONA = A.ID_PERSONA_CONSULTOR
	WHERE ID_BENEFICIARIO = @ID;
GO

/***
	OBJETO: PROCEDURE [DBO].[SP_TB_BENEFICIARIO_GetByIdBeneficiario]
	DESCRIPCION: PROCEDIMIENTO PARA BUSCAR UN BENEFICIARIO POR SU ID
	FECHA DE CREACION: 21/05/2019
	FECHA DE ACTUALIZACION: 
***/
CREATE PROCEDURE [dbo].[SP_TB_BENEFICIARIO_GetByIdBeneficiario]
	@ID_BENEFICIARIO INT
AS
	SELECT
		*
	FROM
		TB_BENEFICIARIO
	WHERE
		ID_BENEFICIARIO = @ID_BENEFICIARIO
GO

/***
	OBJETO: PROCEDURE [DBO].[SP_TB_BENEFICIARIO_CambiarCodigo]
	DESCRIPCION: PROCEDIMIENTO PARA ACTUALIZAR EL CODIGO DE UN BENEFICIARIO EN BASE AL CODIGO ENVIADO
	FECHA DE CREACION: 09/05/2019
	FECHA DE ACTUALIZACION: 
***/
CREATE PROCEDURE [dbo].[SP_TB_BENEFICIARIO_CambiarCodigo]
	@CodBene CHAR(7),
	@IdBeneficiario INT,
	@USUARIO_ACTUALIZA INT
AS

	BEGIN TRY
		BEGIN TRANSACTION
			UPDATE 
				B
			SET
				B.CODIGO_BENEFICIARIO = @CodBene,
				USUARIO_ACTUALIZA = @USUARIO_ACTUALIZA, 
				FECHA_ACTUALIZA = GETDATE()
			FROM   
				[dbo].[TB_BENEFICIARIO] AS B
			WHERE 
				B.[ID_BENEFICIARIO] = @IdBeneficiario

			
			SELECT
				'IDENTITY' = @IdBeneficiario,
				ERROR_NUMBER() 'ERROR_NUMBER',
				ERROR_MESSAGE() 'ERROR_MESSAGE',
				ERROR_PROCEDURE() 'ERROR_PROCEDURE',
				ERROR_LINE() 'ERROR_LINE';

		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
		SELECT
			'IDENTITY' = NULL,
			ERROR_NUMBER() 'ERROR_NUMBER',
			ERROR_MESSAGE() 'ERROR_MESSAGE',
			ERROR_PROCEDURE() 'ERROR_PROCEDURE',
			ERROR_LINE() 'ERROR_LINE';
		ROLLBACK TRANSACTION
	END CATCH
GO


/***
	OBJETO: PROCEDURE [DBO].[SP_TB_BENEFICIARIO_CambiarEstado]
	DESCRIPCION: PROCEDIMIENTO PARA ACTUALIZAR EL ESTADO DE UN BENEFICIARIO EN BASE AL CODIGO ENVIADO
	FECHA DE CREACION: 14/05/2019
	FECHA DE ACTUALIZACION: 
***/
CREATE PROCEDURE [dbo].[SP_TB_BENEFICIARIO_CambiarEstado]
	@CodProceso VARCHAR(5),
	@IdBeneficiario INT,
	@USUARIO_ACTUALIZA INT
AS
	BEGIN TRY
		BEGIN TRANSACTION
			UPDATE 
				B
			SET    
				B.[ID_ESTADO_PROCESO] = (
					SELECT 
						[ID_ESTADO_PROCESO] 
					FROM 
						[dbo].[TBC_ESTADO_PROCESO]
					WHERE 
						[CODIGO_ESTADO_PROCESO]=@CodProceso
					),
				USUARIO_ACTUALIZA = @USUARIO_ACTUALIZA, 
				FECHA_ACTUALIZA = GETDATE()
			FROM   
				[dbo].[TB_BENEFICIARIO] AS B
			WHERE 
				B.[ID_BENEFICIARIO] = @IdBeneficiario

			SELECT
				SCOPE_IDENTITY() 'IDENTITY',
				ERROR_NUMBER() 'ERROR_NUMBER',
				ERROR_MESSAGE() 'ERROR_MESSAGE',
				ERROR_PROCEDURE() 'ERROR_PROCEDURE',
				ERROR_LINE() 'ERROR_LINE';
		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
		SELECT
			SCOPE_IDENTITY() 'IDENTITY',
			ERROR_NUMBER() 'ERROR_NUMBER',
			ERROR_MESSAGE() 'ERROR_MESSAGE',
			ERROR_PROCEDURE() 'ERROR_PROCEDURE',
			ERROR_LINE() 'ERROR_LINE';
		ROLLBACK TRANSACTION
	END CATCH
GO




-- =============================================
-- Author:		YOHALMO DIAZ
-- Create date: 27-MAYO-2019
-- Description:	Actualiza la tabla Beneficiario con la informacion complementaria
-- =============================================
CREATE PROCEDURE SP_TB_BENEFICIARIO_UpdateInfoComplementaria
	@IdBeneficiario int,
	@Dui char(10),
	@Nit char(14),
	@ExistenActivos bit,
	@MasAnyosLugar bit,
	@PuedeComprobar bit,
	@IdMunicipio int,
	@IdSector int,
	@InfoComplementaria varchar(200),
	@Lat char(10),
	@Long char(10),
	@MedioContacto varchar(25),
	@UsuarioActualiza int
AS
BEGIN TRY
		BEGIN TRANSACTION

			UPDATE 
				[dbo].[TB_BENEFICIARIO]
			SET
				DUI = @Dui, 
				NIT = @Nit, 
				LAT = @Lat, 
				LONG = @Long, 
				FECHA_ACTUALIZA = GETDATE(), 
				EXISTEN_ACTIVOS = @ExistenActivos, 
				MAS_ANIOS_EN_LUGAR = @MasAnyosLugar, 
				PUEDE_COMPROBAR_VENTAS = @PuedeComprobar,
				MEDIO_CONTACTO = @MedioContacto,
				INFO_COMPLEMENTARIA = @InfoComplementaria,
				USUARIO_ACTUALIZA = @UsuarioActualiza 
			WHERE
				ID_BENEFICIARIO = @IdBeneficiario;

		SELECT
			'IDENTITY' = @IdBeneficiario,
			ERROR_NUMBER() 'ERROR_NUMBER',
			ERROR_MESSAGE() 'ERROR_MESSAGE',
			ERROR_PROCEDURE() 'ERROR_PROCEDURE',
			ERROR_LINE() 'ERROR_LINE';

		COMMIT TRANSACTION		--CONFIRMANDO LA TRANSACCIÓN
	END TRY
	BEGIN CATCH
		SELECT
			'IDENTITY' = NULL,
			ERROR_NUMBER() 'ERROR_NUMBER',
			ERROR_MESSAGE() 'ERROR_MESSAGE',
			ERROR_PROCEDURE() 'ERROR_PROCEDURE',
			ERROR_LINE() 'ERROR_LINE';

		ROLLBACK TRANSACTION;	--REVIRTIENDO LA TRANSACCIÓN
	END CATCH

/********************************* TABLA TBC_DEPARTAMENTO *********************************/
GO

/***
	OBJETO: PROCEDURE [DBO].[SP_TBC_DEPARTAMENTO_GetDepartamentos]
	DESCRIPCION: PROCEDIMIENTO PARA OBTENER LOS DEPARTAMENTOS
	FECHA DE CREACION: 02/05/2019
	FECHA DE ACTUALIZACION: 
***/
CREATE PROCEDURE [dbo].[SP_TBC_DEPARTAMENTO_GetDepartamentos] AS
	SELECT * FROM dbo.TBC_DEPARTAMENTO;
GO

/***
	OBJETO: PROCEDURE  [DBO].[SP_TBC_MUNICIPIO_GetMunicipiosXDepartamento]
	DESCRIPCION: PROCEDIMIENTO PARA OBTENER LOS MUNICIPIOS DE UN DEPARTAMENTO
	FECHA DE CREACION: 02/05/2019
	FECHA DE ACTUALIZACION: 
***/
CREATE PROCEDURE [dbo].[SP_TBC_MUNICIPIO_GetMunicipiosXDepartamento]
	@DepartamentoId int
AS
		SELECT * FROM [dbo].[TBC_MUNICIPIO]
		WHERE ID_DEPARTAMENTO = @DepartamentoId
GO

/***
	OBJETO: PROCEDURE  [DBO].[SP_TBC_MUNICIPIO_GetDepartamentoByIdMunicipio]
	DESCRIPCION: PROCEDIMIENTO PARA OBTENER EL REGISTRO DEL DEPARTAMENTO
	FECHA DE CREACION: 02/05/2019
	FECHA DE ACTUALIZACION: 
***/
CREATE PROCEDURE SP_TBC_MUNICIPIO_GetDepartamentoByIdMunicipio
	@ID_MUNICIPIO INT
AS
	SELECT
		*
	FROM 
		TBC_DEPARTAMENTO
	WHERE
		ID_DEPARTAMENTO = (
			SELECT
				ID_DEPARTAMENTO
			FROM
				TBC_MUNICIPIO
			WHERE
				ID_MUNICIPIO = @ID_MUNICIPIO
		)
GO

CREATE PROCEDURE [DBO].[SP_TBC_DEPARTAMENTO_INSERT]
   @COD_DEPARTAMENTO CHAR(2),
   @NOMBRE_DEPTO VARCHAR(16),
   @USUARIO_CREA INT
AS 
   BEGIN TRY
         BEGIN TRANSACTION 
               INSERT INTO
                     TBC_DEPARTAMENTO(COD_DEPARTAMENTO, NOMBRE_DEPTO, ID_USUARIO_CREA)
               VALUES
                     (@COD_DEPARTAMENTO, @NOMBRE_DEPTO, @USUARIO_CREA);

               SELECT 
                     SCOPE_IDENTITY() 'IDENTITY',
                     ERROR_NUMBER() 'ERROR NUMBER',
                     ERROR_MESSAGE() 'ERROR_MESSAGE',
                     ERROR_PROCEDURE() 'ERROR_PROCEDURE',
                     ERROR_LINE() 'ERROR_LINE';
         COMMIT TRANSACTION   
   END TRY
   BEGIN CATCH
         SELECT 
               SCOPE_IDENTITY() 'IDENTITY',
               ERROR_NUMBER() 'ERROR_NUMBER',
               ERROR_MESSAGE() 'ERROR_MESSAGE',
               ERROR_PROCEDURE() 'ERROR_PROCEDURE',
               ERROR_LINE() 'ERROR_LINE';
         ROLLBACK TRANSACTION 
   END CATCH
   
   GO 

/***
    OBJETO: PROCEDURE [DBO].[SP_TBC_DEPARTAMENTO_UPDATE]
    DESCRIPCION: PROCEDIMIENTO PARA ACTUALIZAR UN DEPARTAMENTO DEL CATALOGO 
    FECHA DE CREACION: 24/05/2019
    FECHA DE ACTUALIZACION:
    ***/
    CREATE PROCEDURE [DBO].[SP_TBC_DEPARTAMENTO_UPDATE]
        @ID_DEPARTAMENTO INT,
        @COD_DEPARTAMENTO CHAR(2),
        @NOMBRE_DEPTO VARCHAR(16),
        @USUARIO_ACTUALIZA INT
    AS
        BEGIN TRY
            BEGIN TRANSACTION 
                    UPDATE
                        TBC_DEPARTAMENTO
                    SET
                        COD_DEPARTAMENTO = @COD_DEPARTAMENTO,
                        NOMBRE_DEPTO = @NOMBRE_DEPTO,
                        ID_USUARIO_ACTUALIZA = @USUARIO_ACTUALIZA
                    WHERE
                        ID_DEPARTAMENTO = @ID_DEPARTAMENTO;
            SELECT
                'IDENTITY' = @ID_DEPARTAMENTO,
                ERROR_NUMBER() 'ERROR_NUMBER',
                ERROR_MESSAGE() 'ERROR_MESSAGE',
                ERROR_PROCEDURE() 'ERROR_PROCEDURE',
                ERROR_LINE() 'ERROR_LINE';
            COMMIT TRANSACTION 
        END TRY
        BEGIN CATCH
            SELECT 
                'IDENTITY' = NULL,
                ERROR_NUMBER() 'ERROR_NUMBER',
                ERROR_MESSAGE() 'ERROR_MESSAGE',
                ERROR_PROCEDURE() 'ERROR_PROCEDURE',
                ERROR_LINE() 'ERROR_LINE';
            ROLLBACK TRANSACTION
        END CATCH
GO

    /***
    OBJETO: PROCEDURE [DBO].[SP_TBC_DEPARTAMENTO_DELETE_SOFT]
    DESCRIPCION: PROCEDIMIENTO PARA DESACTIVAR UN DEPARTAMENTO DEL CATALOGO 
    FECHA DE CREACION: 24/05/2019
    FECHA DE ACTUALIZACION:
    ***/

    CREATE PROCEDURE SP_TBC_DEPARTAMENTO_DELETE_SOFT
        @ID_DEPARTAMENTO INT,
        @USUARIO_ACTUALIZA INT
    AS
        BEGIN TRY
                BEGIN TRANSACTION

                        UPDATE
                                TBC_DEPARTAMENTO
                        SET
                            ID_USUARIO_ACTUALIZA = @USUARIO_ACTUALIZA,
                            FECHA_BORRADO = GETDATE()
                        WHERE
                            ID_DEPARTAMENTO = @ID_DEPARTAMENTO;
                SELECT
                        'IDENTITY' = @ID_DEPARTAMENTO,
                        ERROR_NUMBER() 'ERROR_NUMBER',
                        ERROR_MESSAGE() 'ERROR_MESSAGE',
                        ERROR_PROCEDURE() 'ERROR_PROCEDURE',
                        ERROR_LINE() 'ERROR_LINE';
                COMMIT TRANSACTION
        END TRY
        BEGIN CATCH
                SELECT
                    'IDENTITY' = NULL,
                    ERROR_NUMBER() 'ERROR_NUMBER',
                    ERROR_MESSAGE() 'ERROR_MESSAGE',
                    ERROR_PROCEDURE() 'ERROR_PROCEDURE',
                    ERROR_LINE() 'ERROR_LINE';
                ROLLBACK TRANSACTION
        END CATCH
GO


/********************************* TABLA TBC_SECTOR_ECONOMICO *********************************/
GO

/***
	OBJETO: PROCEDURE  [DBO].[SP_TBC_SECTOR_ECONOMICO_GetSectores]
	DESCRIPCION: PROCEDIMIENTO PARA OBTENER LOS MUNICIPIOS DE UN DEPARTAMENTO
	FECHA DE CREACION: 02/05/2019
	FECHA DE ACTUALIZACION: 
***/
CREATE PROCEDURE [dbo].[SP_TBC_SECTOR_ECONOMICO_GetSectores] AS
	SELECT * FROM dbo.TBC_SECTOR_ECONOMICO
GO

/********************************* TABLA TB_RECURSO *********************************/
GO

/***
	OBJETO: PROCEDURE [DBO].[SP_TB_RECURSO_GetAll]
	DESCRIPCION: PROCEDIMIENTO PARA OBTENER TODOS LOS RECURSOS, EXCLUYENDO LOS BORRADOS
	FECHA DE CREACION: 03/05/2019
	FECHA DE ACTUALIZACION: 
***/
CREATE PROCEDURE SP_TB_RECURSO_GetAll
AS
	SELECT 
		* 
	FROM 
		TB_RECURSO
	WHERE
		FECHA_BORRADO IS NULL;

GO

/***
	OBJETO: PROCEDURE [DBO].[SP_TB_RECURSO_GetByUrlRecurso]
	DESCRIPCION: PROCEDIMIENTO PARA BUSCAR UN RECURSO A PARTIR DE SU URL
	FECHA DE CREACION: 08/05/2019
	FECHA DE ACTUALIZACION: 
***/
CREATE PROCEDURE SP_TB_RECURSO_GetByUrlRecurso
	@URL_RECURSO VARCHAR(512)
AS
	SELECT 
		*
	FROM 
		TB_RECURSO
	WHERE 
		URL_RECURSO = @URL_RECURSO
		AND
		FECHA_BORRADO IS NULL;

GO

/***
	OBJETO: PROCEDURE [DBO].[SP_TB_RECURSO_GetAllWithDeleted]
	DESCRIPCION: PROCEDIMIENTO PARA OBTENER TODOS LOS RECURSOS, INCLUYENDO LOS BORRADOS
	FECHA DE CREACION: 05/05/2019
	FECHA DE ACTUALIZACION: 
***/
CREATE PROCEDURE SP_TB_RECURSO_GetAllWithDeleted
AS
	SELECT 
		* 
	FROM 
		TB_RECURSO

GO

/***
	OBJETO: PROCEDURE [DBO].[SP_TB_RECURSO_GetById]
	DESCRIPCION: PROCEDIMIENTO PARA BUSCAR UN RECURSO A PARTIR DE SU ID
	FECHA DE CREACION: 03/05/2019
	FECHA DE ACTUALIZACION: 
***/
CREATE PROCEDURE SP_TB_RECURSO_GetById
	@ID_RECURSO INT
AS
	SELECT 
		*
	FROM 
		TB_RECURSO
	WHERE 
		ID_RECURSO = @ID_RECURSO
		AND
		FECHA_BORRADO IS NULL;

GO

/***
	OBJETO: PROCEDURE [DBO].[SP_TB_RECURSO_GetDeleted]
	DESCRIPCION: PROCEDIMIENTO PARA EXTRAER LOS RECURSOS BORRADOS
	FECHA DE CREACION: 03/05/2019
	FECHA DE ACTUALIZACION: 05/03/2019
***/
CREATE PROCEDURE SP_TB_RECURSO_GetDeleted
AS
	SELECT 
		* 
	FROM 
		TB_RECURSO 
	WHERE 
		FECHA_BORRADO IS NOT NULL;


GO

/***
	OBJETO: PROCEDURE [DBO].[SP_TB_RECURSO_INSERT]
	DESCRIPCION: PROCEDIMIENTO PARA INSERTAR UN RECURSO NUEVO
	FECHA DE CREACION: 03/05/2019
	FECHA DE ACTUALIZACION: 05/05/2019
***/
CREATE PROCEDURE SP_TB_RECURSO_INSERT
	@URL_RECURSO VARCHAR(512),
	@NOMBRE VARCHAR(64),
	@USUARIO_CREA INT
AS
	DECLARE @FECHA DATETIME;
	SET @FECHA = GETDATE();

	BEGIN TRY
		BEGIN TRANSACTION

			INSERT INTO 
				TB_RECURSO(URL_RECURSO, NOMBRE, USUARIO_CREA, FECHA_CREA) 
			VALUES
				(@URL_RECURSO, @NOMBRE, @USUARIO_CREA, @FECHA);

			SELECT
				SCOPE_IDENTITY() 'IDENTITY',
				ERROR_NUMBER() 'ERROR_NUMBER',
				ERROR_MESSAGE() 'ERROR_MESSAGE',
				ERROR_PROCEDURE() 'ERROR_PROCEDURE',
				ERROR_LINE() 'ERROR_LINE';
		COMMIT TRANSACTION		--CONFIRMANDO LA TRANSACCIÓN
	END TRY
	BEGIN CATCH
		SELECT
			SCOPE_IDENTITY() 'IDENTITY',
			ERROR_NUMBER() 'ERROR_NUMBER',
			ERROR_MESSAGE() 'ERROR_MESSAGE',
			ERROR_PROCEDURE() 'ERROR_PROCEDURE',
			ERROR_LINE() 'ERROR_LINE';
		ROLLBACK TRANSACTION	--REVIRTIENDO LA TRANSACCIÓN
	END CATCH

GO

/***
	OBJETO: PROCEDURE [DBO].[SP_TB_RECURSO_UPDATE]
	DESCRIPCION: PROCEDIMIENTO PARA ACTUALIZAR UN RECURSO
	FECHA DE CREACION: 03/05/2019
	FECHA DE ACTUALIZACION: 05/05/2019
***/
CREATE PROCEDURE SP_TB_RECURSO_UPDATE
	@ID_RECURSO INT,
	@URL_RECURSO VARCHAR(512),
	@NOMBRE VARCHAR(64),
	@USUARIO_ACTUALIZA INT
AS
	BEGIN TRY
		BEGIN TRANSACTION
				
			UPDATE
				TB_RECURSO 
			SET
				URL_RECURSO = @URL_RECURSO, 
				NOMBRE = @NOMBRE, 
				USUARIO_ACTUALIZA = @USUARIO_ACTUALIZA, 
				FECHA_ACTUALIZA = GETDATE()
			WHERE
				ID_RECURSO = @ID_RECURSO;
				
		SELECT
			'IDENTITY' = @ID_RECURSO,
			ERROR_NUMBER() 'ERROR_NUMBER',
			ERROR_MESSAGE() 'ERROR_MESSAGE',
			ERROR_PROCEDURE() 'ERROR_PROCEDURE',
			ERROR_LINE() 'ERROR_LINE';
		COMMIT TRANSACTION		--CONFIRMANDO LA TRANSACCIÓN
	END TRY
	BEGIN CATCH
		SELECT
			'IDENTITY' = NULL,
			ERROR_NUMBER() 'ERROR_NUMBER',
			ERROR_MESSAGE() 'ERROR_MESSAGE',
			ERROR_PROCEDURE() 'ERROR_PROCEDURE',
			ERROR_LINE() 'ERROR_LINE';
		ROLLBACK TRANSACTION	--REVIRTIENDO LA TRANSACCIÓN
	END CATCH

GO

/***
	OBJETO: PROCEDURE [DBO].[SP_TB_RECURSO_DELETE_SOFT]
	DESCRIPCION: PROCEDIMIENTO PARA DESACTIVAR UN RECURSO
	FECHA DE CREACION: 03/05/2019
	FECHA DE ACTUALIZACION: 
***/
CREATE PROCEDURE SP_TB_RECURSO_DELETE_SOFT
	@ID_RECURSO INT,
	@USUARIO_ACTUALIZA INT
AS
	BEGIN TRY
		BEGIN TRANSACTION
				
			UPDATE
				TB_RECURSO
			SET
				USUARIO_ACTUALIZA = @USUARIO_ACTUALIZA, 
				FECHA_BORRADO = GETDATE()
			WHERE
				ID_RECURSO = @ID_RECURSO;

		SELECT
			'IDENTITY' = @ID_RECURSO,
			ERROR_NUMBER() 'ERROR_NUMBER',
			ERROR_MESSAGE() 'ERROR_MESSAGE',
			ERROR_PROCEDURE() 'ERROR_PROCEDURE',
			ERROR_LINE() 'ERROR_LINE';
		COMMIT TRANSACTION		--CONFIRMANDO LA TRANSACCIÓN
	END TRY
	BEGIN CATCH
		SELECT
			'IDENTITY' = NULL,
			ERROR_NUMBER() 'ERROR_NUMBER',
			ERROR_MESSAGE() 'ERROR_MESSAGE',
			ERROR_PROCEDURE() 'ERROR_PROCEDURE',
			ERROR_LINE() 'ERROR_LINE';
		ROLLBACK TRANSACTION	--REVIRTIENDO LA TRANSACCIÓN
	END CATCH

GO

/***
	OBJETO: PROCEDURE [DBO].[SP_TB_RECURSO_RestoreById]
	DESCRIPCION: PROCEDIMIENTO PARA RESTAURAR UN RECURSO POR SU ID
	FECHA DE CREACION: 03/05/2019
	FECHA DE ACTUALIZACION: 05/05/2019
***/
CREATE PROCEDURE SP_TB_RECURSO_RestoreById
	@ID_RECURSO INT,
	@USUARIO_ACTUALIZA INT
AS
	BEGIN TRY
		BEGIN TRANSACTION
				
			UPDATE
				TB_RECURSO 
			SET
				USUARIO_ACTUALIZA = @USUARIO_ACTUALIZA,
				FECHA_ACTUALIZA = GETDATE(), 
				FECHA_BORRADO = NULL
			WHERE
				ID_RECURSO = @ID_RECURSO;
		SELECT
			'IDENTITY' = @ID_RECURSO,
			ERROR_NUMBER() 'ERROR_NUMBER',
			ERROR_MESSAGE() 'ERROR_MESSAGE',
			ERROR_PROCEDURE() 'ERROR_PROCEDURE',
			ERROR_LINE() 'ERROR_LINE';

		COMMIT TRANSACTION		--CONFIRMANDO LA TRANSACCIÓN
	END TRY
	BEGIN CATCH
		SELECT
			'IDENTITY' = NULL,
			ERROR_NUMBER() 'ERROR_NUMBER',
			ERROR_MESSAGE() 'ERROR_MESSAGE',
			ERROR_PROCEDURE() 'ERROR_PROCEDURE',
			ERROR_LINE() 'ERROR_LINE';

		ROLLBACK TRANSACTION	--REVIRTIENDO LA TRANSACCIÓN
	END CATCH

GO

/***
	OBJETO: PROCEDURE [DBO].[SP_TB_RECURSO_DELETE_HARD]
	DESCRIPCION: PROCEDIMIENTO PARA ELIMINAR UN RECURSO
	FECHA DE CREACION: 03/05/2019
	FECHA DE ACTUALIZACION: 
***/
CREATE PROCEDURE SP_TB_RECURSO_DELETE_HARD
	@ID_RECURSO INT
AS
	BEGIN TRY
		BEGIN TRANSACTION
				
			DELETE FROM
				TB_RECURSO
			WHERE
				ID_RECURSO = @ID_RECURSO
		SELECT
			'IDENTITY' = @ID_RECURSO,
			ERROR_NUMBER() 'ERROR_NUMBER',
			ERROR_MESSAGE() 'ERROR_MESSAGE',
			ERROR_PROCEDURE() 'ERROR_PROCEDURE',
			ERROR_LINE() 'ERROR_LINE';
		COMMIT TRANSACTION		--CONFIRMANDO LA TRANSACCIÓN
	END TRY
	BEGIN CATCH
		SELECT
			'IDENTITY' = NULL,
			ERROR_NUMBER() 'ERROR_NUMBER',
			ERROR_MESSAGE() 'ERROR_MESSAGE',
			ERROR_PROCEDURE() 'ERROR_PROCEDURE',
			ERROR_LINE() 'ERROR_LINE';
		ROLLBACK TRANSACTION	--REVIRTIENDO LA TRANSACCIÓN
	END CATCH

GO


/********************************* TABLA TB_PERMISO *********************************/
GO

/***
	OBJETO: PROCEDURE [DBO].[SP_TB_PERMISO_GetAll]
	DESCRIPCION: PROCEDIMIENTO PARA OBTENER TODOS LOS PERMISOS, EXCEPTUANDO LOS BORRADOS
	FECHA DE CREACION: 05/05/2019
	FECHA DE ACTUALIZACION: 
***/
CREATE PROCEDURE SP_TB_PERMISO_GetAll
AS
	SELECT 
		* 
	FROM 
		TB_PERMISO
	WHERE
		FECHA_BORRADO IS NULL

GO

/***
	OBJETO: PROCEDURE [DBO].[SP_TB_PERMISO_GetAllWithDeleted]
	DESCRIPCION: PROCEDIMIENTO PARA OBTENER TODOS LOS PERMISOS, INCLUYENDO LOS BORRADOS
	FECHA DE CREACION: 05/05/2019
	FECHA DE ACTUALIZACION: 
***/
CREATE PROCEDURE SP_TB_PERMISO_GetAllWithDeleted
AS
	SELECT 
		* 
	FROM 
		TB_PERMISO

GO

/***
	OBJETO: PROCEDURE [DBO].[SP_TB_PERMISO_GetByRol]
	DESCRIPCION: PROCEDIMIENTO QUE DEVUELVE LOS RECURSOS ASIGNADOS A UN ROL ESPECIFICADO
	FECHA DE CREACION: 05/05/2019
	FECHA DE ACTUALIZACION: 
***/
CREATE PROCEDURE SP_TB_PERMISO_GetByRol
	@ID_ROL INT
AS
	SELECT 
		*
	FROM
		TB_RECURSO
	WHERE
		ID_RECURSO IN (
			SELECT 
				ID_RECURSO
			FROM
				TB_PERMISO
			WHERE
				ID_ROL = @ID_ROL
				AND
				FECHA_BORRADO IS NULL
		)
		AND
		FECHA_BORRADO IS NULL;
			
GO


/***
	OBJETO: PROCEDURE [DBO].[SP_TB_PERMISO_GetByRecurso]
	DESCRIPCION: PROCEDIMIENTO QUE DEVUELVE LOS ROLES QUE POSEEN PERMISO DE ACCESO A UN RECURSO DETERMINADO
	FECHA DE CREACION: 05/05/2019
	FECHA DE ACTUALIZACION: 
***/
CREATE PROCEDURE SP_TB_PERMISO_GetByRecurso
	@ID_RECURSO INT
AS
	SELECT 
		*
	FROM
		TB_ROL
	WHERE
		ID_ROL IN (
			SELECT 
				ID_ROL
			FROM
				TB_PERMISO
			WHERE
				ID_RECURSO = @ID_RECURSO
				AND
				FECHA_BORRADO IS NULL
		)
		AND
		FECHA_BORRADO IS NULL;

GO

/***
	OBJETO: PROCEDURE [DBO].[SP_TB_PERMISO_GetByRol]
	DESCRIPCION: PROCEDIMIENTO PARA BUSCAR TODOS LOS RECURSOS ASIGNADOS A UN ROL
	FECHA DE CREACION: 05/05/2019
	FECHA DE ACTUALIZACION: 20/05/2019
***/
CREATE PROCEDURE SP_TB_PERMISO_GetByRolRecurso
	@ID_RECURSO INT
AS
	SELECT 
		* 
	FROM 
		TB_PERMISO 
	WHERE 
		ID_RECURSO = @ID_RECURSO
		AND
		FECHA_BORRADO IS NULL;


GO

/***
	OBJETO: PROCEDURE [DBO].[SP_TB_PERMISO_GetDeleted]
	DESCRIPCION: PROCEDIMIENTO PARA EXTRAER LOS PERMISOS BORRADOS
	FECHA DE CREACION: 05/05/2019
	FECHA DE ACTUALIZACION: 
***/
CREATE PROCEDURE SP_TB_PERMISO_GetDeleted
AS
	SELECT 
		* 
	FROM 
		TB_PERMISO 
	WHERE 
		FECHA_BORRADO IS NOT NULL;

GO

/***
	OBJETO: PROCEDURE [DBO].[SP_TB_PERMISO_INSERT]
	DESCRIPCION: PROCEDIMIENTO PARA INSERTAR UN PERMISO NUEVO
	FECHA DE CREACION: 05/05/2019
	FECHA DE ACTUALIZACION:
***/
CREATE PROCEDURE SP_TB_PERMISO_INSERT
	@ID_ROL INT,
	@ID_RECURSO INT,
	@USUARIO_CREA INT
AS
	DECLARE @FECHA DATETIME;
	SET @FECHA = GETDATE();

	BEGIN TRY
		BEGIN TRANSACTION

			INSERT INTO 
				TB_PERMISO(ID_ROL, ID_RECURSO, USUARIO_CREA, FECHA_CREA) 
			VALUES
				(@ID_ROL, @ID_RECURSO, @USUARIO_CREA, @FECHA);

			SELECT
				SCOPE_IDENTITY() 'IDENTITY',
				ERROR_NUMBER() 'ERROR_NUMBER',
				ERROR_MESSAGE() 'ERROR_MESSAGE',
				ERROR_PROCEDURE() 'ERROR_PROCEDURE',
				ERROR_LINE() 'ERROR_LINE';

		COMMIT TRANSACTION		--CONFIRMANDO LA TRANSACCIÓN
	END TRY
	BEGIN CATCH

		SELECT
			SCOPE_IDENTITY() 'IDENTITY',
			ERROR_NUMBER() 'ERROR_NUMBER',
			ERROR_MESSAGE() 'ERROR_MESSAGE',
			ERROR_PROCEDURE() 'ERROR_PROCEDURE',
			ERROR_LINE() 'ERROR_LINE';
		ROLLBACK TRANSACTION	--REVIRTIENDO LA TRANSACCIÓN
	END CATCH

GO

/***
	OBJETO: PROCEDURE [DBO].[SP_TB_PERMISO_DELETE_SOFT]
	DESCRIPCION: PROCEDIMIENTO PARA DESACTIVAR UN PERMISO
	FECHA DE CREACION: 05/05/2019
	FECHA DE ACTUALIZACION: 
***/
CREATE PROCEDURE SP_TB_PERMISO_DELETE_SOFT
	@ID_ROL INT,
	@ID_RECURSO INT,
	@USUARIO_ACTUALIZA INT

AS
	DECLARE @FECHA DATETIME;
	SET @FECHA = GETDATE();

	BEGIN TRY
		BEGIN TRANSACTION
				
			UPDATE
				TB_PERMISO
			SET
				USUARIO_ACTUALIZA = @USUARIO_ACTUALIZA, FECHA_ACTUALIZA = @FECHA, FECHA_BORRADO = @FECHA
			WHERE
				ID_RECURSO = @ID_RECURSO
				AND
				ID_ROL = @ID_ROL;

		SELECT
			'IDENTITY' = @ID_ROL,
			ERROR_NUMBER() 'ERROR_NUMBER',
			ERROR_MESSAGE() 'ERROR_MESSAGE',
			ERROR_PROCEDURE() 'ERROR_PROCEDURE',
			ERROR_LINE() 'ERROR_LINE';
		COMMIT TRANSACTION		--CONFIRMANDO LA TRANSACCIÓN
	END TRY
	BEGIN CATCH

		SELECT
			'IDENTITY' = NULL,
			ERROR_NUMBER() 'ERROR_NUMBER',
			ERROR_MESSAGE() 'ERROR_MESSAGE',
			ERROR_PROCEDURE() 'ERROR_PROCEDURE',
			ERROR_LINE() 'ERROR_LINE';
		ROLLBACK TRANSACTION	--REVIRTIENDO LA TRANSACCIÓN
	END CATCH

GO

/***
	OBJETO: PROCEDURE [DBO].[SP_TB_PERMISO_RestoreById]
	DESCRIPCION: PROCEDIMIENTO PARA RESTAURAR UN PERMISO POR SU ID
	FECHA DE CREACION: 05/05/2019
	FECHA DE ACTUALIZACION: 
***/
CREATE PROCEDURE SP_TB_PERMISO_RestoreById
	@ID_ROL INT,
	@ID_RECURSO INT,
	@USUARIO_ACTUALIZA INT
AS
	BEGIN TRY
		BEGIN TRANSACTION
				
			UPDATE
				TB_PERMISO 
			SET
				USUARIO_ACTUALIZA = @USUARIO_ACTUALIZA, 
				FECHA_ACTUALIZA = GETDATE(), 
				FECHA_BORRADO = NULL
			WHERE
				ID_RECURSO = @ID_RECURSO
				AND
				ID_ROL = @ID_ROL;

			SELECT
				'IDENTITY' = @ID_ROL,
				ERROR_NUMBER() 'ERROR_NUMBER',
				ERROR_MESSAGE() 'ERROR_MESSAGE',
				ERROR_PROCEDURE() 'ERROR_PROCEDURE',
				ERROR_LINE() 'ERROR_LINE';
		COMMIT TRANSACTION		--CONFIRMANDO LA TRANSACCIÓN
	END TRY
	BEGIN CATCH
		SELECT
			'IDENTITY' = NULL,
			ERROR_NUMBER() 'ERROR_NUMBER',
			ERROR_MESSAGE() 'ERROR_MESSAGE',
			ERROR_PROCEDURE() 'ERROR_PROCEDURE',
			ERROR_LINE() 'ERROR_LINE';
		ROLLBACK TRANSACTION	--REVIRTIENDO LA TRANSACCIÓN
	END CATCH

GO

/***
	OBJETO: PROCEDURE [DBO].[SP_TB_PERMISO_DELETE_HARD]
	DESCRIPCION: PROCEDIMIENTO PARA ELIMINAR UN PERMISO
	FECHA DE CREACION: 05/05/2019
	FECHA DE ACTUALIZACION: 
***/
CREATE PROCEDURE SP_TB_PERMISO_DELETE_HARD
	@ID_ROL INT,
	@ID_RECURSO INT
AS
	BEGIN TRY
		BEGIN TRANSACTION
				
			DELETE FROM
				TB_PERMISO
			WHERE
				ID_RECURSO = @ID_RECURSO
				AND
				ID_ROL = @ID_ROL;

		SELECT
			'IDENTITY' = @ID_ROL,
			ERROR_NUMBER() 'ERROR_NUMBER',
			ERROR_MESSAGE() 'ERROR_MESSAGE',
			ERROR_PROCEDURE() 'ERROR_PROCEDURE',
			ERROR_LINE() 'ERROR_LINE';
		COMMIT TRANSACTION		--CONFIRMANDO LA TRANSACCIÓN
	END TRY
	BEGIN CATCH
		SELECT
			'IDENTITY' = NULL,
			ERROR_NUMBER() 'ERROR_NUMBER',
			ERROR_MESSAGE() 'ERROR_MESSAGE',
			ERROR_PROCEDURE() 'ERROR_PROCEDURE',
			ERROR_LINE() 'ERROR_LINE';
		ROLLBACK TRANSACTION	--REVIRTIENDO LA TRANSACCIÓN
	END CATCH

GO


	

/********************************* TABLA TB_PROPUESTA *********************************/


/***
	OBJETO: PROCEDURE [DBO].[SP_TB_PROPUESTA_InsertPropuesta]
	DESCRIPCION: PROCEDIMIENTO PARA INGRESAR UN UNA PROPUESTA A UN PROBLEMA
	FECHA DE CREACION: 22/05/2019
	FECHA DE ACTUALIZACION: 23/05/2019
	AUTOR: Frederick Mejia
***/
CREATE PROCEDURE [dbo].[SP_TB_PROPUESTA_InsertPropuesta]
	@IdProblema int,
	@IdUsuarioFormula int,
	@IdEstadoProceso int,
	@IdTipoIniciativa int,
	@SolucionAdopcion text,
	@SolucionAsistencia text,
	@SolucionInnovacion text,
	@ComponentesBasicos text,
	@InformacionAdicional text,
	@PresupuestoContrapartida text,
	@UsuarioCrea int
AS
	BEGIN TRY
		BEGIN TRANSACTION

			INSERT INTO [dbo].[TB_PROPUESTA]
           ([ID_PROBLEMA]
           ,[ID_USUARIO_FORMULA]
           ,[ID_ESTADO_PROCESO]
           ,[ID_TIPO_INICIATIVA]
           ,[ID_USUARIO_CREA]
           ,[FECHA_CREA]
           ,[SOLUCION_ASISTENCIA]
           ,[SOLUCION_ADOPCION]
           ,[SOLUCION_INNOVACION]
           ,[COMPONENTES_BASICOS]
           ,[INFORMACION_ADICIONAL]
           ,[PRESUPUESTO_CONTRAPARTIDA])
     VALUES
           (@IdProblema
           ,@IdUsuarioFormula
           ,@IdEstadoProceso
           ,@IdTipoIniciativa
           ,@UsuarioCrea
           ,GETDATE()
           ,@SolucionAsistencia
           ,@SolucionAdopcion
           ,@SolucionInnovacion
           ,@ComponentesBasicos
           ,@InformacionAdicional
           ,@PresupuestoContrapartida);

			SELECT
				SCOPE_IDENTITY() 'IDENTITY',
				ERROR_NUMBER() 'ERROR_NUMBER',
				ERROR_MESSAGE() 'ERROR_MESSAGE',
				ERROR_PROCEDURE() 'ERROR_PROCEDURE',
				ERROR_LINE() 'ERROR_LINE';

		COMMIT TRANSACTION		--CONFIRMANDO LA TRANSACCIÓN
	END TRY
	BEGIN CATCH

		SELECT
			SCOPE_IDENTITY() 'IDENTITY',
			ERROR_NUMBER() 'ERROR_NUMBER',
			ERROR_MESSAGE() 'ERROR_MESSAGE',
			ERROR_PROCEDURE() 'ERROR_PROCEDURE',
			ERROR_LINE() 'ERROR_LINE';
		ROLLBACK TRANSACTION	--REVIRTIENDO LA TRANSACCIÓN
	END CATCH


	GO

/***
	OBJETO: PROCEDURE [DBO].[SP_TB_PROPUESTA_ObtenerPropuestasDeFormuladorPorIdProblema]
	DESCRIPCION: PROCEDIMIENTO PARA OBTENER LAS PROPUESTAS HECHAS DE UN FORMULADOR A UN PROBLEMA
	FECHA DE CREACION: 23/05/2019
	FECHA DE ACTUALIZACION:
	AUTOR: FREDERICK MEJIA
***/
CREATE PROCEDURE [SP_TB_PROPUESTA_ObtenerPropuestasDeFormuladorPorIdProblema]
	@ID_FORMULADOR INT,
	@ID_PROBLEMA INT
AS
	SELECT
		*
	FROM
		TB_PROPUESTA
	WHERE
		ID_USUARIO_FORMULA = @ID_FORMULADOR
		AND
		ID_PROBLEMA = @ID_PROBLEMA
GO

/***
	OBJETO: PROCEDURE [DBO].[SP_TB_PROPUESTA_ObtenerBeneficiarioPorIdPropuesta]
	DESCRIPCION: PROCEDIMIENTO PARA OBTENER EL BENEFICIARIO POR ELID DE LA PROPUESTA
	FECHA DE CREACION: 03/06/2019
	FECHA DE ACTUALIZACION:
	AUTOR: FREDERICK MEJIA
***/
CREATE PROCEDURE [SP_TB_PROPUESTA_ObtenerBeneficiarioPorIdPropuesta]
	@ID_PROPUESTA INT
	AS
		SELECT B.*
		FROM TB_PROPUESTA AS PR
		INNER JOIN TB_PROBLEMA AS P ON PR.ID_PROBLEMA = P.ID_PROBLEMA
		INNER JOIN TB_BENEFICIARIO AS B ON B.ID_BENEFICIARIO = P.ID_BENEFICIARIO
		WHERE PR.ID_PROPUESTA=@ID_PROPUESTA
		

GO
/***
	OBJETO: PROCEDURE [DBO].[SP_TB_PROBLEMA_ObtenerProblemaPorId]
	DESCRIPCION: PROCEDIMIENTO PARA OBTENER EL DETALLE DEL PROBLEMA POR ID
	FECHA DE CREACION: 23/05/2019
	FECHA DE ACTUALIZACION:
	AUTOR: FREDERICK MEJIA
***/
CREATE PROCEDURE [SP_TB_PROBLEMA_ObtenerProblemaPorId]
	@ID_PROBLEMA INT
AS
	SELECT
		*
	FROM
		TB_PROBLEMA
	WHERE
		ID_PROBLEMA = @ID_PROBLEMA
GO

-- =============================================
-- Author:		YOHALMO DIAZ
-- Create date: 27/05/2019
-- Description:	Cambia el estado de proceso en la tabla propuesta
-- =============================================
CREATE PROCEDURE SP_TB_PROPUESTA_CambiarEstado
	@CodProceso VARCHAR(5),
	@IdPropuesta INT,
	@USUARIO_ACTUALIZA INT
AS
BEGIN TRY
		BEGIN TRANSACTION
			UPDATE 
				B
			SET    
				B.[ID_ESTADO_PROCESO] = (
					SELECT 
						[ID_ESTADO_PROCESO] 
					FROM 
						[dbo].[TBC_ESTADO_PROCESO]
					WHERE 
						[CODIGO_ESTADO_PROCESO]=@CodProceso
					),
				B.ID_USUARIO_ACTUALIZA = @USUARIO_ACTUALIZA, 
				B.FECHA_ACTUALIZA = GETDATE()
			FROM   
				 [dbo].[TB_PROPUESTA] AS B
			WHERE 
				B.ID_PROPUESTA = @IdPropuesta

			SELECT
			'IDENTITY' = @IdPropuesta,
			ERROR_NUMBER() 'ERROR_NUMBER',
			ERROR_MESSAGE() 'ERROR_MESSAGE',
			ERROR_PROCEDURE() 'ERROR_PROCEDURE',
			ERROR_LINE() 'ERROR_LINE';

		COMMIT TRANSACTION		--CONFIRMANDO LA TRANSACCIÓN
	END TRY
	BEGIN CATCH
		SELECT
			'IDENTITY' = NULL,
			ERROR_NUMBER() 'ERROR_NUMBER',
			ERROR_MESSAGE() 'ERROR_MESSAGE',
			ERROR_PROCEDURE() 'ERROR_PROCEDURE',
			ERROR_LINE() 'ERROR_LINE';

		ROLLBACK TRANSACTION;	--REVIRTIENDO LA TRANSACCIÓN
	END CATCH
GO

/***
	OBJETO: PROCEDURE [DBO].[SP_TB_OBSERVACION_UPDATE]
	DESCRIPCION: PROCEDIMIENTO PARA ACTUALIZAR UNA OBSERVACION
	FECHA DE CREACION: 28/05/2019
	FECHA DE ACTUALIZACION:
***/
CREATE PROCEDURE SP_TB_OBSERVACION_UPDATE
	@ID_OBSERVACION INT,
	@CODIGO_ESTADO_PROCESO VARCHAR(6),
	@DESCRIPCION VARCHAR(4096),
	@ENTIDAD VARCHAR(128),
	@ID INT,
	@RESUELTO SMALLINT
AS
BEGIN TRY
		BEGIN TRANSACTION
			UPDATE 
				TB_OBSERVACION
			SET    
				DESCRIPCION = @DESCRIPCION,
				ENTIDAD = @ENTIDAD,
				ID = @ID,
				FECHA = GETDATE(),
				RESUELTO = @RESUELTO,
				ID_ESTADO_PROCESO = (
					SELECT
						ID_ESTADO_PROCESO
					FROM 
						TBC_ESTADO_PROCESO
					WHERE
						CODIGO_ESTADO_PROCESO = @CODIGO_ESTADO_PROCESO
						),
					@ID_OBSERVACION = ID_OBSERVACION
			WHERE
				ID_OBSERVACION = @ID_OBSERVACION

			SELECT
			'IDENTITY' = @ID_OBSERVACION,
			ERROR_NUMBER() 'ERROR_NUMBER',
			ERROR_MESSAGE() 'ERROR_MESSAGE',
			ERROR_PROCEDURE() 'ERROR_PROCEDURE',
			ERROR_LINE() 'ERROR_LINE';

		COMMIT TRANSACTION		--CONFIRMANDO LA TRANSACCIÓN
	END TRY
	BEGIN CATCH
		SELECT
			'IDENTITY' = NULL,
			ERROR_NUMBER() 'ERROR_NUMBER',
			ERROR_MESSAGE() 'ERROR_MESSAGE',
			ERROR_PROCEDURE() 'ERROR_PROCEDURE',
			ERROR_LINE() 'ERROR_LINE';

		ROLLBACK TRANSACTION;	--REVIRTIENDO LA TRANSACCIÓN
	END CATCH
GO


/***
	OBJETO: PROCEDURE [DBO].[SP_TB_OBSERVACION_GetByIdObservacion]
	DESCRIPCION: PROCEDIMIENTO PARA OBTENER UNA OBSERVACION A PARTIR DE SU ID
	FECHA DE CREACION: 28/05/2019
	FECHA DE ACTUALIZACION:
***/
CREATE PROCEDURE SP_TB_OBSERVACION_GetByIdObservacion
	@ID_OBSERVACION INT
AS
	SELECT
		*
	FROM 
		TB_OBSERVACION
	WHERE
		ID_OBSERVACION = ID_OBSERVACION
GO

/***
	OBJETO: PROCEDURE [DBO].[SP_TB_OBSERVACION_GetByIdObservacion]
	DESCRIPCION: PROCEDIMIENTO PARA OBTENER UNA OBSERVACION A PARTIR DE SU ID
	FECHA DE CREACION: 28/05/2019
	FECHA DE ACTUALIZACION:
***/
CREATE PROCEDURE SP_TB_OBSERVACION_Resolver
	@ID INT,
	@entidad varchar(128)
AS
	UPDATE TB_OBSERVACION
	SET RESUELTO=1
	WHERE ID=@ID AND ENTIDAD=@entidad
GO
/***

	DESCRIPCION: PROCEDIMIENTO PARA OBTENER UNA OBSERVACION A PARTIR DE SU ID
	FECHA DE CREACION: 28/05/2019
	FECHA DE ACTUALIZACION:
***/
CREATE PROCEDURE SP_TB_OBSERVACION_GetByIdAndEntidad
	@ID INT,
	@entidad varchar(128)
AS
	SELECT
		*
	FROM 
		TB_OBSERVACION
	WHERE ID=@ID AND ENTIDAD = @entidad AND RESUELTO=0
		
GO

/********************************* TABLA TB_OBSERVACION *********************************/

-- =============================================
-- Author:		YOHALMO DIAZ
-- Create date: 23/05/2019
-- Description:	Ingresa una observación
-- =============================================
CREATE PROCEDURE SP_TB_OBSERVACION_CrearObservacion
	@IdEstadoProceso INT,
	@Descripcion VARCHAR(4096),
	@Entidad VARCHAR(128),
	@IdEntidad INT,
	@Resuelto SMALLINT
AS
BEGIN
BEGIN TRY
	BEGIN TRANSACTION

		INSERT INTO TB_OBSERVACION([ID_ESTADO_PROCESO], [DESCRIPCION], [ENTIDAD], [ID], [FECHA], [RESUELTO]) 
		VALUES (@IdEstadoProceso, @Descripcion, @Entidad, @IdEntidad, GETDATE(), @Resuelto)


		SELECT
			SCOPE_IDENTITY() 'IDENTITY',
			ERROR_NUMBER() 'ERROR_NUMBER',
			ERROR_MESSAGE() 'ERROR_MESSAGE',
			ERROR_PROCEDURE() 'ERROR_PROCEDURE',
			ERROR_LINE() 'ERROR_LINE';
	COMMIT TRANSACTION
END TRY
BEGIN CATCH
	SELECT
		SCOPE_IDENTITY() 'IDENTITY',
		ERROR_NUMBER() 'ERROR_NUMBER',
		ERROR_MESSAGE() 'ERROR_MESSAGE',
		ERROR_PROCEDURE() 'ERROR_PROCEDURE',
		ERROR_LINE() 'ERROR_LINE';
	ROLLBACK TRANSACTION;
END CATCH
END
GO



/********************************* TABLA TB_ASIG_CONSULTOR_VINCULACION *********************************/

-- =============================================
-- Author:		YOHALMO DIAZ
-- Create date: 27-Mayo-2019
-- Description:	Busca un consultor basado en el IdMunicipio evalua el numero de beneficiarios 
-- que tiene asociados y en base a eso hace la asignacion de nuevos beneficiarios a los consultores
-- =============================================
CREATE PROCEDURE [dbo].[SP_TB_ASIG_CONSULTOR_VINCULACION_AsignarConsultorABeneficiario]
	@IdMunicipio INT,
	@IdSector INT,
	@IdBeneficiario INT,
	@IdConsultor INT
AS
BEGIN
	DECLARE @IdConsul INT

	IF(@IdConsultor = 0)
		BEGIN
			IF(@IdSector = 0) --SI EL SECTOR ECONOMICO NO SE INGRESA
				SET @IdConsul = (
					SELECT TOP 1 ACV.ID_PERSONA AS ID_CONSULTOR -- COUNT(A.ID_BENEFICIARIO) AS BENEFICIARIOS_ASIGNADOS
					FROM TB_ASIGNACION A
					RIGHT JOIN TB_ASIG_CONSULTOR_VINCULACION ACV ON ACV.ID_PERSONA = A.ID_PERSONA_CONSULTOR
					WHERE ACV.ID_MUNICIPIO = @IdMunicipio
					GROUP BY ACV.ID_PERSONA
					ORDER BY COUNT(A.ID_PERSONA_BENEFICIARIO)
					)
			ELSE			  --CON INFO COMPLETA SECTOR Y MUNICIPIO
				SET @IdConsul = (
					SELECT TOP 1 ACV.ID_PERSONA AS ID_CONSULTOR -- COUNT(A.ID_BENEFICIARIO) AS BENEFICIARIOS_ASIGNADOS
					FROM TB_ASIGNACION A
					RIGHT JOIN TB_ASIG_CONSULTOR_VINCULACION ACV ON ACV.ID_PERSONA = A.ID_PERSONA_CONSULTOR
					WHERE ACV.ID_MUNICIPIO = @IdMunicipio AND ACV.ID_SECTOR_ECONOMICO = @IdSector
					GROUP BY ACV.ID_PERSONA
					ORDER BY COUNT(A.ID_PERSONA_BENEFICIARIO)
					)			
		END 
	ELSE					  
		SET @IdConsul = @IdConsultor

	BEGIN TRY
		BEGIN TRANSACTION
			
			IF EXISTS (SELECT * FROM TB_ASIGNACION a WHERE a.[ID_PERSONA_BENEFICIARIO] = @IdBeneficiario)
				BEGIN -- si ya existe un registro con ese id de beneficiario va y actualiza el id del consultor y mantiene el id del beneficiario
					UPDATE A
					SET A.[ID_PERSONA_CONSULTOR] = @IdConsul, A.FECHA_ASIGNACION = GETDATE()
					FROM TB_ASIGNACION A
					WHERE A.ID_PERSONA_BENEFICIARIO = @IdBeneficiario
				END
			ELSE IF @IdConsul IS NULL
				SET @IdConsul = 0
			ELSE
				BEGIN
					INSERT INTO TB_ASIGNACION(ID_PERSONA_BENEFICIARIO,ID_PERSONA_CONSULTOR,FECHA_ASIGNACION)
					VALUES(@IdBeneficiario, @IdConsul,GETDATE())
				END			

			SELECT
				'IDENTITY' = @IdConsul,
				ERROR_NUMBER() 'ERROR_NUMBER',
				ERROR_MESSAGE() 'ERROR_MESSAGE',
				ERROR_PROCEDURE() 'ERROR_PROCEDURE',
				ERROR_LINE() 'ERROR_LINE';

		COMMIT TRANSACTION		--CONFIRMANDO LA TRANSACCIÓN
	END TRY
	BEGIN CATCH

		SELECT
			'IDENTITY' = NULL,
			ERROR_NUMBER() 'ERROR_NUMBER',
			ERROR_MESSAGE() 'ERROR_MESSAGE',
			ERROR_PROCEDURE() 'ERROR_PROCEDURE',
			ERROR_LINE() 'ERROR_LINE';
		ROLLBACK TRANSACTION	--REVIRTIENDO LA TRANSACCIÓN
	END CATCH
END
GO

-- =============================================
-- Author:		YOHALMO DIAZ
-- Create date: 28/Mayo/2019
-- Description:	Obtiene los Coordinadores segun el id del municipio y el sector economico
-- =============================================
CREATE PROCEDURE SP_TB_ASIG_CONSULTOR_VINCULACION_ObtenerXMuniYSector 
	@IdMuni int,
	@IdSector int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    IF @IdMuni != 0 AND @IdSector != 0
		SELECT DISTINCT ACV.[ID_PERSONA] ID_CONSULTOR, P.[NOMBRES]+' '+P.[APELLIDOS] AS NOMBRE_CONSULTOR, D.NOMBRE_DEPTO
		FROM TB_ASIG_CONSULTOR_VINCULACION AS ACV
		INNER JOIN TB_PERSONA P ON P.ID_PERSONA = ACV.ID_PERSONA
		INNER JOIN TBC_MUNICIPIO M ON M.ID_MUNICIPIO = ACV.ID_MUNICIPIO
		INNER JOIN TBC_DEPARTAMENTO D ON D.ID_DEPARTAMENTO = M.ID_DEPARTAMENTO
		WHERE ACV.[ID_MUNICIPIO] = @IdMuni AND ACV.[ID_SECTOR_ECONOMICO] = @IdSector
		ORDER BY D.NOMBRE_DEPTO, NOMBRE_CONSULTOR
	ELSE IF @IdSector = 0 AND @IdMuni != 0
		SELECT DISTINCT ACV.[ID_PERSONA] ID_CONSULTOR, P.[NOMBRES]+' '+P.[APELLIDOS] AS NOMBRE_CONSULTOR, D.NOMBRE_DEPTO
		FROM TB_ASIG_CONSULTOR_VINCULACION AS ACV
		INNER JOIN TB_PERSONA P ON P.ID_PERSONA = ACV.ID_PERSONA
		INNER JOIN TBC_MUNICIPIO M ON M.ID_MUNICIPIO = ACV.ID_MUNICIPIO
		INNER JOIN TBC_DEPARTAMENTO D ON D.ID_DEPARTAMENTO = M.ID_DEPARTAMENTO
		WHERE ACV.[ID_MUNICIPIO] = @IdMuni
		ORDER BY D.NOMBRE_DEPTO, NOMBRE_CONSULTOR
	ELSE IF @IdMuni = 0 AND @IdSector !=0
		SELECT DISTINCT ACV.[ID_PERSONA] ID_CONSULTOR, P.[NOMBRES]+' '+P.[APELLIDOS] AS NOMBRE_CONSULTOR, D.NOMBRE_DEPTO
		FROM TB_ASIG_CONSULTOR_VINCULACION AS ACV
		INNER JOIN TB_PERSONA P ON P.ID_PERSONA = ACV.ID_PERSONA
		INNER JOIN TBC_MUNICIPIO M ON M.ID_MUNICIPIO = ACV.ID_MUNICIPIO
		INNER JOIN TBC_DEPARTAMENTO D ON D.ID_DEPARTAMENTO = M.ID_DEPARTAMENTO
		WHERE ACV.[ID_SECTOR_ECONOMICO] = @IdSector
		ORDER BY D.NOMBRE_DEPTO, NOMBRE_CONSULTOR
	ELSE
		SELECT DISTINCT ACV.[ID_PERSONA] ID_CONSULTOR, P.[NOMBRES]+' '+P.[APELLIDOS] AS  NOMBRE_CONSULTOR,  P.[NOMBRES]+' '+P.[APELLIDOS] +'-' +D.NOMBRE_DEPTO + '-'+M.NOMBRE_MUNIC AS ASIGNACION
		FROM TB_ASIG_CONSULTOR_VINCULACION AS ACV
		INNER JOIN TB_PERSONA P ON P.ID_PERSONA = ACV.ID_PERSONA
		INNER JOIN TBC_MUNICIPIO M ON M.ID_MUNICIPIO = ACV.ID_MUNICIPIO
		INNER JOIN TBC_DEPARTAMENTO D ON D.ID_DEPARTAMENTO = M.ID_DEPARTAMENTO
		ORDER BY ASIGNACION, NOMBRE_CONSULTOR
END


/********************************* TABLA TB_ASIGNACION ********************************/
GO

/***
	OBJETO: PROCEDURE [DBO].[SP_TB_ASIGNACION_GetPersonaByIdBeneficiario]
	DESCRIPCION: PROCEDIMIENTO PARA OBTENER LA INFORMACION DEL CONSULTOR A PARTIR DEL id persona BENEFICIARIO ASIGNADO
	FECHA DE CREACION: 27/05/2019
	FECHA DE ACTUALIZACION:
***/
CREATE PROCEDURE SP_TB_ASIGNACION_GetPersonaByIdBeneficiario
	@ID_BENEFICIARIO INT
AS
	SELECT
		*
	FROM
		TB_PERSONA
	WHERE
		ID_PERSONA = (
			SELECT
				ID_PERSONA_CONSULTOR
			FROM
				TB_ASIGNACION
			WHERE
				ID_PERSONA_BENEFICIARIO = @ID_BENEFICIARIO
			)
GO
/***
	OBJETO: PROCEDURE [DBO].[SP_TB_ASIGNACION_GetConsultorByIdBeneficiario]
	DESCRIPCION: PROCEDIMIENTO PARA OBTENER LA INFORMACION DEL CONSULTOR A PARTIR DEL id BENEFICIARIO ASIGNADO
	FECHA DE CREACION: 27/05/2019
	FECHA DE ACTUALIZACION:
***/
CREATE PROCEDURE SP_TB_ASIGNACION_GetConsultorByIdBeneficiario
	@ID_BENEFICIARIO INT
AS
	SELECT
		C.*
	FROM
		TB_PERSONA AS C
		INNER JOIN TB_ASIGNACION AS A ON C.ID_PERSONA = A.ID_PERSONA_CONSULTOR
		INNER JOIN TB_BENEFICIARIO AS B ON B.ID_PERSONA = A.ID_PERSONA_BENEFICIARIO
	WHERE B.ID_BENEFICIARIO = @ID_BENEFICIARIO
		
GO

/***
	OBJETO: PROCEDURE [DBO].[SP_TB_ASIGNACION_GetUsuarioBeneficiarioByIdBeneficiario]
	DESCRIPCION: PROCEDIMIENTO PARA OBTENER LA INFORMACION DEL CONSULTOR A PARTIR DEL id BENEFICIARIO ASIGNADO
	FECHA DE CREACION: 27/05/2019
	FECHA DE ACTUALIZACION:
***/
CREATE PROCEDURE SP_TB_ASIGNACION_GetUsuarioBeneficiarioByIdBeneficiario
	@ID_BENEFICIARIO INT
AS
	SELECT
		U.*
	FROM
		TB_PERSONA AS P
		INNER JOIN TB_ASIGNACION AS A ON P.ID_PERSONA = A.ID_PERSONA_BENEFICIARIO
		INNER JOIN TB_BENEFICIARIO AS B ON B.ID_PERSONA = A.ID_PERSONA_BENEFICIARIO
		INNER JOIN TB_USUARIO AS U ON U.ID_PERSONA = P.ID_PERSONA
	WHERE B.ID_BENEFICIARIO = @ID_BENEFICIARIO
		
GO

/***
	OBJETO: PROCEDURE [DBO].[SP_TB_PROYECTO_InsertProyecto]
	DESCRIPCION: PROCEDIMIENTO PARA INGRESAR UN PROYECTo QUE RETORNA EL ID DEL REGISTROS INGRESADO
	FECHA DE CREACION: 28/05/2019
	FECHA DE ACTUALIZACION: 
	AUTOR : Frederick Mejia
***/
CREATE PROCEDURE [dbo].[SP_TB_PROYECTO_InsertProyecto]
	@CodProyecto char(7),
	@IdProblema int,
	@IdTipoIniciativa int,
	@UsuarioCrea int,
	@IdPropuesta int
AS
	BEGIN TRY
		BEGIN TRANSACTION
			INSERT INTO
				[dbo].[TB_PROYECTO](
					COD_PROYECTO,
					ID_PROBLEMA,
					ID_TIPO_INICIATIVA,
					USUARIO_CREA,
					FECHA_CREA,
					ID_ESTADO_PROCESO,
					ID_PROPUESTA
					) 

			VALUES( 
				@CodProyecto,
				@IdProblema,
				@IdTipoIniciativa,
				@UsuarioCrea,
				GETDATE(),
				15,
				(
				CASE WHEN @IdPropuesta = 0 THEN NULL ELSE @IdPropuesta END
				)
				);

		SELECT
			SCOPE_IDENTITY() 'IDENTITY',
			ERROR_NUMBER() 'ERROR_NUMBER',
			ERROR_MESSAGE() 'ERROR_MESSAGE',
			ERROR_PROCEDURE() 'ERROR_PROCEDURE',
			ERROR_LINE() 'ERROR_LINE';

		COMMIT TRANSACTION;

	END TRY
	BEGIN CATCH
		SELECT
			SCOPE_IDENTITY() 'IDENTITY',
			ERROR_NUMBER() 'ERROR_NUMBER',
			ERROR_MESSAGE() 'ERROR_MESSAGE',
			ERROR_PROCEDURE() 'ERROR_PROCEDURE',
			ERROR_LINE() 'ERROR_LINE';
	END CATCH

	GO
	/***
	OBJETO: PROCEDURE [DBO].[SP_TB_PROPUESTA_ObtenerPropuestasAceptadasPorIdFormulador]
	DESCRIPCION: PROCEDIMIENTO PARA OBTENER TODAS LAS PROPUESTAS ACEPTADAS POR LOS BENEFICIARIOS POR EL ID DEL FORMULADOR
	FECHA DE CREACION: 27/05/2019
	FECHA DE ACTUALIZACION:
***/
CREATE PROCEDURE SP_TB_PROPUESTA_ObtenerPropuestasAceptadasPorIdFormulador
	@ID_FORMULADOR INT
AS
	SELECT PROPUESTA.ID_PROPUESTA
      ,PROPUESTA.ID_PROBLEMA
      ,PROPUESTA.ID_USUARIO_FORMULA
      ,PROPUESTA.ID_ESTADO_PROCESO
      ,PROPUESTA.ID_TIPO_INICIATIVA
	  ,INICIATIVA.NOMBRE AS NOMBRE_INICIATIVA
      ,PROPUESTA.ID_USUARIO_CREA
      ,PROPUESTA.ID_USUARIO_ACTUALIZA
      ,PROPUESTA.FECHA_CREA
      ,PROPUESTA.FECHA_ACTUALIZA
      ,PROPUESTA.SOLUCION_ASISTENCIA
      ,PROPUESTA.SOLUCION_ADOPCION
      ,PROPUESTA.SOLUCION_INNOVACION
      ,PROPUESTA.COMPONENTES_BASICOS
      ,PROPUESTA.INFORMACION_ADICIONAL
      ,PROPUESTA.PRESUPUESTO_CONTRAPARTIDA
  FROM [dbo].[TB_PROPUESTA] AS PROPUESTA
  INNER JOIN [dbo].[TBC_TIPO_INICIATIVA] AS INICIATIVA
  ON PROPUESTA.ID_TIPO_INICIATIVA = INICIATIVA.ID_TIPO_INICIATIVA
  WHERE
	ID_USUARIO_FORMULA = @ID_FORMULADOR AND ID_ESTADO_PROCESO = 11
GO
/***
	OBJETO: PROCEDURE [DBO].[SP_TB_PROPUESTA_ObtenerPropuestaIdBeneficiario]
	DESCRIPCION: PROCEDIMIENTO PARA OBTENER TODAS LAS PROPUESTAS DEL BENEFICIARIO
	FECHA DE CREACION: 03/06/2019
	FECHA DE ACTUALIZACION:
***/
CREATE PROCEDURE SP_TB_PROPUESTA_ObtenerPropuestaIdBeneficiario
	@ID_BENEFICIARIO INT
AS
	SELECT P.*
	FROM TB_PROPUESTA AS P
	INNER JOIN TBC_ESTADO_PROCESO AS E ON E.ID_ESTADO_PROCESO = P.ID_ESTADO_PROCESO 
	WHERE P.ID_PROBLEMA IN(SELECT ID_PROBLEMA FROM TB_PROBLEMA WHERE ID_BENEFICIARIO =@ID_BENEFICIARIO) AND E.CODIGO_ESTADO_PROCESO = 'S01'
GO
/***
	OBJETO: PROCEDURE [DBO].[SP_TB_BENEFICIARIO_ObternerBeneficiariosPorConsultor]
	DESCRIPCION: PROCEDIMIENTO PARA OBTENER TODOS LOS BENEFICIARIOS SEGUN el idPersona del consultor
	FECHA DE CREACION: 29/05/2019
	FECHA DE ACTUALIZACION: 
	autor : Frederick Mejia
***/
CREATE PROCEDURE [dbo].[SP_TB_BENEFICIARIO_ObtenerBeneficiariosPorConsultor]
	@IdConsultor int
AS
		BEGIN
			SELECT B.ID_BENEFICIARIO, P.NOMBRES, P.APELLIDOS, P.TEL_CEL, P.TEL_FIJO, EP.DESCRIPCION_ESTADO_PROCESO, D.NOMBRE_DEPTO
			FROM TB_BENEFICIARIO AS B
			INNER JOIN TB_ASIGNACION AS A ON B.ID_PERSONA = A.ID_PERSONA_BENEFICIARIO
			INNER JOIN TBC_ESTADO_PROCESO AS EP ON EP.ID_ESTADO_PROCESO = B.ID_ESTADO_PROCESO
			INNER JOIN TB_PERSONA AS P ON P.ID_PERSONA = B.ID_PERSONA
			INNER JOIN TBC_MUNICIPIO M ON M.ID_MUNICIPIO = P.ID_MUNICIPIO
			INNER JOIN TBC_DEPARTAMENTO D ON D.ID_DEPARTAMENTO = M.ID_DEPARTAMENTO
			WHERE A.ID_PERSONA_CONSULTOR = @IdConsultor
		END
GO

/***
	OBJETO: PROCEDURE [DBO].[SP_TB_BENEFICIARIO_ObtenerTodosMenosNoValidadosONoPrecalificados]
	DESCRIPCION: PROCEDIMIENTO PARA OBTENER TODOS LOS BENEFICIARIOS SEGUN SU ESTADO DE PROCESO
	FECHA DE CREACION: 08/05/2019
	FECHA DE ACTUALIZACION: 
***/
CREATE PROCEDURE [dbo].[SP_TB_BENEFICIARIO_ObtenerTodosMenosValidadosONoPrecalificados]
AS
		BEGIN
			SELECT B.ID_BENEFICIARIO, P.NOMBRES, P.APELLIDOS, P.TEL_CEL, P.TEL_FIJO, EP.DESCRIPCION_ESTADO_PROCESO, D.NOMBRE_DEPTO, CONSUL.NOMBRES+ ' '+ CONSUL.APELLIDOS AS NOMBRE_CONSULTOR 
			FROM TB_BENEFICIARIO AS B 
			INNER JOIN TBC_ESTADO_PROCESO AS EP ON EP.ID_ESTADO_PROCESO = B.ID_ESTADO_PROCESO
			INNER JOIN TB_PERSONA AS P ON P.ID_PERSONA = B.ID_PERSONA
			INNER JOIN TBC_MUNICIPIO M ON M.ID_MUNICIPIO = P.ID_MUNICIPIO
			INNER JOIN TBC_DEPARTAMENTO D ON D.ID_DEPARTAMENTO = M.ID_DEPARTAMENTO
			INNER JOIN TB_ASIGNACION AS ASIG ON ASIG.ID_PERSONA_BENEFICIARIO = B.ID_PERSONA
			INNER JOIN TB_PERSONA AS CONSUL ON  CONSUL.ID_PERSONA = ASIG.ID_PERSONA_CONSULTOR
			WHERE EP.CODIGO_ESTADO_PROCESO = 'B06' OR EP.CODIGO_ESTADO_PROCESO = 'B05'
		END
GO


/***
	OBJETO: PROCEDURE [DBO].[SP_TB_PROBLEMA_UPDATE]
	DESCRIPCION: PROCEDIMIENTO PARA ACTUALIZAR UN PROBLEMA
	FECHA DE CREACION: 23/05/2019
	FECHA DE ACTUALIZACION: 
***/
CREATE PROCEDURE [dbo].[SP_TB_PROBLEMA_UPDATE]
	@ID_PROBLEMA INT,
	@USUARIO_ACTUALIZA INT,
	@Mercado varchar(500),
	@CantEmpleados int,
	@NombreProblema varchar(500),
	@DescripcionNegocio varchar(2000),
	@VentaDia varchar(200),
	@VentaMes decimal(8,2),
	@DescripcionProblema varchar(2000),
	@DescripcionOtroProblema varchar(2000),
	@ID_ESTADO_PROCESO int
AS
	BEGIN TRY
		BEGIN TRANSACTION

			UPDATE 
				TB_PROBLEMA
			SET
					[MERCADO] = @Mercado,
					[CANT_EMPLEADOS] = @CantEmpleados,
					[NOMBRE_PROBLEMA] = @NombreProblema,
					[DESCRIPCION_NEGOCIO] = @DescripcionNegocio,
					[VENTA_DIA] = @VentaDia,
					[VENTA_MES] = @VentaMes,
					[DESCRIPCION_PROBLEMA] = @DescripcionProblema,
					[DESCRIPCION_OTRO_PROBLEMA] = @DescripcionOtroProblema,
					[ID_ESTADO_PROCESO] = @ID_ESTADO_PROCESO,
					[USUARIO_ACTUALIZA] = @USUARIO_ACTUALIZA,
					[FECHA_ACTUALIZA] = GETDATE()
			WHERE
				ID_PROBLEMA = @ID_PROBLEMA;

		SELECT
			'IDENTITY' = @ID_PROBLEMA,
			ERROR_NUMBER() 'ERROR_NUMBER',
			ERROR_MESSAGE() 'ERROR_MESSAGE',
			ERROR_PROCEDURE() 'ERROR_PROCEDURE',
			ERROR_LINE() 'ERROR_LINE';

		COMMIT TRANSACTION		--CONFIRMANDO LA TRANSACCIÓN
	END TRY
	BEGIN CATCH
		SELECT
			'IDENTITY' = NULL,
			ERROR_NUMBER() 'ERROR_NUMBER',
			ERROR_MESSAGE() 'ERROR_MESSAGE',
			ERROR_PROCEDURE() 'ERROR_PROCEDURE',
			ERROR_LINE() 'ERROR_LINE';

		ROLLBACK TRANSACTION;	--REVIRTIENDO LA TRANSACCIÓN
	END CATCH

GO
	/***
	OBJETO: PROCEDURE [DBO].[SP_TB_PROPUESTA_ObtenerPropuestassPorIdFormulador]
	DESCRIPCION: PROCEDIMIENTO PARA OBTENER TODAS LAS PROPUESTAS ACEPTADAS POR LOS BENEFICIARIOS POR EL ID DEL FORMULADOR
	FECHA DE CREACION: 27/05/2019
	FECHA DE ACTUALIZACION:03/06/2019
	autor:FREDERICK MEJIA
***/
CREATE PROCEDURE [dbo].[SP_TB_PROPUESTA_ObtenerPropuestasPorIdFormulador]
	@ID_FORMULADOR INT
AS
	SELECT P.NOMBRE_PROBLEMA,PR.ID_PROPUESTA,PER.NOMBRES,
	(SELECT FP.NOMBRES FROM TB_PERSONA AS FP INNER JOIN TB_USUARIO AS U ON U.ID_PERSONA = FP.ID_PERSONA WHERE U.ID_USUARIO = @ID_FORMULADOR) AS NOMBRE_FORMULADOR,
	PR.FECHA_CREA AS FECHA_PRESENTA,PR.FECHA_ACTUALIZA AS ULTIMA_ACTUALIZA,E.DESCRIPCION_ESTADO_PROCESO AS ETAPA
	FROM TB_PROPUESTA AS PR 
	INNER JOIN TB_PROBLEMA AS P ON PR.ID_PROBLEMA = P.ID_PROBLEMA
	INNER JOIN TB_BENEFICIARIO AS B ON P.ID_BENEFICIARIO = B.ID_BENEFICIARIO
	INNER JOIN TB_PERSONA AS PER ON PER.ID_PERSONA = B.ID_PERSONA
	INNER JOIN TBC_ESTADO_PROCESO AS E ON E.ID_ESTADO_PROCESO = PR.ID_ESTADO_PROCESO
	WHERE  PR.ID_USUARIO_FORMULA = @ID_FORMULADOR
	
GO

/***
	OBJETO: PROCEDURE [DBO].[SP_TB_DISTRIBUCION_PRESUPUESTO_INSERT]
	DESCRIPCION: PROCEDIMIENTO PARA INSERTAR LA DISTRIBUCION DEL PRESUPUESTO DE UN PROYECTO
	FECHA DE CREACION: 02/05/2019
	FECHA DE ACTUALIZACION: 
***/
CREATE PROCEDURE [dbo].[SP_TB_DISTRIBUCION_PRESUPUESTO_INSERT]
	@ID_PROYECTO INT,
	@COFINANCIADO DECIMAL(18,2),
	@ESPECIES DECIMAL(18,2),
	@EFECTIVO DECIMAL(18,2)
AS
BEGIN TRY
	BEGIN TRANSACTION

			INSERT INTO
				TB_DISTRIBUCION_PRESUPUESTO(ID_PROYECTO, COFINANCIADO, ESPECIES, EFECTIVO) 
			VALUES
				(@ID_PROYECTO, @COFINANCIADO, @ESPECIES, @EFECTIVO);
		

		SELECT
			SCOPE_IDENTITY() 'IDENTITY',
			ERROR_NUMBER() 'ERROR_NUMBER',
			ERROR_MESSAGE() 'ERROR_MESSAGE',
			ERROR_PROCEDURE() 'ERROR_PROCEDURE',
			ERROR_LINE() 'ERROR_LINE';
	COMMIT TRANSACTION
END TRY
BEGIN CATCH
	SELECT
		SCOPE_IDENTITY() 'IDENTITY',
		ERROR_NUMBER() 'ERROR_NUMBER',
		ERROR_MESSAGE() 'ERROR_MESSAGE',
		ERROR_PROCEDURE() 'ERROR_PROCEDURE',
		ERROR_LINE() 'ERROR_LINE';
	ROLLBACK TRANSACTION;
END CATCH


GO


/***
	OBJETO: PROCEDURE [DBO].[SP_TB_DISTRIBUCION_PRESUPUESTO_UPDATE]
	DESCRIPCION: PROCEDIMIENTO PARA ACTUALIAR LA DISTRIBUCION DEL PRESUPUESTO DE UN PROYECTO
	FECHA DE CREACION: 07/05/2019
	FECHA DE ACTUALIZACION:
***/
CREATE PROCEDURE [dbo].[SP_TB_DISTRIBUCION_PRESUPUESTO_UPDATE]
	@ID_DISTRIBUCION_PRESUPUESTO INT,
	@CONFINANCIADO DECIMAL(18,2),
	@ESPECIES DECIMAL(18,2),
	@EFECTIVO DECIMAL(18,2)
AS
	BEGIN TRY
		BEGIN TRANSACTION

			DECLARE @ID INT;
			SET @ID= NULL;

			UPDATE 
				TB_DISTRIBUCION_PRESUPUESTO
			SET
				COFINANCIADO = @CONFINANCIADO, ESPECIES = @ESPECIES, EFECTIVO = @EFECTIVO, @ID=@ID_DISTRIBUCION_PRESUPUESTO
			WHERE
				ID_DISTRIBUCION_PRESUPUESTO = @ID_DISTRIBUCION_PRESUPUESTO;

		SELECT
			'IDENTITY' = @ID,
			ERROR_NUMBER() 'ERROR_NUMBER',
			ERROR_MESSAGE() 'ERROR_MESSAGE',
			ERROR_PROCEDURE() 'ERROR_PROCEDURE',
			ERROR_LINE() 'ERROR_LINE';

		COMMIT TRANSACTION		--CONFIRMANDO LA TRANSACCIÓN
	END TRY
	BEGIN CATCH
		SELECT
			'IDENTITY' = NULL,
			ERROR_NUMBER() 'ERROR_NUMBER',
			ERROR_MESSAGE() 'ERROR_MESSAGE',
			ERROR_PROCEDURE() 'ERROR_PROCEDURE',
			ERROR_LINE() 'ERROR_LINE';

		ROLLBACK TRANSACTION;	--REVIRTIENDO LA TRANSACCIÓN
	END CATCH

go
/***
	OBJETO: PROCEDURE  [dbo].[SP_TB_PROYECTO_ObtenerProyectoPorIdBeneficiario]
	DESCRIPCION: PROCEDIMIENTO PARA Obtener el proyecto por el beneficiario
	FECHA DE CREACION: 30/05/2019
	FECHA DE ACTUALIZACION:
***/
CREATE PROCEDURE [dbo].[SP_TB_PROYECTO_ObtenerProyectoPorIdBeneficiario]
@id_beneficiario INT
AS
SELECT
	   PY.COD_PROYECTO,
	   PY.FECHA_ACTUALIZA,
	   PY.FECHA_CREA,
	   PY.ID_ESTADO_PROCESO AS ESTADOPROCESO,
	   PY.ID_PROPUESTA,
	   PY.ID_PROYECTO,
	   PY.ID_TIPO_INICIATIVA,
	   PY.MONTO,
	   T.NOMBRE AS NOMBRE_INICIATIVA,
	   P.*
FROM TB_PROYECTO AS PY
INNER JOIN TB_PROBLEMA AS P ON P.ID_PROBLEMA = PY.ID_PROBLEMA
INNER JOIN TBC_TIPO_INICIATIVA AS T ON T.ID_TIPO_INICIATIVA = PY.ID_TIPO_INICIATIVA
WHERE P.ID_BENEFICIARIO = @id_beneficiario
go
/***
	OBJETO: PROCEDURE  [dbo].[SP_TB_PROYECTO_ObtenerProyectosPorIdFormulador]
	DESCRIPCION: PROCEDIMIENTO PARA Obtener los proyectos de el formulador
	FECHA DE CREACION: 30/05/2019
	FECHA DE ACTUALIZACION:
***/
CREATE PROCEDURE [dbo].[SP_TB_PROYECTO_ObtenerProyectosPorIdFormulador]
@id_formulador INT
AS
SELECT
	   PY.COD_PROYECTO,
	   PY.FECHA_ACTUALIZA,
	   PY.FECHA_CREA,
	   PY.ID_ESTADO_PROCESO AS ESTADOPROCESO,
	   PY.ID_PROPUESTA,
	   PY.ID_PROYECTO,
	   PY.ID_TIPO_INICIATIVA,
	   PY.MONTO,
	   PY.USUARIO_ACTUALIZA,
	   T.NOMBRE AS NOMBRE_INICIATIVA,
	   P.*,
	   PROPU.ID_USUARIO_FORMULA,
	   PERS.NOMBRES AS NOMBRE_BENEFICIARIO,
	   PERS.APELLIDOS AS APELLIDO_BENEFICIARIO
FROM TB_PROYECTO AS PY
INNER JOIN TB_PROBLEMA AS P ON P.ID_PROBLEMA = PY.ID_PROBLEMA
INNER JOIN TBC_TIPO_INICIATIVA AS T ON T.ID_TIPO_INICIATIVA = PY.ID_TIPO_INICIATIVA
INNER JOIN TB_BENEFICIARIO AS BEN ON BEN.ID_BENEFICIARIO = P.ID_BENEFICIARIO
INNER JOIN TB_PERSONA AS PERS ON PERS.ID_PERSONA = BEN.ID_PERSONA
INNER JOIN TB_PROPUESTA AS PROPU ON PROPU.ID_PROPUESTA = PY.ID_PROPUESTA
WHERE PROPU.ID_USUARIO_FORMULA = @id_formulador
go
/***
	OBJETO: PROCEDURE  [dbo].[SP_TB_PROYECTO_ObtenerProyectosPorIdConsultorUsuario]
	DESCRIPCION: PROCEDIMIENTO PARA Obtener los proyectos de el formulador
	FECHA DE CREACION: 30/05/2019
	FECHA DE ACTUALIZACION:
***/
create PROCEDURE [dbo].[SP_TB_PROYECTO_ObtenerProyectosPorIdConsultorUsuario]
@idconsultorUsuario INT
AS
SELECT
	   PY.COD_PROYECTO,
	   PY.FECHA_ACTUALIZA,
	   PY.FECHA_CREA,
	   PY.ID_ESTADO_PROCESO AS ESTADOPROCESO,
	   PY.ID_PROPUESTA,
	   PY.ID_PROYECTO,
	   PY.ID_TIPO_INICIATIVA,
	   PY.MONTO,
	   PY.USUARIO_ACTUALIZA,
	   T.NOMBRE AS NOMBRE_INICIATIVA,
	   P.*,

	   PERS.NOMBRES AS NOMBRE_BENEFICIARIO,
	   PERS.APELLIDOS AS APELLIDO_BENEFICIARIO
FROM TB_PROYECTO AS PY
INNER JOIN TB_PROBLEMA AS P ON P.ID_PROBLEMA = PY.ID_PROBLEMA
INNER JOIN TBC_TIPO_INICIATIVA AS T ON T.ID_TIPO_INICIATIVA = PY.ID_TIPO_INICIATIVA
INNER JOIN TB_BENEFICIARIO AS BEN ON BEN.ID_BENEFICIARIO = P.ID_BENEFICIARIO
INNER JOIN TB_PERSONA AS PERS ON PERS.ID_PERSONA = BEN.ID_PERSONA

INNER JOIN TB_ASIGNACION AS ASIG ON ASIG.ID_PERSONA_BENEFICIARIO = BEN.ID_PERSONA
INNER JOIN TB_PERSONA AS CONSUL ON CONSUL.ID_PERSONA = ASIG.ID_PERSONA_CONSULTOR
INNER JOIN TB_USUARIO AS U ON CONSUL.ID_PERSONA = U.ID_PERSONA
WHERE U.ID_USUARIO = @idconsultorUsuario
go
/***
	OBJETO: PROCEDURE  [dbo].[SP_TB_PROYECTO_ObtenerProyectos]
	DESCRIPCION: PROCEDIMIENTO PARA Obtener los proyectos
	FECHA DE CREACION: 05/06/2019
	FECHA DE ACTUALIZACION:
***/
CREATE PROCEDURE [dbo].[SP_TB_PROYECTO_ObtenerProyectos]
AS
SELECT
	   PY.COD_PROYECTO,
	   PY.FECHA_ACTUALIZA,
	   PY.FECHA_CREA,
	   PY.ID_ESTADO_PROCESO AS ESTADOPROCESO,
	   PY.ID_PROPUESTA,
	   PY.ID_PROYECTO,
	   PY.ID_TIPO_INICIATIVA,
	   PY.MONTO,
	   PY.USUARIO_ACTUALIZA,
	   T.NOMBRE AS NOMBRE_INICIATIVA,
	   P.*,
	   PERS.NOMBRES AS NOMBRE_BENEFICIARIO,
	   PERS.APELLIDOS AS APELLIDO_BENEFICIARIO
FROM TB_PROYECTO AS PY
INNER JOIN TB_PROBLEMA AS P ON P.ID_PROBLEMA = PY.ID_PROBLEMA
INNER JOIN TBC_TIPO_INICIATIVA AS T ON T.ID_TIPO_INICIATIVA = PY.ID_TIPO_INICIATIVA
INNER JOIN TB_BENEFICIARIO AS BEN ON BEN.ID_BENEFICIARIO = P.ID_BENEFICIARIO
INNER JOIN TB_PERSONA AS PERS ON PERS.ID_PERSONA = BEN.ID_PERSONA
go


/***
	OBJETO: PROCEDURE  [dbo].[SP_TBC_ESTADO_PROCESO_OBTENER_POR_CODIGO]
	DESCRIPCION: PROCEDIMIENTO PARA Obtener el  estado por su codigo
	FECHA DE CREACION: 01/06/2019
	FECHA DE ACTUALIZACION:
	AUTOR:FREDERICK MEJIA
***/
CREATE PROCEDURE SP_TBC_ESTADO_PROCESO_GetByCodigo
@CODIGO varchar(10)
AS
SELECT * FROM TBC_ESTADO_PROCESO
WHERE CODIGO_ESTADO_PROCESO = @CODIGO
GO
/***
	OBJETO: PROCEDURE  [dbo].[SP_TBC_ESTADO_PROCESO_OBTENER_POR_id]
	DESCRIPCION: PROCEDIMIENTO PARA Obtener el  estado por su codigo
	FECHA DE CREACION: 01/06/2019
	FECHA DE ACTUALIZACION:
	AUTOR:FREDERICK MEJIA
***/
CREATE PROCEDURE SP_TBC_ESTADO_PROCESO_GetByiD
@ID INT
AS
SELECT * FROM TBC_ESTADO_PROCESO
WHERE ID_ESTADO_PROCESO = @ID
GO

/***
	OBJETO: PROCEDURE  [dbo].[SP_TB_NOTIFICACION_INSERTAR_NOTIFICACION]
	DESCRIPCION: PROCEDIMIENTO PARA INSERTAR UNA NOTIFICACION
	FECHA DE CREACION: 01/06/2019
	FECHA DE ACTUALIZACION:
	AUTOR:FREDERICK MEJIA
***/
CREATE PROCEDURE [dbo].[SP_TB_NOTIFICACION_insertNotificacion]
	@ID_USUARIO_OWNER int,
	@ID_USUARIO_CREA int,
	@ID_ESTADO_PROCESO int
AS
BEGIN TRY
	BEGIN TRANSACTION
	IF @ID_USUARIO_CREA = 0
		INSERT INTO 
				TB_NOTIFICACION(ID_USUARIO,USUARIO_CREA,ID_ESTADO_PROCESO,LEIDO,FECHA_CREA) 
			VALUES
				(@ID_USUARIO_OWNER,@ID_USUARIO_OWNER,@ID_ESTADO_PROCESO,0,GETDATE());
	ELSE
		INSERT INTO 
				TB_NOTIFICACION(ID_USUARIO,USUARIO_CREA,ID_ESTADO_PROCESO,LEIDO,FECHA_CREA) 
			VALUES
				(@ID_USUARIO_OWNER,@ID_USUARIO_CREA,@ID_ESTADO_PROCESO,0,GETDATE());

	SELECT
			SCOPE_IDENTITY() 'IDENTITY',
			ERROR_NUMBER() 'ERROR_NUMBER',
			ERROR_MESSAGE() 'ERROR_MESSAGE',
			ERROR_PROCEDURE() 'ERROR_PROCEDURE',
			ERROR_LINE() 'ERROR_LINE';
	COMMIT TRANSACTION
END TRY
BEGIN CATCH
	SELECT
		SCOPE_IDENTITY() 'IDENTITY',
		ERROR_NUMBER() 'ERROR_NUMBER',
		ERROR_MESSAGE() 'ERROR_MESSAGE',
		ERROR_PROCEDURE() 'ERROR_PROCEDURE',
		ERROR_LINE() 'ERROR_LINE';
	ROLLBACK TRANSACTION;
END CATCH

GO

/***
	OBJETO: PROCEDURE [DBO].[SP_TB_NOTIFICACION_ObtenerNuevasNotificacionesPorIdUsuario]
	DESCRIPCION: PROCEDIMIENTO PARA OBTENER TODAS LAS NOTIFICACIONES POR USUARIO
	FECHA DE CREACION: 01/06/2019
	FECHA DE ACTUALIZACION: 
	autor : Frederick Mejia
***/
CREATE PROCEDURE [dbo].[SP_TB_NOTIFICACION_ObtenerNuevasNotificacionesPorIdUsuario]
	@IdUsuario int
AS
			SELECT N.ID_NOTIFICACION,EP.*,N.FECHA_CREA
			FROM TB_NOTIFICACION AS N
			INNER JOIN TBC_ESTADO_PROCESO EP ON N.ID_ESTADO_PROCESO = EP.ID_ESTADO_PROCESO
			WHERE N.ID_USUARIO = @IdUsuario AND N.LEIDO = 0


GO

/***
	OBJETO: PROCEDURE [DBO].[SP_TB_NOTIFICACION_ActualizarNotificacionesLeidas]
	DESCRIPCION: PROCEDIMIENTO ACTUALIZAR LAS NOTIFICACIONES A LEIDAS
	FECHA DE CREACION: 01/06/2019
	FECHA DE ACTUALIZACION: 
	autor : Frederick Mejia
***/
CREATE PROCEDURE [dbo].[SP_TB_NOTIFICACION_ActualizarNotificacionesLeidas]
	@IdUsuario int
AS
BEGIN TRY
		BEGIN TRANSACTION
			UPDATE TB_NOTIFICACION
			SET LEIDO = 1
			WHERE ID_USUARIO = @IdUsuario AND LEIDO = 0
		
		SELECT
			'IDENTITY' = @IdUsuario,
			ERROR_NUMBER() 'ERROR_NUMBER',
			ERROR_MESSAGE() 'ERROR_MESSAGE',
			ERROR_PROCEDURE() 'ERROR_PROCEDURE',
			ERROR_LINE() 'ERROR_LINE';
		COMMIT TRANSACTION;		--CONFIRMANDO LA TRANSACCIÓN
	END TRY
	BEGIN CATCH
		SELECT
			'IDENTITY' = NULL,
			ERROR_NUMBER() 'ERROR_NUMBER',
			ERROR_MESSAGE() 'ERROR_MESSAGE',
			ERROR_PROCEDURE() 'ERROR_PROCEDURE',
			ERROR_LINE() 'ERROR_LINE';

		ROLLBACK TRANSACTION	--REVIRTIENDO LA TRANSACCIÓN
	END CATCH

GO

/********************************* TABLA TB_EXPERIENCIA *********************************/

/***
	OBJETO: PROCEDURE [DBO].[SP_TB_EXPERIENCIA_InsertExperiencia]
	DESCRIPCION: PROCEDIMIENTO PARA INSERTAR LA EXPERIENCIA DE UN FORMULADOR
	FECHA DE CREACION: 01/06/2019
	FECHA DE ACTUALIZACION: 01/06/2019
***/
CREATE PROCEDURE [dbo].[SP_TB_EXPERIENCIA_InsertExperiencia]
	@ID_FORMULADOR        INT,
	@INSTITUCION          VARCHAR(1024),
	@CARGO                VARCHAR(1024),
	@TIEMPO               VARCHAR(64),
	@PROYECTO             VARCHAR(2048),
	@USUARIO_CREA         INT
   
AS
BEGIN TRY
	BEGIN TRANSACTION

		IF @USUARIO_CREA IS NOT NULL
			INSERT INTO
				TB_EXPERIENCIA(ID_FORMULADOR, INSTITUCION, CARGO, TIEMPO, PROYECTO, USUARIO_CREA, FECHA_CREA) 
			VALUES
				(@ID_FORMULADOR, @INSTITUCION, @CARGO, @TIEMPO, @PROYECTO, @USUARIO_CREA, GETDATE());
		ELSE
			INSERT INTO
				TB_EXPERIENCIA(ID_FORMULADOR, INSTITUCION, CARGO, TIEMPO, PROYECTO, FECHA_CREA)  
			VALUES
				(@ID_FORMULADOR, @INSTITUCION, @CARGO, @TIEMPO, @PROYECTO, GETDATE());
				
		SELECT
			SCOPE_IDENTITY() 'IDENTITY',
			ERROR_NUMBER() 'ERROR_NUMBER',
			ERROR_MESSAGE() 'ERROR_MESSAGE',
			ERROR_PROCEDURE() 'ERROR_PROCEDURE',
			ERROR_LINE() 'ERROR_LINE';
	COMMIT TRANSACTION
END TRY
BEGIN CATCH
	SELECT
		SCOPE_IDENTITY() 'IDENTITY',
		ERROR_NUMBER() 'ERROR_NUMBER',
		ERROR_MESSAGE() 'ERROR_MESSAGE',
		ERROR_PROCEDURE() 'ERROR_PROCEDURE',
		ERROR_LINE() 'ERROR_LINE';
	ROLLBACK TRANSACTION;
END CATCH

GO

/***
	OBJETO: PROCEDURE [DBO].[SP_TB_EXPERIENCIA_GetByIdFormulador]
	DESCRIPCION: PROCEDIMIENTO PARA RECUPERAR LAS EXPERIENCIAS DE UN FORMULADOR
	FECHA DE CREACION: 02/06/2019
	FECHA DE ACTUALIZACION: 02/06/2019
***/
CREATE PROCEDURE [dbo].[SP_TB_EXPERIENCIA_GetByIdFormulador]
	@ID_FORMULADOR        INT
   
AS
	SELECT 
		* 
	FROM 
		TB_EXPERIENCIA
	WHERE 
		ID_FORMULADOR = @ID_FORMULADOR;
GO

/***
	OBJETO: PROCEDURE [DBO].[SP_TB_EXPERIENCIA_UPDATE]
	DESCRIPCION: PROCEDIMIENTO PARA ACTUALIZAR LA EXPERIENCIA DE UN FORMULADOR
	FECHA DE CREACION: 02/06/2019
	FECHA DE ACTUALIZACION: 02/06/2019
***/  
CREATE PROCEDURE [dbo].[SP_TB_EXPERIENCIA_UPDATE]
	@ID_EXPERIENCIA       INT,
	@INSTITUCION          VARCHAR(1024),
	@CARGO                VARCHAR(1024),
	@TIEMPO               VARCHAR(64),
	@PROYECTO             VARCHAR(2048),
	@USUARIO_ACTUALIZA    INT
	
AS
	BEGIN TRY
		BEGIN TRANSACTION
				
			UPDATE
				TB_EXPERIENCIA 
			SET
				INSTITUCION = @INSTITUCION, 
				CARGO = @CARGO,
				TIEMPO = @TIEMPO,	
				PROYECTO = @PROYECTO,				
				USUARIO_ACTUALIZA = @USUARIO_ACTUALIZA, 
				FECHA_ACTUALIZA = GETDATE()
			WHERE
				ID_EXPERIENCIA = @ID_EXPERIENCIA;
				
		SELECT
			'IDENTITY' = @ID_EXPERIENCIA,
			ERROR_NUMBER() 'ERROR_NUMBER',
			ERROR_MESSAGE() 'ERROR_MESSAGE',
			ERROR_PROCEDURE() 'ERROR_PROCEDURE',
			ERROR_LINE() 'ERROR_LINE';
		COMMIT TRANSACTION		--CONFIRMANDO LA TRANSACCIÓN
	END TRY
	BEGIN CATCH
		SELECT
			'IDENTITY' = NULL,
			ERROR_NUMBER() 'ERROR_NUMBER',
			ERROR_MESSAGE() 'ERROR_MESSAGE',
			ERROR_PROCEDURE() 'ERROR_PROCEDURE',
			ERROR_LINE() 'ERROR_LINE';
		ROLLBACK TRANSACTION	--REVIRTIENDO LA TRANSACCIÓN
	END CATCH
GO

/***
	OBJETO: PROCEDURE [DBO].[SP_TB_EXPERIENCIA_DELETE_HARD]
	DESCRIPCION: PROCEDIMIENTO PARA ELIMINAR LA EXPERIENCIA DE UN FORMULADOR
	FECHA DE CREACION: 02/06/2019
	FECHA DE ACTUALIZACION: 02/06/2019
***/
CREATE PROCEDURE [dbo].[SP_TB_EXPERIENCIA_DELETE_HARD]
	@ID_EXPERIENCIA INT
AS
	BEGIN TRY
		BEGIN TRANSACTION
				
			DELETE FROM
				TB_EXPERIENCIA
			WHERE
				ID_EXPERIENCIA = @ID_EXPERIENCIA

		SELECT
			'IDENTITY' = @ID_EXPERIENCIA,
			ERROR_NUMBER() 'ERROR_NUMBER',
			ERROR_MESSAGE() 'ERROR_MESSAGE',
			ERROR_PROCEDURE() 'ERROR_PROCEDURE',
			ERROR_LINE() 'ERROR_LINE';
		COMMIT TRANSACTION		--CONFIRMANDO LA TRANSACCIÓN
	END TRY
	BEGIN CATCH
		SELECT
			'IDENTITY' = NULL,
			ERROR_NUMBER() 'ERROR_NUMBER',
			ERROR_MESSAGE() 'ERROR_MESSAGE',
			ERROR_PROCEDURE() 'ERROR_PROCEDURE',
			ERROR_LINE() 'ERROR_LINE';
		ROLLBACK TRANSACTION	--REVIRTIENDO LA TRANSACCIÓN
	END CATCH
GO


/********************************* TABLA TB_FORMULADOR *********************************/
/***
	OBJETO: PROCEDURE [dbo].[SP_TB_FORMULADOR_ObtenerFormuladorPorProyecto]
	DESCRIPCION: PROCEDIMIENTO PARA OBTENER EL FORMULADOR DE UN PROYECTO
	FECHA DE CREACION: 01/06/2019
	FECHA DE ACTUALIZACION: 01/06/2019
***/
CREATE PROCEDURE [dbo].[SP_TB_FORMULADOR_ObtenerFormuladorPorProyecto]
@idProyecto int
AS
SELECT PER.*
FROM TB_FORMULADOR AS F INNER JOIN TB_PERSONA AS PER ON PER.ID_PERSONA = F.ID_PERSONA
INNER JOIN TB_PROPUESTA AS PROP ON PROP.ID_USUARIO_FORMULA = PER.ID_PERSONA
INNER JOIN TB_PROYECTO AS PY ON PY.ID_PROPUESTA = PROP.ID_PROPUESTA
WHERE PY.ID_PROYECTO = @idProyecto

GO
/***
	OBJETO: PROCEDURE [DBO].[SP_TB_FORMULADOR_InsertFormulador]
	DESCRIPCION: PROCEDIMIENTO PARA INSERTAR UN FORMULADOR
	FECHA DE CREACION: 01/06/2019
	FECHA DE ACTUALIZACION: 01/06/2019
***/
CREATE PROCEDURE [dbo].[SP_TB_FORMULADOR_InsertFormulador]
	@ID_PERSONA           INT,
	@GRADO_ACADEMICO      VARCHAR(64),
	@ANIOS_EXPERIENCIA    INT,
	@ACTIVO               SMALLINT,
	@USUARIO_CREA         INT
   
AS
BEGIN TRY
	BEGIN TRANSACTION

		IF @USUARIO_CREA IS NOT NULL
			INSERT INTO
				TB_FORMULADOR(ID_PERSONA, GRADO_ACADEMICO, ANIOS_EXPERIENCIA, ACTIVO, USUARIO_CREA, FECHA_CREA) 
			VALUES
				(@ID_PERSONA, @GRADO_ACADEMICO, @ANIOS_EXPERIENCIA, @ACTIVO, @USUARIO_CREA, GETDATE());
		ELSE
			INSERT INTO
				TB_FORMULADOR(ID_PERSONA, GRADO_ACADEMICO, ANIOS_EXPERIENCIA, ACTIVO, FECHA_CREA) 
			VALUES
				(@ID_PERSONA, @GRADO_ACADEMICO, @ANIOS_EXPERIENCIA, @ACTIVO, GETDATE());

		SELECT
			SCOPE_IDENTITY() 'IDENTITY',
			ERROR_NUMBER() 'ERROR_NUMBER',
			ERROR_MESSAGE() 'ERROR_MESSAGE',
			ERROR_PROCEDURE() 'ERROR_PROCEDURE',
			ERROR_LINE() 'ERROR_LINE';
	COMMIT TRANSACTION
END TRY
BEGIN CATCH
	SELECT
		SCOPE_IDENTITY() 'IDENTITY',
		ERROR_NUMBER() 'ERROR_NUMBER',
		ERROR_MESSAGE() 'ERROR_MESSAGE',
		ERROR_PROCEDURE() 'ERROR_PROCEDURE',
		ERROR_LINE() 'ERROR_LINE';
	ROLLBACK TRANSACTION;
END CATCH
GO


/********************************* LISTA PARA REPORTES *********************************/

/***
   OBJETO: PROCEDURE [DBO].[SP_TBC_TIPO_INICIATIVA_GetAll]
   DESCRIPCION: PROCEDIMIENTO PARA OBTENER LOS TIPOS DE INICIATIVA
   FECHA DE CREACION: 21/05/2019
   FECHA DE ACTUALIZACION: 
***/
CREATE PROCEDURE [dbo].[SP_TBC_TIPO_INICIATIVA_GetAll]
AS
   SELECT
      *
   FROM
      TBC_TIPO_INICIATIVA
GO

/***
   OBJETO: PROCEDURE [DBO].[SP_VIEW_TB_USUARIO_GetByIdBeneficiario]
   DESCRIPCION: PROCEDIMIENTO PARA BUSCAR TODOS LOS USUARIOS QUE POSEEN EL ROL BENEFICIARIO
   FECHA DE CREACION: 20/05/2019
   FECHA DE ACTUALIZACION:
***/
CREATE PROCEDURE [dbo].[SP_VIEW_TB_USUARIO_GetByIdBeneficiario]
AS
    SELECT 
      usr.ID_PERSONA, pr.NOMBRES, pr.APELLIDOS 
   FROM TB_USUARIO usr
      LEFT JOIN TB_ROL rl ON rl.ID_ROL=usr.ID_ROL
      LEFT JOIN TB_PERSONA pr ON PR.ID_PERSONA=usr.ID_PERSONA
    WHERE rl.NOMBRE='Beneficiario'
GO

/***
   OBJETO: PROCEDURE [DBO].[SP_TB_USUARIO_GetByIdConsultor]
   DESCRIPCION: PROCEDIMIENTO PARA BUSCAR TODOS LOS USUARIOS QUE POSEEN EL ROL FORMULADOR
   FECHA DE CREACION: 20/05/2019
   FECHA DE ACTUALIZACION:
***/
CREATE PROCEDURE [dbo].[SP_VIEW_TB_USUARIO_GetByIdConsultor]
AS
    SELECT 
      usr.ID_PERSONA, pr.NOMBRES, pr.APELLIDOS 
   FROM TB_USUARIO usr
      LEFT JOIN TB_ROL rl ON rl.ID_ROL=usr.ID_ROL
      LEFT JOIN TB_PERSONA pr ON PR.ID_PERSONA=usr.ID_PERSONA
    WHERE rl.NOMBRE='Consultor'
GO

/***
   OBJETO: PROCEDURE [DBO].[SP_TB_USUARIO_GetByIdFormulador]
   DESCRIPCION: PROCEDIMIENTO PARA BUSCAR TODOS LOS USUARIOS QUE POSEEN EL ROL FORMULADOR
   FECHA DE CREACION: 20/05/2019
   FECHA DE ACTUALIZACION:
***/
CREATE PROCEDURE [dbo].[SP_VIEW_TB_USUARIO_GetByIdFormulador]
AS
   SELECT 
      usr.ID_PERSONA, pr.NOMBRES, pr.APELLIDOS 
   FROM TB_USUARIO usr
      INNER JOIN TB_ROL rl ON rl.ID_ROL=usr.ID_ROL
      INNER JOIN TB_PERSONA pr ON PR.ID_PERSONA=usr.ID_PERSONA
      INNER JOIN TB_FORMULADOR fr ON fr.ID_PERSONA=pr.ID_PERSONA
    WHERE rl.NOMBRE='Formulador'
GO

CREATE PROCEDURE [dbo].[SP_VIEW_TB_USUARIO_GetByIniciativas]
AS
   SELECT
prb.ID_PERSONA AS id_personab,
prb.NOMBRES as beneficiario,
prc.ID_PERSONA AS id_personac,
prc.NOMBRES as consultor,
fr.ID_PERSONA as id_formulador,
prf.NOMBRES as formulador,
sec.ID_SECTOR_ECONOMICO as id_sector,
sec.NOMBRE_SECTOR as sector,
ti.ID_TIPO_INICIATIVA as id_iniciativa,
ti.NOMBRE as iniciativa,
pry.MONTO as monto,
pry.FECHA_CREA as fecha_aprobacion,
espry.ID_ESTADO_PROCESO as id_estado,
espry.DESCRIPCION_ESTADO_PROCESO as estado_proceso
FROM TB_USUARIO usr
INNER JOIN TB_ROL rl ON rl.ID_ROL=usr.ID_ROL
INNER JOIN TB_PERSONA prb ON prb.ID_PERSONA=usr.ID_PERSONA
INNER JOIN TB_BENEFICIARIO tbb ON tbb.ID_PERSONA=prb.ID_PERSONA
INNER JOIN TB_ASIGNACION asig ON tbB.ID_PERSONA = asig.ID_PERSONA_BENEFICIARIO
INNER JOIN TB_PERSONA prc ON asig.ID_PERSONA_CONSULTOR = prc.ID_PERSONA
INNER JOIN TB_PROBLEMA tp ON TP.ID_BENEFICIARIO=tbb.ID_BENEFICIARIO
INNER JOIN TB_PROPUESTA tpp ON tpp.ID_PROBLEMA=tp.ID_PROBLEMA
INNER JOIN TB_USUARIO usrp ON usrp.ID_USUARIO=tpp.ID_USUARIO_FORMULA
INNER JOIN TB_PERSONA prf ON prf.ID_PERSONA=usrp.ID_PERSONA
INNER JOIN TB_FORMULADOR fr ON fr.ID_PERSONA=prf.ID_PERSONA
INNER JOIN TB_PROYECTO pry ON pry.ID_PROBLEMA=tp.ID_PROBLEMA
INNER JOIN TBC_TIPO_INICIATIVA ti ON ti.ID_TIPO_INICIATIVA=pry.ID_TIPO_INICIATIVA
INNER JOIN TBC_SECTOR_ECONOMICO sec ON SEC.ID_SECTOR_ECONOMICO=tbb.ID_SECTOR_ECONOMICO
INNER JOIN TBC_ESTADO_PROCESO espry ON espry.ID_ESTADO_PROCESO=pry.ID_ESTADO_PROCESO
GO

CREATE PROCEDURE [dbo].[SP_TBC_ESTADO_PROCESO_GetAllByIniciativas]
AS
   SELECT
      ID_ESTADO_PROCESO, CODIGO_ESTADO_PROCESO, DESCRIPCION_ESTADO_PROCESO
   FROM
      TBC_ESTADO_PROCESO 
     WHERE CODIGO_ESTADO_PROCESO LIKE 'PY%' 
GO



CREATE PROCEDURE [dbo].[SP_TB_PROYECTO_GetEstado]
	@ID_PROYECTO INT
AS
	SELECT 
		E.CODIGO_ESTADO_PROCESO 
	FROM 
		TB_PROYECTO P JOIN TBC_ESTADO_PROCESO E ON P.ID_ESTADO_PROCESO=E.ID_ESTADO_PROCESO
	WHERE 
		P.ID_PROYECTO = @ID_PROYECTO;


GO
CREATE PROCEDURE [dbo].[SP_TB_RESULTADO_EVAL_APROBAR_PROYECTO]
	@ID_PROYECTO INT,
	@CODIGO_ESTADO_PROCESO varchar(6),
	@USUARIO_ACTUALIZA INT
AS
	BEGIN TRY
		BEGIN TRANSACTION

			UPDATE 
				TB_PROYECTO
			SET
				ID_ESTADO_PROCESO = (
					SELECT
						ID_ESTADO_PROCESO
					FROM
						TBC_ESTADO_PROCESO
					WHERE
						CODIGO_ESTADO_PROCESO = @CODIGO_ESTADO_PROCESO
				),
				USUARIO_ACTUALIZA = @USUARIO_ACTUALIZA
			WHERE
				ID_PROYECTO=@ID_PROYECTO;

		SELECT
			'IDENTITY' = @ID_PROYECTO,
			ERROR_NUMBER() 'ERROR_NUMBER',
			ERROR_MESSAGE() 'ERROR_MESSAGE',
			ERROR_PROCEDURE() 'ERROR_PROCEDURE',
			ERROR_LINE() 'ERROR_LINE';

		COMMIT TRANSACTION		--CONFIRMANDO LA TRANSACCIÓN
	END TRY
	BEGIN CATCH
		SELECT
			'IDENTITY' = NULL,
			ERROR_NUMBER() 'ERROR_NUMBER',
			ERROR_MESSAGE() 'ERROR_MESSAGE',
			ERROR_PROCEDURE() 'ERROR_PROCEDURE',
			ERROR_LINE() 'ERROR_LINE';

		ROLLBACK TRANSACTION;	--REVIRTIENDO LA TRANSACCIÓN
	END CATCH

GO
CREATE PROCEDURE SP_TB_FORMULADOR_ObtenerFormuladorPorIdPersona
	@idpersona int
	AS
	SELECT * FROM TB_FORMULADOR WHERE ID_PERSONA = @idpersona
GO
/***
	OBJETO: PROCEDURE [DBO].[SP_TB_PROYECTO_ObtenerProyectoPorId]
	DESCRIPCION: PROCEDIMIENTO PARA OBTENER EL PROYECTO POR SU ID
	FECHA DE CREACION:09/06/2019
	FECHA DE ACTUALIZACION: 
***/

CREATE PROCEDURE SP_TB_PROYECTO_ObtenerProyectoPorId
	@id int
	AS
	SELECT * FROM TB_PROYECTO WHERE ID_PROYECTO = @id
GO
/***
	OBJETO: PROCEDURE [DBO].[SP_TB_PROYECTO_CambiarEstadoProyecto]
	DESCRIPCION: PROCEDIMIENTO PARA ACTUALIZAR EL ESTADO DEL PROYECTO
	FECHA DE CREACION:05/06/2019
	FECHA DE ACTUALIZACION: 
***/
CREATE PROCEDURE SP_TB_PROYECTO_CambiarEstadoProyecto
	@idProyecto int,
	@idProceso int,
	@USUARIO_ACTUALIZA int
AS
	BEGIN TRY
		BEGIN TRANSACTION

			UPDATE 
				TB_PROYECTO
			SET
				ID_ESTADO_PROCESO = @idProceso,
				USUARIO_ACTUALIZA = @USUARIO_ACTUALIZA,
				FECHA_ACTUALIZA = GETDATE()
			WHERE
				ID_PROYECTO=@idProyecto;

		SELECT
			'IDENTITY' = @idProyecto,
			ERROR_NUMBER() 'ERROR_NUMBER',
			ERROR_MESSAGE() 'ERROR_MESSAGE',
			ERROR_PROCEDURE() 'ERROR_PROCEDURE',
			ERROR_LINE() 'ERROR_LINE';

		COMMIT TRANSACTION		--CONFIRMANDO LA TRANSACCIÓN
	END TRY
	BEGIN CATCH
		SELECT
			'IDENTITY' = NULL,
			ERROR_NUMBER() 'ERROR_NUMBER',
			ERROR_MESSAGE() 'ERROR_MESSAGE',
			ERROR_PROCEDURE() 'ERROR_PROCEDURE',
			ERROR_LINE() 'ERROR_LINE';

		ROLLBACK TRANSACTION;	--REVIRTIENDO LA TRANSACCIÓN
	END CATCH
--
-- Dropping stored procedure sp_TBC_CAMPOS_INICIATIVA_SelectRow : 
--

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[SP_TBC_CAMPOS_INICIATIVA_OBTENER_POR_ID]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
  DROP PROCEDURE [dbo].[SP_TBC_CAMPOS_INICIATIVA_OBTENER_POR_ID]
  
GO

-- ==========================================================================================
-- Entity Name:	SP_TBC_CAMPOS_INICIATIVA_OBTENER_POR_ID
-- Author:	Frederick Mejia
-- Create date:	06/06/2019 13:45:22
-- Description:	This stored procedure is intended for selecting a specific row from TBC_CAMPOS_INICIATIVA table
-- ==========================================================================================
Create Procedure SP_TBC_CAMPOS_INICIATIVA_OBTENER_POR_ID
	@ID_CAMPO int
As
Begin
	Select 
		[ID_CAMPO],
		[ID_TIPO_INICIATIVA],
		[NOMBRE_CAMPO]
	From TBC_CAMPOS_INICIATIVA
	Where
		[ID_CAMPO] = @ID_CAMPO
End

GO


--
-- Dropping stored procedure SP_TBC_CAMPOS_INICIATIVA_Insert : 
--

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[sp_TBC_CAMPOS_INICIATIVA_Insert]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
  DROP PROCEDURE [dbo].[SP_TBC_CAMPOS_INICIATIVA_Insert]
  
GO

-- ==========================================================================================
-- Entity Name:	SP_TBC_CAMPOS_INICIATIVA_Insert
-- Author:	Frederick Mejia
-- Create date:	06/06/2019 13:45:22
-- Description:	This stored procedure is intended for inserting values to TBC_CAMPOS_INICIATIVA table
-- ==========================================================================================
CREATE Procedure SP_TBC_CAMPOS_INICIATIVA_Insert
	@ID_CAMPO int,
	@ID_TIPO_INICIATIVA int = NULL,
	@NOMBRE_CAMPO varchar(150) = NULL,
	@USUARIO_CREA int = NULL
As
Begin
	Insert Into TBC_CAMPOS_INICIATIVA
		([ID_TIPO_INICIATIVA],[NOMBRE_CAMPO],[USUARIO_CREA],[FECHA_CREA])
	Values
		(@ID_TIPO_INICIATIVA,@NOMBRE_CAMPO,@USUARIO_CREA,GETDATE())

End

GO


--
-- Dropping stored procedure SP_TBC_CAMPOS_INICIATIVA_Update : 
--

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[SP_TBC_CAMPOS_INICIATIVA_Update]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
  DROP PROCEDURE [dbo].[SP_TBC_CAMPOS_INICIATIVA_Update]
  
GO

-- ==========================================================================================
-- Entity Name:	sp_TBC_CAMPOS_INICIATIVA_Update
-- Author:	Frederick Mejia
-- Create date:	06/06/2019 13:45:22
-- Description:	This stored procedure is intended for updating TBC_CAMPOS_INICIATIVA table
-- ==========================================================================================
CREATE Procedure SP_TBC_CAMPOS_INICIATIVA_Update
	@ID_CAMPO int,
	@ID_TIPO_INICIATIVA int,
	@NOMBRE_CAMPO varchar(150),
	@USUARIO_ACTUALIZA int
As
Begin
BEGIN TRY
            BEGIN TRANSACTION 
	Update TBC_CAMPOS_INICIATIVA
	Set
		[ID_TIPO_INICIATIVA] = @ID_TIPO_INICIATIVA,
		[NOMBRE_CAMPO] = @NOMBRE_CAMPO,
		[USUARIO_ACTUALIZA] = @USUARIO_ACTUALIZA,
		[FECHA_ACTUALIZA] = GETDATE()
		
	Where		
		[ID_CAMPO] = @ID_CAMPO
		SELECT
                'IDENTITY' = @ID_CAMPO,
                ERROR_NUMBER() 'ERROR_NUMBER',
                ERROR_MESSAGE() 'ERROR_MESSAGE',
                ERROR_PROCEDURE() 'ERROR_PROCEDURE',
                ERROR_LINE() 'ERROR_LINE';
            COMMIT TRANSACTION 
        END TRY
        BEGIN CATCH
            SELECT 
                'IDENTITY' = NULL,
                ERROR_NUMBER() 'ERROR_NUMBER',
                ERROR_MESSAGE() 'ERROR_MESSAGE',
                ERROR_PROCEDURE() 'ERROR_PROCEDURE',
                ERROR_LINE() 'ERROR_LINE';
            ROLLBACK TRANSACTION
        END CATCH

End

GO


--
-- Dropping stored procedure S`P_TBC_CAMPOS_INICIATIVA_DeleteRow : 
--

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[SP_TBC_CAMPOS_INICIATIVA_DeleteRow]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
  DROP PROCEDURE [dbo].[SP_TBC_CAMPOS_INICIATIVA_DeleteRow]
  
GO

-- ==========================================================================================
-- Entity Name:	sp_TBC_CAMPOS_INICIATIVA_DeleteRow
-- Author:	Frederick Mejia
-- Create date:	06/06/2019 13:45:22
-- Description:	This stored procedure is intended for deleting a specific row from TBC_CAMPOS_INICIATIVA table
-- ==========================================================================================
CREATE Procedure SP_TBC_CAMPOS_INICIATIVA_DeleteRow
	@ID_CAMPO int,
	@USUARIO_ACTUALIZA int
As
Begin
BEGIN TRY
                BEGIN TRANSACTION
	UPDATE TBC_CAMPOS_INICIATIVA
	set
	USUARIO_ACTUALIZA = @USUARIO_ACTUALIZA,
	FECHA_BORRADO = GETDATE()
	Where
		[ID_CAMPO] = @ID_CAMPO
		SELECT
                        'IDENTITY' = @ID_CAMPO,
                        ERROR_NUMBER() 'ERROR_NUMBER',
                        ERROR_MESSAGE() 'ERROR_MESSAGE',
                        ERROR_PROCEDURE() 'ERROR_PROCEDURE',
                        ERROR_LINE() 'ERROR_LINE';
                COMMIT TRANSACTION
        END TRY
        BEGIN CATCH
                SELECT
                    'IDENTITY' = NULL,
                    ERROR_NUMBER() 'ERROR_NUMBER',
                    ERROR_MESSAGE() 'ERROR_MESSAGE',
                    ERROR_PROCEDURE() 'ERROR_PROCEDURE',
                    ERROR_LINE() 'ERROR_LINE';
                ROLLBACK TRANSACTION
        END CATCH

End

GO
-- Dropping stored procedure SP_TBC_CAMPOS_INICIATIVA_SelectAll : 
--

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[SP_TBC_CAMPOS_INICIATIVA_SelectAll]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
  DROP PROCEDURE [dbo].[SP_TBC_CAMPOS_INICIATIVA_SelectAll]
  
GO

-- ==========================================================================================
-- Entity Name:	SP_TBC_CAMPOS_INICIATIVA_SelectAll
-- Author:	Frederick Mejia
-- Create date:	06/06/2019 13:49:17
-- Description:	This stored procedure is intended for selecting all rows from TBC_CAMPOS_INICIATIVA table
-- ==========================================================================================
Create Procedure SP_TBC_CAMPOS_INICIATIVA_SelectAll
As
Begin
	Select 
		[ID_CAMPO],
		[ID_TIPO_INICIATIVA],
		[NOMBRE_CAMPO]
	From TBC_CAMPOS_INICIATIVA
End

GO
-- Dropping stored procedure SP_TBC_CAMPOS_INICIATIVA_SelectAll : 
--

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[SP_TBC_CAMPOS_INICIATIVA_SELECT_ALL_BY_TIPO_INICIATIVA]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
  DROP PROCEDURE [dbo].[SP_TBC_CAMPOS_INICIATIVA_SELECT_ALL_BY_TIPO_INICIATIVA]
  
GO

-- ==========================================================================================
-- Entity Name:	SP_TBC_CAMPOS_INICIATIVA_SELECT_ALL_BY_TIPO_INICIATIVA
-- Author:	Frederick Mejia
-- Create date:	06/06/2019 13:49:17
-- Description:	This stored procedure is intended for selecting all rows from TBC_CAMPOS_INICIATIVA table
-- ==========================================================================================
Create Procedure SP_TBC_CAMPOS_INICIATIVA_SELECT_ALL_BY_TIPO_INICIATIVA
@tipoIniciativa int
As
Begin
	Select 
		[ID_CAMPO],
		[ID_TIPO_INICIATIVA],
		[NOMBRE_CAMPO]
	From TBC_CAMPOS_INICIATIVA
	WHERE [ID_TIPO_INICIATIVA] = @tipoIniciativa
End

GO
--
-- Dropping stored procedure sp_TB_DETALLE_INICIATIVA_SelectRow : 
--

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[SP_TB_DETALLE_INICIATIVA_SelectRow]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
  DROP PROCEDURE [dbo].[SP_TB_DETALLE_INICIATIVA_SelectRow]
  
GO

-- ==========================================================================================
-- Entity Name:	sp_TB_DETALLE_INICIATIVA_SelectRow
-- Author:	Frederick Mejia
-- Create date:	06/06/2019 13:47:26
-- Description:	This stored procedure is intended for selecting a specific row from TB_DETALLE_INICIATIVA table
-- ==========================================================================================
Create Procedure SP_TB_DETALLE_INICIATIVA_SelectRow
	@ID_DETALLE_INICIATIVA int
As
Begin
	Select 
		[ID_PROYECTO],
		[ID_CAMPO],
		[VALOR],
		[ID_DETALLE_INICIATIVA]
	From TB_DETALLE_INICIATIVA
	Where
		[ID_DETALLE_INICIATIVA] = @ID_DETALLE_INICIATIVA
End

GO


--
-- Dropping stored procedure sp_TB_DETALLE_INICIATIVA_Insert : 
--

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[SP_TB_DETALLE_INICIATIVA_Insert]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
  DROP PROCEDURE [dbo].[SP_TB_DETALLE_INICIATIVA_Insert]
  
GO

-- ==========================================================================================
-- Entity Name:	sp_TB_DETALLE_INICIATIVA_Insert
-- Author:	Frederick Mejia
-- Create date:	06/06/2019 13:47:26
-- Description:	This stored procedure is intended for inserting values to TB_DETALLE_INICIATIVA table
-- ==========================================================================================
Create Procedure SP_TB_DETALLE_INICIATIVA_Insert
	@ID_PROYECTO int = NULL,
	@ID_CAMPO int = NULL,
	@VALOR text = NULL
As
Begin
	Insert Into TB_DETALLE_INICIATIVA
		([ID_PROYECTO],[ID_CAMPO],[VALOR])
	Values
		(@ID_PROYECTO,@ID_CAMPO,@VALOR)

End

GO


--
-- Dropping stored procedure sp_TB_DETALLE_INICIATIVA_Update : 
--

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[SP_TB_DETALLE_INICIATIVA_Update]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
  DROP PROCEDURE [dbo].[SP_TB_DETALLE_INICIATIVA_Update]
  
GO

-- ==========================================================================================
-- Entity Name:	sp_TB_DETALLE_INICIATIVA_Update
-- Author:	Frederick Mejia
-- Create date:	06/06/2019 13:47:26
-- Description:	This stored procedure is intended for updating TB_DETALLE_INICIATIVA table
-- ==========================================================================================
Create Procedure SP_TB_DETALLE_INICIATIVA_Update
	@ID_PROYECTO int,
	@ID_CAMPO int,
	@VALOR text,
	@ID_DETALLE_INICIATIVA int
As
Begin
	Update TB_DETALLE_INICIATIVA
	Set
		[ID_PROYECTO] = @ID_PROYECTO,
		[ID_CAMPO] = @ID_CAMPO,
		[VALOR] = @VALOR
	Where		
		[ID_DETALLE_INICIATIVA] = @ID_DETALLE_INICIATIVA

End

GO


--
-- Dropping stored procedure sp_TB_DETALLE_INICIATIVA_DeleteRow : 
--

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[SP_TB_DETALLE_INICIATIVA_DeleteRow]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
  DROP PROCEDURE [dbo].[SP_TB_DETALLE_INICIATIVA_DeleteRow]
  
GO

-- ==========================================================================================
-- Entity Name:	sp_TB_DETALLE_INICIATIVA_DeleteRow
-- Author:	Frederick Mejia
-- Create date:	06/06/2019 13:47:26
-- Description:	This stored procedure is intended for deleting a specific row from TB_DETALLE_INICIATIVA table
-- ==========================================================================================
Create Procedure SP_TB_DETALLE_INICIATIVA_DeleteRow
	@ID_DETALLE_INICIATIVA int
As
Begin
	Delete TB_DETALLE_INICIATIVA
	Where
		[ID_DETALLE_INICIATIVA] = @ID_DETALLE_INICIATIVA

End

GO

--
-- Dropping stored procedure SP_TB_DETALLE_INICIATIVA_SelectAll : 
--

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[SP_TB_DETALLE_INICIATIVA_SelectAll]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
  DROP PROCEDURE [dbo].[SP_TB_DETALLE_INICIATIVA_SelectAll]
  
GO

-- ==========================================================================================
-- Entity Name:	SP_TB_DETALLE_INICIATIVA_SelectAll
-- Author:	Frederick Mejia
-- Create date:	06/06/2019 13:48:57
-- Description:	This stored procedure is intended for selecting all rows from TB_DETALLE_INICIATIVA table
-- ==========================================================================================
Create Procedure SP_TB_DETALLE_INICIATIVA_SelectAll
As
Begin
	Select 
		[ID_PROYECTO],
		[ID_CAMPO],
		[VALOR],
		[ID_DETALLE_INICIATIVA]
	From TB_DETALLE_INICIATIVA
End

GO
--
-- Dropping stored procedure SP_TB_DETALLE_INICIATIVA_SelectAllByProyecto : 
--

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[SP_TB_DETALLE_INICIATIVA_SelectAllByProyecto]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
  DROP PROCEDURE [dbo].[SP_TB_DETALLE_INICIATIVA_SelectAll]
  
GO

-- ==========================================================================================
-- Entity Name:	SP_TB_DETALLE_INICIATIVA_SelectAllByProyecto
-- Author:	Frederick Mejia
-- Create date:	06/06/2019 13:48:57
-- Description:	This stored procedure is intended for selecting all rows from TB_DETALLE_INICIATIVA table
-- ==========================================================================================
Create Procedure SP_TB_DETALLE_INICIATIVA_SelectAllByProyecto
@idProyecto int
As
Begin
	Select 
		[ID_PROYECTO],
		[ID_CAMPO],
		[VALOR],
		[ID_DETALLE_INICIATIVA]
	From TB_DETALLE_INICIATIVA
	Where ID_PROYECTO = @idProyecto
End
GO

CREATE PROCEDURE SP_TB_USUARIO_ObtenerUsuarioPorIdBeneficiario
@idBeneficiario int
AS
	SELECT U.*
	FROM TB_USUARIO AS U INNER JOIN TB_PERSONA AS P ON P.ID_PERSONA = U.ID_PERSONA
	INNER JOIN TB_BENEFICIARIO AS B ON B.ID_PERSONA = P.ID_PERSONA
	WHERE B.ID_BENEFICIARIO = @idBeneficiario
	

/* cambios en presupuesto y evaluacion */
GO
SET IDENTITY_INSERT [dbo].[TBC_CRITERIO_EVAL_TECNICA] ON 

INSERT [dbo].[TBC_CRITERIO_EVAL_TECNICA] ([ID_CRITERIO_EVAL_TECNICO], [ID_CRITERIO_EVAL_TECNICO_SUP], [CRITERIO], [TIPO_EVAL]) VALUES (1, NULL, N'Pertinencia, Resultados y Capacidad de Ejecución', N'TEC')
INSERT [dbo].[TBC_CRITERIO_EVAL_TECNICA] ([ID_CRITERIO_EVAL_TECNICO], [ID_CRITERIO_EVAL_TECNICO_SUP], [CRITERIO], [TIPO_EVAL]) VALUES (2, NULL, N'Innovación y Diversificación', N'TEC')
INSERT [dbo].[TBC_CRITERIO_EVAL_TECNICA] ([ID_CRITERIO_EVAL_TECNICO], [ID_CRITERIO_EVAL_TECNICO_SUP], [CRITERIO], [TIPO_EVAL]) VALUES (3, 1, N'El grado de pertinencia para el beneficiario de la iniciativa y la solución', N'TEC')
INSERT [dbo].[TBC_CRITERIO_EVAL_TECNICA] ([ID_CRITERIO_EVAL_TECNICO], [ID_CRITERIO_EVAL_TECNICO_SUP], [CRITERIO], [TIPO_EVAL]) VALUES (4, 1, N'Resultados', N'TEC')
INSERT [dbo].[TBC_CRITERIO_EVAL_TECNICA] ([ID_CRITERIO_EVAL_TECNICO], [ID_CRITERIO_EVAL_TECNICO_SUP], [CRITERIO], [TIPO_EVAL]) VALUES (5, 1, N'Capacidad de ejecución', N'TEC')
INSERT [dbo].[TBC_CRITERIO_EVAL_TECNICA] ([ID_CRITERIO_EVAL_TECNICO], [ID_CRITERIO_EVAL_TECNICO_SUP], [CRITERIO], [TIPO_EVAL]) VALUES (19, 2, N'La viabilidad técnica de la ejecución de la iniciativa y los resultados técnicos esperados', N'TEC')
INSERT [dbo].[TBC_CRITERIO_EVAL_TECNICA] ([ID_CRITERIO_EVAL_TECNICO], [ID_CRITERIO_EVAL_TECNICO_SUP], [CRITERIO], [TIPO_EVAL]) VALUES (20, 2, N'El grado de innovación de la iniciativa', N'TEC')
INSERT [dbo].[TBC_CRITERIO_EVAL_TECNICA] ([ID_CRITERIO_EVAL_TECNICO], [ID_CRITERIO_EVAL_TECNICO_SUP], [CRITERIO], [TIPO_EVAL]) VALUES (21, NULL, N'Evaluación del Comité Evaluador FONDEPRO', N'COM')
SET IDENTITY_INSERT [dbo].[TBC_CRITERIO_EVAL_TECNICA] OFF
SET IDENTITY_INSERT [dbo].[TBC_CAMPO_CRITERIO_EVAL] ON 

INSERT [dbo].[TBC_CAMPO_CRITERIO_EVAL] ([ID_CAMPO_CRITERIO_EVAL], [ID_CRITERIO_EVAL_TECNICO], [CAMPO], [PUNTAJE_MAX]) VALUES (1, 3, N'La iniciativa soluciona un cuello de botella, o un límite (Físico / Intangible), o garantiza la solución de un problema operacional para el beneficiari', 2)
INSERT [dbo].[TBC_CAMPO_CRITERIO_EVAL] ([ID_CAMPO_CRITERIO_EVAL], [ID_CRITERIO_EVAL_TECNICO], [CAMPO], [PUNTAJE_MAX]) VALUES (2, 3, N'El monto de fondos solicitados al FONDEPRO es coherente con el tipo de iniciativa', 1)
INSERT [dbo].[TBC_CAMPO_CRITERIO_EVAL] ([ID_CAMPO_CRITERIO_EVAL], [ID_CRITERIO_EVAL_TECNICO], [CAMPO], [PUNTAJE_MAX]) VALUES (3, 4, N'Los beneficios de ejecutar la iniciativa son o se vuelven de carácter permanentes', 1)
INSERT [dbo].[TBC_CAMPO_CRITERIO_EVAL] ([ID_CAMPO_CRITERIO_EVAL], [ID_CRITERIO_EVAL_TECNICO], [CAMPO], [PUNTAJE_MAX]) VALUES (4, 4, N'El resultado de ejecutar la iniciativa tiene efecto directamente en sus ventas, o en su capacidad de acceder nuevos mercados, o en su capacidad de acceder nuevos mercados, o incrementar su participación en el mercado actual', 2)
INSERT [dbo].[TBC_CAMPO_CRITERIO_EVAL] ([ID_CAMPO_CRITERIO_EVAL], [ID_CRITERIO_EVAL_TECNICO], [CAMPO], [PUNTAJE_MAX]) VALUES (5, 4, N'Los resultados potenciales esperados superan la inversión propuesta', 1)
INSERT [dbo].[TBC_CAMPO_CRITERIO_EVAL] ([ID_CAMPO_CRITERIO_EVAL], [ID_CRITERIO_EVAL_TECNICO], [CAMPO], [PUNTAJE_MAX]) VALUES (6, 4, N'La iniciativa presenta los indicadores de resultado', 1)
INSERT [dbo].[TBC_CAMPO_CRITERIO_EVAL] ([ID_CAMPO_CRITERIO_EVAL], [ID_CRITERIO_EVAL_TECNICO], [CAMPO], [PUNTAJE_MAX]) VALUES (7, 5, N'El Beneficiario cuenta con la infraestructura física para ejecutar la iniciativa', 1)
INSERT [dbo].[TBC_CAMPO_CRITERIO_EVAL] ([ID_CAMPO_CRITERIO_EVAL], [ID_CRITERIO_EVAL_TECNICO], [CAMPO], [PUNTAJE_MAX]) VALUES (8, 5, N'El Beneficiario puede darle continuidad a la iniciativa después de la ejecución', 1)
INSERT [dbo].[TBC_CAMPO_CRITERIO_EVAL] ([ID_CAMPO_CRITERIO_EVAL], [ID_CRITERIO_EVAL_TECNICO], [CAMPO], [PUNTAJE_MAX]) VALUES (9, 19, N'La justificación de la selección de solución o forma de aprovechar la oportunidad es clara', 1)
INSERT [dbo].[TBC_CAMPO_CRITERIO_EVAL] ([ID_CAMPO_CRITERIO_EVAL], [ID_CRITERIO_EVAL_TECNICO], [CAMPO], [PUNTAJE_MAX]) VALUES (10, 19, N'El cambio a realizar en la tecnología, el producto, proceso u operaciones actuales, es claro y alcanzable en el período y tiempo estipulado', 2)
INSERT [dbo].[TBC_CAMPO_CRITERIO_EVAL] ([ID_CAMPO_CRITERIO_EVAL], [ID_CRITERIO_EVAL_TECNICO], [CAMPO], [PUNTAJE_MAX]) VALUES (11, 19, N'a iniciativa presenta el análisis y selección de: Tecnología(dura / blanda), maquinaria, equipo y proveedores, según el caso<p>Es factible en términos de costo / beneficio', 2)
INSERT [dbo].[TBC_CAMPO_CRITERIO_EVAL] ([ID_CAMPO_CRITERIO_EVAL], [ID_CRITERIO_EVAL_TECNICO], [CAMPO], [PUNTAJE_MAX]) VALUES (12, 20, N'La iniciativa implica una innovación a nivel de la operación actual del Beneficiario y logra evidenciarse el efecto en las ventas esperadas', 3)
INSERT [dbo].[TBC_CAMPO_CRITERIO_EVAL] ([ID_CAMPO_CRITERIO_EVAL], [ID_CRITERIO_EVAL_TECNICO], [CAMPO], [PUNTAJE_MAX]) VALUES (13, 20, N'La innovación potencia otros procesos y/u operaciones en la operación del beneficiario', 2)
INSERT [dbo].[TBC_CAMPO_CRITERIO_EVAL] ([ID_CAMPO_CRITERIO_EVAL], [ID_CRITERIO_EVAL_TECNICO], [CAMPO], [PUNTAJE_MAX]) VALUES (14, 21, N'El Beneficiario tiene total conocimiento y dominio de iniciativa, conoce la solución planteada y tiene expectativas de los resultados', 1)
INSERT [dbo].[TBC_CAMPO_CRITERIO_EVAL] ([ID_CAMPO_CRITERIO_EVAL], [ID_CRITERIO_EVAL_TECNICO], [CAMPO], [PUNTAJE_MAX]) VALUES (15, 21, N'La iniciativa genera diversificación productiva', 1)
INSERT [dbo].[TBC_CAMPO_CRITERIO_EVAL] ([ID_CAMPO_CRITERIO_EVAL], [ID_CRITERIO_EVAL_TECNICO], [CAMPO], [PUNTAJE_MAX]) VALUES (16, 21, N'La iniciativa tiene la posibilidad de beneficiar a otras empresas del mismo rubro con su testimonio', 1)
INSERT [dbo].[TBC_CAMPO_CRITERIO_EVAL] ([ID_CAMPO_CRITERIO_EVAL], [ID_CRITERIO_EVAL_TECNICO], [CAMPO], [PUNTAJE_MAX]) VALUES (17, 21, N'La ejecución de la iniciativa brindará beneficios esperados en menos de seis meses de haber ocurrido', 1)
INSERT [dbo].[TBC_CAMPO_CRITERIO_EVAL] ([ID_CAMPO_CRITERIO_EVAL], [ID_CRITERIO_EVAL_TECNICO], [CAMPO], [PUNTAJE_MAX]) VALUES (18, 21, N'Los beneficios tenderán a aumentar o al menos serán estables en el tiempo', 1)
INSERT [dbo].[TBC_CAMPO_CRITERIO_EVAL] ([ID_CAMPO_CRITERIO_EVAL], [ID_CRITERIO_EVAL_TECNICO], [CAMPO], [PUNTAJE_MAX]) VALUES (19, 21, N'La iniciativa tiene el potencial de detonar otros proyectos de inversión en la zona', 1)
INSERT [dbo].[TBC_CAMPO_CRITERIO_EVAL] ([ID_CAMPO_CRITERIO_EVAL], [ID_CRITERIO_EVAL_TECNICO], [CAMPO], [PUNTAJE_MAX]) VALUES (20, 21, N'La ejecución de la iniciativa tiene potencial de generar empleos', 2)
INSERT [dbo].[TBC_CAMPO_CRITERIO_EVAL] ([ID_CAMPO_CRITERIO_EVAL], [ID_CRITERIO_EVAL_TECNICO], [CAMPO], [PUNTAJE_MAX]) VALUES (21, 21, N'La ejecución de la iniciativa tiene potencial de incrementar las ventas', 2)
SET IDENTITY_INSERT [dbo].[TBC_CAMPO_CRITERIO_EVAL] OFF

/* COMITE DE EVALUACION */
GO


CREATE FUNCTION [dbo].[FN_RESULTADO_EVAL_IS_COMPLETED] (@ID_ASPECTO INT, @ID_PROYECTO INT) RETURNS SMALLINT
AS
BEGIN
	DECLARE @NO_EVALUADORES INT, @CANT_EVALUACIONES INT, @RESULT SMALLINT
	
	
SELECT @NO_EVALUADORES=CAST(VALOR AS INT) FROM TB_CONFIGURACION WHERE CODIGO_CONFIGURACION='NO_EVAL'

SELECT @CANT_EVALUACIONES= CAST( COUNT(DISTINCT r.ID_PERSONA) AS INT)
	FROM TBC_CAMPO_CRITERIO_EVAL c INNER JOIN TBC_CRITERIO_EVAL_TECNICA cr
	ON c.ID_CRITERIO_EVAL_TECNICO = cr.ID_CRITERIO_EVAL_TECNICO
	JOIN TB_RESULTADO_EVAL_TECNICA r on r.ID_CAMPO_CRITERIO_EVAL=c.ID_CAMPO_CRITERIO_EVAL
	WHERE cr.ID_CRITERIO_EVAL_TECNICO = @ID_ASPECTO and r.ID_PROYECTO=@ID_PROYECTO	

	IF @NO_EVALUADORES = @CANT_EVALUACIONES 
		BEGIN
			SET @RESULT= 1;
		END	
	ELSE
		BEGIN
		SET @RESULT= 0;
		END

RETURN @RESULT;
END

GO


CREATE FUNCTION [dbo].[FN_RESULTADO_EVAL_CAN_APPROVE_PROJECT] (@ID_ASPECTO INT, @ID_PROYECTO INT) RETURNS SMALLINT
AS
BEGIN
	DECLARE @TOTAL FLOAT, @NO_EVALUADORES INT, @CANT_EVALUACIONES INT, @RESULT SMALLINT
	
	
SELECT @NO_EVALUADORES=CAST(VALOR AS INT) FROM TB_CONFIGURACION WHERE CODIGO_CONFIGURACION='NO_EVAL'

SELECT @CANT_EVALUACIONES= CAST( COUNT(DISTINCT r.ID_PERSONA) AS INT)
	FROM TBC_CAMPO_CRITERIO_EVAL c INNER JOIN TBC_CRITERIO_EVAL_TECNICA cr
	ON c.ID_CRITERIO_EVAL_TECNICO = cr.ID_CRITERIO_EVAL_TECNICO
	JOIN TB_RESULTADO_EVAL_TECNICA r on r.ID_CAMPO_CRITERIO_EVAL=c.ID_CAMPO_CRITERIO_EVAL
	WHERE cr.ID_CRITERIO_EVAL_TECNICO = @ID_ASPECTO and r.ID_PROYECTO=@ID_PROYECTO	

IF @NO_EVALUADORES = @CANT_EVALUACIONES BEGIN

;WITH TOTAL AS(
SELECT
	(	SELECT ROUND (AVG(CAST(r.PUNTAJE AS FLOAT)),2) AS PUNTAJE 
		FROM TB_RESULTADO_EVAL_TECNICA r WHERE r.ID_PROYECTO=@ID_PROYECTO and r.ID_CAMPO_CRITERIO_EVAL=c.ID_CAMPO_CRITERIO_EVAL 
		GROUP BY r.ID_CAMPO_CRITERIO_EVAL
	) AS PUNTAJE
	
	FROM TBC_CAMPO_CRITERIO_EVAL c INNER JOIN TBC_CRITERIO_EVAL_TECNICA cr
	ON c.ID_CRITERIO_EVAL_TECNICO = cr.ID_CRITERIO_EVAL_TECNICO
	WHERE cr.ID_CRITERIO_EVAL_TECNICO = @ID_ASPECTO
)

SELECT @TOTAL = SUM(PUNTAJE) FROM TOTAL

	IF @TOTAL >= 7.0
		BEGIN
			SET @RESULT= 1;
		END	
	ELSE
		BEGIN
		SET @RESULT= 0;
		END
END		
RETURN @RESULT;
END


GO
CREATE PROCEDURE [dbo].[SP_TB_RESULTADO_EVAL_TECNICA_INSERT]
	@ID_PROYECTO INT,
	@ID_CAMPO_CRITERIO_EVAL INT,
	@PUNTAJE SMALLINT,
	@ID_PERSONA INT
AS
	BEGIN TRY

			INSERT INTO 
				TB_RESULTADO_EVAL_TECNICA(ID_PROYECTO, ID_CAMPO_CRITERIO_EVAL, PUNTAJE, ID_PERSONA) 
			VALUES
				(@ID_PROYECTO, @ID_CAMPO_CRITERIO_EVAL, @PUNTAJE, @ID_PERSONA);

			SELECT
				SCOPE_IDENTITY() 'IDENTITY',
				ERROR_NUMBER() 'ERROR_NUMBER',
				ERROR_MESSAGE() 'ERROR_MESSAGE',
				ERROR_PROCEDURE() 'ERROR_PROCEDURE',
				ERROR_LINE() 'ERROR_LINE';
	END TRY
	BEGIN CATCH
		SELECT
			SCOPE_IDENTITY() 'IDENTITY',
			ERROR_NUMBER() 'ERROR_NUMBER',
			ERROR_MESSAGE() 'ERROR_MESSAGE',
			ERROR_PROCEDURE() 'ERROR_PROCEDURE',
			ERROR_LINE() 'ERROR_LINE';
	END CATCH

GO
CREATE PROCEDURE [dbo].[SP_TB_RESULTADO_EVAL_TECNICA_GetById]
@ID_ASPECTO INT, @ID_PROYECTO INT, @ID_PERSONA INT
AS

	select cr.ID_CRITERIO_EVAL_TECNICO, cr.CRITERIO, c.ID_CAMPO_CRITERIO_EVAL, c.CAMPO, c.PUNTAJE_MAX,
	(select r.puntaje from TB_RESULTADO_EVAL_TECNICA r where r.ID_PROYECTO=@ID_PROYECTO and r.ID_PERSONA=@ID_PERSONA and r.ID_CAMPO_CRITERIO_EVAL=c.ID_CAMPO_CRITERIO_EVAL ) as PUNTAJE,
	(select r.ID_PROYECTO from TB_RESULTADO_EVAL_TECNICA r where r.ID_PROYECTO=@ID_PROYECTO and r.ID_PERSONA=@ID_PERSONA and r.ID_CAMPO_CRITERIO_EVAL=c.ID_CAMPO_CRITERIO_EVAL ) 
	as ID_PROYECTO,
	(select r.ID_RESULTADO_EVAL_TECNICA from TB_RESULTADO_EVAL_TECNICA r where r.ID_PROYECTO=@ID_PROYECTO and r.ID_PROYECTO=@ID_PERSONA and r.ID_CAMPO_CRITERIO_EVAL=c.ID_CAMPO_CRITERIO_EVAL ) 
	as ID_RESULTADO_EVAL_TECNICA
	from TBC_CAMPO_CRITERIO_EVAL c INNER JOIN TBC_CRITERIO_EVAL_TECNICA cr
	ON c.ID_CRITERIO_EVAL_TECNICO = cr.ID_CRITERIO_EVAL_TECNICO
	where 
	cr.ID_CRITERIO_EVAL_TECNICO = @ID_ASPECTO 
	order by c.ID_CAMPO_CRITERIO_EVAL asc

GO
CREATE PROCEDURE [dbo].[SP_TB_RESULTADO_EVAL_TECNICA_GetByAspecto]
@ID_ASPECTO INT, @ID_PROYECTO INT, @ID_PERSONA INT
AS

	select cr.ID_CRITERIO_EVAL_TECNICO, cr.CRITERIO, c.ID_CAMPO_CRITERIO_EVAL, c.CAMPO, c.PUNTAJE_MAX,
	(select r.puntaje from TB_RESULTADO_EVAL_TECNICA r where r.ID_PROYECTO=@ID_PROYECTO and r.ID_PERSONA=@ID_PERSONA and r.ID_CAMPO_CRITERIO_EVAL=c.ID_CAMPO_CRITERIO_EVAL ) as PUNTAJE,
	(select r.ID_PROYECTO from TB_RESULTADO_EVAL_TECNICA r where r.ID_PROYECTO=@ID_PROYECTO and r.ID_PERSONA=@ID_PERSONA and r.ID_CAMPO_CRITERIO_EVAL=c.ID_CAMPO_CRITERIO_EVAL ) 
	as ID_PROYECTO,
	(select r.ID_RESULTADO_EVAL_TECNICA from TB_RESULTADO_EVAL_TECNICA r where r.ID_PROYECTO=@ID_PROYECTO and r.ID_CAMPO_CRITERIO_EVAL=c.ID_CAMPO_CRITERIO_EVAL ) 
	as ID_RESULTADO_EVAL_TECNICA
	from TBC_CAMPO_CRITERIO_EVAL c INNER JOIN TBC_CRITERIO_EVAL_TECNICA cr
	ON c.ID_CRITERIO_EVAL_TECNICO = cr.ID_CRITERIO_EVAL_TECNICO
	where 
	cr.ID_CRITERIO_EVAL_TECNICO_SUP = @ID_ASPECTO 
	order by c.ID_CAMPO_CRITERIO_EVAL asc


GO
CREATE PROCEDURE [dbo].[SP_TB_RESULTADO_EVAL_DELETE]
	@ID_PROYECTO INT,
	@TIPO_EVAL VARCHAR(10),
	@ID_PERSONA INT
AS
	BEGIN TRY
	BEGIN TRANSACTION


			DELETE FROM
			 TB_RESULTADO_EVAL_TECNICA 

			WHERE 
			 ID_PROYECTO=@ID_PROYECTO AND ID_CAMPO_CRITERIO_EVAL IN
				(SELECT CE.ID_CAMPO_CRITERIO_EVAL FROM TBC_CAMPO_CRITERIO_EVAL CE 
				INNER JOIN TBC_CRITERIO_EVAL_TECNICA CR ON CE.ID_CRITERIO_EVAL_TECNICO = CR.ID_CRITERIO_EVAL_TECNICO 
				WHERE CR.TIPO_EVAL=@TIPO_EVAL) AND ID_PERSONA=@ID_PERSONA

			SELECT
				'IDENTITY' = 'TRUE',
				ERROR_NUMBER() 'ERROR_NUMBER',
				ERROR_MESSAGE() 'ERROR_MESSAGE',
				ERROR_PROCEDURE() 'ERROR_PROCEDURE',
				ERROR_LINE() 'ERROR_LINE';
	COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
		SELECT
			'IDENTITY' = 'FALSE',
			ERROR_NUMBER() 'ERROR_NUMBER',
			ERROR_MESSAGE() 'ERROR_MESSAGE',
			ERROR_PROCEDURE() 'ERROR_PROCEDURE',
			ERROR_LINE() 'ERROR_LINE';
	ROLLBACK TRANSACTION
	END CATCH


GO

CREATE PROCEDURE [dbo].[SP_TB_RESULTADO_EVAL_COM_GetEvaluadores]
@ID_ASPECTO INT, @ID_PROYECTO INT
AS
SELECT DISTINCT r.ID_PERSONA, p.NOMBRES +SPACE(1)+ p.APELLIDOS as NOMBRE, r.ID_PROYECTO FROM TB_RESULTADO_EVAL_TECNICA r 
JOIN TB_PERSONA p ON r.ID_PERSONA=p.ID_PERSONA 
JOIN TBC_CAMPO_CRITERIO_EVAL c ON r.ID_CAMPO_CRITERIO_EVAL=c.ID_CAMPO_CRITERIO_EVAL
INNER JOIN TBC_CRITERIO_EVAL_TECNICA cr ON c.ID_CRITERIO_EVAL_TECNICO = cr.ID_CRITERIO_EVAL_TECNICO
WHERE ID_PROYECTO= @ID_PROYECTO AND cr.ID_CRITERIO_EVAL_TECNICO = @ID_ASPECTO 

GO
CREATE PROCEDURE [dbo].[SP_TB_RESULTADO_EVAL_COM_GetEvaluaciones]
@ID_ASPECTO INT, @ID_PROYECTO INT
AS

	select cr.ID_CRITERIO_EVAL_TECNICO, cr.CRITERIO, c.ID_CAMPO_CRITERIO_EVAL, c.CAMPO, c.PUNTAJE_MAX,
	(select ROUND (AVG(CAST(r.PUNTAJE as float)),2) AS PUNTAJE from TB_RESULTADO_EVAL_TECNICA r where r.ID_PROYECTO=@ID_PROYECTO and r.ID_CAMPO_CRITERIO_EVAL=c.ID_CAMPO_CRITERIO_EVAL GROUP BY r.ID_CAMPO_CRITERIO_EVAL) as PUNTAJE,
	@ID_PROYECTO AS ID_PROYECTO
	from TBC_CAMPO_CRITERIO_EVAL c INNER JOIN TBC_CRITERIO_EVAL_TECNICA cr
	ON c.ID_CRITERIO_EVAL_TECNICO = cr.ID_CRITERIO_EVAL_TECNICO
	where 
	cr.ID_CRITERIO_EVAL_TECNICO = @ID_ASPECTO 
	order by c.ID_CAMPO_CRITERIO_EVAL asc

GO

CREATE PROCEDURE [dbo].[SP_TB_CONFIGURACION_GetCantEvaluadores]
AS
SELECT COUNT(u.ID_USUARIO) AS CANT_USER_EVAL, (SELECT cast(VALOR as int) from TB_CONFIGURACION where CODIGO_CONFIGURACION='NO_EVAL') AS NUMERO_EVALUADORES FROM TB_USUARIO u JOIN TB_ROL r ON (u.ID_ROL=r.ID_ROL) WHERE r.ID_ROL=6

GO
CREATE PROCEDURE [dbo].[SP_TB_CONFIGURACION_UpdateCantEvaluadores]
@CantEvaluadores varchar(50)
AS 
UPDATE TB_CONFIGURACION set VALOR=@CantEvaluadores where CODIGO_CONFIGURACION='NO_EVAL' 

GO

/****** Object:  StoredProcedure [dbo].[SP_TBC_ACTIVIDAD_INICIATIVA_DeleteRow]    Script Date: 08/06/2019 0:10:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- ==========================================================================================
-- Entity Name:	SP_TBC_ACTIVIDAD_INICIATIVA_DeleteRow
-- Author:	Douglas Serbino
-- Create date:	07/06/2019 8:55:12
-- Description:	This stored procedure is intended for deleting a specific row from TBC_ACTIVIDAD_INICIATIVA table
-- ==========================================================================================
CREATE Procedure [dbo].[SP_TBC_ACTIVIDAD_INICIATIVA_DeleteRow]
	@ID_ACTIVIDAD_INICIATIVA int,
	@USUARIO_ACTUALIZA INT
As
Begin
BEGIN TRY
                BEGIN TRANSACTION
	UPDATE TBC_ACTIVIDAD_INICIATIVA
	set
	USUARIO_ACTUALIZA = @USUARIO_ACTUALIZA,
	FECHA_BORRADO = GETDATE()
	Where
		[ID_ACTIVIDAD_INICIATIVA] = @ID_ACTIVIDAD_INICIATIVA
SELECT
                        'IDENTITY' = @ID_ACTIVIDAD_INICIATIVA,
                        ERROR_NUMBER() 'ERROR_NUMBER',
                        ERROR_MESSAGE() 'ERROR_MESSAGE',
                        ERROR_PROCEDURE() 'ERROR_PROCEDURE',
                        ERROR_LINE() 'ERROR_LINE';
                COMMIT TRANSACTION
        END TRY
        BEGIN CATCH
                SELECT
                    'IDENTITY' = NULL,
                    ERROR_NUMBER() 'ERROR_NUMBER',
                    ERROR_MESSAGE() 'ERROR_MESSAGE',
                    ERROR_PROCEDURE() 'ERROR_PROCEDURE',
                    ERROR_LINE() 'ERROR_LINE';
                ROLLBACK TRANSACTION
        END CATCH
End
GO
/****** Object:  StoredProcedure [dbo].[SP_TBC_CRITERIO_EVAL_TECNICA_SelectAll]    Script Date: 08/06/2019 0:10:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- ==========================================================================================
-- Entity Name:	SP_TBC_CRITERIO_EVAL_TECNICA_SelectAll
-- Author:	Douglas Serbino
-- Create date:	07/06/2019 11:17:10
-- Description:	This stored procedure is intended for selecting all rows from TBC_CRITERIO_EVAL_TECNICA table
-- ==========================================================================================
CREATE Procedure [dbo].[SP_TBC_CRITERIO_EVAL_TECNICA_SelectAll]
As
Begin
	Select 
		[ID_CRITERIO_EVAL_TECNICO],
		[ID_CRITERIO_EVAL_TECNICO_SUP],
		[CRITERIO],
		[TIPO_EVAL],
		[USUARIO_CREA],
		[USUARIO_ACTUALIZA],
		[FECHA_CREA],
		[FECHA_ACTUALIZA],
		[FECHA_BORRADO]
	From TBC_CRITERIO_EVAL_TECNICA
	WHERE [FECHA_BORRADO] IS NULL
End
GO
/****** Object:  StoredProcedure [dbo].[SP_TBC_CRITERIO_EVAL_TECNICA_Insert]    Script Date: 08/06/2019 0:10:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- ==========================================================================================
-- Entity Name:	SP_TBC_CRITERIO_EVAL_TECNICA_Insert
-- Author:	Douglas Serbino
-- Create date:	07/06/2019 11:17:10
-- Description:	This stored procedure is intended for inserting values to TBC_CRITERIO_EVAL_TECNICA table
-- ==========================================================================================
CREATE Procedure [dbo].[SP_TBC_CRITERIO_EVAL_TECNICA_Insert]
	@ID_CRITERIO_EVAL_TECNICO_SUP int = NULL,
	@CRITERIO varchar(1024) = NULL,
	@TIPO_EVAL char(3) = NULL,
	@USUARIO_CREA int = NULL
AS
Begin
BEGIN TRY
         BEGIN TRANSACTION 
	Insert Into TBC_CRITERIO_EVAL_TECNICA
		([ID_CRITERIO_EVAL_TECNICO_SUP],[CRITERIO],[TIPO_EVAL],[USUARIO_CREA],[FECHA_CREA])
	Values
		(@ID_CRITERIO_EVAL_TECNICO_SUP,@CRITERIO,@TIPO_EVAL,@USUARIO_CREA,GETDATE())

	SELECT 
                     SCOPE_IDENTITY() 'IDENTITY',
                     ERROR_NUMBER() 'ERROR NUMBER',
                     ERROR_MESSAGE() 'ERROR_MESSAGE',
                     ERROR_PROCEDURE() 'ERROR_PROCEDURE',
                     ERROR_LINE() 'ERROR_LINE';
         COMMIT TRANSACTION   
		 END TRY
   BEGIN CATCH
         SELECT 
               SCOPE_IDENTITY() 'IDENTITY',
               ERROR_NUMBER() 'ERROR_NUMBER',
               ERROR_MESSAGE() 'ERROR_MESSAGE',
               ERROR_PROCEDURE() 'ERROR_PROCEDURE',
               ERROR_LINE() 'ERROR_LINE';
         ROLLBACK TRANSACTION 
   END CATCH

End
GO
/****** Object:  StoredProcedure [dbo].[SP_TBC_ACTIVIDAD_INICIATIVA_SelectAll]    Script Date: 08/06/2019 0:10:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- ==========================================================================================
-- Entity Name:	SP_TBC_ACTIVIDAD_INICIATIVA_SelectAll
-- Author:	Douglas Serbino
-- Create date:	07/06/2019 8:55:12
-- Description:	This stored procedure is intended for selecting all rows from TBC_ACTIVIDAD_INICIATIVA table
-- ==========================================================================================
CREATE Procedure [dbo].[SP_TBC_ACTIVIDAD_INICIATIVA_SelectAll]
As
Begin
	Select 
		[ID_ACTIVIDAD_INICIATIVA],
		[ID_TIPO_INICIATIVA],
		[USUARIO_CREA],
		[USUARIO_ACTUALIZA],
		[COD_ACTIVIDAD_PROY],
		[DESCRIPCION],
		[FECHA_CREA],
		[FECHA_ACTUALIZA],
		[FECHA_BORRADO]
	From TBC_ACTIVIDAD_INICIATIVA
	WHERE [FECHA_BORRADO] IS NULL
End
GO
/****** Object:  StoredProcedure [dbo].[SP_TBC_ACTIVIDAD_INICIATIVA_Insert]    Script Date: 08/06/2019 0:10:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- ==========================================================================================
-- Entity Name:	SP_TBC_ACTIVIDAD_INICIATIVA_Insert
-- Author:	Douglas Serbino
-- Create date:	07/06/2019 8:55:12
-- Description:	This stored procedure is intended for inserting values to TBC_ACTIVIDAD_INICIATIVA table
-- ==========================================================================================
CREATE Procedure [dbo].[SP_TBC_ACTIVIDAD_INICIATIVA_Insert]
	@ID_TIPO_INICIATIVA int,
	@USUARIO_CREA int = NULL,
	@COD_ACTIVIDAD_PROY char(4),
	@DESCRIPCION varchar(4096)
	
	
As
Begin
BEGIN TRY
         BEGIN TRANSACTION 
	Insert Into TBC_ACTIVIDAD_INICIATIVA
		([ID_TIPO_INICIATIVA],[USUARIO_CREA],[COD_ACTIVIDAD_PROY],[DESCRIPCION],[FECHA_CREA])
	Values
		(@ID_TIPO_INICIATIVA,@USUARIO_CREA,@COD_ACTIVIDAD_PROY,@DESCRIPCION, GETDATE())

	SELECT 
                     SCOPE_IDENTITY() 'IDENTITY',
                     ERROR_NUMBER() 'ERROR NUMBER',
                     ERROR_MESSAGE() 'ERROR_MESSAGE',
                     ERROR_PROCEDURE() 'ERROR_PROCEDURE',
                     ERROR_LINE() 'ERROR_LINE';
         COMMIT TRANSACTION   
		 END TRY
   BEGIN CATCH
         SELECT 
               SCOPE_IDENTITY() 'IDENTITY',
               ERROR_NUMBER() 'ERROR_NUMBER',
               ERROR_MESSAGE() 'ERROR_MESSAGE',
               ERROR_PROCEDURE() 'ERROR_PROCEDURE',
               ERROR_LINE() 'ERROR_LINE';
         ROLLBACK TRANSACTION 
   END CATCH

End

GO
/****** Object:  StoredProcedure [dbo].[SP_TBC_ACTIVIDAD_INICIATIVA_Update]    Script Date: 08/06/2019 0:10:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- ==========================================================================================
-- Entity Name:	SP_TBC_ACTIVIDAD_INICIATIVA_Update
-- Author:	Douglas Serbino
-- Create date:	07/06/2019 8:55:12
-- Description:	This stored procedure is intended for updating TBC_ACTIVIDAD_INICIATIVA table
-- ==========================================================================================
CREATE Procedure [dbo].[SP_TBC_ACTIVIDAD_INICIATIVA_Update]
	@ID_ACTIVIDAD_INICIATIVA int,
	@ID_TIPO_INICIATIVA int,
	@USUARIO_ACTUALIZA int,
	@COD_ACTIVIDAD_PROY char(4),
	@DESCRIPCION varchar(4096)
	
As
Begin
BEGIN TRY
            BEGIN TRANSACTION 
	Update TBC_ACTIVIDAD_INICIATIVA
	Set
		[ID_TIPO_INICIATIVA] = @ID_TIPO_INICIATIVA,
		[COD_ACTIVIDAD_PROY] = @COD_ACTIVIDAD_PROY,
		[DESCRIPCION] = @DESCRIPCION,
		[USUARIO_ACTUALIZA] = @USUARIO_ACTUALIZA,
		[FECHA_ACTUALIZA] = GETDATE()
	Where		
		[ID_ACTIVIDAD_INICIATIVA] = @ID_ACTIVIDAD_INICIATIVA

		SELECT
                'IDENTITY' = @ID_ACTIVIDAD_INICIATIVA,
                ERROR_NUMBER() 'ERROR_NUMBER',
                ERROR_MESSAGE() 'ERROR_MESSAGE',
                ERROR_PROCEDURE() 'ERROR_PROCEDURE',
                ERROR_LINE() 'ERROR_LINE';
            COMMIT TRANSACTION 
        END TRY
        BEGIN CATCH
            SELECT 
                'IDENTITY' = NULL,
                ERROR_NUMBER() 'ERROR_NUMBER',
                ERROR_MESSAGE() 'ERROR_MESSAGE',
                ERROR_PROCEDURE() 'ERROR_PROCEDURE',
                ERROR_LINE() 'ERROR_LINE';
            ROLLBACK TRANSACTION
        END CATCH

End
GO
/****** Object:  StoredProcedure [dbo].[SP_TBC_ACTIVIDAD_INICIATIVA_SelectRow]    Script Date: 08/06/2019 0:10:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- ==========================================================================================
-- Entity Name:	SP_TBC_ACTIVIDAD_INICIATIVA_SelectRow
-- Author:	Douglas Serbino
-- Create date:	07/06/2019 8:55:12
-- Description:	This stored procedure is intended for selecting a specific row from TBC_ACTIVIDAD_INICIATIVA table
-- ==========================================================================================
CREATE Procedure [dbo].[SP_TBC_ACTIVIDAD_INICIATIVA_SelectRow]
	@ID_ACTIVIDAD_INICIATIVA int
As
Begin
	Select 
		[ID_ACTIVIDAD_INICIATIVA],
		[ID_TIPO_INICIATIVA],
		[USUARIO_CREA],
		[USUARIO_ACTUALIZA],
		[COD_ACTIVIDAD_PROY],
		[DESCRIPCION],
		[FECHA_CREA],
		[FECHA_ACTUALIZA],
		[FECHA_BORRADO]
	From TBC_ACTIVIDAD_INICIATIVA
	Where
		[ID_ACTIVIDAD_INICIATIVA] = @ID_ACTIVIDAD_INICIATIVA
End


GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- ==========================================================================================
-- Entity Name:	SP_TBC_CRITERIO_EVAL_TECNICA_Update
-- Author:	Douglas Serbino
-- Create date:	07/06/2019 11:17:10
-- Description:	This stored procedure is intended for updating TBC_CRITERIO_EVAL_TECNICA table
-- ==========================================================================================
CREATE Procedure [dbo].[SP_TBC_CRITERIO_EVAL_TECNICA_Update]
	@ID_CRITERIO_EVAL_TECNICO int,
	@ID_CRITERIO_EVAL_TECNICO_SUP int,
	@CRITERIO varchar(1024),
	@TIPO_EVAL char(3),
	@USUARIO_ACTUALIZA int

As
Begin
BEGIN TRY
            BEGIN TRANSACTION 
	Update TBC_CRITERIO_EVAL_TECNICA
	Set
		[ID_CRITERIO_EVAL_TECNICO_SUP] = @ID_CRITERIO_EVAL_TECNICO_SUP,
		[CRITERIO] = @CRITERIO,
		[TIPO_EVAL] = @TIPO_EVAL,
		[USUARIO_ACTUALIZA] = @USUARIO_ACTUALIZA,
		[FECHA_ACTUALIZA] = GETDATE()
	Where		
		[ID_CRITERIO_EVAL_TECNICO] = @ID_CRITERIO_EVAL_TECNICO
SELECT
                'IDENTITY' =  @ID_CRITERIO_EVAL_TECNICO,
                ERROR_NUMBER() 'ERROR_NUMBER',
                ERROR_MESSAGE() 'ERROR_MESSAGE',
                ERROR_PROCEDURE() 'ERROR_PROCEDURE',
                ERROR_LINE() 'ERROR_LINE';
            COMMIT TRANSACTION 
        END TRY
        BEGIN CATCH
            SELECT 
                'IDENTITY' = NULL,
                ERROR_NUMBER() 'ERROR_NUMBER',
                ERROR_MESSAGE() 'ERROR_MESSAGE',
                ERROR_PROCEDURE() 'ERROR_PROCEDURE',
                ERROR_LINE() 'ERROR_LINE';
            ROLLBACK TRANSACTION
        END CATCH
End
GO
/****** Object:  StoredProcedure [dbo].[SP_TBC_CRITERIO_EVAL_TECNICA_SelectRow]    Script Date: 08/06/2019 0:10:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- ==========================================================================================
-- Entity Name:	SP_TBC_CRITERIO_EVAL_TECNICA_SelectRow
-- Author:	Douglas Serbino
-- Create date:	07/06/2019 11:17:10
-- Description:	This stored procedure is intended for selecting a specific row from TBC_CRITERIO_EVAL_TECNICA table
-- ==========================================================================================
Create Procedure [dbo].[SP_TBC_CRITERIO_EVAL_TECNICA_SelectRow]
	@ID_CRITERIO_EVAL_TECNICO int
As
Begin
	Select 
		[ID_CRITERIO_EVAL_TECNICO],
		[ID_CRITERIO_EVAL_TECNICO_SUP],
		[CRITERIO],
		[TIPO_EVAL],
		[USUARIO_CREA],
		[USUARIO_ACTUALIZA],
		[FECHA_CREA],
		[FECHA_ACTUALIZA],
		[FECHA_BORRADO]
	From TBC_CRITERIO_EVAL_TECNICA
	Where
		[ID_CRITERIO_EVAL_TECNICO] = @ID_CRITERIO_EVAL_TECNICO
End
GO
/****** Object:  StoredProcedure [dbo].[SP_TBC_CRITERIO_EVAL_TECNICA_DeleteRow]    Script Date: 08/06/2019 0:10:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- ==========================================================================================
-- Entity Name:	SP_TBC_CRITERIO_EVAL_TECNICA_DeleteRow
-- Author:	Douglas Serbino
-- Create date:	07/06/2019 11:17:10
-- Description:	This stored procedure is intended for deleting a specific row from TBC_CRITERIO_EVAL_TECNICA table
-- ==========================================================================================
CREATE Procedure [dbo].[SP_TBC_CRITERIO_EVAL_TECNICA_DeleteRow]
	@ID_CRITERIO_EVAL_TECNICO int,
	@USUARIO_ACTUALIZA int 
As
Begin
BEGIN TRY
                BEGIN TRANSACTION
	UPDATE TBC_CRITERIO_EVAL_TECNICA
	set
	USUARIO_ACTUALIZA = @USUARIO_ACTUALIZA,
	FECHA_BORRADO = GETDATE()
	Where
		[ID_CRITERIO_EVAL_TECNICO] = @ID_CRITERIO_EVAL_TECNICO

		SELECT
                        'IDENTITY' = @ID_CRITERIO_EVAL_TECNICO,
                        ERROR_NUMBER() 'ERROR_NUMBER',
                        ERROR_MESSAGE() 'ERROR_MESSAGE',
                        ERROR_PROCEDURE() 'ERROR_PROCEDURE',
                        ERROR_LINE() 'ERROR_LINE';
                COMMIT TRANSACTION
        END TRY
        BEGIN CATCH
                SELECT
                    'IDENTITY' = NULL,
                    ERROR_NUMBER() 'ERROR_NUMBER',
                    ERROR_MESSAGE() 'ERROR_MESSAGE',
                    ERROR_PROCEDURE() 'ERROR_PROCEDURE',
                    ERROR_LINE() 'ERROR_LINE';
                ROLLBACK TRANSACTION
        END CATCH

End
GO
/****** Object:  StoredProcedure [dbo].[SP_TBC_CAMPOS_INICIATIVA_SelectRow]    Script Date: 08/06/2019 0:10:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- ==========================================================================================
-- Entity Name:	SP_TBC_CAMPOS_INICIATIVA_SelectRow
-- Author:	Douglas Serbino
-- Create date:	07/06/2019 11:17:02
-- Description:	This stored procedure is intended for selecting a specific row from TBC_CAMPOS_INICIATIVA table
-- ==========================================================================================
CREATE Procedure [dbo].[SP_TBC_CAMPOS_INICIATIVA_SelectRow]
	@ID_CAMPO int
As
Begin
	Select 
		[ID_CAMPO],
		[ID_TIPO_INICIATIVA],
		[NOMBRE_CAMPO],
		[USUARIO_CREA],
		[USUARIO_ACTUALIZA],
		[FECHA_CREA],
		[FECHA_ACTUALIZA],
		[FECHA_BORRADO]
	From TBC_CAMPOS_INICIATIVA
	Where
		[ID_CAMPO] = @ID_CAMPO
End
GO
/****** Object:  StoredProcedure [dbo].[SP_TBC_CAMPO_CRITERIO_EVAL_SelectAll]    Script Date: 08/06/2019 0:10:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- ==========================================================================================
-- Entity Name:	SP_TBC_CAMPO_CRITERIO_EVAL_SelectAll
-- Author:	Douglas Serbino
-- Create date:	07/06/2019 11:16:50
-- Description:	This stored procedure is intended for selecting all rows from TBC_CAMPO_CRITERIO_EVAL table
-- ==========================================================================================
CREATE Procedure [dbo].[SP_TBC_CAMPO_CRITERIO_EVAL_SelectAll]
As
Begin
	Select 
		[ID_CAMPO_CRITERIO_EVAL],
		[ID_CRITERIO_EVAL_TECNICO],
		[CAMPO],
		[PUNTAJE_MAX],
		[USUARIO_CREA],
		[USUARIO_ACTUALIZA],
		[FECHA_CREA],
		[FECHA_ACTUALIZA],
		[FECHA_BORRADO]
	From TBC_CAMPO_CRITERIO_EVAL
	WHERE [FECHA_BORRADO] IS NULL
End
GO
/****** Object:  StoredProcedure [dbo].[SP_TBC_CAMPO_CRITERIO_EVAL_Insert]    Script Date: 08/06/2019 0:10:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- ==========================================================================================
-- Entity Name:	SP_TBC_CAMPO_CRITERIO_EVAL_Insert
-- Author:	Douglas Serbino
-- Create date:	07/06/2019 11:16:50
-- Description:	This stored procedure is intended for inserting values to TBC_CAMPO_CRITERIO_EVAL table
-- ==========================================================================================
CREATE Procedure [dbo].[SP_TBC_CAMPO_CRITERIO_EVAL_Insert]
	@ID_CRITERIO_EVAL_TECNICO int = NULL,
	@CAMPO varchar(2048),
	@PUNTAJE_MAX smallint,
	@USUARIO_CREA int = NULL
As
Begin
BEGIN TRY
         BEGIN TRANSACTION 
	Insert Into TBC_CAMPO_CRITERIO_EVAL
		([ID_CRITERIO_EVAL_TECNICO],[CAMPO],[PUNTAJE_MAX],[USUARIO_CREA],[FECHA_CREA])
	Values
		(@ID_CRITERIO_EVAL_TECNICO,@CAMPO,@PUNTAJE_MAX,@USUARIO_CREA,GETDATE())

	SELECT 
                     SCOPE_IDENTITY() 'IDENTITY',
                     ERROR_NUMBER() 'ERROR NUMBER',
                     ERROR_MESSAGE() 'ERROR_MESSAGE',
                     ERROR_PROCEDURE() 'ERROR_PROCEDURE',
                     ERROR_LINE() 'ERROR_LINE';
         COMMIT TRANSACTION   
		 END TRY
   BEGIN CATCH
         SELECT 
               SCOPE_IDENTITY() 'IDENTITY',
               ERROR_NUMBER() 'ERROR_NUMBER',
               ERROR_MESSAGE() 'ERROR_MESSAGE',
               ERROR_PROCEDURE() 'ERROR_PROCEDURE',
               ERROR_LINE() 'ERROR_LINE';
         ROLLBACK TRANSACTION 
   END CATCH
End
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- ==========================================================================================
-- Entity Name:	SP_TBC_CAMPO_CRITERIO_EVAL_Update
-- Author:	Douglas Serbino
-- Create date:	07/06/2019 11:16:50
-- Description:	This stored procedure is intended for updating TBC_CAMPO_CRITERIO_EVAL table
-- ==========================================================================================
CREATE Procedure [dbo].[SP_TBC_CAMPO_CRITERIO_EVAL_Update]
	@ID_CAMPO_CRITERIO_EVAL int,
	@ID_CRITERIO_EVAL_TECNICO int,
	@CAMPO varchar(2048),
	@PUNTAJE_MAX smallint,
	@USUARIO_ACTUALIZA int

As
Begin
BEGIN TRY
            BEGIN TRANSACTION 
	Update TBC_CAMPO_CRITERIO_EVAL
	Set
		[ID_CRITERIO_EVAL_TECNICO] = @ID_CRITERIO_EVAL_TECNICO,
		[CAMPO] = @CAMPO,
		[PUNTAJE_MAX] = @PUNTAJE_MAX,
		[USUARIO_ACTUALIZA] = @USUARIO_ACTUALIZA,
		[FECHA_ACTUALIZA] = GETDATE()
	Where		
		[ID_CAMPO_CRITERIO_EVAL] = @ID_CAMPO_CRITERIO_EVAL
SELECT
                'IDENTITY' = @ID_CAMPO_CRITERIO_EVAL,
                ERROR_NUMBER() 'ERROR_NUMBER',
                ERROR_MESSAGE() 'ERROR_MESSAGE',
                ERROR_PROCEDURE() 'ERROR_PROCEDURE',
                ERROR_LINE() 'ERROR_LINE';
            COMMIT TRANSACTION 
        END TRY
        BEGIN CATCH
            SELECT 
                'IDENTITY' = NULL,
                ERROR_NUMBER() 'ERROR_NUMBER',
                ERROR_MESSAGE() 'ERROR_MESSAGE',
                ERROR_PROCEDURE() 'ERROR_PROCEDURE',
                ERROR_LINE() 'ERROR_LINE';
            ROLLBACK TRANSACTION
        END CATCH
End
GO
/****** Object:  StoredProcedure [dbo].[SP_TBC_CAMPO_CRITERIO_EVAL_SelectRow]    Script Date: 08/06/2019 0:10:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- ==========================================================================================
-- Entity Name:	SP_TBC_CAMPO_CRITERIO_EVAL_SelectRow
-- Author:	Douglas Serbino
-- Create date:	07/06/2019 11:16:50
-- Description:	This stored procedure is intended for selecting a specific row from TBC_CAMPO_CRITERIO_EVAL table
-- ==========================================================================================
Create Procedure [dbo].[SP_TBC_CAMPO_CRITERIO_EVAL_SelectRow]
	@ID_CAMPO_CRITERIO_EVAL int
As
Begin
	Select 
		[ID_CAMPO_CRITERIO_EVAL],
		[ID_CRITERIO_EVAL_TECNICO],
		[CAMPO],
		[PUNTAJE_MAX],
		[USUARIO_CREA],
		[USUARIO_ACTUALIZA],
		[FECHA_CREA],
		[FECHA_ACTUALIZA],
		[FECHA_BORRADO]
	From TBC_CAMPO_CRITERIO_EVAL
	Where
		[ID_CAMPO_CRITERIO_EVAL] = @ID_CAMPO_CRITERIO_EVAL
End
GO
/****** Object:  StoredProcedure [dbo].[SP_TBC_CAMPO_CRITERIO_EVAL_DeleteRow]    Script Date: 08/06/2019 0:10:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- ==========================================================================================
-- Entity Name:	SP_TBC_CAMPO_CRITERIO_EVAL_DeleteRow
-- Author:	Douglas Serbino
-- Create date:	07/06/2019 11:16:50
-- Description:	This stored procedure is intended for deleting a specific row from TBC_CAMPO_CRITERIO_EVAL table
-- ==========================================================================================
CREATE Procedure [dbo].[SP_TBC_CAMPO_CRITERIO_EVAL_DeleteRow]
	@ID_CAMPO_CRITERIO_EVAL int,
	@USUARIO_ACTUALIZA INT
As
Begin
BEGIN TRY
                BEGIN TRANSACTION
	UPDATE TBC_CAMPO_CRITERIO_EVAL
	set
	USUARIO_ACTUALIZA = @USUARIO_ACTUALIZA,
	FECHA_BORRADO = GETDATE()
	Where
		[ID_CAMPO_CRITERIO_EVAL] = @ID_CAMPO_CRITERIO_EVAL
	SELECT
                        'IDENTITY' = @ID_CAMPO_CRITERIO_EVAL,
                        ERROR_NUMBER() 'ERROR_NUMBER',
                        ERROR_MESSAGE() 'ERROR_MESSAGE',
                        ERROR_PROCEDURE() 'ERROR_PROCEDURE',
                        ERROR_LINE() 'ERROR_LINE';
                COMMIT TRANSACTION
        END TRY
        BEGIN CATCH
                SELECT
                    'IDENTITY' = NULL,
                    ERROR_NUMBER() 'ERROR_NUMBER',
                    ERROR_MESSAGE() 'ERROR_MESSAGE',
                    ERROR_PROCEDURE() 'ERROR_PROCEDURE',
                    ERROR_LINE() 'ERROR_LINE';
                ROLLBACK TRANSACTION
        END CATCH

End
GO
/****** Object:  StoredProcedure [dbo].[SP_TBC_DEPARTAMENTO_GetDepartamentosById]    Script Date: 08/06/2019 0:10:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/***
	OBJETO: PROCEDURE [DBO].[SP_TBC_DEPARTAMENTO_GetDepartamentos]
	DESCRIPCION: PROCEDIMIENTO PARA OBTENER LOS DEPARTAMENTOS
	FECHA DE CREACION: 02/05/2019
	FECHA DE ACTUALIZACION: 
***/
CREATE PROCEDURE [dbo].[SP_TBC_DEPARTAMENTO_GetDepartamentosById]
@ID_DEPARTAMENTO INT
 AS
	
	SELECT * FROM dbo.TBC_DEPARTAMENTO
	WHERE ID_DEPARTAMENTO = @ID_DEPARTAMENTO;
GO
GO
/****** Object:  StoredProcedure [dbo].[SP_TBC_ESTADO_PROCESO_SelectRow]    Script Date: 08/06/2019 0:10:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- ==========================================================================================
-- Entity Name:	SP_TBC_ESTADO_PROCESO_SelectRow
-- Author:	Douglas Serbino
-- Create date:	07/06/2019 11:17:16
-- Description:	This stored procedure is intended for selecting a specific row from TBC_ESTADO_PROCESO table
-- ==========================================================================================
Create Procedure [dbo].[SP_TBC_ESTADO_PROCESO_SelectRow]
	@ID_ESTADO_PROCESO int
As
Begin
	Select 
		[ID_ESTADO_PROCESO],
		[CODIGO_ESTADO_PROCESO],
		[DESCRIPCION_ESTADO_PROCESO],
		[ICONO_ESTADO_PROCESO],
		[COLOR_ESTADO_PROCESO],
		[USUARIO_CREA],
		[USUARIO_ACTUALIZA],
		[FECHA_CREA],
		[FECHA_ACTUALIZA],
		[FECHA_BORRADO]
	From TBC_ESTADO_PROCESO
	Where
		[ID_ESTADO_PROCESO] = @ID_ESTADO_PROCESO
End
GO
/****** Object:  StoredProcedure [dbo].[SP_TBC_ESTADO_PROCESO_SelectAll]    Script Date: 08/06/2019 0:10:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- ==========================================================================================
-- Entity Name:	SP_TBC_ESTADO_PROCESO_SelectAll
-- Author:	Douglas Serbino
-- Create date:	07/06/2019 11:17:16
-- Description:	This stored procedure is intended for selecting all rows from TBC_ESTADO_PROCESO table
-- ==========================================================================================
CREATE Procedure [dbo].[SP_TBC_ESTADO_PROCESO_SelectAll]
As
Begin
	Select 
		[ID_ESTADO_PROCESO],
		[CODIGO_ESTADO_PROCESO],
		[DESCRIPCION_ESTADO_PROCESO],
		[ICONO_ESTADO_PROCESO],
		[COLOR_ESTADO_PROCESO],
		[USUARIO_CREA],
		[USUARIO_ACTUALIZA],
		[FECHA_CREA],
		[FECHA_ACTUALIZA],
		[FECHA_BORRADO]
	From TBC_ESTADO_PROCESO
	WHERE [FECHA_BORRADO] IS NULL
End
GO
/****** Object:  StoredProcedure [dbo].[SP_TBC_ESTADO_PROCESO_Insert]    Script Date: 08/06/2019 0:10:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- ==========================================================================================
-- Entity Name:	SP_TBC_ESTADO_PROCESO_Insert
-- Author:	Douglas Serbino
-- Create date:	07/06/2019 11:17:16
-- Description:	This stored procedure is intended for inserting values to TBC_ESTADO_PROCESO table
-- ==========================================================================================
CREATE Procedure [dbo].[SP_TBC_ESTADO_PROCESO_Insert]
	@CODIGO_ESTADO_PROCESO varchar(6),
	@DESCRIPCION_ESTADO_PROCESO varchar(64),
	@ICONO_ESTADO_PROCESO varchar(50) = NULL,
	@COLOR_ESTADO_PROCESO varchar(50) = NULL,
	@USUARIO_CREA int = NULL
	
As
Begin
BEGIN TRY
         BEGIN TRANSACTION 

	Insert Into TBC_ESTADO_PROCESO
		([CODIGO_ESTADO_PROCESO],[DESCRIPCION_ESTADO_PROCESO],[ICONO_ESTADO_PROCESO],[COLOR_ESTADO_PROCESO],[USUARIO_CREA],[FECHA_CREA])
	Values
		(@CODIGO_ESTADO_PROCESO,@DESCRIPCION_ESTADO_PROCESO,@ICONO_ESTADO_PROCESO,@COLOR_ESTADO_PROCESO,@USUARIO_CREA,GETDATE())

SELECT 
                     SCOPE_IDENTITY() 'IDENTITY',
                     ERROR_NUMBER() 'ERROR NUMBER',
                     ERROR_MESSAGE() 'ERROR_MESSAGE',
                     ERROR_PROCEDURE() 'ERROR_PROCEDURE',
                     ERROR_LINE() 'ERROR_LINE';
         COMMIT TRANSACTION   
		 END TRY
   BEGIN CATCH
         SELECT 
               SCOPE_IDENTITY() 'IDENTITY',
               ERROR_NUMBER() 'ERROR_NUMBER',
               ERROR_MESSAGE() 'ERROR_MESSAGE',
               ERROR_PROCEDURE() 'ERROR_PROCEDURE',
               ERROR_LINE() 'ERROR_LINE';
         ROLLBACK TRANSACTION 
   END CATCH

End
GO
/****** Object:  StoredProcedure [dbo].[SP_TBC_ESTADO_PROCESO_Update]    Script Date: 08/06/2019 0:10:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- ==========================================================================================
-- Entity Name:	SP_TBC_ESTADO_PROCESO_Update
-- Author:	Douglas Serbino
-- Create date:	07/06/2019 11:17:16
-- Description:	This stored procedure is intended for updating TBC_ESTADO_PROCESO table
-- ==========================================================================================
CREATE Procedure [dbo].[SP_TBC_ESTADO_PROCESO_Update]
	@ID_ESTADO_PROCESO int,
	@CODIGO_ESTADO_PROCESO varchar(6),
	@DESCRIPCION_ESTADO_PROCESO varchar(64),
	@ICONO_ESTADO_PROCESO varchar(50),
	@COLOR_ESTADO_PROCESO varchar(50),
	@USUARIO_ACTUALIZA int
As
Begin
BEGIN TRY
            BEGIN TRANSACTION 
	Update TBC_ESTADO_PROCESO
	Set
		[CODIGO_ESTADO_PROCESO] = @CODIGO_ESTADO_PROCESO,
		[DESCRIPCION_ESTADO_PROCESO] = @DESCRIPCION_ESTADO_PROCESO,
		[ICONO_ESTADO_PROCESO] = @ICONO_ESTADO_PROCESO,
		[COLOR_ESTADO_PROCESO] = @COLOR_ESTADO_PROCESO,
		[USUARIO_ACTUALIZA] = @USUARIO_ACTUALIZA,
		[FECHA_ACTUALIZA] = GETDATE()
	Where		
		[ID_ESTADO_PROCESO] = @ID_ESTADO_PROCESO

	SELECT
                'IDENTITY' = @ID_ESTADO_PROCESO,
                ERROR_NUMBER() 'ERROR_NUMBER',
                ERROR_MESSAGE() 'ERROR_MESSAGE',
                ERROR_PROCEDURE() 'ERROR_PROCEDURE',
                ERROR_LINE() 'ERROR_LINE';
            COMMIT TRANSACTION 
        END TRY
        BEGIN CATCH
            SELECT 
                'IDENTITY' = NULL,
                ERROR_NUMBER() 'ERROR_NUMBER',
                ERROR_MESSAGE() 'ERROR_MESSAGE',
                ERROR_PROCEDURE() 'ERROR_PROCEDURE',
                ERROR_LINE() 'ERROR_LINE';
            ROLLBACK TRANSACTION
        END CATCH

End
GO
/****** Object:  StoredProcedure [dbo].[SP_TBC_ESTADO_PROCESO_DeleteRow]    Script Date: 08/06/2019 0:10:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- ==========================================================================================
-- Entity Name:	SP_TBC_ESTADO_PROCESO_DeleteRow
-- Author:	Douglas Serbino
-- Create date:	07/06/2019 11:17:16
-- Description:	This stored procedure is intended for deleting a specific row from TBC_ESTADO_PROCESO table
-- ==========================================================================================
CREATE Procedure [dbo].[SP_TBC_ESTADO_PROCESO_DeleteRow]
	@ID_ESTADO_PROCESO int,
	@USUARIO_ACTUALIZA int
As
Begin
BEGIN TRY
                BEGIN TRANSACTION
	UPDATE TBC_ESTADO_PROCESO
	set
	USUARIO_ACTUALIZA = @USUARIO_ACTUALIZA,
	FECHA_BORRADO = GETDATE()
	Where
		[ID_ESTADO_PROCESO] = @ID_ESTADO_PROCESO

		SELECT
                        'IDENTITY' = @ID_ESTADO_PROCESO,
                        ERROR_NUMBER() 'ERROR_NUMBER',
                        ERROR_MESSAGE() 'ERROR_MESSAGE',
                        ERROR_PROCEDURE() 'ERROR_PROCEDURE',
                        ERROR_LINE() 'ERROR_LINE';
                COMMIT TRANSACTION
        END TRY
        BEGIN CATCH
                SELECT
                    'IDENTITY' = NULL,
                    ERROR_NUMBER() 'ERROR_NUMBER',
                    ERROR_MESSAGE() 'ERROR_MESSAGE',
                    ERROR_PROCEDURE() 'ERROR_PROCEDURE',
                    ERROR_LINE() 'ERROR_LINE';
                ROLLBACK TRANSACTION
        END CATCH

End
GO
/****** Object:  StoredProcedure [dbo].[SP_TBC_MUNICIPIO_SelectAll]    Script Date: 08/06/2019 0:10:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- ==========================================================================================
-- Entity Name:	SP_TBC_MUNICIPIO_SelectAll
-- Author:	Douglas Serbino
-- Create date:	07/06/2019 11:17:48
-- Description:	This stored procedure is intended for selecting all rows from TBC_MUNICIPIO table
-- ==========================================================================================
CREATE Procedure [dbo].[SP_TBC_MUNICIPIO_SelectAll]
As
Begin
	Select 
		[ID_MUNICIPIO],
		[ID_DEPARTAMENTO],
		[COD_MUNICIPIO],
		[NOMBRE_MUNIC],
		[USUARIO_CREA],
		[USUARIO_ACTUALIZA],
		[FECHA_CREA],
		[FECHA_ACTUALIZA],
		[FECHA_BORRADO]
	From TBC_MUNICIPIO
	WHERE [FECHA_BORRADO] IS NULL
End
GO
/****** Object:  StoredProcedure [dbo].[SP_TBC_MUNICIPIO_SelectRow]    Script Date: 08/06/2019 0:10:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- ==========================================================================================
-- Entity Name:	SP_TBC_MUNICIPIO_SelectRow
-- Author:	Douglas Serbino
-- Create date:	07/06/2019 11:17:48
-- Description:	This stored procedure is intended for selecting a specific row from TBC_MUNICIPIO table
-- ==========================================================================================
Create Procedure [dbo].[SP_TBC_MUNICIPIO_SelectRow]
	@ID_MUNICIPIO int
As
Begin
	Select 
		[ID_MUNICIPIO],
		[ID_DEPARTAMENTO],
		[COD_MUNICIPIO],
		[NOMBRE_MUNIC],
		[USUARIO_CREA],
		[USUARIO_ACTUALIZA],
		[FECHA_CREA],
		[FECHA_ACTUALIZA],
		[FECHA_BORRADO]
	From TBC_MUNICIPIO
	Where
		[ID_MUNICIPIO] = @ID_MUNICIPIO
End
GO
/****** Object:  StoredProcedure [dbo].[SP_TBC_MUNICIPIO_Insert]    Script Date: 08/06/2019 0:10:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- ==========================================================================================
-- Entity Name:	SP_TBC_MUNICIPIO_Insert
-- Author:	Douglas Serbino
-- Create date:	07/06/2019 11:17:48
-- Description:	This stored procedure is intended for inserting values to TBC_MUNICIPIO table
-- ==========================================================================================
CREATE Procedure [dbo].[SP_TBC_MUNICIPIO_Insert]
	@ID_DEPARTAMENTO int = NULL,
	@COD_MUNICIPIO char(4),
	@NOMBRE_MUNIC varchar(32),
	@USUARIO_CREA int = NULL
	
As
Begin
BEGIN TRY
         BEGIN TRANSACTION 
	Insert Into TBC_MUNICIPIO
		([ID_DEPARTAMENTO],[COD_MUNICIPIO],[NOMBRE_MUNIC],[USUARIO_CREA],[FECHA_CREA])
	Values
		(@ID_DEPARTAMENTO,@COD_MUNICIPIO,@NOMBRE_MUNIC,@USUARIO_CREA,GETDATE())

	SELECT 
                     SCOPE_IDENTITY() 'IDENTITY',
                     ERROR_NUMBER() 'ERROR NUMBER',
                     ERROR_MESSAGE() 'ERROR_MESSAGE',
                     ERROR_PROCEDURE() 'ERROR_PROCEDURE',
                     ERROR_LINE() 'ERROR_LINE';
         COMMIT TRANSACTION   
		 END TRY
   BEGIN CATCH
         SELECT 
               SCOPE_IDENTITY() 'IDENTITY',
               ERROR_NUMBER() 'ERROR_NUMBER',
               ERROR_MESSAGE() 'ERROR_MESSAGE',
               ERROR_PROCEDURE() 'ERROR_PROCEDURE',
               ERROR_LINE() 'ERROR_LINE';
         ROLLBACK TRANSACTION 
   END CATCH

End
GO
/****** Object:  StoredProcedure [dbo].[SP_TBC_MUNICIPIO_Update]    Script Date: 08/06/2019 0:10:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- ==========================================================================================
-- Entity Name:	SP_TBC_MUNICIPIO_Update
-- Author:	Douglas Serbino
-- Create date:	07/06/2019 11:17:48
-- Description:	This stored procedure is intended for updating TBC_MUNICIPIO table
-- ==========================================================================================
CREATE Procedure [dbo].[SP_TBC_MUNICIPIO_Update]
	@ID_MUNICIPIO int,
	@ID_DEPARTAMENTO int,
	@COD_MUNICIPIO char(4),
	@NOMBRE_MUNIC varchar(32),
	@USUARIO_ACTUALIZA int
	
As
Begin
BEGIN TRY
            BEGIN TRANSACTION 
	Update TBC_MUNICIPIO
	Set
		[ID_DEPARTAMENTO] = @ID_DEPARTAMENTO,
		[COD_MUNICIPIO] = @COD_MUNICIPIO,
		[NOMBRE_MUNIC] = @NOMBRE_MUNIC,
		[USUARIO_ACTUALIZA] = @USUARIO_ACTUALIZA,
		[FECHA_ACTUALIZA] = GETDATE()
	Where		
		[ID_MUNICIPIO] = @ID_MUNICIPIO
SELECT
                'IDENTITY' = @ID_MUNICIPIO,
                ERROR_NUMBER() 'ERROR_NUMBER',
                ERROR_MESSAGE() 'ERROR_MESSAGE',
                ERROR_PROCEDURE() 'ERROR_PROCEDURE',
                ERROR_LINE() 'ERROR_LINE';
            COMMIT TRANSACTION 
        END TRY
        BEGIN CATCH
            SELECT 
                'IDENTITY' = NULL,
                ERROR_NUMBER() 'ERROR_NUMBER',
                ERROR_MESSAGE() 'ERROR_MESSAGE',
                ERROR_PROCEDURE() 'ERROR_PROCEDURE',
                ERROR_LINE() 'ERROR_LINE';
            ROLLBACK TRANSACTION
        END CATCH
End
GO
/****** Object:  StoredProcedure [dbo].[SP_TBC_MUNICIPIO_DeleteRow]    Script Date: 08/06/2019 0:10:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- ==========================================================================================
-- Entity Name:	SP_TBC_MUNICIPIO_DeleteRow
-- Author:	Douglas Serbino
-- Create date:	07/06/2019 11:17:48
-- Description:	This stored procedure is intended for deleting a specific row from TBC_MUNICIPIO table
-- ==========================================================================================
CREATE Procedure [dbo].[SP_TBC_MUNICIPIO_DeleteRow]
	@ID_MUNICIPIO int,
	@USUARIO_ACTUALIZA int

As
Begin
BEGIN TRY
                BEGIN TRANSACTION
	UPDATE TBC_MUNICIPIO
	set
	USUARIO_ACTUALIZA = @USUARIO_ACTUALIZA,
	FECHA_BORRADO = GETDATE()
	Where
		[ID_MUNICIPIO] = @ID_MUNICIPIO

	SELECT
                        'IDENTITY' = @ID_MUNICIPIO,
                        ERROR_NUMBER() 'ERROR_NUMBER',
                        ERROR_MESSAGE() 'ERROR_MESSAGE',
                        ERROR_PROCEDURE() 'ERROR_PROCEDURE',
                        ERROR_LINE() 'ERROR_LINE';
                COMMIT TRANSACTION
        END TRY
        BEGIN CATCH
                SELECT
                    'IDENTITY' = NULL,
                    ERROR_NUMBER() 'ERROR_NUMBER',
                    ERROR_MESSAGE() 'ERROR_MESSAGE',
                    ERROR_PROCEDURE() 'ERROR_PROCEDURE',
                    ERROR_LINE() 'ERROR_LINE';
                ROLLBACK TRANSACTION
        END CATCH

End
GO
/****** Object:  StoredProcedure [dbo].[SP_TBC_SECTOR_ECONOMICO_SelectAll]    Script Date: 08/06/2019 0:10:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- ==========================================================================================
-- Entity Name:	SP_TBC_SECTOR_ECONOMICO_SelectAll
-- Author:	Douglas Serbino
-- Create date:	07/06/2019 11:17:55
-- Description:	This stored procedure is intended for selecting all rows from TBC_SECTOR_ECONOMICO table
-- ==========================================================================================
CREATE Procedure [dbo].[SP_TBC_SECTOR_ECONOMICO_SelectAll]
As
Begin
	Select 
		[ID_SECTOR_ECONOMICO],
		[COD_SECTOR_ECONOMICO],
		[NOMBRE_SECTOR],
		[USUARIO_CREA],
		[USUARIO_ACTUALIZA],
		[FECHA_CREA],
		[FECHA_ACTUALIZA],
		[FECHA_BORRADO]
	From TBC_SECTOR_ECONOMICO
	WHERE [FECHA_BORRADO] IS NULL
End
GO
/****** Object:  StoredProcedure [dbo].[SP_TBC_SECTOR_ECONOMICO_Insert]    Script Date: 08/06/2019 0:10:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- ==========================================================================================
-- Entity Name:	SP_TBC_SECTOR_ECONOMICO_Insert
-- Author:	Douglas Serbino
-- Create date:	07/06/2019 11:17:55
-- Description:	This stored procedure is intended for inserting values to TBC_SECTOR_ECONOMICO table
-- ==========================================================================================
CREATE Procedure [dbo].[SP_TBC_SECTOR_ECONOMICO_Insert]
	@COD_SECTOR_ECONOMICO char(6),
	@NOMBRE_SECTOR varchar(16),
	@USUARIO_CREA int = NULL

	
As
Begin
BEGIN TRY
         BEGIN TRANSACTION 
	Insert Into TBC_SECTOR_ECONOMICO
		([COD_SECTOR_ECONOMICO],[NOMBRE_SECTOR],[USUARIO_CREA],[FECHA_CREA])
	Values
		(@COD_SECTOR_ECONOMICO,@NOMBRE_SECTOR,@USUARIO_CREA,GETDATE())

		SELECT 
                     SCOPE_IDENTITY() 'IDENTITY',
                     ERROR_NUMBER() 'ERROR NUMBER',
                     ERROR_MESSAGE() 'ERROR_MESSAGE',
                     ERROR_PROCEDURE() 'ERROR_PROCEDURE',
                     ERROR_LINE() 'ERROR_LINE';
         COMMIT TRANSACTION   
		 END TRY
   BEGIN CATCH
         SELECT 
               SCOPE_IDENTITY() 'IDENTITY',
               ERROR_NUMBER() 'ERROR_NUMBER',
               ERROR_MESSAGE() 'ERROR_MESSAGE',
               ERROR_PROCEDURE() 'ERROR_PROCEDURE',
               ERROR_LINE() 'ERROR_LINE';
         ROLLBACK TRANSACTION 
   END CATCH
	
End
GO
/****** Object:  StoredProcedure [dbo].[SP_TBC_SECTOR_ECONOMICO_Update]    Script Date: 08/06/2019 0:10:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- ==========================================================================================
-- Entity Name:	SP_TBC_SECTOR_ECONOMICO_Update
-- Author:	Douglas Serbino
-- Create date:	07/06/2019 11:17:55
-- Description:	This stored procedure is intended for updating TBC_SECTOR_ECONOMICO table
-- ==========================================================================================
CREATE Procedure [dbo].[SP_TBC_SECTOR_ECONOMICO_Update]
	@ID_SECTOR_ECONOMICO int,
	@COD_SECTOR_ECONOMICO char(6),
	@NOMBRE_SECTOR varchar(16),
	@USUARIO_ACTUALIZA int
	
As
Begin
BEGIN TRY
            BEGIN TRANSACTION 
	Update TBC_SECTOR_ECONOMICO
	Set
		[COD_SECTOR_ECONOMICO] = @COD_SECTOR_ECONOMICO,
		[NOMBRE_SECTOR] = @NOMBRE_SECTOR,
		[USUARIO_ACTUALIZA] = @USUARIO_ACTUALIZA,
		[FECHA_ACTUALIZA] =  GETDATE()
		
	Where		
		[ID_SECTOR_ECONOMICO] = @ID_SECTOR_ECONOMICO

	SELECT
                'IDENTITY' = @ID_SECTOR_ECONOMICO,
                ERROR_NUMBER() 'ERROR_NUMBER',
                ERROR_MESSAGE() 'ERROR_MESSAGE',
                ERROR_PROCEDURE() 'ERROR_PROCEDURE',
                ERROR_LINE() 'ERROR_LINE';
            COMMIT TRANSACTION 
        END TRY
        BEGIN CATCH
            SELECT 
                'IDENTITY' = NULL,
                ERROR_NUMBER() 'ERROR_NUMBER',
                ERROR_MESSAGE() 'ERROR_MESSAGE',
                ERROR_PROCEDURE() 'ERROR_PROCEDURE',
                ERROR_LINE() 'ERROR_LINE';
            ROLLBACK TRANSACTION
        END CATCH
End
GO
/****** Object:  StoredProcedure [dbo].[SP_TBC_SECTOR_ECONOMICO_DeleteRow]    Script Date: 08/06/2019 0:10:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- ==========================================================================================
-- Entity Name:	SP_TBC_SECTOR_ECONOMICO_DeleteRow
-- Author:	Douglas Serbino
-- Create date:	07/06/2019 11:17:55
-- Description:	This stored procedure is intended for deleting a specific row from TBC_SECTOR_ECONOMICO table
-- ==========================================================================================
CREATE Procedure [dbo].[SP_TBC_SECTOR_ECONOMICO_DeleteRow]
	@ID_SECTOR_ECONOMICO int,
	@USUARIO_ACTUALIZA int
As
Begin
BEGIN TRY
                BEGIN TRANSACTION
	UPDATE TBC_SECTOR_ECONOMICO
	set
	USUARIO_ACTUALIZA = @USUARIO_ACTUALIZA,
	FECHA_BORRADO = GETDATE()
	Where
		[ID_SECTOR_ECONOMICO] = @ID_SECTOR_ECONOMICO

		SELECT
                        'IDENTITY' = @ID_SECTOR_ECONOMICO,
                        ERROR_NUMBER() 'ERROR_NUMBER',
                        ERROR_MESSAGE() 'ERROR_MESSAGE',
                        ERROR_PROCEDURE() 'ERROR_PROCEDURE',
                        ERROR_LINE() 'ERROR_LINE';
                COMMIT TRANSACTION
        END TRY
        BEGIN CATCH
                SELECT
                    'IDENTITY' = NULL,
                    ERROR_NUMBER() 'ERROR_NUMBER',
                    ERROR_MESSAGE() 'ERROR_MESSAGE',
                    ERROR_PROCEDURE() 'ERROR_PROCEDURE',
                    ERROR_LINE() 'ERROR_LINE';
                ROLLBACK TRANSACTION
        END CATCH

End
GO
/****** Object:  StoredProcedure [dbo].[SP_TBC_SECTOR_ECONOMICO_SelectRow]    Script Date: 08/06/2019 0:10:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- ==========================================================================================
-- Entity Name:	SP_TBC_SECTOR_ECONOMICO_SelectRow
-- Author:	Douglas Serbino
-- Create date:	07/06/2019 11:17:55
-- Description:	This stored procedure is intended for selecting a specific row from TBC_SECTOR_ECONOMICO table
-- ==========================================================================================
Create Procedure [dbo].[SP_TBC_SECTOR_ECONOMICO_SelectRow]
	@ID_SECTOR_ECONOMICO int
As
Begin
	Select 
		[ID_SECTOR_ECONOMICO],
		[COD_SECTOR_ECONOMICO],
		[NOMBRE_SECTOR],
		[USUARIO_CREA],
		[USUARIO_ACTUALIZA],
		[FECHA_CREA],
		[FECHA_ACTUALIZA],
		[FECHA_BORRADO]
	From TBC_SECTOR_ECONOMICO
	Where
		[ID_SECTOR_ECONOMICO] = @ID_SECTOR_ECONOMICO
End
GO
/****** Object:  StoredProcedure [dbo].[SP_TBC_TIPO_INICIATIVA_DeleteRow]    Script Date: 08/06/2019 0:10:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- ==========================================================================================
-- Entity Name:	SP_TBC_TIPO_INICIATIVA_DeleteRow
-- Author:	Douglas Serbino
-- Create date:	07/06/2019 7:35:02
-- Description:	This stored procedure is intended for deleting a specific row from TBC_TIPO_INICIATIVA table
-- ==========================================================================================
CREATE Procedure [dbo].[SP_TBC_TIPO_INICIATIVA_DeleteRow]
	@ID_TIPO_INICIATIVA int,
	@USUARIO_ACTUALIZA INT
As
Begin
 BEGIN TRY
                BEGIN TRANSACTION
	UPDATE TBC_TIPO_INICIATIVA
	SET 
	   USUARIO_ACTUALIZA = @USUARIO_ACTUALIZA,
	   FECHA_BORRADO = GETDATE()
	Where
		[ID_TIPO_INICIATIVA] = @ID_TIPO_INICIATIVA
	SELECT
                        'IDENTITY' = @ID_TIPO_INICIATIVA,
                        ERROR_NUMBER() 'ERROR_NUMBER',
                        ERROR_MESSAGE() 'ERROR_MESSAGE',
                        ERROR_PROCEDURE() 'ERROR_PROCEDURE',
                        ERROR_LINE() 'ERROR_LINE';
                COMMIT TRANSACTION
        END TRY
        BEGIN CATCH
                SELECT
                    'IDENTITY' = NULL,
                    ERROR_NUMBER() 'ERROR_NUMBER',
                    ERROR_MESSAGE() 'ERROR_MESSAGE',
                    ERROR_PROCEDURE() 'ERROR_PROCEDURE',
                    ERROR_LINE() 'ERROR_LINE';
                ROLLBACK TRANSACTION
        END CATCH

End
GO
/****** Object:  StoredProcedure [dbo].[SP_TBC_TIPO_INICIATIVA_Insert]    Script Date: 08/06/2019 0:10:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- ==========================================================================================
-- Entity Name:	SP_TBC_TIPO_INICIATIVA_Insert
-- Author:	Douglas Serbino
-- Create date:	07/06/2019 7:35:02
-- Description:	This stored procedure is intended for inserting values to TBC_TIPO_INICIATIVA table
-- ==========================================================================================
CREATE Procedure [dbo].[SP_TBC_TIPO_INICIATIVA_Insert]
	@NOMBRE varchar(32),
	@CODIGO_TIPO_INICIATVA varchar(5),
	@USUARIO_CREA int = NULL
	
As
Begin
BEGIN TRY
         BEGIN TRANSACTION 
	Insert Into TBC_TIPO_INICIATIVA
		([NOMBRE],[CODIGO_TIPO_INICIATVA],[USUARIO_CREA],[FECHA_CREA])
	Values
		(@NOMBRE,@CODIGO_TIPO_INICIATVA,@USUARIO_CREA, GETDATE())

	
	 SELECT 
                     SCOPE_IDENTITY() 'IDENTITY',
                     ERROR_NUMBER() 'ERROR NUMBER',
                     ERROR_MESSAGE() 'ERROR_MESSAGE',
                     ERROR_PROCEDURE() 'ERROR_PROCEDURE',
                     ERROR_LINE() 'ERROR_LINE';
         COMMIT TRANSACTION   
		 END TRY
   BEGIN CATCH
         SELECT 
               SCOPE_IDENTITY() 'IDENTITY',
               ERROR_NUMBER() 'ERROR_NUMBER',
               ERROR_MESSAGE() 'ERROR_MESSAGE',
               ERROR_PROCEDURE() 'ERROR_PROCEDURE',
               ERROR_LINE() 'ERROR_LINE';
         ROLLBACK TRANSACTION 
   END CATCH

End
GO
/****** Object:  StoredProcedure [dbo].[SP_TBC_TIPO_INICIATIVA_SelectAll]    Script Date: 08/06/2019 0:10:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- ==========================================================================================
-- Entity Name:	SP_TBC_TIPO_INICIATIVA_SelectAll
-- Author:	Douglas Serbino
-- Create date:	07/06/2019 7:35:02
-- Description:	This stored procedure is intended for selecting all rows from TBC_TIPO_INICIATIVA table
-- ==========================================================================================
CREATE Procedure [dbo].[SP_TBC_TIPO_INICIATIVA_SelectAll]
As
Begin
	Select 
		[ID_TIPO_INICIATIVA],
		[NOMBRE],
		[CODIGO_TIPO_INICIATVA],
		[USUARIO_CREA],
		[USUARIO_ACTUALIZA],
		[FECHA_CREA],
		[FECHA_ACTUALIZA],
		[FECHA_BORRADO]
	From TBC_TIPO_INICIATIVA
	WHERE [FECHA_BORRADO] IS NULL
End
GO
/****** Object:  StoredProcedure [dbo].[SP_TBC_TIPO_INICIATIVA_SelectRow]    Script Date: 08/06/2019 0:10:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- ==========================================================================================
-- Entity Name:	SP_TBC_TIPO_INICIATIVA_SelectRow
-- Author:	Douglas Serbino
-- Create date:	07/06/2019 7:35:02
-- Description:	This stored procedure is intended for selecting a specific row from TBC_TIPO_INICIATIVA table
-- ==========================================================================================
CREATE Procedure [dbo].[SP_TBC_TIPO_INICIATIVA_SelectRow]
	@ID_TIPO_INICIATIVA int
As
Begin
	Select 
		[ID_TIPO_INICIATIVA],
		[NOMBRE],
		[CODIGO_TIPO_INICIATVA],
		[USUARIO_CREA],
		[USUARIO_ACTUALIZA],
		[FECHA_CREA],
		[FECHA_ACTUALIZA],
		[FECHA_BORRADO]
	From TBC_TIPO_INICIATIVA
	Where
		[ID_TIPO_INICIATIVA] = @ID_TIPO_INICIATIVA
End
GO
/****** Object:  StoredProcedure [dbo].[SP_TBC_TIPO_INICIATIVA_Update]    Script Date: 08/06/2019 0:10:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- ==========================================================================================
-- Entity Name:	SP_TBC_TIPO_INICIATIVA_Update
-- Author:	Douglas Serbino
-- Create date:	07/06/2019 7:35:02
-- Description:	This stored procedure is intended for updating TBC_TIPO_INICIATIVA table
-- ==========================================================================================
CREATE Procedure [dbo].[SP_TBC_TIPO_INICIATIVA_Update]
	@ID_TIPO_INICIATIVA int,
	@NOMBRE varchar(32),
	@CODIGO_TIPO_INICIATVA varchar(5),
	@USUARIO_ACTUALIZA int
	

As
Begin
BEGIN TRY
            BEGIN TRANSACTION 
	Update TBC_TIPO_INICIATIVA
	Set
		[NOMBRE] = @NOMBRE,
		[CODIGO_TIPO_INICIATVA] = @CODIGO_TIPO_INICIATVA,
		[USUARIO_ACTUALIZA] = @USUARIO_ACTUALIZA,
		[FECHA_ACTUALIZA] = GETDATE()
		
	Where		
		[ID_TIPO_INICIATIVA] = @ID_TIPO_INICIATIVA
	SELECT
                'IDENTITY' = @ID_TIPO_INICIATIVA,
                ERROR_NUMBER() 'ERROR_NUMBER',
                ERROR_MESSAGE() 'ERROR_MESSAGE',
                ERROR_PROCEDURE() 'ERROR_PROCEDURE',
                ERROR_LINE() 'ERROR_LINE';
            COMMIT TRANSACTION 
        END TRY
        BEGIN CATCH
            SELECT 
                'IDENTITY' = NULL,
                ERROR_NUMBER() 'ERROR_NUMBER',
                ERROR_MESSAGE() 'ERROR_MESSAGE',
                ERROR_PROCEDURE() 'ERROR_PROCEDURE',
                ERROR_LINE() 'ERROR_LINE';
            ROLLBACK TRANSACTION
        END CATCH

End

GO

CREATE PROCEDURE SP_TB_PROYECTO_ACTIVIDAD_Insert
	@idActividad int,
	@idProyecto int,
	@idUsuarioCrea int
AS
	Begin
BEGIN TRY
         BEGIN TRANSACTION 
	INSERT INTO TB_PROYECTO_ACTIVIDAD(ID_ACTIVIDAD_INICIATIVA,ID_PROYECTO,USUARIO_CREA,FECHA_CREA,PORCENTAJE_AVANCE)
	VALUES (@idActividad,@idProyecto,@idUsuarioCrea,GETDATE(),0)

	
	 SELECT 
                     SCOPE_IDENTITY() 'IDENTITY',
                     ERROR_NUMBER() 'ERROR NUMBER',
                     ERROR_MESSAGE() 'ERROR_MESSAGE',
                     ERROR_PROCEDURE() 'ERROR_PROCEDURE',
                     ERROR_LINE() 'ERROR_LINE';
         COMMIT TRANSACTION   
		 END TRY
   BEGIN CATCH
         SELECT 
               SCOPE_IDENTITY() 'IDENTITY',
               ERROR_NUMBER() 'ERROR_NUMBER',
               ERROR_MESSAGE() 'ERROR_MESSAGE',
               ERROR_PROCEDURE() 'ERROR_PROCEDURE',
               ERROR_LINE() 'ERROR_LINE';
         ROLLBACK TRANSACTION 
   END CATCH

End
GO

CREATE PROCEDURE [dbo].[SP_TB_PROYECTO_ACTIVIDAD_ObtenerDetalleActividad]
@idProyecto int
AS
SELECT PA.ID_PROYECTO,PA.ID_ACTIVIDAD_INICIATIVA,
PA.ID_PROYECTO_ACTIVIDAD,PA.PORCENTAJE_AVANCE,
AI.COD_ACTIVIDAD_PROY,
AI.DESCRIPCION
FROM TB_PROYECTO_ACTIVIDAD AS PA
INNER JOIN TBC_ACTIVIDAD_INICIATIVA AS AI ON PA.ID_ACTIVIDAD_INICIATIVA = AI.ID_ACTIVIDAD_INICIATIVA
WHERE PA.ID_PROYECTO = @idProyecto

GO

CREATE PROCEDURE [dbo].[SP_TB_PROYECTO_ACTIVIDAD_ObtenerDetalleEjecucion]
@idProyecto int
AS
SELECT E.*
FROM TB_EJECUCION AS E
INNER JOIN TB_PROYECTO_ACTIVIDAD AS P ON E.ID_PROYECTO_ACTIVIDAD = P.ID_PROYECTO_ACTIVIDAD
INNER JOIN TB_PROYECTO AS PR ON PR.ID_PROYECTO = P.ID_PROYECTO
WHERE PR.ID_PROYECTO = @idProyecto

GO
CREATE PROCEDURE [dbo].[SP_TB_EJECUCION_Insert]
	@idProyectoActividad int,
	@descripcion varchar(4096),
	@MONTO varchar(50),
	@semIni datetime,
	@semFin datetime

AS
	Begin
BEGIN TRY
         BEGIN TRANSACTION 
	INSERT INTO TB_EJECUCION(ID_PROYECTO_ACTIVIDAD,DESCRIPCION,FECHA,MONTO_EJECUTADO,SEMANA_INICIO,SEMANA_FIN) VALUES(@idProyectoActividad,@descripcion,GETDATE(),CAST(@MONTO AS decimal(18,2)),@semIni,@semFin)

	 SELECT 
                     SCOPE_IDENTITY() 'IDENTITY',
                     ERROR_NUMBER() 'ERROR NUMBER',
                     ERROR_MESSAGE() 'ERROR_MESSAGE',
                     ERROR_PROCEDURE() 'ERROR_PROCEDURE',
                     ERROR_LINE() 'ERROR_LINE';
         COMMIT TRANSACTION   
		 END TRY
   BEGIN CATCH
         SELECT 
               SCOPE_IDENTITY() 'IDENTITY',
               ERROR_NUMBER() 'ERROR_NUMBER',
               ERROR_MESSAGE() 'ERROR_MESSAGE',
               ERROR_PROCEDURE() 'ERROR_PROCEDURE',
               ERROR_LINE() 'ERROR_LINE';
         ROLLBACK TRANSACTION 
   END CATCH

End
go
CREATE Procedure [dbo].[SP_TB_ACTIVIDAD_PROYECTO_ActualizarAvance]
	@idActividad int,
	@avance int,
	@idUsuari int

As
Begin
BEGIN TRY
            BEGIN TRANSACTION 
	Update TB_PROYECTO_ACTIVIDAD
	Set
		[PORCENTAJE_AVANCE] = @avance,
		[USUARIO_ACTUALIZA] = @idUsuari,
		[FECHA_ACTUALIZA] = GETDATE()
		
	Where		
		ID_PROYECTO_ACTIVIDAD = @idActividad
	SELECT
                'IDENTITY' = @idActividad,
                ERROR_NUMBER() 'ERROR_NUMBER',
                ERROR_MESSAGE() 'ERROR_MESSAGE',
                ERROR_PROCEDURE() 'ERROR_PROCEDURE',
                ERROR_LINE() 'ERROR_LINE';
            COMMIT TRANSACTION 
        END TRY
        BEGIN CATCH
            SELECT 
                'IDENTITY' = NULL,
                ERROR_NUMBER() 'ERROR_NUMBER',
                ERROR_MESSAGE() 'ERROR_MESSAGE',
                ERROR_PROCEDURE() 'ERROR_PROCEDURE',
                ERROR_LINE() 'ERROR_LINE';
            ROLLBACK TRANSACTION
        END CATCH

End
GO
CREATE PROCEDURE SP_TB_ASIG_CONSULTOR_VINCULACION_Insert
	@IDMUNICIPIO int,
	@IDSECTOR int,
	@IDPERSONA int
AS
	Begin
BEGIN TRY
         BEGIN TRANSACTION 
	INSERT INTO TB_ASIG_CONSULTOR_VINCULACION(ID_MUNICIPIO,ID_SECTOR_ECONOMICO,ID_PERSONA) VALUES(@IDMUNICIPIO,@IDSECTOR,@IDPERSONA)

	 SELECT 
                     SCOPE_IDENTITY() 'IDENTITY',
                     ERROR_NUMBER() 'ERROR NUMBER',
                     ERROR_MESSAGE() 'ERROR_MESSAGE',
                     ERROR_PROCEDURE() 'ERROR_PROCEDURE',
                     ERROR_LINE() 'ERROR_LINE';
         COMMIT TRANSACTION   
		 END TRY
   BEGIN CATCH
         SELECT 
               SCOPE_IDENTITY() 'IDENTITY',
               ERROR_NUMBER() 'ERROR_NUMBER',
               ERROR_MESSAGE() 'ERROR_MESSAGE',
               ERROR_PROCEDURE() 'ERROR_PROCEDURE',
               ERROR_LINE() 'ERROR_LINE';
         ROLLBACK TRANSACTION 
   END CATCH

End
GO
CREATE PROCEDURE SP_TB_FORMULADOR_ObtenerFormuladores
AS
SELECT F.ID_FORMULADOR,F.ID_PERSONA,F.ACTIVO,P.NOMBRES+' '+P.APELLIDOS AS NOMBRES, P.CORREO_E, P.TEL_CEL, P.TEL_FIJO,F.FECHA_CREA
FROM TB_FORMULADOR AS F INNER JOIN TB_PERSONA AS P ON P.ID_PERSONA = F.ID_PERSONA
go
CREATE Procedure [dbo].[SP_TB_FORMULADOR_VALIDAR]
@id INT
As
Begin
BEGIN TRY
            BEGIN TRANSACTION 
	Update TB_FORMULADOR
	Set
		ACTIVO = 1,
		[FECHA_ACTUALIZA] = GETDATE()
		
	Where		
		ID_FORMULADOR = @id
	SELECT
                'IDENTITY' = @id,
                ERROR_NUMBER() 'ERROR_NUMBER',
                ERROR_MESSAGE() 'ERROR_MESSAGE',
                ERROR_PROCEDURE() 'ERROR_PROCEDURE',
                ERROR_LINE() 'ERROR_LINE';
            COMMIT TRANSACTION 
        END TRY
        BEGIN CATCH
            SELECT 
                'IDENTITY' = NULL,
                ERROR_NUMBER() 'ERROR_NUMBER',
                ERROR_MESSAGE() 'ERROR_MESSAGE',
                ERROR_PROCEDURE() 'ERROR_PROCEDURE',
                ERROR_LINE() 'ERROR_LINE';
            ROLLBACK TRANSACTION
        END CATCH

End

GO
CREATE PROCEDURE SP_TB_USUARIO_ObtenerUsuarioCoordinador
AS
SELECT U.ID_USUARIO
FROM TB_USUARIO AS U WHERE U.ID_ROL=5

GO

CREATE PROCEDURE SP_TB_ASIG_CONSULTOR_VINCULACION_ObtenerConsultor
@idSector int,
@idMunicipio int
AS
SELECT P.*
FROM TB_ASIG_CONSULTOR_VINCULACION AS A
INNER JOIN TB_PERSONA AS P ON A.ID_PERSONA = P.ID_PERSONA
WHERE A.ID_SECTOR_ECONOMICO =@idSector AND A.ID_MUNICIPIO =@idMunicipio

GO

CREATE PROCEDURE SP_TB_ASIGNACION_InsertAsignacion
	@consultor int,
	@beneficiario int
AS
	Begin
BEGIN TRY
         BEGIN TRANSACTION 
	INSERT INTO TB_ASIGNACION(ID_PERSONA_BENEFICIARIO,ID_PERSONA_CONSULTOR,FECHA_ASIGNACION) VALUES(@beneficiario,@consultor,GETDATE());

	 SELECT 
                     SCOPE_IDENTITY() 'IDENTITY',
                     ERROR_NUMBER() 'ERROR NUMBER',
                     ERROR_MESSAGE() 'ERROR_MESSAGE',
                     ERROR_PROCEDURE() 'ERROR_PROCEDURE',
                     ERROR_LINE() 'ERROR_LINE';
         COMMIT TRANSACTION   
		 END TRY
   BEGIN CATCH
         SELECT 
               SCOPE_IDENTITY() 'IDENTITY',
               ERROR_NUMBER() 'ERROR_NUMBER',
               ERROR_MESSAGE() 'ERROR_MESSAGE',
               ERROR_PROCEDURE() 'ERROR_PROCEDURE',
               ERROR_LINE() 'ERROR_LINE';
         ROLLBACK TRANSACTION 
   END CATCH

End
GO
CREATE PROCEDURE SP_TB_SOLICITUD_SEGUIMIENTO_INSERT
	@idProyecto int,
	@usuarioCrea int,
	@descripcion varchar(4096)
AS
	Begin
BEGIN TRY
         BEGIN TRANSACTION 
	INSERT INTO TB_SOLICITUD_SEGUIMIENTO(ID_PROYECTO,USUARIO_CREA,FECHA,DESCRIPCION) VALUES(@idProyecto,@usuarioCrea,GETDATE(),@descripcion);

	 SELECT 
                     SCOPE_IDENTITY() 'IDENTITY',
                     ERROR_NUMBER() 'ERROR NUMBER',
                     ERROR_MESSAGE() 'ERROR_MESSAGE',
                     ERROR_PROCEDURE() 'ERROR_PROCEDURE',
                     ERROR_LINE() 'ERROR_LINE';
         COMMIT TRANSACTION   
		 END TRY
   BEGIN CATCH
         SELECT 
               SCOPE_IDENTITY() 'IDENTITY',
               ERROR_NUMBER() 'ERROR_NUMBER',
               ERROR_MESSAGE() 'ERROR_MESSAGE',
               ERROR_PROCEDURE() 'ERROR_PROCEDURE',
               ERROR_LINE() 'ERROR_LINE';
         ROLLBACK TRANSACTION 
   END CATCH

End
GO
CREATE PROCEDURE SP_TB_SOLICITUD_SEGUIMIENTO_ObtenerPorIdProyecto
@idproyecto int
AS
SELECT * FROM TB_SOLICITUD_SEGUIMIENTO WHERE ID_PROYECTO = @idProyecto

go
CREATE PROCEDURE SP_TB_DOCUMENTO_ObtenerPorIdBeneficiarioYNombre
@idbeneficiario int,
@nombre varchar(100)
AS
SELECT *
FROM TB_DOCUMENTO
WHERE ID_BENEFICIARIO = @idbeneficiario AND NOMBRE_DOCUMENTO = @nombre

GO
CREATE PROCEDURE SP_TB_DOCUMENTO_GuardarDocumento
@idBeneficio int,
@direccion varchar(2048),
@nombre varchar(100)
AS
INSERT INTO TB_DOCUMENTO(ID_BENEFICIARIO,DIRECCION,FECHA_CREA,NOMBRE_DOCUMENTO) VALUES(@idBeneficio,@direccion,GETDATE(),@nombre)
GO
CREATE PROCEDURE SP_TB_BENEFICIARIO_VALIDAR_DUI
@dui char(10)
as
SELECT COUNT(*)
FROM TB_BENEFICIARIO
WHERE DUI=@dui
GO
CREATE PROCEDURE SP_TB_ASIGNACION_CambiarFechaAsignacion
@idPersona int,
@idConsultor int
AS
UPDATE TB_ASIGNACION
SET FECHA_ASIGNACION = GETDATE()
WHERE ID_PERSONA_BENEFICIARIO=@idPersona and ID_PERSONA_CONSULTOR=@idConsultor
GO
CREATE PROCEDURE SP_TBC_SECTOR_ECONOMICO_ObtenerTodos
as
SELECT * FROM TBC_SECTOR_ECONOMICO
GO