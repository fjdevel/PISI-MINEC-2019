using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Routing;

namespace MinecPISI.App_Start
{
    public class FormulacionRoutes
    {
        public void RegistrarRutas(RouteCollection route)
        {
            //Pagina donde el formulador, formulara la propuesta de solucion
            route.MapPageRoute("FormularSolucion", "Formulacion/Solucion/{tipoSolucion}/{idProblema}", "~/Views/Formulacion/FormularSolucionFormulador.aspx");
            //Pagina donde se ve el detalle de una Propuesta Solucion
            route.MapPageRoute("PropuestaSolucion","Formulacion/Propuesta/Solucion/{idProblema}", "~/Views/Formulacion/PropuestaSolucion.aspx");
            //Pagina para la consulta del estado de iniciativas
            route.MapPageRoute("ConsultarIniciativa", "Formulacion/Consultar/Iniciativa", "~/Views/Formulacion/ConsultarEstadoIniciativa.aspx");
            route.MapPageRoute("ConsultarIniciativasBeneficiario", "Formulacion/Consultar/MisIniciativas", "~/Views/Formulacion/ConsultarIniciativasBeneficiario.aspx");
            //Pagina para revisar el detalle de la iniciativa
            route.MapPageRoute("DetalleIniciativaAdopcion", "Formulacion/Detalle/Iniciativa/Adopcion/{idIniciativa}", "~/Views/Formulacion/DetalleIniciativa.aspx");
            route.MapPageRoute("DetalleIniciativaInnovacion", "Formulacion/Detalle/Iniciativa/Innovacion/{idIniciativa}", "~/Views/Formulacion/DetalleIniciativaInnovacion.aspx");
            route.MapPageRoute("DetalleIniciativaAsistencia", "Formulacion/Detalle/Iniciativa/Asistencia/{idIniciativa}", "~/Views/Formulacion/DetalleIniciativaAsistencia.aspx");
            route.MapPageRoute("DetalleIniciativaIntegral", "Formulacion/Detalle/Iniciativa/Integral/{idIniciativa}", "~/Views/Formulacion/DetalleIniciativaIntegral.aspx");
            //Pagina para realizar el Filtro Técnico
            route.MapPageRoute("FiltroTecnico","Formulacion/FiltroTecnico/{idProyecto}", "~/Views/Formulacion/FiltroTecnico.aspx");
            //Pagina para Evaluar la Iniciativa
            route.MapPageRoute("EvaluarIniciativa", "Formulacion/Evaluar/Iniciativa/{idIniciativa}", "~/Views/Formulacion/EvaluarIniciativa.aspx");
            //Pagina para revisar la Iniciativa
            route.MapPageRoute("RevisarEvaluacion", "Formulacion/Evaluar/Iniciativa/{idIniciativa}/Persona/{idPersona}", "~/Views/Formulacion/EvaluarIniciativa.aspx");
            //Pagina para aprobar proyectos. Usada por el rol de presidente del comite evaluador
            route.MapPageRoute("MonitorearIniciativa", "Formulacion/Monitorear/Iniciativa/{idIniciativa}", "~/Views/Formulacion/MonitorearIniciativa.aspx");
            //Pagina donde el formulador, formulara la propuesta de solucion de adopcion
            route.MapPageRoute("FormularIniciativaAdopcion", "Formulacion/Iniciativa/Adopcion/{idProblema}", "~/Views/Formulacion/FormularIniciativaAdopcionFormulador.aspx");
            route.MapPageRoute("EditarIniciativaAdopcion", "Editar/Iniciativa/Adopcion/{idIniciativa}", "~/Views/Formulacion/FormularIniciativaAdopcionFormulador.aspx");
            //Pagina donde el formulador, formulara la propuesta de solucion de innovacion
            route.MapPageRoute("FormularIniciativaInnovacion", "Formulacion/Iniciativa/Innovacion/{idProblema}", "~/Views/Formulacion/FormularIniciativaProyectoInnovacionFormulador.aspx");
            route.MapPageRoute("EditareIniciativaInnovacion", "Editar/Iniciativa/Innovacion/{idIniciativa}", "~/Views/Formulacion/FormularIniciativaProyectoInnovacionFormulador.aspx");
            //Pagina donde el formulador, formulara la propuesta de solucion de asistencia
            route.MapPageRoute("FormularIniciativaAsistencia", "Formulacion/Iniciativa/Asistencia/{idProblema}", "~/Views/Formulacion/FormularIniciativaAsistenciaTecnicaFormulador.aspx");
            route.MapPageRoute("EditarIniciativaAsistencia", "Editar/Iniciativa/Asistencia/{idIniciativa}", "~/Views/Formulacion/FormularIniciativaAsistenciaTecnicaFormulador.aspx");
            //Pagina donde el formulador, formulara la propuesta de solucion integral
            route.MapPageRoute("FormularIniciativaIntegral", "Formulacion/Iniciativa/Integral/{idProblema}", "~/Views/Formulacion/FormularIniciativaIntegralFormulador.aspx");
            route.MapPageRoute("EditarIniciativaIntegral", "Editar/Iniciativa/Integral/{idIniciativa}", "~/Views/Formulacion/FormularIniciativaIntegralFormulador.aspx");

            //Pagina donde se ve el detalle de una propuesta Ratificada
            route.MapPageRoute("VerPropuestaRatificada","Formulacion/Propuesta/Ratificada/{idProblema}", "~/Views/Formulacion/DetalleCasoRatificado.aspx");
            //Pagina donde se Registra un Formulador
            route.MapPageRoute("RegistroFormulador","Formulacion/Registro", "~/Views/Formulacion/RegistroFormulador.aspx");
            route.MapPageRoute("VerExperienciaFormulador","Formulacion/Experiencia/{idPersona}", "~/Views/Formulacion/DetalleFormulador.aspx");
            //Pagina donde se Registra un Formulador
            route.MapPageRoute("DocumentarAvance", "Formulacion/Documentar/Avances/{idIniciativa}", "~/Views/Formulacion/DocumentarAvancesDeEjecucion.aspx");
            route.MapPageRoute("FacturarIniciativa", "Formulacion/Facturar/Iniciativa/{idIniciativa}", "~/Views/Formulacion/DetalleCasoRatificado.aspx");

        }
    }
}