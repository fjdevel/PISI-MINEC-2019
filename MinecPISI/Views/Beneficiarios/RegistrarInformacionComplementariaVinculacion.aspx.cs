using BLL.Acciones;
using BLL.Modelos.ModelosVistas;
using MinecPISI.ViewModels;
using System;
using System.Web.UI;

namespace MinecPISI.Views.Beneficiarios
{
    public partial class RegistrarInformacionComplementariaVinculacion : Page
    {
        private MV_DetalleBeneficiario _detalleBeneficiario = new MV_DetalleBeneficiario();
        protected void Page_Load(object sender, EventArgs e)
        {
            _detalleBeneficiario = (MV_DetalleBeneficiario)Session["beneficiarioData"];

            if (IsPostBack)
                return;

            #region Inicialización de Dropdows

            var aSector = new A_SECTOR_ECONOMICO();
            var aMunicipio = new A_MUNICIPIO();

            ddl_sector.DataSource = aSector.ObtenerSectores();
            ddl_sector.DataTextField = "NOMBRE";
            ddl_sector.DataValueField = "ID_SECTOR_ECONOMICO";
            ddl_sector.DataBind();

            ddl_municipio.DataSource = aMunicipio.ObtenerMunicipiosXDepartamento(_detalleBeneficiario.IdDepartamento);
            ddl_municipio.DataTextField = "NOMBRE";
            ddl_municipio.DataValueField = "ID_MUNICIPIO";
            ddl_municipio.DataBind();

            ddl_sector.SelectedValue = _detalleBeneficiario.IdSector.ToString();
            ddl_municipio.SelectedValue = _detalleBeneficiario.IdMunicipio.ToString();

            #endregion

            lbl_nombre.Text = _detalleBeneficiario.NOMBRES + ' ' + _detalleBeneficiario.APELLIDOS;
            lbl_telefono.Text = _detalleBeneficiario.TEL_FIJO;
            lbl_nit.Text = _detalleBeneficiario.NIT;
            lbl_muni.Text = _detalleBeneficiario.MUNICIPIO;
            txt_dui.Text = _detalleBeneficiario.DUI.Trim();
            txt_nit.Text = _detalleBeneficiario.NIT.Trim();
        }

        protected void OnSiguienteClick(object sender, EventArgs e)
        {
            if (AlmacenarDatos()) //almacenamiento info
                Response.RedirectToRoute("DatosComplementariosBeneficiario2", new { id = _detalleBeneficiario.ID_BENEFICIARIO });
        }

        private bool AlmacenarDatos()
        {
            var ubica = hd_ubicacion.Value;

            if (string.IsNullOrEmpty(ubica))
            {
                ubica = "0,0";
            }
            ubica = ubica.Trim();
            var ubicaciones = ubica.Split(',');

            var infoComplementariaViewModel = new InfoComplementariaViewModel(txt_dui.Text,
                txt_infoComplementaria.Value, txt_medio.Value, txt_nit.Text,
                Convert.ToInt32(ddl_municipio.SelectedValue), Convert.ToInt32(ddl_sector.SelectedValue),
                chk_tiempo.Checked, chk_ventas.Checked, activos.Checked, ubicaciones[0], ubicaciones[1]);

            Session["infoComplementaria"] = infoComplementariaViewModel;

            return true;
        }

    }
}