using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MinecPISI.ViewModels
{
    public class InformacionDocumentacionViewModel
    {
        public InformacionDocumentacionPersonaNaturalViewModel InfoDocumentacionPersonaNatural { get; set; }
        public InformacionDocumentacionPersonaJuridicaViewModel InfoDocumentacionPersonaJuridica { get; set; }

        public InformacionDocumentacionViewModel()
        {
            InfoDocumentacionPersonaNatural = new InformacionDocumentacionPersonaNaturalViewModel();
            InfoDocumentacionPersonaJuridica = new InformacionDocumentacionPersonaJuridicaViewModel();
        }
    }
}