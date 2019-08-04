using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MinecPISI.ViewModels
{
    public class InfoComplementariaViewModel
    {
        public string Dui { get; set; }
        public string InfoComplementaria { get; set; }
        public string MedioContacto { get; set; }
        public string Nit { get; set; }
        public int IdMunicipio { get; set; }
        public int IdSector { get; set; }
        public bool MasAnyoEnLugar { get; set; }
        public bool PuedeComprobarVentas { get; set; }
        public bool ExistenActivos { get; set; }
        public string Lat { get; set; }
        public string Lng { get; set; }

        public InfoComplementariaViewModel(string dui, string infoComplementaria, string medioContacto, string nit, int idMunicipio, int idSector, bool masAnyoEnLugar, bool puedeComprobarVentas, bool existenActivos, string lat, string lng)
        {
            Dui = dui;
            InfoComplementaria = infoComplementaria;
            MedioContacto = medioContacto;
            Nit = nit;
            IdMunicipio = idMunicipio;
            IdSector = idSector;
            MasAnyoEnLugar = masAnyoEnLugar;
            PuedeComprobarVentas = puedeComprobarVentas;
            ExistenActivos = existenActivos;
            Lat = lat;
            Lng = lng;
        }
    }
}