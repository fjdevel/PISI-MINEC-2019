using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MinecPISI.ViewModels
{
    public class InformacionCredencialesViewModel
    {
        //Paso #4
        public string Correo { get; set; }
        public string Password { get; set; }
        public int PersonaId { get; set; }

        public InformacionCredencialesViewModel(string correo, string password, int personaId = 0)
        {
            Correo = correo;
            Password = password;
            PersonaId = personaId;
        }

        public InformacionCredencialesViewModel()
        {
        }
    }
}