using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL.Acciones;
using MinecPISI.ViewModels;

namespace MinecPISI.Views.Beneficiarios
{
    public partial class RegistroBeneficiarioP2ActividadEconomica : System.Web.UI.Page
    {
        private RegistroBeneficiarioViewModel _registroViewModel;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["registroData"] != null)
                _registroViewModel = (RegistroBeneficiarioViewModel)Session["registroData"];
            else
            {
                Response.RedirectToRoute("RegistroBeneficiario01");
                return;
            }

            #region Inicialización de Dropdows

            lbl_muni.Visible = false;

            if (ddl_sector.Items.Count == 1 && ddl_depto.Items.Count == 1)
            {
                var aSector = new A_SECTOR_ECONOMICO();
                var aDepto = new A_DEPARTAMENTO();

                ddl_sector.DataSource = aSector.ObtenerSectores();
                ddl_sector.DataTextField = "NOMBRE";
                ddl_sector.DataValueField = "ID_SECTOR_ECONOMICO";
                ddl_sector.DataBind();

                ddl_depto.DataSource = aDepto.ObtenerDeptos();
                ddl_depto.DataTextField = "NOMBRE";
                ddl_depto.DataValueField = "ID_DEPARTAMENTO";
                ddl_depto.DataBind();
            }

            #endregion

            if (_registroViewModel.InfoActividadEconomica == null)
                return;

            if (IsPostBack) return;

            #region Inicializar Formulario

            txt_direccion.Text = _registroViewModel.InfoActividadEconomica.Direccion;
            ddl_sector.SelectedValue = _registroViewModel.InfoActividadEconomica.SectorId.ToString();
            ddl_depto.SelectedValue = _registroViewModel.InfoActividadEconomica.DepartamentoId.ToString();

            LlenarMunicipios();

            ddl_municipio.SelectedValue = _registroViewModel.InfoActividadEconomica.MunicipioId.ToString();

            #endregion

        }

        protected void OnSiguienteClick(object sender, EventArgs e)
        {
            if (ddl_municipio.SelectedIndex == 0)
            {
                lbl_muni.Visible = true;
            }
            else
            {
                _registroViewModel.InfoActividadEconomica = LlenarViewModel();
                Session["registroData"] = _registroViewModel;
                Response.RedirectToRoute(Session["tipoPersona"].ToString() == "personaJuridica" ? "RegistroAsociacion" : "RegistroBeneficiario04");
            }

            
        }
        protected void OnAnteriorClick(object sender, EventArgs e)
        {
            _registroViewModel.InfoActividadEconomica = LlenarViewModel();

            Session["registroData"] = _registroViewModel;

            Response.RedirectToRoute("RegistroBeneficiario02");
        }

        protected void ddl_depto_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            LlenarMunicipios();
        }
        private void LlenarMunicipios()
        {
            if (ddl_depto.SelectedIndex != 0)
            {
                var aMunicipio = new A_MUNICIPIO();

                ddl_municipio.Items.Clear();
                ddl_municipio.Items.Insert(0, new ListItem("--Seleccionar--", "0"));

                ddl_municipio.DataSource = aMunicipio.ObtenerMunicipiosXDepartamento(Convert.ToInt32(ddl_depto.SelectedValue));
                ddl_municipio.DataTextField = "NOMBRE";
                ddl_municipio.DataValueField = "ID_MUNICIPIO";
                ddl_municipio.DataBind();
            }
            else
            {
                ddl_municipio.Items.Clear();
                ddl_municipio.Items.Insert(0, new ListItem("--Seleccione un departamento primero--", "0"));
            }
        }

        private InformacionActividadEconomicaViewModel LlenarViewModel()
        {
            var infoEconomicaViewModel = new InformacionActividadEconomicaViewModel(direccion: txt_direccion.Text,
                sectorId: Convert.ToInt32(ddl_sector.SelectedValue),
                departamentoId: Convert.ToInt32(ddl_depto.SelectedValue),
                municipioId: Convert.ToInt32(ddl_municipio.SelectedValue));

            return infoEconomicaViewModel;
        }
    }
}