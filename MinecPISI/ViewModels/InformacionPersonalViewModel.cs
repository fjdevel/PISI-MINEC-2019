using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MinecPISI.ViewModels
{
    public class InformacionPersonalViewModel
    {
        ///Paso #1
        public bool EsBeneficiario { get; set; }
        public string Nombres { get; set; }
        public string Apellidos { get; set; }
        public string Telefono { get; set; }
        public string Celular { get; set; }
        public string Dui { get; set; }
        public string Nit { get; set; }

        public InformacionPersonalViewModel(bool esBeneficiario, string nombres, string apellidos, string telefono, string celular, string dui, string nit)
        {
            EsBeneficiario = esBeneficiario;
            Nombres = nombres;
            Apellidos = apellidos;
            Telefono = telefono;
            Celular = celular;
            Dui = dui;
            Nit = nit;
        }

        public InformacionPersonalViewModel()
        {
        }
    }
}