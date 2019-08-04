using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Routing;

namespace MinecPISI.App_Start
{
    public class CalendarioRoutes
    {
        public void RegistrarRutas(RouteCollection route)
        {
            //Pagina donde se programaran las citas
            route.MapPageRoute("ProgramarCita", "CalendarioProgramarCita/{id}", "~/Views/Calendario/ProgramarCitasVinculacion.aspx");
            route.MapPageRoute("ConsultarCitas", "Calendario/Consultar", "~/Views/Calendario/ConsultarCalendario.aspx");
             }
    }
}