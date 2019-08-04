using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL.Modelos
{
    public class TBC_CAMPO_CRITERIO_EVALUACION
    {
        public int ID_CAMPO_CRITERIO_EVAL { get; set; }
        public int? ID_CRITERIO_EVAL_TECNICO { get; set; }
        public short PUNTAJE_MAX { get; set; }
        public string CAMPO { get; set; }
        public int USUARIO_CREA { get; set; }
        public int USUARIO_ACTUALIZA { get; set; }
        public DateTime FECHA_CREA { get; set; }
        public DateTime FECHA_ACTUALIZA { get; set; }
        public DateTime FECHA_BORRADO { get; set; }
    }
}
