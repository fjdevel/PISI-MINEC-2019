using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MinecPISI.ViewModels
{
    public class MV_ComiteEvaluacionCriterioCampo
    {
        public string Criterio { get; set; }
        public int IdCriterio { get; set; }
        public string Campo { get; set; }
        public short PuntajeMaximo { get; set; }
        public int IdCampo { get; set; }
        public double? Puntaje { get; set; }
    }
}