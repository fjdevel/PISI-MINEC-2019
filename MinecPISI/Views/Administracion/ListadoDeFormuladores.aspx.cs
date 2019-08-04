using BLL.Acciones;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MinecPISI.Views.Administracion
{
    public partial class ListadoDeFormuladores : System.Web.UI.Page
    {
        protected List<Object> formuladores;
        protected void Page_Load(object sender, EventArgs e)
        {
            formuladores = A_FORMULADOR.ObtenerFormuladores();   
        }

        protected void validar_Click(object sender, EventArgs e)
        {
            A_FORMULADOR.ValidarRegistro(Convert.ToInt32(idformulador.Text));
            //A_CORREO.FormuladorValidado(correof.Text);
            ScriptManager.RegisterStartupScript(this, GetType(),
                    "alert",
                    "alert('felicidades! ha validado el registro de un formulador,se ha notificado por correo y ahora podra ingresar al sistema...');",
                    true);
            Response.RedirectToRoute("ConsultarFormuladores");
        }
    }
}