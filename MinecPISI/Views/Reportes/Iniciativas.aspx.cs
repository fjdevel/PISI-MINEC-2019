using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL.Acciones;
using BLL.Modelos;
using MinecPISI.ViewModels;

namespace MinecPISI.Views.Reportes
{
    public partial class Iniciativas : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack)
                return;
            
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

            ddl_iniciativa.DataSource = aTipoIniciativa.ObtenerIniciativas();
            ddl_iniciativa.DataTextField = "NOMBRE";
            ddl_iniciativa.DataValueField = "ID_TIPO_INICIATIVA";
            ddl_iniciativa.DataBind();

            ddl_estados.DataSource = aEstados.obtenerEstados();
            ddl_estados.DataTextField = "DESCRIPCION_ESTADO_PROCESO";
            ddl_estados.DataValueField = "ID_ESTADO_PROCESO";
            ddl_estados.DataBind();

        }
        private void LoadGrid()
        {            

        }
        protected void btn_imprimir_OnClick(object sender, EventArgs e)
        {
            var aIniciativas = new A_USUARIO();

            decimal montoMenor = Convert.ToDecimal(txt_montoMenor.Text == "" ? "0" : txt_montoMenor.Text);
            decimal montoMayor = Convert.ToDecimal(txt_montoMayor.Text == "" ? "0" : txt_montoMayor.Text);

            var idBeneficiario = Convert.ToInt32(ddl_beneficiario.SelectedValue);
            var idConsultor = Convert.ToInt32(ddl_consultor.SelectedValue);
            var idFormulador = Convert.ToInt32(ddl_formulador.SelectedValue);
            var idSector = Convert.ToInt32(ddl_sector.SelectedValue);
            var idIniciativa = Convert.ToInt32(ddl_iniciativa.SelectedValue);
            var idEstado = Convert.ToInt32(ddl_estados.SelectedValue);

            List<REPORTE> listaIniciativa = new A_REPORTES().ObtenerReporte().ToList();
            if (montoMenor != 0 && montoMayor != 0)
            {
                listaIniciativa = listaIniciativa.Where(o => o.MONTO >= montoMenor).Where(o => o.MONTO <= montoMayor).ToList();
            }
            if (montoMenor != 0 && montoMayor == 0)
            {
                listaIniciativa = listaIniciativa.Where(o => o.MONTO >= montoMenor).ToList();
            }
            if (montoMayor != 0 && montoMenor == 0)
            {
                listaIniciativa = listaIniciativa.Where(o => o.MONTO <= montoMayor).ToList();
            }
            if (idSector != 0)
            {
                listaIniciativa = listaIniciativa.Where(o => o.ID_SECTOR_ECONOMICO == idSector).ToList();
            }
            if (idBeneficiario != 0)
            {
                listaIniciativa = listaIniciativa.Where(o => o.ID_BENEFICIARIO==idBeneficiario).ToList();

            }
            if (idIniciativa != 0)
            {
                listaIniciativa = listaIniciativa.Where(o => o.ID_TIPO_INICIATIVA==idIniciativa).ToList();

            }
            if (idEstado != 0){
                listaIniciativa = listaIniciativa.Where(o => o.ID_ESTADO==idEstado).ToList();

            }
            if (idFormulador != 0)
            {
                listaIniciativa = listaIniciativa.Where(o => o.id_formulador==idFormulador).ToList();

            }
            if (idConsultor != 0)
            {
                listaIniciativa = listaIniciativa.Where(o => o.id_consultor_vinculacion==idConsultor).ToList();

            }
            if(fechaDesde.Text!="" && fechaHasta.Text != "")
            {
                DateTime datedeste;
                DateTime.TryParse(fechaDesde.Text, out datedeste);
                DateTime datehasta;
                DateTime.TryParse(fechaHasta.Text, out datehasta);

                listaIniciativa = listaIniciativa.Where(o => o.FECHA >=datedeste).Where(o=>o.FECHA<=datehasta).ToList();

            }
            if(fechaDesde.Text!="" && fechaHasta.Text == "")
            {
                DateTime datedeste;
                DateTime.TryParse(fechaDesde.Text, out datedeste);
                listaIniciativa = listaIniciativa.Where(o => o.FECHA >= datedeste).ToList();
            }
            if(fechaHasta.Text !="" && fechaDesde.Text == "")
            {
                DateTime datehasta;
                DateTime.TryParse(fechaHasta.Text, out datehasta);
                listaIniciativa = listaIniciativa.Where(o => o.FECHA <= datehasta).ToList();

            }
            iniciativas.DataSource = listaIniciativa;
            iniciativas.DataBind();
            UpdatePanel1.Update();
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