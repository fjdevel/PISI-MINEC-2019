using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL.Acciones;
using BLL.Modelos;
using MinecPISI.ViewModels;

namespace MinecPISI.Views.Beneficiarios
{
    public partial class RegistrarProblema : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Session["mensajeType"] = null; //dejamos objeto de mensaje como nulo para ya no ver el mensaje en las pantallas

            if (IsPostBack)
                return;
        }

        protected void btn_enviar_OnClick(object sender, EventArgs e)
        {
            var aUsuario = new A_USUARIO();
            var aBeneficiario = new A_BENEFICIARIO();
            var aProblema = new A_PROBLEMA();

            var idUsuario = ((BLL.Modelos.ModelosVistas.MV_DetalleUsuario)Session["usuario"]).ID_USUARIO;
            var usuario = aUsuario.getUsuarioById(idUsuario);
            var beneficiario = A_BENEFICIARIO.ObtenerBeneficiario(usuario.ID_USUARIO);

            var problemaBeneficiario = new TB_PROBLEMA
            {
                ID_BENEFICIARIO = beneficiario.ID_BENEFICIARIO,
                ID_ESTADO_PROCESO = A_ESTADO_PROCESO.ObtenerPorCodigo("P01").ID_ESTADO_PROCESO,
                MERCADO = txt_clientes.Text,
                CANT_EMPLEADOS = Convert.ToInt32(txt_empleados.Text),
                VENTA_MES = Convert.ToDecimal(txt_ventasMes.Text),
                VENTA_DIA = txt_ventaDia.Text,
                NOMBRE_PROBLEMA = txt_nombreProblema.Text,
                DESCRIPCION_NEGOCIO = txt_negocio.Text,
                REQUIERE_APOYO = btnSi.Checked,
                DESCRIPCION_PROBLEMA = txt_problema.Text,
                DESCRIPCION_OTRO_PROBLEMA = txt_problema2.Text
            };
            var miConsultor = A_ASIGNACION.getPersonaByIdBeneficiario(Convert.ToInt32(usuario.ID_PERSONA.ToString()));
            aProblema.AlmacenarProblema(problemaBeneficiario);
            A_NOTIFICACION.GuardarNotificacion(new A_USUARIO().getUsuarioByPersona(miConsultor.ID_PERSONA).ID_USUARIO, idUsuario, "P01");
            
            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Pop", "ShowMessage('Tu problema ha sido guardado <strong>correctamente!</strong>', 'success');", true);

            //LimpiarTextBoxes(Page);
        }
        /*
        protected void LimpiarTextBoxes(Control p1)
        {
            foreach (Control ctrl in p1.Controls)
            {
                if (ctrl is TextBox t)
                {
                    t.Text = string.Empty;
                }
                else
                {
                    if (ctrl.Controls.Count > 0)
                    {
                        LimpiarTextBoxes(ctrl);
                    }
                }
            }
        }*/

    }
}