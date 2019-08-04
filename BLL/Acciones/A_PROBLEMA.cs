using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL.DB;
using TB_PROBLEMA = BLL.Modelos.TB_PROBLEMA;
using BLL.Helpers;
using BLL.Modelos.ModelosVistas;
using BLL.Modelos;

namespace BLL.Acciones
{
    public class A_PROBLEMA
    {
        private readonly PISIDataContext _context = new PISIDataContext();

        /// <summary>
        /// Método encargado de almacernar un problema
        /// </summary>
        /// <param name="problema">objeto de tipo problema</param>
        /// <returns>Retorna el Id del problema que se acaba de ingresar</returns>
        public MV_Exception AlmacenarProblema(TB_PROBLEMA problema)
        {
            MV_Exception result = H_LogErrorEXC.resultToException(_context.SP_TB_PROBLEMA_InsertProblema(problema.ID_BENEFICIARIO, problema.ID_ESTADO_PROCESO, problema.MERCADO, problema.CANT_EMPLEADOS, problema.REQUIERE_APOYO, problema.NOMBRE_PROBLEMA, problema.DESCRIPCION_NEGOCIO, problema.VENTA_DIA, problema.VENTA_MES, problema.DESCRIPCION_PROBLEMA, problema.DESCRIPCION_OTRO_PROBLEMA).FirstOrDefault());

            if (result.IDENTITY == null)
                return result;

            //Notificando la creación del problema al consultor
            //result = A_NOTIFICACION.createForRol(
            //    new A_ROL().getRolByNombre("Consultor").ID_ROL,
            //    "El beneficiario con DUI " + new A_BENEFICIARIO().BuscarBeneficiarioXId(problema.ID_BENEFICIARIO).DUI + " ha ingresado un nuevo Problema/Oportunidad",
            //    A_ESTADO_PROCESO.getByIdEstadoProceso(problema.ID_ESTADO_PROCESO.Value).ID_TIPO_NOTIFICACION.Value
            //    );

            return result;
        }

        /// <summary>
        /// Método que verifica si el beneficiario ya posee un probelma asociado
        /// </summary>
        /// <param name="idBeneficiario"></param>
        /// <returns name="valor">entero que define si hay registros o no con ese valor</returns>
        public int TieneBeneficiarioAsociado(int idBeneficiario)
        {
            var res = _context.SP_TB_PROBLEMA_TieneBeneficiarioAsociado(idBeneficiario).FirstOrDefault();
            return Convert.ToInt32(res.Column1);
        }

        /// <summary>
        /// Lista de problemas para el Formulador
        /// </summary>
        /// <returns></returns>
        public static List<MV_DetalleProblema> getAllNotResolved()
        {
            PISIDataContext _context = new PISIDataContext();
            List<MV_DetalleProblema> problemas = _context.SP_VIEW_DETALLE_PROBLEMA_GetNotResolved().Select(p => (MV_DetalleProblema)p).ToList();
            return problemas;
        }

        /// <summary>
        /// Lista de todos los problemas
        /// </summary>
        /// <returns></returns>
        public static List<MV_DetalleProblema> getAll()
        {
            PISIDataContext _context = new PISIDataContext();

            return _context.SP_VIEW_DETALLE_PROBLEMA_GetAll().Select(p => (MV_DetalleProblema)p).ToList();
        }

        public void ActualizarProblema(TB_PROBLEMA problema)
        {
            var res = new MV_Exception();
            try
            {
                H_LogErrorEXC.resultToException(_context.SP_TB_PROBLEMA_UPDATE(problema.ID_PROBLEMA, problema.USUARIO_ACTUALIZA
                    , problema.MERCADO, problema.CANT_EMPLEADOS, problema.NOMBRE_PROBLEMA, problema.DESCRIPCION_NEGOCIO,
                    problema.VENTA_DIA, problema.VENTA_MES, problema.DESCRIPCION_PROBLEMA, problema.DESCRIPCION_OTRO_PROBLEMA,problema.ID_ESTADO_PROCESO
                    ));
                if (res.IDENTITY == null)
                    throw new Exception(res.ERROR_MESSAGE);
            }
            catch(Exception e)
            {
                H_LogErrorEXC.GuardarRegistroLogError(e);
            }
        }

        /// <summary>
        /// Obtiene los detalles de un problema especifico
        /// </summary>
        /// <param name="id_problema"></param>
        /// <returns></returns>
        public static MV_DetalleProblema getByIdProblema(int id_problema)
        {
            PISIDataContext _context = new PISIDataContext();

            var result = _context.SP_VIEW_DETALLE_PROBLEMA_GetByIdProblema(id_problema).FirstOrDefault();

            if (result != null)
                return (MV_DetalleProblema)result;
            else
                return null;
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="id_persona_consultor"></param>
        /// <returns></returns>
        public static List<MV_DetalleProblema> getByIdPersonaConsultor(int id_persona_consultor)
        {
            PISIDataContext _context = new PISIDataContext();

            return _context.SP_VIEW_DETALLE_PROBLEMA_GetByIdPersonaConsultor(id_persona_consultor).Select(p => (MV_DetalleProblema)p).ToList();
        }


        /// <summary>
        /// OBTIENE LA LISTA DE PROBLEMAS PARA UN BENEFICIARIO
        /// </summary>
        /// <param name="id_beneficiario"></param>
        /// <returns></returns>
        public static List<MV_DetalleProblema> getByIdBeneficiario(int id_beneficiario)
        {
            PISIDataContext _context = new PISIDataContext();

            return _context.SP_VIEW_DETALLE_PROBLEMA_GetByIdBeneficiario(id_beneficiario).Select(p => (MV_DetalleProblema)p).ToList();
        }


        public TB_PROBLEMA ObtenerProblemaPorId(int _idProblema)
        {
            var resultado = _context.SP_TB_PROBLEMA_ObtenerProblemaPorId(_idProblema).FirstOrDefault();
            TB_PROBLEMA problema =  null;
            if (resultado != null)
            {
                problema = (TB_PROBLEMA)resultado;
            }
            return problema;

        }

        /// <summary>
        /// ACTUALIZA EL PROBLEMA A UN ESTADO ESPECIFICO
        /// </summary>
        /// <param name="id_problema"></param>
        /// <param name="codigo_estado_proceso"></param>
        /// <param name="id_usuario_actualiza"></param>
        /// <returns></returns>
        public static MV_Exception cambiarEstadoProblema(int id_problema, string codigo_estado_proceso, int id_usuario_actualiza)
        {
            PISIDataContext _context = new PISIDataContext();

            return (MV_Exception)_context.SP_TB_PROBLEMA_UPDATE_ID_ESTADO_PROCESO(id_problema, codigo_estado_proceso, id_usuario_actualiza).FirstOrDefault();
        }
    }
}
