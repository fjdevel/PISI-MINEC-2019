using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL.Modelos
{
    public class TBC_CAMPOS_EVALUACION_TECNICA
    {
        public int ID_CRITERIO_EVAL_TECNICO { get; set; }
        public int? ID_CRITERIO_EVAL_TECNICO_SUP { get; set; }
        public string TIPO_EVAL { get; set; }
        public string CRITERIO { get; set; }
        public int USUARIO_CREA { get; set; }
        public int USUARIO_ACTUALIZA { get; set; }
        public DateTime FECHA_CREA { get; set; }
        public DateTime FECHA_ACTUALIZA { get; set; }
        public DateTime FECHA_BORRADO { get; set; }
    }
}
