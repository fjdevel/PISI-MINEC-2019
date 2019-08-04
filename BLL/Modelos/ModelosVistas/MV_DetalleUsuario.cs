using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL.Modelos.ModelosVistas
{
    public class MV_DetalleUsuario
    {
        public int ID_USUARIO { get; set; }
        public int ID_PERSONA { get; set; }
        public int ID_ROL { get; set; }
        public string NOMBRE_ROL { get; set; }
        public string ID_SESION { get; set; }
    }
}
