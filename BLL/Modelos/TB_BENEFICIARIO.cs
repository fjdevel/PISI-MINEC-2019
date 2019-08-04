using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL.Modelos
{
    public class TB_BENEFICIARIO
    {
        public int ID_BENEFICIARIO { get; set; }
        public int? ID_SECTOR_ECONOMICO { get; set; }
        public int ID_PERSONA { get; set; }
        public int? ID_ESTADO_PROCESO { get; set; }
        public string CODIGO_BENEFICIARIO { get; set; }
        public short? TIPO_PERSONA { get; set; }
        public string DUI { get; set; }
        public string NIT { get; set; }
        public string LAT { get; set; }
        public string LONG { get; set; }
        public int USUARIO_CREA { get; set; }
        public int USUARIO_ACTUALIZA { get; set; }
        public DateTime FECHA_CREA { get; set; }
        public DateTime FECHA_ACTUALIZA { get; set; }
        public DateTime FECHA_BORRADO { get; set; }
    }
}
