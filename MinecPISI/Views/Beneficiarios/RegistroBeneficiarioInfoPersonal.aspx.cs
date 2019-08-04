using MinecPISI.ViewModels;
using System;
using BLL.Acciones;

namespace MinecPISI.Views.Beneficiarios
{
    public partial class RegistroBeneficiario1 : System.Web.UI.Page
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

            if (IsPostBack) return;

            if (_registroViewModel.InfoPersonal == null)
                return;

            #region Inicializar Campos

            beneficiario.Checked = _registroViewModel.InfoPersonal.EsBeneficiario;
            asociacion.Checked = !_registroViewModel.InfoPersonal.EsBeneficiario;
            txt_nombre.Text = _registroViewModel.InfoPersonal.Nombres;
            txt_apellido.Text = _registroViewModel.InfoPersonal.Apellidos;
            txt_tel.Text = _registroViewModel.InfoPersonal.Telefono;
            txt_cel.Text = _registroViewModel.InfoPersonal.Celular;
            txt_dui.Text = _registroViewModel.InfoPersonal.Dui;
            txt_nit.Text = _registroViewModel.InfoPersonal.Nit;

            #endregion
        }

        protected void OnSiguienteClick(object sender, EventArgs e)
        {
            lbl_dui.Text = "";

            if (A_BENEFICIARIO.ValidarDui(txt_dui.Text) >0 )
            {
                lbl_dui.Text = "Ya existe un registro con ese numero de dui";
                return;
            }

            _registroViewModel.InfoPersonal = LlenarViewModel();

            Session["registroData"] = _registroViewModel;

            if (beneficiario.Checked && !asociacion.Checked)
                Session["tipoPersona"] = "personaNatural";
            else
                Session["tipoPersona"] = "personaJuridica";

            Response.RedirectToRoute("RegistroBeneficiario03");
        }
        
        protected void OnAnteriorClick(object sender, EventArgs e)
        {
            lbl_dui.Text = "";

            if (A_BENEFICIARIO.ValidarDui(txt_dui.Text) > 0)
            {
                lbl_dui.Text = "Ya existe un registro con ese numero de dui";
                return;
            }

            _registroViewModel.InfoPersonal = LlenarViewModel();

            Session["registroData"] = _registroViewModel;

            Response.RedirectToRoute("RegistroBeneficiario01");
        }

        private InformacionPersonalViewModel LlenarViewModel()
        {
            var infoPersonalViewModel = new InformacionPersonalViewModel(esBeneficiario: true, nombres: txt_nombre.Text, apellidos: txt_apellido.Text,
                telefono: txt_tel.Text, celular: txt_cel.Text, dui: txt_dui.Text, nit: txt_nit.Text);

            if (beneficiario.Checked && !asociacion.Checked)
                infoPersonalViewModel.EsBeneficiario = true;
            else
                infoPersonalViewModel.EsBeneficiario = false;

            return infoPersonalViewModel;
        }
    }
}