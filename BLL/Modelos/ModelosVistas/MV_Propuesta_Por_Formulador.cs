using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL.Modelos.ModelosVistas
{
    public class MV_Propuesta_Por_Formulador
    {
        public int IdPropuesta { get; set; }
        public int IdProblema { get; set; }
        public int IdUsuarioFormula { get; set; }
        public int IdEstadoProceso { get; set; }
        public int IdTipoIniciativa { get; set; }
        public string NombreIniciativa { get; set; }
        public int IdUsuarioCrea { get; set; }
        public int IdUsuarioActualiza { get; set; }
        public DateTime? FechaCrea { get; set; }
        public DateTime? FechaActualiza { get; set; }
        public string SolucionAsistencia { get; set; }
        public string SolucionAdopcion { get; set; }
        public string SolucionInnovacion { get; set; }
        public string ComponenentesBasicos { get; set; }
        public string InformacionAdicional { get; set; }
        public string PresupuestoContrapartida { get; set; }

    }
}
