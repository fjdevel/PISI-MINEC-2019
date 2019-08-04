using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MinecPISI.ViewModels
{
    public class MensajeTypeViewModel
    {
        public const string SUCCESS = "success";
        public const string WARNING = "warning";
        public const string ERROR = "error";
        public const string INFO = "info";

        public string Mensaje { get; set; }
        public string TipoMensaje { get; set; }

        public MensajeTypeViewModel(string mensaje, string tipoMensaje)
        {
            Mensaje = mensaje;
            TipoMensaje = tipoMensaje;
        }
    }
}