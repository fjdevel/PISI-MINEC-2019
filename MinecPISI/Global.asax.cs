using MinecPISI.App_Start;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Routing;
using System.Web.Security;
using System.Web.SessionState;

namespace MinecPISI
{
    public class Global : System.Web.HttpApplication
    {
        protected void Application_Start(object sender, EventArgs e)
        {
            
            RegisterRoutes(RouteTable.Routes);
        }

        private void RegisterRoutes(RouteCollection route)
        {
            //Registro de rutas del modulo de administracion y seguridad
            AdministracionRoutes administracionRoutes = new AdministracionRoutes();
            administracionRoutes.RegistrarRutas(route);
            //Registro de rutas del modulo de beneficiarios
            BeneficiarioRoutes beneficiario = new BeneficiarioRoutes();
            beneficiario.RegistrarRutas(route);
            //Registro de rutas del modulo de casos
            CasosRoute casosRoute = new CasosRoute();
            casosRoute.RegistrarRutas(route);
            //Registro de rutas del modulo de calendario
            CalendarioRoutes calendarioRoute = new CalendarioRoutes();
            calendarioRoute.RegistrarRutas(route);
            //Registro de rutas del modulo de formulacion
            FormulacionRoutes formulacionRoutes = new FormulacionRoutes();
            formulacionRoutes.RegistrarRutas(route);


        }
        
    }
}