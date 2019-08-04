using BLL.Acciones;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MinecPISI.Views.Casos
{
    public partial class ConsultarCasosDelFormulador : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            gv_casos.DataSource = A_PROBLEMA.getAllNotResolved();
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