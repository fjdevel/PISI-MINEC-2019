using BLL.Acciones;
using BLL.Modelos.ModelosVistas;
using System;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MinecPISI.Views.Casos
{
    public partial class ConsultarCasosActivosCoordinador : Page
    {
        public string rol;
        public BLL.Modelos.TB_PERSONA persona_consultor;

        protected void Page_Load(object sender, EventArgs e)
        {
            var usuario = (MV_DetalleUsuario)Session["usuario"];

            Session["mensajeType"] = null; //dejamos objeto de mensaje como nulo para ya no ver el mensaje en las pantallas

            if (IsPostBack) return;

            switch (usuario.NOMBRE_ROL.ToUpper())
            {
                case "CONSULTOR":
                    gv_casos.Columns[6].Visible = false;

                    gv_casos.DataSource = A_PROBLEMA.getByIdPersonaConsultor(usuario.ID_PERSONA);
                    break;
                case "COORDINADOR":
                    gv_casos.Columns[5].Visible = false;
                    gv_casos.Columns[6].Visible = false;

                    gv_casos.DataSource = A_PROBLEMA.getAll();
                    break;
                case "FORMULADOR":
                    gv_casos.Columns[5].Visible = false;

                    //acciones si es formulador
                    gv_casos.DataSource = A_PROBLEMA.getAllNotResolved();
                    break;

                case "BENEFICIARIO":
                    persona_consultor = A_ASIGNACION.getPersonaByIdBeneficiario( A_BENEFICIARIO.ObtenerBeneficiario(usuario.ID_USUARIO).ID_BENEFICIARIO);
                    gv_casos.Columns[3].Visible = false;
                    gv_casos.Columns[5].Visible = false;
                    gv_casos.Columns[6].Visible = false;
                    gv_casos.DataSource = A_PROBLEMA.getByIdBeneficiario(A_BENEFICIARIO.ObtenerBeneficiario(usuario.ID_USUARIO).ID_BENEFICIARIO);
                    break;
            }

            rol = ((MV_DetalleUsuario)Session["usuario"]).NOMBRE_ROL.ToUpper();

            gv_casos.DataBind();

        }

        protected void gv_casos_OnRowDataBound(object sender, GridViewRowEventArgs e)
        {
            //check if the row is the header row
            if (e.Row.RowType == DataControlRowType.Header)
            {
                //add the thead and tbody section programatically
                e.Row.TableSection = TableRowSection.TableHeader;
            }
        }
    }
}