using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL.Modelos
{
    public class REPORTE
    {
        public string CODIGO_BENEFICIARIO { set; get; }
        public int? ID_BENEFICIARIO { set; get; }
        public string NOMBRE_SECTOR { set; get; }
        public int? ID_SECTOR_ECONOMICO { set; get; }
        public string COD_SECTOR_ECONOMICO { set; get; }
        public string NOMBRES { set; get; }
        public string APELLIDOS { set; get; }
        public int? id_formulador { set; get; }
        public string nombre_formulador { set; get; }
        public string apellidos_formulador { set; get; }
        public string NOMBRE_PROBLEMA { set; get; }
        public int? ID_ESTADO { set; get; }
        public string CODIGO_ESTADO { set; get; }
        public string DESCRIPCION_ESTADO_PROCESO { set; get; }
        public string ICONO_ESTADO_PROCESO { set; get; }
        public string COLOR_ESTADO_PROCESO { set; get; }
        public string codigo_estado_proyecto { set; get; }
        public string descripcion_estado_proyecto { set; get; }
        public string icono_estado_proyecto { set; get; }
        public string color_estado_proyecto { set; get; }
        public decimal? MONTO { set; get; }
        public string NOMBRE { set; get; }
        public int? ID_TIPO_INICIATIVA { set; get; }
        public string CODIGO_TIPO_INICIATIVA { set; get; }
        public string nombre_tipo_iniciativa_propuesta { set; get; }
        public string COD_PROYECTO { set; get; }
        public string PRESUPUESTO_CONTRAPARTIDA { set; get; }
        public int? id_consultor_vinculacion { set; get; }
        public string nombres_consultor_vinculacion { set; get; }
        public string apellidos_consultor_vinculacion { set; get; }
        public DateTime? FECHA{ set; get; }
    }
}
