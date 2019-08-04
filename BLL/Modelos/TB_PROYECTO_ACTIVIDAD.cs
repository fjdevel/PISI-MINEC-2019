using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL.Modelos
{
    public class TB_PROYECTO_ACTIVIDAD
    {
        public TB_PROYECTO_ACTIVIDAD(int idIniciativa, int iD_PROYECTO, int iD_USUARIO)
        {
            ID_PROYECTO = iD_PROYECTO;
            ID_ACTIVIDAD_INICIATIVA = idIniciativa;
            ID_USUARIO_CREA = ID_USUARIO_CREA;
        }

        public int ID_PROYECTO_ACTIVIDAD { get; set; }
        public int ID_ACTIVIDAD_INICIATIVA { get; set; }
        public int ID_PROYECTO { get; set; }
        public int? ID_USUARIO_CREA { get; set; }
        public int? ID_USUARIO_ACTUALIZA { get; set; }
        public string COD_ACTIVIDAD_PROY { get; set; }
        public string DESCRIPCION { get; set; }
        public DateTime? FECHA_CREA { get; set; }
        public DateTime? FECHA_ACTUALIZA { get; set; }
        public DateTime? FECHA_BORRADO { get; set; }
    }
}
