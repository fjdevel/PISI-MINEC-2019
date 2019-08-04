using BLL.Acciones;
using BLL.Modelos;
using BLL.Modelos.ModelosVistas;
using MinecPISI.ViewModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MinecPISI.Views.Administracion
{
    public partial class CantidadEvaluadores : System.Web.UI.Page
    {
        protected MV_DetalleUsuario usuario;
        protected A_CONFIGURACION a_configuracion = new A_CONFIGURACION();
        protected MV_CantEvaluadores cantEvaluadores;

        protected void Page_Load(object sender, EventArgs e)
        {
            cantEvaluadores = a_configuracion.ObtenerCantEvaluadores();        
            if (!IsPostBack)
                cantidad.Text = cantEvaluadores.NumeroEvaluadores.ToString();
         
        }

        protected void btnactualizar_Click(object sender, EventArgs e)
        {
            var valor = Int16.Parse(cantidad.Text);
            if(valor> 0 && valor <= cantEvaluadores.CantUserEval)
            {
                var res = a_configuracion.ActualizarCantEvaluadores(cantidad.Text);
                if (res)
                {
                    ScriptManager.RegisterStartupScript(this, GetType(),
                               "alert",
                               "alert('Se ha actualizado el registro');",
                               true);
                }
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, GetType(),
                               "alert",
                               "alert('El valor debe ser mayor a 0 y menor o igual a "+ cantEvaluadores.CantUserEval + "');",
                               true);
            }
            
   
        }

    }
}