using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MinecPISI.ViewModels
{
    public class InformacionActividadEconomicaViewModel
    {
        //Paso #2
        public string Direccion { get; set; }
        public int SectorId { get; set; }
        public int DepartamentoId { get; set; }
        public int MunicipioId { get; set; }

        public InformacionActividadEconomicaViewModel(string direccion, int sectorId, int departamentoId, int municipioId)
        {
            Direccion = direccion;
            SectorId = sectorId;
            DepartamentoId = departamentoId;
            MunicipioId = municipioId;
        }

        public InformacionActividadEconomicaViewModel()
        {
        }
    }
}