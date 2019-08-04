using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL.DB;

namespace BLL.Modelos
{
    public class TB_OBSERVACION
    {
        public int? ID_OBSERVACION { get; set; }
        public int? ID_ESTADO_PROCESO { get; set; }
        public string DESCRIPCION { get; set; }
        public string ENTIDAD { get; set; }
        public int? ID { get; set; }
        public DateTime? FECHA { get; set; }
        public bool? RESUELTO { get; set; }

        public static explicit operator TB_OBSERVACION(SP_TB_OBSERVACION_GetByIdObservacionResult o)
        {
            if (o != null)
                return new TB_OBSERVACION()
                {
                    DESCRIPCION = o.DESCRIPCION,
                    ENTIDAD = o.ENTIDAD,
                    FECHA = o.FECHA,
                    ID = o.ID,
                    ID_ESTADO_PROCESO = o.ID_ESTADO_PROCESO,
                    ID_OBSERVACION = o.ID_OBSERVACION,
                    RESUELTO = o.RESUELTO == 1 ? true : false
                };
            else
                return null;
        }
    }
}
