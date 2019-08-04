using System;
using System.Collections.Generic;
using System.Linq;
using BLL.Helpers;
using BLL.Modelos.ModelosVistas;
using DAL.DB;
using TB_BENEFICIARIO = BLL.Modelos.TB_BENEFICIARIO;

namespace BLL.Acciones
{
    public class A_BENEFICIARIO
    {
        private static readonly PISIDataContext _context = new PISIDataContext();
        public static List<MV_ConsultarBeneficiarios> ObtenerBeneficiariosObtenerTodosMenosNoValidadosONoPrecalificados()
        {
            var res = _context.SP_TB_BENEFICIARIO_ObtenerTodosMenosValidadosONoPrecalificados();

            return res.Select(r => new MV_ConsultarBeneficiarios
            {
                IdBeneficiario = r.ID_BENEFICIARIO,
                Nombre = r.NOMBRES,
                Apellido = r.APELLIDOS,
                Telefono = r.TEL_CEL,
                Departamento = r.NOMBRE_DEPTO,
                Estado = r.DESCRIPCION_ESTADO_PROCESO,
                NombreConsultor = r.NOMBRE_CONSULTOR
            })
                .ToList();
        }

        public static List<MV_ConsultarBeneficiarios> ObtenerBeneficiariosPorConsultor(int _idPersonaConsultor)
        {
            var res = _context.SP_TB_BENEFICIARIO_ObtenerBeneficiariosPorConsultor(_idPersonaConsultor);

            return res.Select(r => new MV_ConsultarBeneficiarios
            {
                IdBeneficiario = r.ID_BENEFICIARIO,
                Nombre = r.NOMBRES,
                Apellido = r.APELLIDOS,
                Telefono = r.TEL_CEL,
                Departamento = r.NOMBRE_DEPTO,
                Estado = r.DESCRIPCION_ESTADO_PROCESO,
                FechaAsignacion = DateTime.Now //no se conoce que campo es al momento
            })
                .ToList();
        }

        /// <summary>
        ///     Método encargado de almacernar un beneficiario
        /// </summary>
        /// <returns>Retorna la PK del beneficiario recién guardado o NULL si no se guardó</returns>
        public MV_Exception GuardarBeneficiario(TB_BENEFICIARIO beneficiario, int id_usuario)
        {
            var res = new MV_Exception();
            try
            {
                res = id_usuario == 0
                    ? H_LogErrorEXC.resultToException(_context.SP_TB_BENEFICIARIO_InsertBeneficiario(
                        beneficiario.ID_SECTOR_ECONOMICO, beneficiario.ID_PERSONA, beneficiario.ID_ESTADO_PROCESO,
                        beneficiario.CODIGO_BENEFICIARIO, beneficiario.TIPO_PERSONA, beneficiario.DUI, beneficiario.NIT,
                        null).SingleOrDefault())
                    : H_LogErrorEXC.resultToException(_context.SP_TB_BENEFICIARIO_InsertBeneficiario(
                        beneficiario.ID_SECTOR_ECONOMICO, beneficiario.ID_PERSONA, beneficiario.ID_ESTADO_PROCESO,
                        beneficiario.CODIGO_BENEFICIARIO, beneficiario.TIPO_PERSONA, beneficiario.DUI, beneficiario.NIT,
                        id_usuario).SingleOrDefault());

                //Notificando la inscripción 
                //var idTipoNotificacion = A_ESTADO_PROCESO.getByCodigoEstadoProceso("01.05").ID_TIPO_NOTIFICACION;

                //if (idTipoNotificacion != null && res.IDENTITY != null)
                //    A_NOTIFICACION.createForRol(
                //        new A_ROL().getRolByNombre("Coordinador").ID_ROL,
                //        "El beneficiario con DUI " + beneficiario.DUI + " se ha registrado",
                //        idTipoNotificacion.Value
                //    );
                //else
                //    throw new Exception(res.ERROR_MESSAGE);
            }
            catch (Exception e)
            {
                H_LogErrorEXC.GuardarRegistroLogError(e);
            }

            return res;
        }

        public TB_BENEFICIARIO BuscarBeneficiarioXIdPersona(int? idPersona)
        {
            var res = _context.SP_TB_BENEFICIARIO_GetByIdPersona(idPersona).FirstOrDefault();
            
            if (res == null) return null;

            var beneficiario = new TB_BENEFICIARIO
            {
                ID_BENEFICIARIO = res.ID_BENEFICIARIO,
                ID_ESTADO_PROCESO = res.ID_ESTADO_PROCESO,
                ID_PERSONA = (int)res.ID_PERSONA,
                ID_SECTOR_ECONOMICO = res.ID_SECTOR_ECONOMICO,
                TIPO_PERSONA = res.TIPO_PERSONA,
                CODIGO_BENEFICIARIO = res.CODIGO_BENEFICIARIO,
                NIT = res.NIT,
                DUI = res.DUI
            };

            return beneficiario;
        }

