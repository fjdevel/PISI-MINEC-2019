using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL.Acciones;
using BLL.Modelos.ModelosVistas;

namespace MinecPISI.Views.Administracion
{
    public partial class logout1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                A_USUARIO u = new A_USUARIO();

                //Cerrando sesion en BD
                if (Session["usuario"] == null)
                    Response.Redirect("login");

                u.updateUsuarioAsAutenticado(((MV_DetalleUsuario)Session["usuario"]).ID_USUARIO, null, false);

                //Borrando sesion en memoria
                Session["usuario"] = null;
                Session["rol"] = null;

                Session.Clear();
                Session.RemoveAll();
                Session.Abandon();

                //Borrando sesion en cookies
                Response.Cookies.Add(new HttpCookie("ASP.NET_SessionId", ""));
                
                Response.Redirect("login", true);
            }
        }
    }
}