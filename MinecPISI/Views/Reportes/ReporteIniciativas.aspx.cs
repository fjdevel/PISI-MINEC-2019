using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL.Acciones;
using MinecPISI.ViewModels;

namespace MinecPISI.Views.Reportes
{
    public partial class ReporteIniciativas : System.Web.UI.Page
    {
        
        protected void Page_Load(object sender, EventArgs e)
        {

          
            var aSector = new A_SECTOR_ECONOMICO();
            var aBeneficiario = new A_USUARIO();
            var aConsultor = new A_USUARIO();
            var aFormulador = new A_USUARIO();
            var aEstados = new A_USUARIO();
            var aTipoIniciativa = new A_TIPO_INICIATIVA();
        
            ddl_sector.DataSource = aSector.ObtenerSectores();
            ddl_sector.DataTextField = "NOMBRE";
            ddl_sector.DataValueField = "ID_SECTOR_ECONOMICO";
            ddl_sector.DataBind();

            ddl_beneficiario.DataSource = aBeneficiario.getObtenerRolBeneficiarios();
            ddl_beneficiario.DataTextField = "NOMBRE";
            ddl_beneficiario.DataValueField = "ID_PERSONA";
            ddl_beneficiario.DataBind();

            ddl_consultor.DataSource = aConsultor.getObtenerRolConsultor();
            ddl_consultor.DataTextField = "NOMBRE";
            ddl_consultor.DataValueField = "ID_PERSONA";
            ddl_consultor.DataBind();


            ddl_formulador.DataSource = aFormulador.getObtenerRolFormulador();
            ddl_formulador.DataTextField = "NOMBRE";
            ddl_formulador.DataValueField = "ID_PERSONA";
            ddl_formulador.DataBind();

            //ddl_iniciativa.DataSource = aTipoIniciativa.obtenerIniciativas();
            //ddl_iniciativa.DataTextField = "NOMBRE";
            //ddl_iniciativa.DataValueField = "ID_TIPO_INICIATIVA";
            //ddl_iniciativa.DataBind();

            ddl_estados.DataSource = aEstados.obtenerEstados();
            ddl_estados.DataTextField = "DESCRIPCION_ESTADO_PROCESO";        
            ddl_estados.DataValueField = "ID_ESTADO_PROCESO";
            ddl_estados.DataBind();



        }
      
        protected void gv_iniciativas_OnRowDataBound(object sender, GridViewRowEventArgs e)
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