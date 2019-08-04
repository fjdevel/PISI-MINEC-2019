using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL.Modelos
{
    public class TB_DOCUMENTO
    {
        public int ID_DOCUMENTO { get; set; }
        public int ID_TIPO_DOCUMENTO { get; set; }
        public int ID_BENEFICIARIO { get; set; }
        public string DIRECCION { get; set; }
        public string NOMBRE_ARCHIVO { get; set; }
        public int USUARIO_CREA { get; set; }
        public int USUARIO_ACTUALIZA { get; set; }
        public DateTime? FECHA_CREA { get; set; }
        public DateTime? FECHA_ACTUALIZA { get; set; }
        public DateTime? FECHA_BORRADO { get; set; }
        public string NOMBRE_DOCUMENTO { get; internal set; }
    }
}
