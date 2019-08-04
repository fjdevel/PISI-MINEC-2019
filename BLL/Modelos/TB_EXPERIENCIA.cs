using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL.Modelos
{
    public class TB_EXPERIENCIA
    {
        public int ID_EXPERIENCIA { get; set; }
        public int? ID_FORMULADOR { get; set; }
        public string INSTITUCION { get; set; }
        public string CARGO { get; set; }
        public string TIEMPO { get; set; }
        public string PROYECTO { get; set; }
        public int? USUARIO_CREA { get; set; }
        public int? USUARIO_ACTUALIZA { get; set; }
        public DateTime FECHA_CREA { get; set; }
        public DateTime? FECHA_ACTUALIZA { get; set; }
        public DateTime? FECHA_BORRADO { get; set; }

    }
}
