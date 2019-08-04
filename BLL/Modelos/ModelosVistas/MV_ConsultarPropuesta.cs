using System;
using System.Data.Linq;
using DAL.DB;

namespace BLL.Modelos.ModelosVistas
{
    public class MV_ConsultarPropuesta
    {
        public int IdPropuesta { get; set; }
        public string NombreProblema { get; set; }
        public string NombreBeneficiario { get; set; }
        public string NombreFormulador { get; set; }
        public DateTime? FechaPresenta { get; set; }
        public DateTime? FechaActualiza { get; set; }
        public string NombreProceso { get; set; }
        public string NombreEstadoProceso { get; set; }

        
    }
}
    