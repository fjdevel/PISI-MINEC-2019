using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL.Modelos
{
    public class TB_ACTIVIDAD
    {
        public int ID_ACTIVIDAD { get; set; }
        public int ID_USUARIO_BENEFICIARIO { get; set; }
        public int ID_USUARIO_CONSULTOR { get; set; }
        public DateTime FECHA { get; set; }
        public DateTime HORA { get; set; }
        public string DIRECCION { get; set; }
        public string DESCRIPCION { get; set; }
        public int USUARIO_CREA { get; set; }
        public int USUARIO_ACTUALIZA { get; set; }
        public DateTime FECHA_CREA { get; set; }
        public DateTime FECHA_ACTUALIZA { get; set; }
        public DateTime FECHA_BORRADO { get; set; }
        public string NOMBRE_BENEFICIARIO { get; set; }
    }
}
