using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL.Modelos.ModelosVistas;
using BLL.Acciones;
using BLL.Modelos;

namespace MinecPISI.Views.Administracion
{
    
    public partial class ConsultoresMuniSector : System.Web.UI.Page
    {
        public List<MV_DetallePersonasConsultor> consultores;
        public List<TBC_DEPARTAMENTO> departamentos;
        public List<TBC_DEPARTAMENTO> departamentos2;
        protected void Page_Load(object sender, EventArgs e)
        {
            
            var aPersona = new A_PERSONA();

           

            consultores = aPersona.ObtenerConsultores();
            departamentos = new A_DEPARTAMENTO().ObtenerDeptos();
            if (ddl_depto.Items.Count == 1)
            {
                var aDepto = new A_DEPARTAMENTO();

                ddl_depto.DataSource = aDepto.ObtenerDeptos();
                ddl_depto.DataTextField = "NOMBRE";
                ddl_depto.DataValueField = "ID_DEPARTAMENTO";
                ddl_depto.DataBind();
            }
            List<TBC_MUNICIPIO> municipiosCompletos = new List<TBC_MUNICIPIO>();
            List<TBC_MUNICIPIO> municipiost = new List<TBC_MUNICIPIO>();

            foreach (var i in departamentos)
            {
                var amunicipio = new A_MUNICIPIO();
               municipiost = amunicipio.ObtenerMunicipiosXDepartamento(i.ID_DEPARTAMENTO);
                foreach(var j in municipiost)
                {
                    municipiosCompletos.Add(j);
                }
            }
            if(ddl_municipioA.Items.Count == 1)
            {
                ddl_municipioA.DataSource = municipiosCompletos;
                ddl_municipioA.DataTextField = "NOMBRE";
                ddl_municipioA.DataValueField = "ID_MUNICIPIO";
                ddl_municipioA.DataBind();
            }

            var a = municipiosCompletos;
            
            if (ddl_sector.Items.Count == 1)
            {
                var aSector = new A_SECTOR_ECONOMICO();

                ddl_sector.DataSource = aSector.ObtenerSectores();
                ddl_sector.DataTextField = "NOMBRE";
                ddl_sector.DataValueField = "ID_SECTOR_ECONOMICO";
                ddl_sector.DataBind();
               
            }
            if (IsPostBack) return;
            LlenarMunicipios();
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
        protected void GuardarConsultor_Click(object sender, EventArgs e)
        {
            var usuario = (MV_DetalleUsuario)Session["usuario"];
            TB_PERSONA consultor = new TB_PERSONA();
            consultor.CORREO_E = correoConsultor.Text;
            consultor.APELLIDOS = apellidoConsultor.Text;
            consultor.DIRECCION = direccionConsultor.Text;
            consultor.NOMBRES = nombreConsultor.Text;
            consultor.TEL_CEL = celularConsultor.Text;
            consultor.TEL_FIJO = telFijoConsultor.Text;
            consultor.ID_DEPARTAMENTO = Convert.ToInt32(ddl_depto.SelectedValue);
            consultor.ID_MUNICIPIO = Convert.ToInt32(ddl_municipio.SelectedValue);
            MV_Exception res = new A_PERSONA().AlmacenarPersona(consultor, ((MV_DetalleUsuario)Session["usuario"]).ID_USUARIO);

            if (res.IDENTITY == null)
                throw new Exception(res.ERROR_MESSAGE);

            consultor.ID_PERSONA = int.Parse(res.IDENTITY.ToString());

            TB_USUARIO usuarioConsultor = new TB_USUARIO();
            usuarioConsultor.NOMBRE_USUARIO = "consultor_"+consultor.ID_PERSONA;
            usuarioConsultor.CONTRASENA = passwordConsultor.Text;
            usuarioConsultor.ID_ROL = 3;
            usuarioConsultor.ID_PERSONA = consultor.ID_PERSONA;

            res = new A_USUARIO().createUsuario(usuarioConsultor, ((MV_DetalleUsuario)Session["usuario"]).ID_USUARIO);
            Response.RedirectToRoute("AsignacionConsultor");
        }

        protected void GuardarAsig_Click(object sender, EventArgs e)
        {
            var a = ddl_municipioA.SelectedValue;

           A_ASIG_CONSULTOR.GuardarAsignacion(Convert.ToInt32(idPersonaConsultorForm.Text), Convert.ToInt32(ddl_municipioA.SelectedValue), Convert.ToInt32(ddl_sector.SelectedValue));
            A_NOTIFICACION.GuardarNotificacion(new A_USUARIO().getUsuarioByPersona(Convert.ToInt32(idPersonaConsultorForm.Text)).ID_USUARIO, ((MV_DetalleUsuario)Session["usuario"]).ID_USUARIO, "IF01");
            ScriptManager.RegisterStartupScript(this, GetType(),
                    "alert",
                    "alert('felicidades! has creado una asignacion, se le notificara al consultor sobre dicha acción...');",
                    true);
        }
    }
}