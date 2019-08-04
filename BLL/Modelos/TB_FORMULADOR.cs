using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL.Modelos
{
    public class TB_FORMULADOR
    {
        public int ID_FORMULADOR { get; set; }
        public int ID_PERSONA { get; set; }
        public string GRADO_ACADEMICO { get; set; }
        public int ANIOS_EXPERIENCIA { get; set; }
        public bool ACTIVO { get; set; }
        public int? USUARIO_CREA { get; set; }
        public int? USUARIO_ACTUALIZA { get; set; }
        public DateTime FECHA_CREA { get; set; }
        public DateTime? FECHA_ACTUALIZA { get; set; }
        public DateTime? FECHA_BORRADO { get; set; }

    }
}
