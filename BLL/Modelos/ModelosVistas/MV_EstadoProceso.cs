using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL.DB;

namespace BLL.Modelos.ModelosVistas
{
    public class MV_EstadoProceso
    {
        public int ID_ESTADO_PROCESO { get; set; }
        public string CODIGO_ESTADO_PROCESO { get; set; }
        public string DESCRIPCION_ESTADO_PROCESO { get; set; }

        public static explicit operator MV_EstadoProceso(SP_TBC_ESTADO_PROCESO_GetAllByIniciativasResult d)
        {
            return new MV_EstadoProceso {

                ID_ESTADO_PROCESO = d.ID_ESTADO_PROCESO,
                CODIGO_ESTADO_PROCESO=d.CODIGO_ESTADO_PROCESO,
                DESCRIPCION_ESTADO_PROCESO=d.DESCRIPCION_ESTADO_PROCESO


            };


        }



    }
}
