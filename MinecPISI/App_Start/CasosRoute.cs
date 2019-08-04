using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Routing;

namespace MinecPISI.App_Start
{
    public class CasosRoute
    {
        public void RegistrarRutas(RouteCollection route)
        {
            
            //Pagina donde se muestra el problema del beneficiario al formulador
            route.MapPageRoute("DatosProblemaIngresado", "Casos/ProblemaIngresado/{idProblema}", "~/Views/Casos/DatosProblemaIngresadoFormulador.aspx");
            //Pagina donde el coordinador, consultor de vinculacion y formulador consulta y verifica los casos activos
            route.MapPageRoute("ConsultarCasos", "Casos/Consulta", "~/Views/Casos/ConsultarCasos.aspx");
            //Pagina donde se consultan las propuestas solucion de cada caso
            route.MapPageRoute("ConsultarPropuestas","Casos/Consulta/Propuestas", "~/Views/Casos/ConsultarPropuestasSolucion.aspx");
            //Pagina donde se consultan las propuestas pertenecientes al formulador
            route.MapPageRoute("ConsultarCasosPublicados", "Casos/Consulta/Publicados", "~/Views/Casos/ConsultarCasosPublicados.aspx");
        }
    }
}