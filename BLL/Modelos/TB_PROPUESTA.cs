using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL.DB;

namespace BLL.Modelos
{
    public class TB_PROPUESTA
    {
        public int ID_PROPUESTA { get; set; }
        public int ID_PROBLEMA { get; set; }
        public int ID_USUARIO_FORMULA { get; set; }
        public int ID_ESTADO_PROCESO { get; set; }
        public int ID_TIPO_INICIATIVA { get; set; }
        public int USUARIO_CREA { get; set; }
        public int USUARIO_ACTUALIZA { get; set; }
        public DateTime? FECHA_CREA { get; set; }
        public DateTime FECHA_ACTUALIZA { get; set; }
        public DateTime FECHA_BORRADO { get; set; }
        public string SOLUCION_ADOPCION { get; set; }
        public string SOLUCION_ASISTENCIA { get; set; }
        public string SOLUCION_INNOVACION { get; set; }
        public string COMPONENTES_BASICOS { get; set; }
        public string INFORMACION_ADICIONAL { get; set; }
        public string PRESUPUESTO_CONTRAPARTIDA { get; set; }
        public string NOMBRE_FORMULADOR { get; set; }
        public string NOMBRE_INICIATIVA { get; set; }

        public static explicit operator TB_PROPUESTA(SP_TB_PROPUESTA_ObtenerPropuestasDeFormuladorPorIdProblemaResult v)
        {
            return new TB_PROPUESTA
            {
                ID_PROBLEMA = v.ID_PROBLEMA,
                ID_USUARIO_FORMULA = v.ID_USUARIO_FORMULA,
                ID_ESTADO_PROCESO = (int)v.ID_ESTADO_PROCESO,
                ID_TIPO_INICIATIVA = (int)v.ID_TIPO_INICIATIVA,
                SOLUCION_ADOPCION = v.SOLUCION_ADOPCION,
                SOLUCION_ASISTENCIA = v.SOLUCION_ASISTENCIA,
                SOLUCION_INNOVACION = v.SOLUCION_INNOVACION,
                COMPONENTES_BASICOS = v.COMPONENTES_BASICOS,
                INFORMACION_ADICIONAL = v.INFORMACION_ADICIONAL,
                PRESUPUESTO_CONTRAPARTIDA = v.PRESUPUESTO_CONTRAPARTIDA,
                USUARIO_CREA = (int)v.ID_USUARIO_CREA,
            };
        }

        public static explicit operator TB_PROPUESTA(SP_TB_PROPUESTA_BuscarPropuestaXIdResult v)
        {
            return new TB_PROPUESTA
            {
                NOMBRE_FORMULADOR = v.NOMBRE_FORMULADOR,
                ID_PROPUESTA = v.ID_PROPUESTA,
                ID_PROBLEMA = v.ID_PROBLEMA,
                ID_USUARIO_FORMULA = v.ID_USUARIO_FORMULA,
                ID_ESTADO_PROCESO = (int)v.ID_ESTADO_PROCESO,
                ID_TIPO_INICIATIVA = (int)v.ID_TIPO_INICIATIVA,
                SOLUCION_ADOPCION = v.SOLUCION_ADOPCION,
                SOLUCION_ASISTENCIA = v.SOLUCION_ASISTENCIA,
                SOLUCION_INNOVACION = v.SOLUCION_INNOVACION,
                COMPONENTES_BASICOS = v.COMPONENTES_BASICOS,
                INFORMACION_ADICIONAL = v.INFORMACION_ADICIONAL,
                PRESUPUESTO_CONTRAPARTIDA = v.PRESUPUESTO_CONTRAPARTIDA,
                NOMBRE_INICIATIVA = v.NOMBRE_INICIATIVA,
                FECHA_CREA = v.FECHA_CREA
            };
        }
    }
}
