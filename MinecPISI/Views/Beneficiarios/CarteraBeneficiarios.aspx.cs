using BLL.Acciones;
using BLL.Modelos.ModelosVistas;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MinecPISI.Views.Beneficiarios
{
    public partial class CarteraBeneficiarios : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            var usuario = (MV_DetalleUsuario)Session["usuario"];

            if (IsPostBack) return;
            gv_beneficiarios.DataSource = A_BENEFICIARIO.ObtenerBeneficiariosObtenerTodosMenosNoValidadosONoPrecalificados();
            

            gv_beneficiarios.DataBind();
        }

        protected void gv_beneficiarios_OnRowDataBound(object sender, GridViewRowEventArgs e)
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