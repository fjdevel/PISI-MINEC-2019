using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;

namespace MinecPISI.ViewModels
{
    public class InformacionDocumentacionPersonaJuridicaViewModel
    {
        //Paso #3
        public FileUpload EscrituraConstitucionFile { get; set; }
        public FileUpload EstadoIngresosEgresosFile { get; set; }
        public FileUpload CredencialCuerpoFile { get; set; }
        public FileUpload ConstanciaAlcaldiaFile { get; set; }
        public FileUpload EstadoResultadosFile { get; set; }
        public string EscrituraConstitucionNombre { get; set; }
        public string EstadoIngresosEgresosNombre { get; set; }
        public string EstadoResultadosNombre { get; set; }
        public string CredencialCuerpoNombre { get; set; }
        public string ConstanciaAlcaldiaNombre { get; set; }
    }
}