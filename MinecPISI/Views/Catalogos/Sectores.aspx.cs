using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL.Acciones;

namespace MinecPISI.Views.Catalogos
{
    public partial class Sectores : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack)
                return;
            var aSector = new A_SECTOR_ECONOMICO();
            var sectores = aSector.ObtenerSectores();
            gv_sectores.DataSource=sectores;
            gv_sectores.DataBind();
        }
        protected void gv_sectores_OnRowDataBound(object sender, GridViewRowEventArgs e)
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