using BLL.Acciones;
using BLL.Modelos;
using BLL.Modelos.ModelosVistas;
using System;
using System.Collections.Generic;
using System.Text.RegularExpressions;
using System.Web.UI;

namespace MinecPISI.Views.Layouts
{
    public partial class Layout2 : System.Web.UI.MasterPage
    {
        public List<Object> notificaciones = new List<Object>();
        protected void Page_PreInit(object sender, EventArgs e)
        {
            if (Session["usuario"] == null)
            {
                Response.StatusCode = 403;
                Response.Close();
                Response.RedirectToRoute("Login");
                return;
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                A_ROL r = new A_ROL();
                A_USUARIO u = new A_USUARIO();

                if (Session["usuario"] == null)
                {
                    Response.StatusCode = 403;
                    Response.RedirectToRoute("Login");
                    return;
                }

                switch (u.getEstadoSesion(((MV_DetalleUsuario)Session["usuario"]).ID_USUARIO, Session.SessionID))
                {
                    case A_USUARIO.SESION_EXISTENTE:
                        lbl_tipo_usuario.Text = r.getRolById(((MV_DetalleUsuario)Session["usuario"]).ID_ROL).NOMBRE;
                        break;

                    default:
                        Response.StatusCode = 403;
                        Response.RedirectToRoute("Login");
                        break;
                }

                // Buscando si el usuario está autorizado para acceder a la página solicitada
                var path = Request.Url.AbsolutePath;    //Extrayendo URL

                if (!isAuthorized(path))
                {
                    Response.StatusCode = 403;
                    Response.SuppressContent = true;
                    Response.RedirectToRoute("Login");
                }

                //Finalmente, si el usuario está autorizado, cargará sus notificaciones
                notificaciones = A_NOTIFICACION.ObtenerNotificacionesNuevas(((MV_DetalleUsuario)Session["usuario"]).ID_USUARIO);
                A_NOTIFICACION.ActualizarNotificacionesLeido(((MV_DetalleUsuario)Session["usuario"]).ID_USUARIO);
            }
        }

        protected bool isAuthorized(string url)
        {
            TB_RECURSO accediendo = new A_RECURSO().getRecursoByUrl(url);   //Buscando el recurso asociado a esa URL

            List<TB_RECURSO> recursos = new A_PERMISO().getRecursosByRol(((MV_DetalleUsuario)Session["usuario"]).ID_ROL);   //Buscando todos los recursos asignados al rol del usuario

            foreach (TB_RECURSO recurso in recursos)    //Buscando si el recurso al que desea acceder se encuentra entre los asignados
            {
                var req = Request.Path.Replace(Request.ApplicationPath, "");

                Regex regex = new Regex(@recurso.URL_RECURSO);
                
                if (regex.IsMatch(req))
                {
                    return true;
                }
            }

            return false;
        }
    }
}