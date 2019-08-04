using BLL.Acciones;
using System;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL.Modelos.ModelosVistas;
using MinecPISI.ViewModels;
using System.Collections.Generic;

namespace MinecPISI.Views.Beneficiarios
{
    public partial class ConsultarBeneficiario : Page
    {
        MV_DetalleUsuario usuario;
        protected void Page_Load(object sender, EventArgs e)
        {
            usuario = (MV_DetalleUsuario)Session["usuario"];

            if (IsPostBack) return;

            var beneficiarios = A_BENEFICIARIO.ObtenerBeneficiariosPorEstadoProceso(""); //lista de todos los beneficiarios sin filtros

            if (usuario.NOMBRE_ROL.ToUpper() == "CONSULTOR")
            {
                pnl_consultor.Visible = true; //solo consultor  puede ver fecha de asignacion y estado
                gv_beneficiarios.Columns[7].Visible = true;
                gv_beneficiarios.Columns[8].Visible = false;
                gv_beneficiarios.Columns[9].Visible = false;
                gv_beneficiarios.Columns[4].Visible = false;
                gv_beneficiarios.Columns[11].Visible = true;

                gv_beneficiarios.DataSource = beneficiarios.FindAll(b => b.IdPersonaConsultor == usuario.ID_PERSONA);
            }
            else if (usuario.NOMBRE_ROL.ToUpper() == "COORDINADOR")
            {
                List<MV_ConsultarBeneficiarios> lista1 = new List<MV_ConsultarBeneficiarios>();
                List<MV_ConsultarBeneficiarios> lista2 = new List<MV_ConsultarBeneficiarios>();
                lista1 = beneficiarios.FindAll(b => b.CodigoEstado == "B03");
                lista2 = beneficiarios.FindAll(b => b.CodigoEstado == "B02");
                foreach(var i in lista1)
                {
                    lista2.Add(i);
                }
                pnl_coordinador.Visible = true;
                gv_beneficiarios.Columns[7].Visible = false;

                gv_beneficiarios.DataSource = lista2;
                

                ddl_consultores.DataSource = A_ASIG_CONSULTOR.ObtenerXMuniYSector(0, 0);
                ddl_consultores.DataTextField = "ASIGNACION";
                ddl_consultores.DataValueField = "ID_CONSULTOR";
                ddl_consultores.DataBind();
            }
            else if (usuario.NOMBRE_ROL.ToUpper() == "FORMULADOR")
            {
                pnl_coordinador.Visible = true;
                gv_beneficiarios.Columns[7].Visible = true;
                gv_beneficiarios.Columns[8].Visible = false;
                gv_beneficiarios.Columns[9].Visible = false;
                gv_beneficiarios.Columns[4].Visible = false;
                gv_beneficiarios.DataSource = beneficiarios.FindAll(b => b.Estado == "B02");
            }

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

        protected void btn_asignarConsultor_OnClick(object sender, EventArgs e)
        {
            var personaId = Convert.ToInt32(hd_idPersona.Text);
            var consultorId = Convert.ToInt32(ddl_consultores.SelectedValue);

            A_ASIG_CONSULTOR.AsignarConsultorABeneficiario(0, 0, personaId, consultorId);

            Response.Redirect(Request.RawUrl);
        }

    }
}