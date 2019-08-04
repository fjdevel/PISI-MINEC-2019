using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL.Modelos.ModelosVistas
{
    public class MV_DetallePersonasConsultor
    {
        public string NombrePersona { get; set; }
        public int IdPersona { get; set; }
        public string NombreConsultor { get; set; }
        public int? IdConsultor { get; set; }
        public string Municipio { get; set; }
        public string Departamento { get; set; }
        public DateTime? FechaAsignacion { get; internal set; }
        public string Correo { get; set; }
        public string NumerosContacto { get; internal set; }
    }
}
