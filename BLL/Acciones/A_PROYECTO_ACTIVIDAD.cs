using BLL.Helpers;
using BLL.Modelos;
using BLL.Modelos.ModelosVistas;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL.Acciones
{
    public class A_PROYECTO_ACTIVIDAD
    {
        private static readonly DAL.DB.PISIDataContext _context = new DAL.DB.PISIDataContext();

        public static MV_Exception GuardarSolicitud(int idProyecto,int usuarioBene,string descripcion)
        {
            var result = new MV_Exception();
            try
            {

                result = H_LogErrorEXC.resultToException(_context.SP_TB_SOLICITUD_SEGUIMIENTO_INSERT(idProyecto,usuarioBene,descripcion));
                if (result.IDENTITY == null)
                    throw new Exception(result.ERROR_MESSAGE);
            }
            catch (Exception e)
            {
                H_LogErrorEXC.GuardarRegistroLogError(e);
            }
            return result;
        }

        public static MV_Exception GuardarEjecucion(int actividadId, string descripcion,string monto,DateTime fechaIni,DateTime fechaFin)
        {
            var result = new MV_Exception();
            try
            {
                
                result = H_LogErrorEXC.resultToException(_context.SP_TB_EJECUCION_Insert(actividadId,descripcion,monto,fechaIni, fechaFin));
                if (result.IDENTITY == null)
                    throw new Exception(result.ERROR_MESSAGE);
            }
            catch (Exception e)
            {
                H_LogErrorEXC.GuardarRegistroLogError(e);
            }
            return result;
        }

        public static MV_Exception ActualizarAvance(int actividadId, int avance, int usuario)
        {
            var result = new MV_Exception();
            try
            {
                result = H_LogErrorEXC.resultToException(_context.SP_TB_ACTIVIDAD_PROYECTO_ActualizarAvance(actividadId,avance,usuario));
                if (result.IDENTITY == null)
                    throw new Exception(result.ERROR_MESSAGE);
            }
            catch (Exception e)
            {
                H_LogErrorEXC.GuardarRegistroLogError(e);
            }
            return result;
        }
        public static MV_Exception GuardarActividadProyecto(TB_PROYECTO_ACTIVIDAD actividad,int idUsuarioCrea)
        {
            var result = new MV_Exception();
            try
            {
                result = H_LogErrorEXC.resultToException(_context.SP_TB_PROYECTO_ACTIVIDAD_Insert(actividad.ID_ACTIVIDAD_INICIATIVA,actividad.ID_PROYECTO,idUsuarioCrea));
                if (result.IDENTITY == null)
                    throw new Exception(result.ERROR_MESSAGE);
            }
            catch (Exception e)
            {
                H_LogErrorEXC.GuardarRegistroLogError(e);
            }
            return result;
        }
        public static List<dynamic> ObtenerSolicitudes(int idProyecto)
        {
            List<dynamic> detalle = new List<dynamic>();
            var res = _context.SP_TB_SOLICITUD_SEGUIMIENTO_ObtenerPorIdProyecto(idProyecto);
            foreach (var a in res)
            {
                dynamic act = new System.Dynamic.ExpandoObject();
                act.ID = a.ID_SOLICITUD_SEGUIMIENTO;
                act.ID_PROYETO = a.ID_PROYECTO;
                act.USUARIO_CREA = a.USUARIO_CREA;
                act.FECHA = a.FECHA;
                act.DESCRIPCION = a.DESCRIPCION;
                detalle.Add(act);
            }
            return detalle;
        }
        public static List<dynamic> ObtenerDetalleActividades(int idProyecto)
        {
            List<dynamic> detalleActividades = new List<dynamic>();
            var res = _context.SP_TB_PROYECTO_ACTIVIDAD_ObtenerDetalleActividad(idProyecto);
            foreach (var a in res)
            {
                dynamic act = new System.Dynamic.ExpandoObject();
                act.ID_PROYECTO = a.ID_PROYECTO;
                act.ID_ACTIVIDAD_INICIATIVA = a.ID_ACTIVIDAD_INICIATIVA;
                act.ID_PROYECTO_ACTIVIDAD = a.ID_PROYECTO_ACTIVIDAD;
                act.PORCENTAJE_AVACE = a.PORCENTAJE_AVANCE;
                act.COD_ACTIVIDAD_PROY = a.COD_ACTIVIDAD_PROY;
                act.DESCRIPCION = a.DESCRIPCION;
                detalleActividades.Add(act);
            }
            return detalleActividades;
        }
        public static List<dynamic> ObtenerDetalleEjecucion(int idProyecto)
        {
            List<dynamic> detalleEjecucion = new List<dynamic>();
            var res = _context.SP_TB_PROYECTO_ACTIVIDAD_ObtenerDetalleEjecucion(idProyecto);
            foreach (var a in res)
            {
                dynamic act = new System.Dynamic.ExpandoObject();
                act.ID_EJECUCION = a.ID_EJECUCION;
                act.ID_PROYECTO_ACTIVIDAD = a.ID_PROYECTO_ACTIVIDAD;
                act.DESCRIPCION = a.DESCRIPCION;
                act.FECHA = a.FECHA;
                act.SEMANA_INICIO = a.SEMANA_INICIO.ToShortDateString();
                act.SEMANA_FIN = a.SEMANA_FIN.ToShortDateString();
                act.MONTO = a.MONTO_EJECUTADO;
                detalleEjecucion.Add(act);
            }
            return detalleEjecucion;
        }



    }
}