        public static TB_BENEFICIARIO ObtenerBeneficiario(int id)
        {
            var res = _context.SP_TB_BENEFICIARIO_GetByIdUsuario(id).FirstOrDefault();
            return new TB_BENEFICIARIO {
                ID_BENEFICIARIO = res.ID_BENEFICIARIO,
                ID_ESTADO_PROCESO = res.ID_ESTADO_PROCESO
            };
        }
        /// <summary>
        ///     Método que realiza una búsqueda de un usuario por su el id de la persona
        /// </summary>
        /// <param name="idPersona">id de la persona</param>
        /// <returns>El objeto Beneficiario del ID proporcionado. Null si no es encontrado</returns>
        public TB_BENEFICIARIO BuscarBeneficiarioXIdPersona(int idPersona)
        {
            var res = _context.SP_TB_BENEFICIARIO_GetByIdPersona(idPersona).FirstOrDefault();

            if (res == null) return null;

            var beneficiario = new TB_BENEFICIARIO
            {
                ID_BENEFICIARIO = res.ID_BENEFICIARIO,
                ID_ESTADO_PROCESO = res.ID_ESTADO_PROCESO,
                ID_PERSONA = (int)res.ID_PERSONA,
                ID_SECTOR_ECONOMICO = res.ID_SECTOR_ECONOMICO,
                TIPO_PERSONA = res.TIPO_PERSONA,
                CODIGO_BENEFICIARIO = res.CODIGO_BENEFICIARIO,
                NIT = res.NIT,
                DUI = res.DUI
            };

            return beneficiario;
        }

        /// <summary>
        ///     Método que obtiene una lista con todos los beneficiarios con estado ingresado
        /// </summary>
        /// <returns>Lista con todos los beneficiarios que tienen como estado del proceso Ingresado</returns>
        public static List<MV_ConsultarBeneficiarios> ObtenerBeneficiariosPorEstadoProceso(string codEstado)
        {
            var res = _context.SP_TB_BENEFICIARIO_ObterPorEstadoProceso(codEstado);

            return res.Select(r => new MV_ConsultarBeneficiarios
                {
                    IdBeneficiario = r.ID_BENEFICIARIO,
                    IdPersonaBeneficiario = r.ID_PERSONA_BENEFICIARIO,
                    NombreBeneficiario = r.NOMBRE_BENEFICIARIO,
                    NumerosContacto = r.TELEFONOS_CONTACTO,
                    CorreoBeneficiario = r.CORREO_E,
                    IdPersonaConsultor = r.ID_PERSONA_CONSULTOR,
                    NombreConsultor = r.NOMBRE_CONSULTOR_ASIGNADO,
                    Departamento = r.DEPARTAMENTO,
                    Municipio = r.MUNICIPIO,
                    Estado = r.DESCRIPCION_ESTADO_PROCESO,
                    CodigoEstado = r.CODIGO_ESTADO_PROCESO,
                    FechaAsignacion = r.FECHA_ASIGNACION
                })
                .ToList();
        }

        public MV_DetalleBeneficiario BuscarBeneficiarioXId(int idBeneficiario)
        {
            var res = _context.SP_TB_BENEFICIARIO_GetById(idBeneficiario).FirstOrDefault();

            if (res == null) return null;

            var beneficiario = new MV_DetalleBeneficiario
            {
                NOMBRES = res.NOMBRES,
                APELLIDOS = res.APELLIDOS,
                TEL_FIJO = res.TEL_FIJO,
                TEL_CEL = res.TEL_CEL,
                Correo = res.CORREO_E,
                NIT = res.NIT,
                DUI = res.DUI,
                DIRECCION = res.DIRECCION,
                Departamento = res.NOMBRE_DEPTO,
                IdDepartamento = res.ID_DEPARTAMENTO,
                MUNICIPIO = res.NOMBRE_MUNIC,
                IdMunicipio = res.ID_MUNICIPIO,
                ID_BENEFICIARIO = idBeneficiario,
                NOMBRE_SECTOR = res.NOMBRE_SECTOR,
                IdSector = res.ID_SECTOR_ECONOMICO,
                TipoBeneficiario = res.TIPO_PERSONA,
                ESTADO_PROCESO = res.CODIGO_ESTADO_PROCESO,
                IdPersonaConsultor = res.ID_PERSONA_CONSULTOR,
                ID_PERSONA = res.ID_PERSONA_BENEFICIARIO
            };

            return beneficiario;
        }

