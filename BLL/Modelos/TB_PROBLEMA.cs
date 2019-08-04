using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL.DB;

namespace BLL.Modelos
{
    public class TB_PROBLEMA
    {
        public int ID_PROBLEMA { get; set; }
        public int ID_BENEFICIARIO { get; set; }
        public int? ID_ESTADO_PROCESO { get; set; }
        public string MERCADO { get; set; }
        public int CANT_EMPLEADOS { get; set; }
        public bool REQUIERE_APOYO { get; set; }
        public string DESCRIPCION_NEGOCIO { get; set; } 
        public string NOMBRE_PROBLEMA { get; set; }
        public string VENTA_DIA { get; set; }
        public decimal? VENTA_MES { get; set; }
        public string DESCRIPCION_PROBLEMA { get; set; }
        public string DESCRIPCION_OTRO_PROBLEMA { get; set; }
        public int USUARIO_CREA { get; set; }
        public int USUARIO_ACTUALIZA { get; set; }
        public DateTime FECHA_CREA { get; set; }
        public DateTime FECHA_ACTUALIZA { get; set; }
        public DateTime FECHA_BORRADO { get; set; }
        public string OBSERVACION_DESCRIPCION { get; set; }
        public DateTime? OBSERVACION_FECHA { get; set; }
        public bool OBSERVACION_RESUELTO { get; set; }

        public static explicit operator TB_PROBLEMA(SP_TB_PROBLEMA_ObtenerProblemaPorIdResult v)
        {
            return new TB_PROBLEMA
            {
                ID_PROBLEMA = v.ID_PROBLEMA,
                ID_BENEFICIARIO = v.ID_BENEFICIARIO,
                ID_ESTADO_PROCESO = v.ID_ESTADO_PROCESO,
                MERCADO = v.MERCADO,
                CANT_EMPLEADOS = v.CANT_EMPLEADOS,
                REQUIERE_APOYO = v.REQUIERE_APOYO,
                DESCRIPCION_NEGOCIO = v.DESCRIPCION_NEGOCIO,
                NOMBRE_PROBLEMA = v.NOMBRE_PROBLEMA,
                VENTA_DIA = v.VENTA_DIA,
                VENTA_MES = (int)v.VENTA_MES,
                DESCRIPCION_PROBLEMA = v.DESCRIPCION_PROBLEMA,
                DESCRIPCION_OTRO_PROBLEMA = v.DESCRIPCION_OTRO_PROBLEMA,
                FECHA_CREA = (DateTime)v.FECHA_CREA
            };
        }

    }
}
