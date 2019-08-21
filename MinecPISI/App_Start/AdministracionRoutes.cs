using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Routing;

namespace MinecPISI.App_Start
{
    public class AdministracionRoutes
    {
        public void RegistrarRutas(RouteCollection route)
        {
            // Pagina de inicio
            route.MapPageRoute("Index", "index", "~/Views/index.aspx");
            route.MapPageRoute("Manual", "ManualDeUsuario", "~/Views/Administracion/Manual.aspx");
            //Login del sistema
            route.MapPageRoute("Login", "login", "~/Views/Administracion/login.aspx");
            //Login del sistema
            route.MapPageRoute("Logout", "logout", "~/Views/Administracion/logout.aspx");
            //Pagina de administracion de usuarios
            route.MapPageRoute("AdministrarUsuarios", "Administrar/Usuarios", "~/Views/Administracion/usuariosAdministrador.aspx");
            //Pagina de administracion de permisos
            route.MapPageRoute("AdministrarRecursos", "Administrar/Recursos", "~/Views/Administracion/RecursosAdministrador.aspx");
            //Pagina de administracion de roles
            route.MapPageRoute("AdministrarRoles", "Administrar/Roles", "~/Views/Administracion/rolesAdministrador.aspx");
            //Pagina donde se muestran las notificaciones del Beneficiario
            route.MapPageRoute("Notificaciones", "Administracion/Notificaciones", "~/Views/Administracion/Notificaciones.aspx");
            //Pagina para registrar experiencia del Formulador
            route.MapPageRoute("RegistrarExperiencia", "Formulador/Experiencia", "~/Views/Formulacion/RegistrarExperiencia.aspx");
            //Pagina para actualizar el numero de evaluadores
            route.MapPageRoute("ActualizarEvaluadores", "Administrar/Evaluadores", "~/Views/Administracion/CantidadEvaluadores.aspx");
            //Pagina donde se muestra el error403
            route.MapPageRoute("Error403","403", "~/Views/Administracion/CustomErrors/Error403.aspx");
            route.MapPageRoute("Error404","404", "~/Views/Administracion/CustomErrors/Error404.aspx");
            route.MapPageRoute("ErrorDefault","defaultError", "~/Views/Administracion/ErrorDefault.aspx");

            route.MapPageRoute("ListaDepartamentos", "Administrar/Departamentos", "~/Views/Catalogos/Departamentos.aspx");
            route.MapPageRoute("RegistroDepartamento", "Administrar/RegistroDepartamento", "~/Views/Catalogos/RegistroDepartamentos.aspx");
            route.MapPageRoute("ReporteIniciativa", "Administrar/ReporteIniciativa", "~/Views/Reportes/Iniciativas.aspx");

            route.MapPageRoute("CatalogoActividadIniciativa", "Administrar/ActividadIniciativa", "~/Views/Catalogos/ActividadIniciativa.aspx");
            route.MapPageRoute("CatalogoDepartamentos", "Administrar/Departamentos", "~/Views/Catalogos/Departamentos.aspx");
            route.MapPageRoute("CatalogoEstadoProceso", "Administrar/EstadoProceso", "~/Views/Catalogos/EstadoProceso.aspx");
            route.MapPageRoute("CatalogoMunicipio", "Administrar/Municipios", "~/Views/Catalogos/Municipios.aspx");
            route.MapPageRoute("CatalogoSectorEconomico", "Administrar/SectorEconomico", "~/Views/Catalogos/SectorEconomico.aspx");
            route.MapPageRoute("CatalogoTipoIniciativa", "Administrar/TipoIniciativas", "~/Views/Catalogos/TipoIniciativa.aspx");
            route.MapPageRoute("CatalogoCriteriosEvaluacion", "Administrar/CriteriosEvaluacion", "~/Views/Catalogos/CriterioEvaluacion.aspx");
            route.MapPageRoute("CatalogoEvaluacionTecnica", "Administrar/EvaluacionTecnica", "~/Views/Catalogos/EvaluacionTecnica.aspx");
            route.MapPageRoute("CatalogoCampoIniciativa", "Administrar/CamposIniciativa", "~/Views/Catalogos/CampoIniciativa.aspx");


            route.MapPageRoute("AsignacionConsultor", "Administrar/Asignaciones", "~/Views/Administracion/ConsultoresMuniSector.aspx");
            route.MapPageRoute("ConsultarFormuladores", "Administrar/Formuladores", "~/Views/Administracion/ListadoDeFormuladores.aspx");
            route.MapPageRoute("Documentos", "Administrar/Documentos", "~/Views/Administracion/DocumentosGenerales.aspx");
        }
    }
}