using BLL.Acciones;
using BLL.Modelos.ModelosVistas;
using MinecPISI.ViewModels;
using System;
using System.Web.UI.WebControls;
using Convert = System.Convert;

namespace MinecPISI.Views.Beneficiarios
{
    public partial class ConsultarPersonasRegistroAyuda : System.Web.UI.Page
    {
        MV_DetalleUsuario usuario;
        protected void Page_Load(object sender, EventArgs e)
        {
            usuario = (MV_DetalleUsuario)Session["usuario"];

            var aPersona = new A_PERSONA();

            if (IsPostBack) return;

            if (usuario.NOMBRE_ROL.ToUpper() == "CONSULTOR")
            {
                gv_personas.Columns[4].Visible = false;
                gv_personas.Columns[8].Visible = false;
                gv_personas.Columns[9].Visible = false;
                gv_personas.Columns[10].Visible = true;
                gv_personas.DataSource = aPersona.ObtenerPersonasXConsultorAsignado(1, usuario.ID_PERSONA); // 0-> verificados y asignados a consultor
            }
            else if (usuario.NOMBRE_ROL.ToUpper() == "COORDINADOR")
            {
                gv_personas.DataSource = aPersona.ObtenerPersonasXConsultorAsignado(0, 0); // 1-> todos los no verificados

                ddl_consultores.DataSource = A_ASIG_CONSULTOR.ObtenerXMuniYSector(0, 0);
                ddl_consultores.DataTextField = "Value";
                ddl_consultores.DataValueField = "Key";
                ddl_consultores.DataBind();
            }

            gv_personas.DataBind();

        }

        protected void gv_personas_OnRowDataBound(object sender, GridViewRowEventArgs e)
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

        protected void btn_verificar_OnClick(object sender, EventArgs e)
        {
            var aPersona = new A_PERSONA();
            var aUsuario = new A_USUARIO();

            var personaId = Convert.ToInt32(hd_idPersona.Text);
            var consultorId = Convert.ToInt32(hd_idConsultor.Text);
            var nombreConsultor = hd_nombreConsultor.Text;

            if (nombreConsultor.ToUpper() != "SIN ASIGNAR")
            {
                aPersona.CambiarDireccionPersona(personaId, string.Empty);
                aPersona.CambiarFechaAsignacion(personaId, consultorId);

                var usuarioConsultor = aUsuario.getUsuarioByPersona(consultorId);

                A_NOTIFICACION.GuardarNotificacion(usuarioConsultor.ID_USUARIO, usuario.ID_USUARIO, "B01");
            }

            Response.Redirect(Request.RawUrl);
        }

        protected void btn_registar_OnClick(object sender, EventArgs e)
        {
            var aPersona = new A_PERSONA();
            var personaId = Convert.ToInt32(hd_idPersona.Text);

            var persona = aPersona.getPersonaById(personaId);
            var infoPersonal = new InformacionPersonalViewModel
            {
                Telefono = persona.TEL_FIJO.Trim(),
                Celular = persona.TEL_CEL.Trim(),
                Nombres = persona.NOMBRES,
                Apellidos = persona.APELLIDOS,
                EsBeneficiario = true
            };
            var infoEconomica = new InformacionActividadEconomicaViewModel
            {
                MunicipioId = (int)persona.ID_MUNICIPIO,
                DepartamentoId = persona.ID_DEPARTAMENTO
            };
            var infoCredenciales = new InformacionCredencialesViewModel
            {
                Correo = persona.CORREO_E,
                PersonaId = personaId
            };

            var registroViewModel = new RegistroBeneficiarioViewModel
            {
                InfoPersonal = infoPersonal,
                InfoActividadEconomica = infoEconomica,
                InfoCredenciales = infoCredenciales
            };

            Session["registroData"] = registroViewModel;

            Response.RedirectToRoute("RegistroBeneficiario01");
        }
    }
}