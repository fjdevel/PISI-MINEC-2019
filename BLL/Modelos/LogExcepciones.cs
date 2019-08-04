using System;

namespace BLL
{
    class LogExcepciones
    {
        public LogExcepciones()
        {
        }

        public string Causa { get; set; }
        public string TipoExcepcion { get; set; }
        public string Recurso { get; set; }
        public string Excepcion { get; set; }
        public DateTime Fecha { get; set; }
        public int? IdUsuario { get; set; }

    }
}