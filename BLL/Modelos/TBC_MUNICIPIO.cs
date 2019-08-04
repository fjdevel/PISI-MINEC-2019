using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL.Modelos
{
    public class TBC_MUNICIPIO
    {
        public int ID_MUNICIPIO { get; set; }
        public int? ID_DEPARTAMENTO { get; set; }
        public string COD_MUNICIPIO { get; set; }
        public string NOMBRE { get; set; }
        public int USUARIO_CREA { get; set; }
        public int USUARIO_ACTUALIZA { get; set; }
        public DateTime FECHA_CREA { get; set; }
        public DateTime FECHA_ACTUALIZA { get; set; }
        public DateTime FECHA_BORRADO { get; set; }
    }
}
