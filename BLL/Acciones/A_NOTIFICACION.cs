using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL.DB;
using BLL.Helpers;
using BLL.Modelos.ModelosVistas;

namespace BLL.Acciones
{
    public class A_NOTIFICACION
    {
        private static readonly PISIDataContext _context = new PISIDataContext();
        public static MV_Exception GuardarNotificacion(int usuarioOwner, int usuarioCrea, string _codigo) {
            var res = new MV_Exception();
            try
            {
                var estado = A_ESTADO_PROCESO.ObtenerPorCodigo(_codigo);
                res = H_LogErrorEXC.resultToException(_context.SP_TB_NOTIFICACION_insertNotificacion(usuarioOwner,usuarioCrea,estado.ID_ESTADO_PROCESO));
                if (res.IDENTITY == null)
                    throw new Exception(res.ERROR_MESSAGE);
            }
            catch (Exception e)
            {
                H_LogErrorEXC.GuardarRegistroLogError(e);
            }

            return res;
        }
        public static List<Object> ObtenerNotificacionesNuevas(int _idUsuario) {
            List<Object> notificaciones = new List<Object>();
            var res = _context.SP_TB_NOTIFICACION_ObtenerNuevasNotificacionesPorIdUsuario(_idUsuario);
            foreach(var n in res)
            {
                dynamic notificacion = new System.Dynamic.ExpandoObject();
                notificacion.IdNotificacion = n.ID_NOTIFICACION;
                notificacion.IdEstadoProceso = n.ID_ESTADO_PROCESO;
                notificacion.CodigoEstadoProceso = n.CODIGO_ESTADO_PROCESO;
                notificacion.Descripcion = n.DESCRIPCION_ESTADO_PROCESO;
                notificacion.Icono = n.ICONO_ESTADO_PROCESO;
                notificacion.Color = n.COLOR_ESTADO_PROCESO;
                notificacion.Fecha = n.FECHA_CREA;
                notificaciones.Add(notificacion);
            }
            return notificaciones;
        }
        public static void ActualizarNotificacionesLeido(int _usuario) {
            _context.SP_TB_NOTIFICACION_ActualizarNotificacionesLeidas(_usuario);
        }
    }
}
