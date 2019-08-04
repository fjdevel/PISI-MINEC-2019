using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL.Modelos
{
    public class TB_NOTIFICACION
    {
        public int ID_NOTIFICACION { get; set; }
        public int ID_USUARIO { get; set; }
        public int ID_ESTADO_PROCESO { get; set; }
        public bool LEIDO { get; set; }
        public DateTime? FECHA_CREA { get; set; }
        public int ID_USUARIO_CREA { get; set; }
    }
}
