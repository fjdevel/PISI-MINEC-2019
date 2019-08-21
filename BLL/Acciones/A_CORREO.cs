using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Net;
using System.Net.Mail;
using BLL.Helpers;
using System.Configuration;
using System.IO;
using System.Web;
using DAL.DB;
using System.Web.Hosting;
using MINECBaseDll.BL;

namespace BLL.Acciones
{
    public class A_CORREO
    {
        private static readonly PISIDataContext _context = new PISIDataContext();

        
        public static Boolean FormuladorValidado(string correo)
        {
            

            string path = HostingEnvironment.MapPath("~/Views/Administracion/Correo/FormuladorValidado.html");

            StreamReader str = new StreamReader(path);
            string bodyText = str.ReadToEnd();

            HttpRequest request = HttpContext.Current.Request;

            bodyText = bodyText.Replace("[url]", "http://" + request.Url.Authority + request.ApplicationPath);

         
            EMailBE dato = new EMailBE("Proyecto Especial de Pequeñas Inversiones para Soluciones Innovadoras", correo, "Formulador Validado", bodyText);
            MINECBaseDll.BL.BaseLogic.SendEmail(dato);
            return true;
        }
        public static Boolean BeneficiarioElegible(string correo)
        {
           

            string path = HostingEnvironment.MapPath("~/Views/Administracion/Correo/BeneficiarioElegible.html");

            StreamReader str = new StreamReader(path);
            string bodyText = str.ReadToEnd();

            HttpRequest request = HttpContext.Current.Request;

            bodyText = bodyText.Replace("[url]", "http://" + request.Url.Authority + request.ApplicationPath);

            
            EMailBE dato = new EMailBE("Proyecto Especial de Pequeñas Inversiones para Soluciones Innovadoras", correo, "Beneficiario Elegible", bodyText);
            MINECBaseDll.BL.BaseLogic.SendEmail(dato);

            return true;
        }

        public static Boolean NuevoProblemaIngresado(string correo, string codigo)
        {
            

            string path = HostingEnvironment.MapPath("~/Views/Administracion/Correo/NuevoProblemaIngresado.html");

            StreamReader str = new StreamReader(path);
            string bodyText = str.ReadToEnd();

            HttpRequest request = HttpContext.Current.Request;

            bodyText = bodyText.Replace("[url]", "http://" + request.Url.Authority + request.ApplicationPath);
            bodyText = bodyText.Replace("[codigo]", codigo);

          
            
            EMailBE dato = new EMailBE("Proyecto Especial de Pequeñas Inversiones para Soluciones Innovadoras", correo, "Nuevo prolema ingresado", bodyText);
            MINECBaseDll.BL.BaseLogic.SendEmail(dato);
            return true;
        }

        public static Boolean InvitacionPresentarPropuesta(string correo, string codigo)
        {
            

            string path = HostingEnvironment.MapPath("~/Views/Administracion/Correo/InvitacionPresentarPropuesta.html");

            StreamReader str = new StreamReader(path);
            string bodyText = str.ReadToEnd();

            HttpRequest request = HttpContext.Current.Request;

            bodyText = bodyText.Replace("[url]", "http://" + request.Url.Authority + request.ApplicationPath);
            bodyText = bodyText.Replace("[codigo]", codigo);

           
            EMailBE dato = new EMailBE("Proyecto Especial de Pequeñas Inversiones para Soluciones Innovadoras", correo, "Invitación a presentar propuestas de solución", bodyText);
            MINECBaseDll.BL.BaseLogic.SendEmail(dato);
            return true;
        }

        public static Boolean EvaluacionesIngresadas(string correo, string codigo)
        {
           

            string path = HostingEnvironment.MapPath("~/Views/Administracion/Correo/EvaluacionesIngresadas.html");

            StreamReader str = new StreamReader(path);
            string bodyText = str.ReadToEnd();

            HttpRequest request = HttpContext.Current.Request;

            bodyText = bodyText.Replace("[url]", "http://" + request.Url.Authority + request.ApplicationPath);
            bodyText = bodyText.Replace("[codigo]", codigo);

            
            EMailBE dato = new EMailBE("Proyecto Especial de Pequeñas Inversiones para Soluciones Innovadoras", correo, "Evaluación del proyecto " + codigo, bodyText);
            MINECBaseDll.BL.BaseLogic.SendEmail(dato);

            return true;
        }
    }
}
