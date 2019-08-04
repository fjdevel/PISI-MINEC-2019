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
    public class A_PROYECTO
    {
        private static readonly DAL.DB.PISIDataContext _context = new DAL.DB.PISIDataContext();

        public static MV_Exception CambiarEstadoProceso(int idProceso, int idProyecto, int idUsuario)
        {
            var res = new MV_Exception();
            try
            {
                res = H_LogErrorEXC.resultToException(_context.SP_TB_PROYECTO_CambiarEstadoProyecto(idProyecto, idProceso, idUsuario).SingleOrDefault());

                if (res.IDENTITY == null)
                    throw new Exception(res.ERROR_MESSAGE);
            }
            catch (Exception e)
            {
                H_LogErrorEXC.GuardarRegistroLogError(e);
            }

            return res;
        }

        public MV_Exception guardarRegistro(Modelos.TB_PROYECTO proyecto)
        {
            MV_Exception exception = new MV_Exception();
            try
            {
                exception = H_LogErrorEXC.resultToException(_context.SP_TB_PROYECTO_InsertProyecto(proyecto.COD_PROYECTO,proyecto.ID_PROBLEMA,proyecto.ID_TIPO_INICIATIVA,proyecto.USUARIO_CREA,proyecto.ID_PROPUESTA));
            }
            catch (Exception e)
            {
                H_LogErrorEXC.GuardarRegistroLogError(e);
            }
            return exception;
        }

        public static List<Object> ObtenerProyectosPorIdBeneficiario(int _id) {
            List<Object> proyectos = new List<object>();
            var res = _context.SP_TB_PROYECTO_ObtenerProyectoPorIdBeneficiario(_id);
            foreach(var p in res){
                dynamic pr = new System.Dynamic.ExpandoObject();
                pr.COD_PROYECTO = p.COD_PROYECTO;
                pr.FECHA_ACTUALIZACION = p.FECHA_ACTUALIZA ==null?p.FECHA_CREA:p.FECHA_ACTUALIZA;
                pr.ESTADO_PROCESO = A_ESTADO_PROCESO.ObtenerPorId((int)p.ESTADOPROCESO).DESCRIPCION_ESTADO_PROCESO;
                pr.ID_PROPUESTA = p.ID_PROPUESTA;
                pr.ID_PROYECTO = p.ID_PROYECTO;
                pr.ID_TIPO_INICIATIVA = p.ID_TIPO_INICIATIVA;
                pr.ID_PROBLEMA = p.ID_PROBLEMA;
                pr.NOMBRE_INICIATIVA = p.NOMBRE_INICIATIVA;
                pr.NOMBRE_PROBLEMA = p.NOMBRE_PROBLEMA;
                pr.ID_ESTADO = p.ESTADOPROCESO;
                pr.AYUDA = p.REQUIERE_APOYO;
                proyectos.Add(pr);
            }
            return proyectos;
        }
        public static List<Object> ObtenerProyectosPorIdFormulador(int _id)
        {
            List<Object> proyectos = new List<object>();
            var res = _context.SP_TB_PROYECTO_ObtenerProyectosPorIdFormulador(_id);
            foreach (var p in res)
            {
                dynamic pr = new System.Dynamic.ExpandoObject();
                pr.COD_PROYECTO = p.COD_PROYECTO;
                pr.FECHA_ACTUALIZACION = p.FECHA_ACTUALIZA == null ? p.FECHA_CREA : p.FECHA_ACTUALIZA;
                pr.ESTADO_PROCESO = A_ESTADO_PROCESO.ObtenerPorId((int)p.ESTADOPROCESO).DESCRIPCION_ESTADO_PROCESO;
                pr.ID_PROPUESTA = p.ID_PROPUESTA;
                pr.ID_PROYECTO = p.ID_PROYECTO;
                pr.ID_TIPO_INICIATIVA = p.ID_TIPO_INICIATIVA;
                pr.ID_PROBLEMA = p.ID_PROBLEMA;
                pr.NOMBRE_INICIATIVA = p.NOMBRE_INICIATIVA;
                pr.NOMBRE_PROBLEMA = p.NOMBRE_PROBLEMA;
                pr.ID_ESTADO = p.ESTADOPROCESO;
                pr.NOMBRE_BENEFICIARIO = p.NOMBRE_BENEFICIARIO + " " + p.APELLIDO_BENEFICIARIO;
                proyectos.Add(pr);
            }
            return proyectos;
        }
        public static List<Object> ObtenerProyectosPorIdConsultorUsuario(int _id)
        {
            List<Object> proyectos = new List<object>();
            var res = _context.SP_TB_PROYECTO_ObtenerProyectosPorIdConsultorUsuario(_id);
            foreach (var p in res)
            {
                dynamic pr = new System.Dynamic.ExpandoObject();
                pr.COD_PROYECTO = p.COD_PROYECTO;
                pr.FECHA_ACTUALIZACION = p.FECHA_ACTUALIZA == null ? p.FECHA_CREA : p.FECHA_ACTUALIZA;
                pr.ESTADO_PROCESO = A_ESTADO_PROCESO.ObtenerPorId((int)p.ESTADOPROCESO).DESCRIPCION_ESTADO_PROCESO;
                pr.ID_PROPUESTA = p.ID_PROPUESTA;
                pr.ID_PROYECTO = p.ID_PROYECTO;
                pr.ID_TIPO_INICIATIVA = p.ID_TIPO_INICIATIVA;
                pr.ID_PROBLEMA = p.ID_PROBLEMA;
                pr.NOMBRE_INICIATIVA = p.NOMBRE_INICIATIVA;
                pr.NOMBRE_PROBLEMA = p.NOMBRE_PROBLEMA;
                pr.ID_ESTADO = p.ESTADOPROCESO;
                pr.NOMBRE_BENEFICIARIO = p.NOMBRE_BENEFICIARIO + " " + p.APELLIDO_BENEFICIARIO;
                proyectos.Add(pr);
            }
            return proyectos;
        }
        public static List<Object> ObtenerProyectos()
        {
            List<Object> proyectos = new List<object>();
            var res = _context.SP_TB_PROYECTO_ObtenerProyectos();
            foreach (var p in res)
            {
                dynamic pr = new System.Dynamic.ExpandoObject();
                pr.COD_PROYECTO = p.COD_PROYECTO;
                pr.FECHA_ACTUALIZACION = p.FECHA_ACTUALIZA == null ? p.FECHA_CREA : p.FECHA_ACTUALIZA;
                pr.ESTADO_PROCESO = A_ESTADO_PROCESO.ObtenerPorId((int)p.ESTADOPROCESO).DESCRIPCION_ESTADO_PROCESO;
                pr.ID_PROYECTO = p.ID_PROYECTO;
                pr.ID_TIPO_INICIATIVA = p.ID_TIPO_INICIATIVA;
                pr.ID_PROBLEMA = p.ID_PROBLEMA;
                pr.NOMBRE_INICIATIVA = p.NOMBRE_INICIATIVA;
                pr.NOMBRE_PROBLEMA = p.NOMBRE_PROBLEMA;
                pr.ID_ESTADO = p.ESTADOPROCESO;
                pr.NOMBRE_BENEFICIARIO = p.NOMBRE_BENEFICIARIO + " " + p.APELLIDO_BENEFICIARIO;
                proyectos.Add(pr);
            }
            return proyectos;
        }
        public static TB_PROYECTO ObtenerProyectoPorId(int idproyecto)
        {
            
            var resultado = _context.SP_TB_PROYECTO_ObtenerProyectoPorId(idproyecto).FirstOrDefault();
            TB_PROYECTO proyecto = new TB_PROYECTO
            {
                ID_PROYECTO = resultado.ID_PROYECTO,
                ID_ESTADO_PROCESO = (int)resultado.ID_ESTADO_PROCESO,
                ID_PROPUESTA = resultado.ID_PROPUESTA==null?0: (int)resultado.ID_PROPUESTA,
                ID_PROBLEMA = resultado.ID_PROBLEMA,
                ID_TIPO_INICIATIVA = resultado.ID_TIPO_INICIATIVA,
                USUARIO_CREA =(int) resultado.USUARIO_CREA,
                COD_PROYECTO = resultado.COD_PROYECTO,
                FECHA_ACTUALIZA = resultado.FECHA_ACTUALIZA==null?new DateTime(): (DateTime)resultado.FECHA_ACTUALIZA,
                FECHA_CREA =(DateTime) resultado.FECHA_CREA
            };
            
            return proyecto;
        }
    }
}
