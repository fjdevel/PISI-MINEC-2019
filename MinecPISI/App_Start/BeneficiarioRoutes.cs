using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Routing;

namespace MinecPISI.App_Start
{
    public class BeneficiarioRoutes
    {
        public void RegistrarRutas(RouteCollection route)
        {
            //Pagina donde se listaran los beneficiarios no verificados para comprobar su documentacion
            route.MapPageRoute("ConsultarBeneficiario", "Beneficiario/Consultar/Beneficiario", "~/Views/Beneficiarios/ConsultarBeneficiario.aspx");
            route.MapPageRoute("ConsultarCarteraBeneficiario", "Beneficiario/Consultar", "~/Views/Beneficiarios/CarteraBeneficiarios.aspx");
            route.MapPageRoute("ConsultarPersonasRegistroAyuda", "Beneficiario/Consultar/Persona", "~/Views/Beneficiarios/ConsultarPersonasRegistroAyuda.aspx");
            //Pagina donde se muestran los datos del beneficiario para su aprobacion
            route.MapPageRoute("DatosBeneficiario", "Beneficiario/Documentacion/{id}", "~/Views/Beneficiarios/ConsultarBeneficiarioDetalle.aspx");
            //Pagina donde se ingresaran los datos adicionales del beneficiario
            route.MapPageRoute("DatosComplementariosBeneficiario", "Beneficiario/AgregarInformacion/{id}", "~/Views/Beneficiarios/RegistrarInformacionComplementariaVinculacion.aspx");
            //Pagina donde se ingresaran los datos adicionales del beneficiario (archivos)
            route.MapPageRoute("DatosComplementariosBeneficiario2", "Beneficiario/AgregarInformacion2/{id}", "~/Views/Beneficiarios/RegistrarInformacionComplementariaVinculacion2.aspx");
            //Pagina Inicial para registrar usuario 
            route.MapPageRoute("Registro", "Beneficiario/RegistroAyuda", "~/Views/Beneficiarios/RegistroBeneficiarioAyuda.aspx");
            //Pagina donde se registra un Beneficiario Pasos 1 - 4
            route.MapPageRoute("RegistroBeneficiario02", "Beneficiario/Registro/Paso/2", "~/Views/Beneficiarios/RegistroBeneficiarioInfoPersonal.aspx");
            route.MapPageRoute("RegistroBeneficiario03", "Beneficiario/Registro/Paso/3", "~/Views/Beneficiarios/RegistroBeneficiarioActividadEconomica.aspx");
            route.MapPageRoute("RegistroBeneficiario04", "Beneficiario/Registro/Paso/4", "~/Views/Beneficiarios/RegistroBeneficiarioDocumentacion.aspx");
            route.MapPageRoute("RegistroBeneficiario01", "Beneficiario/Registro/Paso/1", "~/Views/Beneficiarios/RegistroBeneficiarioCredenciales.aspx");
            //Paso Alternativo donde se registra una Persona Juridica / Asociación Pasos 3
            route.MapPageRoute("RegistroAsociacion", "Asociacion/Registro/Paso/4", "~/Views/Beneficiarios/RegistroAsociacionDocumentacion.aspx");

            //Registrar Problema por el Beneficiario
            route.MapPageRoute("RegistroProblema", "Beneficiario/Registro/Problema", "~/Views/Beneficiarios/RegistrarProblema.aspx");
            route.MapPageRoute("EditarProblema", "Beneficiario/Editar/Problema/{idProblema}", "~/Views/Beneficiarios/EditarProblema.aspx");
        }
    }
}