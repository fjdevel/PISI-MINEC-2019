using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MinecPISI.ViewModels
{
    public class MV_FiltroTecnicoCriterioCampo
    {
        public string Criterio { get; set; }
        public int IdCriterio { get; set; }
        public string Campo { get; set; }
        public short PuntajeMaximo { get; set; }
        public int IdCampo { get; set; }
        public short? Puntaje { get; set; }
    }
}