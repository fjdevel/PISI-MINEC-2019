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
    public partial class EditarProblema : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Session["mensajeType"] = null; //dejamos objeto de mensaje como nulo para ya no ver el mensaje en las pantallas

            if (IsPostBack)
                return;

            var aUsuario = new A_USUARIO();
            var aBeneficiario = new A_BENEFICIARIO();
            var aProblema = new A_PROBLEMA();
            TB_PROBLEMA problema = aProblema.ObtenerProblemaPorId(Convert.ToInt32(Page.RouteData.Values["idProblema"]));

            var idUsuario = ((BLL.Modelos.ModelosVistas.MV_DetalleUsuario)Session["usuario"]).ID_USUARIO;
            var usuario = aUsuario.getUsuarioById(idUsuario);
            var beneficiario = aBeneficiario.BuscarBeneficiarioXIdPersona(usuario.ID_PERSONA);

            txt_nombreProblema.Text = problema.NOMBRE_PROBLEMA;
            txt_negocio.Text = problema.DESCRIPCION_NEGOCIO;
            txt_clientes.Text = problema.MERCADO;
            txt_empleados.Text = problema.CANT_EMPLEADOS.ToString();
            txt_ventasMes.Text = problema.VENTA_MES.ToString();
            txt_ventaDia.Text = problema.VENTA_DIA.ToString();
            txt_problema.Text = problema.DESCRIPCION_PROBLEMA;
            txt_problema2.Text = problema.DESCRIPCION_OTRO_PROBLEMA;
        }

        protected void btn_enviar_OnClick(object sender, EventArgs e)
        {
            var aUsuario = new A_USUARIO();
            var aBeneficiario = new A_BENEFICIARIO();
            var aProblema = new A_PROBLEMA();

            var idUsuario = ((BLL.Modelos.ModelosVistas.MV_DetalleUsuario)Session["usuario"]).ID_USUARIO;
            var usuario = aUsuario.getUsuarioById(idUsuario);
            var beneficiario = aBeneficiario.BuscarBeneficiarioXIdPersona(usuario.ID_PERSONA);

            var problemaBeneficiario = new TB_PROBLEMA
            {
                ID_BENEFICIARIO = beneficiario.ID_BENEFICIARIO,
                ID_ESTADO_PROCESO = A_ESTADO_PROCESO.ObtenerPorCodigo("P04").ID_ESTADO_PROCESO,
                MERCADO = txt_clientes.Text,
                CANT_EMPLEADOS = Convert.ToInt32(txt_empleados.Text),
                VENTA_MES = Convert.ToDecimal(txt_ventasMes.Text),
                VENTA_DIA = txt_ventaDia.Text,
                NOMBRE_PROBLEMA = txt_nombreProblema.Text,
                DESCRIPCION_NEGOCIO = txt_negocio.Text,
                DESCRIPCION_PROBLEMA = txt_problema.Text,
                DESCRIPCION_OTRO_PROBLEMA = txt_problema2.Text,
                ID_PROBLEMA = Convert.ToInt32(Page.RouteData.Values["idProblema"]),
                USUARIO_ACTUALIZA = idUsuario
            };
            var miConsultor = A_ASIGNACION.getPersonaByIdBeneficiario(Convert.ToInt32(usuario.ID_PERSONA.ToString()));
            aProblema.ActualizarProblema(problemaBeneficiario);
            A_NOTIFICACION.GuardarNotificacion(new A_USUARIO().getUsuarioByPersona(miConsultor.ID_PERSONA).ID_USUARIO, idUsuario, "P04");

            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Pop", "ShowMessage('Tu problema ha sido guardado <strong>correctamente!</strong>', 'success');", true);

            
        }

       

    }
}