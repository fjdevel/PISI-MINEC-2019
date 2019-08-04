using System;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL.Acciones;
using BLL.Modelos;
using BLL.Modelos.ModelosVistas;

namespace MinecPISI.Views.Casos
{
    public partial class ConsultarPropuestasSolucion : Page
    {
        public int i;
        public TB_PERSONA miConsultor;
        protected void Page_Load(object sender, EventArgs e)
        {
            var usuario = (MV_DetalleUsuario)Session["usuario"];

            if (IsPostBack) return;

            switch (usuario.NOMBRE_ROL.ToUpper())
            {
               
                case "BENEFICIARIO":

                    h_beneficiario.Visible = true;

                    var aBeneficiario = new A_BENEFICIARIO();

                    var idBeneficiario = A_BENEFICIARIO.ObtenerBeneficiario(usuario.ID_USUARIO).ID_BENEFICIARIO;

                   gv_propuestas.DataSource = A_PROPUESTA.ObtenerPropuestasByIdBeneficiario(idBeneficiario);



                    miConsultor = A_ASIGNACION.getPersonaByIdBeneficiario(Convert.ToInt32(usuario.ID_PERSONA.ToString()));

                    pnl_beneficiario.Visible = true;
                        

                    break;
                case "FORMULADOR":
                    gv_propuestas.DataSource = A_PROPUESTA.ObtenerPropuestasRechazadasOPendientesPorIdUsuarioFormulador(usuario.ID_USUARIO);
                    break;
            }

            gv_propuestas.DataBind();
            i = gv_propuestas.Rows.Count;
        }

        protected void gv_propuestas_OnRowDataBound(object sender, GridViewRowEventArgs e)
        {
            //check if the row is the header row
            if (e.Row.RowType == DataControlRowType.Header)
            {
                //add the thead and tbody section programatically
                e.Row.TableSection = TableRowSection.TableHeader;
            }
        }

        protected void solicitar_apoyo(object sender, EventArgs e)
        {

        }
    }
}