using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL.DB;

namespace BLL.Modelos.ModelosVistas
{
    public class MV_ConsultaReporteInciativa
    {
        public int id_beneficiario { get; set; }
        public string beneficiario { get; set; }
        public int id_consultor { get; set; }
        public string consultor { get; set; }
        public int? id_formulador { get; set;}
        public string formulador { get; set; }
        public int id_sector { get; set; }
        public string sector { get; set; }
        public int id_iniciativa { get; set; }
        public string iniciativa { get; set; }
        public int id_estado { get; set; }
        public string estado { get; set; }
        public decimal? monto { get; set; }
        public DateTime? fechaCreacion { get; set; }

        public static explicit operator MV_ConsultaReporteInciativa(SP_VIEW_TB_USUARIO_GetByIniciativasResult d) {

            return new MV_ConsultaReporteInciativa
            {
                beneficiario = d.beneficiario,
                consultor = d.consultor,
                formulador = d.formulador,
                sector = d.sector,
                iniciativa = d.iniciativa,
                estado = d.estado_proceso,
                id_beneficiario = d.id_personab,
                id_consultor = d.id_personac,
                id_formulador = d.id_formulador,
                id_iniciativa = d.id_iniciativa,
                id_sector = d.id_sector,
                id_estado = d.id_estado,
                monto = d.monto,
                fechaCreacion=d.fecha_aprobacion
            
            };

        }

    }

}
