using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL.Acciones;
using BLL.Modelos;
using BLL.Modelos.ModelosVistas;

namespace MinecPISI.Views.Beneficiarios
{
    public partial class RegistroBeneficiario : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack) return;

            #region Inicialización de Dropdows

            var aDepto = new A_DEPARTAMENTO();

            ddl_depto.DataSource = aDepto.ObtenerDeptos();
            ddl_depto.DataTextField = "NOMBRE";
            ddl_depto.DataValueField = "ID_DEPARTAMENTO";
            ddl_depto.DataBind();

            #endregion

            panel_info.Visible = true;
        }

        protected void ddl_depto_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            var aMunicipio = new A_MUNICIPIO();

            if (ddl_depto.SelectedIndex != 0)
            {
                ddl_municipio.Items.Clear();

                var item = new ListItem("--Seleccionar--", "0");
                ddl_municipio.Items.Insert(0, item);

                int idDepto = Convert.ToInt32(ddl_depto.SelectedValue);

                ddl_municipio.DataSource = aMunicipio.ObtenerMunicipiosXDepartamento(idDepto);
                ddl_municipio.DataTextField = "NOMBRE";
                ddl_municipio.DataValueField = "ID_MUNICIPIO";
                ddl_municipio.DataBind();
            }
            else
            {
                ddl_municipio.Items.Clear();

                var item = new ListItem("--Seleccione un departamento primero--", "0");
                ddl_municipio.Items.Insert(0, item);
            }
        }

        protected void btn_enviar_OnClick(object sender, EventArgs e)
        {
            var aPersona = new A_PERSONA();

            if (aPersona.EsCorreoUnico(correo.Value) == 1)
            {
                lbl_errorCorreo.Text = "Este correo ya fue registrado anteriormente";
                return;
            }

            var persona = new TB_PERSONA
            {
                NOMBRES = nombre.Value,
                APELLIDOS = apellido.Value,
                CORREO_E = correo.Value,
                ID_MUNICIPIO = Convert.ToInt32(ddl_municipio.SelectedValue),
                TEL_FIJO = tel.Value.Trim(),
                TEL_CEL = cel.Value.Trim()
            };

            var res = aPersona.AlmacenarPersona(persona, ((MV_DetalleUsuario)Session["usuario"])?.ID_USUARIO ?? 0);

            A_ASIG_CONSULTOR.AsignarConsultorABeneficiario(persona.ID_MUNICIPIO, 0, Convert.ToInt32(res.IDENTITY), 0);
            
            int idCoordinador = 3;
            A_NOTIFICACION.GuardarNotificacion(idCoordinador,idCoordinador, "B01");

            panel_formulario.Visible = false;
            panel_mensaje.Visible = true;

        }

        protected void btn_ver_OnClick(object sender, EventArgs e)
        {
            panel_info.Visible = false;
            panel_formulario.Visible = true;
        }
    }
}