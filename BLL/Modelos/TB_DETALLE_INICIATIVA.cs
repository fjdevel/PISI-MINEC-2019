using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL.Modelos
{
    public class TB_DETALLE_INICIATIVA
    {
        public int ID_PROYECTO { get; set; }
        public int ID_CAMPO { get; set; }
        public string VALOR { get; set; }
        public int ID_DETALLE_INICIATIVA { get; set; }
        public TB_DETALLE_INICIATIVA(string valor, int campo,int idproyecto)
        {
            this.VALOR = valor;
            this.ID_CAMPO = campo;
            this.ID_PROYECTO = idproyecto;
        }

        public TB_DETALLE_INICIATIVA()
        {
        }
    }
}
