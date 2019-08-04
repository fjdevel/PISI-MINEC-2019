using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using BLL.Helpers;
using BLL.Modelos.ModelosVistas;
using DAL.DB;
using BLL.Modelos;

namespace BLL.Acciones
{
    public class A_PROPUESTA 
    {
        private static readonly PISIDataContext _context = new PISIDataContext();

        public static TB_BENEFICIARIO ObtenerBeneficiarioPorIdPropuesta(int _id)
        {
            var res = _context.SP_TB_PROPUESTA_ObtenerBeneficiarioPorIdPropuesta(_id).FirstOrDefault();

            if (res == null) return null;

            var beneficiario = new TB_BENEFICIARIO
            {
                ID_BENEFICIARIO = res.ID_BENEFICIARIO,
                ID_ESTADO_PROCESO = res.ID_ESTADO_PROCESO,
                ID_PERSONA =(int) res.ID_PERSONA,
                ID_SECTOR_ECONOMICO = res.ID_SECTOR_ECONOMICO,
                TIPO_PERSONA = res.TIPO_PERSONA,
                CODIGO_BENEFICIARIO = res.CODIGO_BENEFICIARIO,
                NIT = res.NIT,
                DUI = res.DUI
            };

            return beneficiario;
        }
        
        public MV_Exception guardarRegistro(TB_PROPUESTA propuesta)
        {
            MV_Exception exception = new MV_Exception();
            try
            {
                exception = H_LogErrorEXC.resultToException(
                    _context.SP_TB_PROPUESTA_InsertPropuesta(
                        propuesta.ID_PROBLEMA,
                        propuesta.ID_USUARIO_FORMULA,
                        propuesta.ID_ESTADO_PROCESO,
                        propuesta.ID_TIPO_INICIATIVA,
                        propuesta.SOLUCION_ADOPCION,
                        propuesta.SOLUCION_ASISTENCIA,
                        propuesta.SOLUCION_INNOVACION,
                        propuesta.COMPONENTES_BASICOS,
                        propuesta.INFORMACION_ADICIONAL,
                        propuesta.PRESUPUESTO_CONTRAPARTIDA,
                        propuesta.USUARIO_CREA
                        ));
            }
            catch (Exception e)
            {
                H_LogErrorEXC.GuardarRegistroLogError(e);
            }
             return exception;
        }

        public static TB_PROPUESTA BuscarPropuestaXId(int idPropuesta)        
        {
            var resultado = _context.SP_TB_PROPUESTA_BuscarPropuestaXId(idPropuesta).FirstOrDefault();
            TB_PROPUESTA propuesta = null;
            if (resultado != null)
            {
                propuesta = (TB_PROPUESTA)resultado;
            }
            return propuesta;
        }

        public static List<MV_ConsultarPropuesta> ObtenerPropuestasByIdBeneficiario(int idBeneficiario)
        {
            var resultado = _context.SP_TB_PROPUESTA_ObtenerPropuestaIdBeneficiario(idBeneficiario);
            return resultado.Select(p=> new MV_ConsultarPropuesta() {
                 IdPropuesta = p.ID_PROPUESTA,
                 NombreProblema = A_PROBLEMA.getByIdProblema(p.ID_PROBLEMA).NOMBRE_PROBLEMA,
                 NombreFormulador = A_PERSONA.getPersonaByIdFormulador((int)new A_USUARIO().getUsuarioById(p.ID_USUARIO_FORMULA).ID_PERSONA).NOMBRES,
                 FechaPresenta = p.FECHA_CREA,
                 NombreEstadoProceso = A_ESTADO_PROCESO.ObtenerPorId((int)p.ID_ESTADO_PROCESO).DESCRIPCION_ESTADO_PROCESO
            }).ToList() ;
        }

        public TB_PROPUESTA ObtenerPropuestaDeFormuladorPorProblema(int _idFormulador, int _idProblema) {
            var resultado = _context.SP_TB_PROPUESTA_ObtenerPropuestasDeFormuladorPorIdProblema(_idFormulador, _idProblema).FirstOrDefault();
            TB_PROPUESTA propuesta = null;
            if (resultado != null)
            {
                propuesta = (TB_PROPUESTA)resultado;
            }
            return propuesta;
        }

        public static List<MV_ConsultarPropuesta> ObtenerPropuestasRechazadasOPendientesPorIdUsuarioFormulador(int idFormulador)
        {
            var resultado = _context.SP_TB_PROPUESTA_ObtenerPropuestasPorIdFormulador(idFormulador);
            return resultado.Select(p => new MV_ConsultarPropuesta()
            {
                IdPropuesta = p.ID_PROPUESTA,
                NombreProblema = p.NOMBRE_PROBLEMA,
                NombreFormulador = p.NOMBRE_FORMULADOR,
                FechaPresenta = p.FECHA_PRESENTA,
                NombreEstadoProceso =p.ETAPA
            }).ToList();
        }

        public static List<MV_Propuesta_Por_Formulador> ObtenerPropuestasAceptadasPorFormulador(int _idFormulador) {

            var resultado = _context.SP_TB_PROPUESTA_ObtenerPropuestasAceptadasPorIdFormulador(_idFormulador);
            return resultado.Select(r => new MV_Propuesta_Por_Formulador()
            {
                IdPropuesta = r.ID_PROPUESTA,
                IdProblema = r.ID_PROBLEMA,
                IdUsuarioFormula = r.ID_USUARIO_FORMULA,
                IdEstadoProceso = (int) r.ID_ESTADO_PROCESO,
                IdTipoIniciativa = (int)r.ID_TIPO_INICIATIVA,
                NombreIniciativa = r.NOMBRE_INICIATIVA,
                IdUsuarioCrea = (int)r.ID_USUARIO_CREA,
                IdUsuarioActualiza = (int)r.ID_USUARIO_ACTUALIZA,
                FechaCrea = r.FECHA_CREA,
                FechaActualiza = r.FECHA_ACTUALIZA,
                SolucionAsistencia = r.SOLUCION_ASISTENCIA,
                SolucionAdopcion = r.SOLUCION_ADOPCION,
                SolucionInnovacion = r.SOLUCION_INNOVACION,
                ComponenentesBasicos = r.COMPONENTES_BASICOS,
                InformacionAdicional = r.INFORMACION_ADICIONAL,
                PresupuestoContrapartida = r.PRESUPUESTO_CONTRAPARTIDA
            }).ToList();
        }
       
        public static MV_Exception CambiarEstadoProceso(string codProceso, int idPropuesta, int idUsuario)
        {
            var res = new MV_Exception();
            try
            {
                res = H_LogErrorEXC.resultToException(_context.SP_TB_PROPUESTA_CambiarEstado(codProceso, idPropuesta, idUsuario).SingleOrDefault());

                if (res.IDENTITY == null)
                    throw new Exception(res.ERROR_MESSAGE);
            }
            catch (Exception e)
            {
                H_LogErrorEXC.GuardarRegistroLogError(e);
            }

            return res;
        }
    }
}