        public TB_BENEFICIARIO getBeneficiarioById(int id_beneficiario)
        {
            if (id_beneficiario == 0)
                return null;

            TB_BENEFICIARIO beneficiario;

            var result = _context.SP_TB_BENEFICIARIO_GetByIdBeneficiario(id_beneficiario).FirstOrDefault();

            if (result != null)
            {
                beneficiario = new TB_BENEFICIARIO
                {
                    CODIGO_BENEFICIARIO = result.CODIGO_BENEFICIARIO,
                    DUI = result.DUI,
                    ID_BENEFICIARIO = result.ID_BENEFICIARIO,
                    ID_ESTADO_PROCESO = result.ID_ESTADO_PROCESO,
                    ID_PERSONA = (int)result.ID_PERSONA,
                    ID_SECTOR_ECONOMICO = result.ID_SECTOR_ECONOMICO,
                    LAT = result.LAT.ToString(),
                    LONG = result.LONG.ToString(),
                    NIT = result.NIT,
                    TIPO_PERSONA = result.TIPO_PERSONA
                };

                return beneficiario;
            }

            return null;
        }


        public static MV_Exception CambiarEstadoProceso(string codProceso, int idBeneficiario, int id_usuario)
        {
            var res = new MV_Exception();
            try
            {
                res = H_LogErrorEXC.resultToException(_context
                    .SP_TB_BENEFICIARIO_CambiarEstado(codProceso, idBeneficiario, id_usuario).SingleOrDefault());

                if (res.IDENTITY == null)
                    throw new Exception(res.ERROR_MESSAGE);
            }
            catch (Exception e)
            {
                H_LogErrorEXC.GuardarRegistroLogError(e);
            }

            return res;
        }

        public MV_Exception CambiarCodigo(string codBene, int idBeneficiario, int id_usuario)
        {
            var res = new MV_Exception();
            try
            {
                res = H_LogErrorEXC.resultToException(_context
                    .SP_TB_BENEFICIARIO_CambiarCodigo(codBene, idBeneficiario, id_usuario).SingleOrDefault());

                if (res.IDENTITY == null)
                    throw new Exception(res.ERROR_MESSAGE);
            }
            catch (Exception e)
            {
                H_LogErrorEXC.GuardarRegistroLogError(e);
            }

            return res;
        }

        public static MV_Exception UpdateInfoComplementaria(int? idBeneficiario, string dui, string nit, bool? existenActivos,
            bool? masAnyosLugar, bool? puedeComprobar, int? idMuni, int? idSector, string infoComplementaria,
            string lat, string lon, string medioContacto, int? usuarioActualiza)
        {
            var res = new MV_Exception();
            try
            {
                res = H_LogErrorEXC.resultToException(_context
                    .SP_TB_BENEFICIARIO_UpdateInfoComplementaria(idBeneficiario, dui, nit, existenActivos, masAnyosLugar, puedeComprobar, idMuni, idSector, infoComplementaria, lat, lon, medioContacto, usuarioActualiza).SingleOrDefault());

                if (res.IDENTITY == null)
                    throw new Exception(res.ERROR_MESSAGE);
            }
            catch (Exception e)
            {
                H_LogErrorEXC.GuardarRegistroLogError(e);
            }

            return res;
        }

        public static List<MV_DetalleBeneficiario> getDetalleBeneficiario()
        {
            var result = _context.SP_VIEW_DETALLE_BENEFICIARIO_GetAll();

            if (result != null)
                return result.Select(b => (MV_DetalleBeneficiario)b).ToList();
            else
                return null;
        }

        public static MV_DetalleBeneficiario getDetalleBeneficiarioById(int? id_beneficiario)
        {
            var result = _context.SP_VIEW_DETALLE_BENEFICIARIO_GetByIdBeneficiario(id_beneficiario).FirstOrDefault();

            if (result != null)
                return (MV_DetalleBeneficiario)result;
            else
                return null;
        }

        public static int ValidarDui(string dui)
        {
            return (int)_context.SP_TB_BENEFICIARIO_VALIDAR_DUI(dui).FirstOrDefault().Column1;
        }
    }
}