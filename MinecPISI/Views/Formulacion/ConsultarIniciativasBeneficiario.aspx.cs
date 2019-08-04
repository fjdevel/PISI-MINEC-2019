using BLL.Acciones;
using BLL.Modelos.ModelosVistas;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MinecPISI.Views.Formulacion
{
    public partial class ConsultarIniciativasBeneficiario : System.Web.UI.Page
    {
        protected List<Object> iniciativas;
        protected void Page_Load(object sender, EventArgs e)
        {
            var usuario = (MV_DetalleUsuario)Session["usuario"];
            var aBeneficiario = new A_BENEFICIARIO();

            var idBeneficiario = A_BENEFICIARIO.ObtenerBeneficiario(usuario.ID_USUARIO).ID_BENEFICIARIO;
            iniciativas = A_PROYECTO.ObtenerProyectosPorIdBeneficiario(idBeneficiario);
        }
    }
}