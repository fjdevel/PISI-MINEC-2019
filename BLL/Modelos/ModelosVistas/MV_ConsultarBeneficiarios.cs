using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL.Modelos.ModelosVistas
{
    public class MV_ConsultarBeneficiarios
    {
        public int IdBeneficiario { get; set; }
        public string Nombre { get; set; }
        public string Apellido { get; set; }
        public string Telefono { get; set; }
        public string Departamento { get; set; }
        public DateTime? FechaAsignacion { get; set; }
        public string Estado { get; set; }
        public string Municipio { get; internal set; }
        public string NombreConsultor { get; internal set; }
        public int? IdPersonaConsultor { get; internal set; }
        public string CorreoBeneficiario { get; internal set; }
        public string NumerosContacto { get; internal set; }
        public string NombreBeneficiario { get; internal set; }
        public int IdPersonaBeneficiario { get; internal set; }
        public string CodigoEstado { get; internal set; }
    }
}
