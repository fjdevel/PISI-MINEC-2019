using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL.DB;

namespace BLL.Modelos
{
    public class TB_PROYECTO
    {
        public int ID_PROYECTO { get; set; }
        public string COD_PROYECTO { get; set; }
        public int ID_PROBLEMA { get; set; }
        public int ID_TIPO_INICIATIVA { get; set; }
        public int ID_PROPUESTA { get; set; }
        public int ID_ESTADO_PROCESO { get; set; }
        public int USUARIO_CREA { get; set; }
        public int USUARIO_ACTUALIZA { get; set; }
        public DateTime FECHA_CREA { get; set; }
        public DateTime FECHA_ACTUALIZA { get; set; }
        public DateTime FECHA_BORRADO { get; set; }
        public decimal MONTO { get; set; }

        
    }
}
