using BLL.Acciones;
using MinecPISI.ViewModels;
using System;
using System.Web.UI;

namespace MinecPISI.Views.Beneficiarios
{
    public partial class RegistroBeneficiarioP4Credenciales : Page
    {
        private RegistroBeneficiarioViewModel _registroViewModel;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["registroData"] != null)
                _registroViewModel = (RegistroBeneficiarioViewModel)Session["registroData"];
            else
            {
                _registroViewModel = new RegistroBeneficiarioViewModel();
                return;
            }

            Session["tipoPersona"] = "";

            if (IsPostBack) return;

            txt_correo.Text = _registroViewModel.InfoCredenciales.Correo;
            txt_password1.Text = _registroViewModel.InfoCredenciales.Password;
            txt_password2.Text = _registroViewModel.InfoCredenciales.Password;
        }

        protected void OnSiguienteClick(object sender, EventArgs e)
        {
            lbl_error_password2.Text = "";
            lbl_errorCorreo.Text = "";

            if (txt_password1.Text != txt_password2.Text)
            {
                lbl_error_password2.Text = "Las contraseñas deben coincidir";
                lbl_error_password2.ForeColor = System.Drawing.Color.Red;
            }
            else
            {
                var aPersona = new A_PERSONA();

                if (aPersona.EsNombreUsuarioUnico(txt_correo.Text) == 1)
                {
                    lbl_errorCorreo.Text = "Este correo ya fue registrado anteriormente";
                    return;
                }

                _registroViewModel.InfoCredenciales = _registroViewModel.InfoCredenciales == null
                    ? new InformacionCredencialesViewModel(txt_correo.Text, txt_password1.Text)
                    : new InformacionCredencialesViewModel(txt_correo.Text, txt_password1.Text, _registroViewModel.InfoCredenciales.PersonaId);

                Session["registroData"] = _registroViewModel;

                Response.RedirectToRoute("RegistroBeneficiario02");
            }
        }
    }
}