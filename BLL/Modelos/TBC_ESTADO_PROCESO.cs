using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL.Modelos
{
    public class TBC_ESTADO_PROCESO
    {
        public int ID_ESTADO_PROCESO { get; set; }
        public string CODIGO_ESTADO_PROCESO { get; set; }
        public string DESCRIPCION_ESTADO_PROCESO{ get; set; }
        public string ICONO_ESTADO_PROCESO{ get; set; }
        public string COLOR_ESTADO_PROCESO{ get; set; }
        public int USUARIO_CREA { get; set; }
        public int USUARIO_ACTUALIZA { get; set; }
        public DateTime FECHA_CREA { get; set; }
        public DateTime FECHA_ACTUALIZA { get; set; }
        public DateTime FECHA_BORRADO { get; set; }
    }
}
