using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MinecPISI.ViewModels
{
    public class RegistroBeneficiarioViewModel
    {
        public InformacionPersonalViewModel InfoPersonal { get; set; }
        public InformacionActividadEconomicaViewModel InfoActividadEconomica { get; set; }
        public InformacionDocumentacionViewModel InfoDocumentacion { get; set; }
        public InformacionCredencialesViewModel InfoCredenciales { get; set; }
    }
}