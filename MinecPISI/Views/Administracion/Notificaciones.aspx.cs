using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL.Modelos;
using BLL.Modelos.ModelosVistas;
using BLL.Acciones;

namespace MinecPISI.Views.Administracion
{
    public partial class Notificaciones : System.Web.UI.Page
    {
        public List<TB_NOTIFICACION> notificaciones;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["usuario"] == null)
            {
                Response.RedirectToRoute("Login");
                return;
            }

            //notificaciones = A_NOTIFICACION.GetByIdUsuario(((MV_DetalleUsuario)Session["usuario"]).ID_USUARIO);

            //Marcando notificaciones no leídas como Leídas
            //A_NOTIFICACION.deactivateAllForUser(((MV_DetalleUsuario)Session["usuario"]).ID_USUARIO);
        }
    }
}