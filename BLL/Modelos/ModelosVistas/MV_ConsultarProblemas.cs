using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL.Modelos.ModelosVistas
{
    public class MV_ConsultarProblemas
    {
        public int IdProblema { get; set; }
        public string NombreProyecto { get; set; }
        public string Estado { get; set; }
        public string NombreBeneficiario { get; set; }
        public int? DiasActualiza { get; set; }
        public string Consultor { get; set; }
        public int? DiasIngreso { get; set; }

    }
}
