using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL.Acciones;
using BLL.Modelos;
using BLL.Modelos.ModelosVistas;
using System.Security.Principal;

namespace MinecPISI.Views.Administracion
{
    public partial class logout : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                btn_restart_sesion.Visible = false;
                txt_password.Attributes.Add("required", "true");

                //Comprobando si no posee una sesion activa

                if (Session["usuario"] != null)
                {
                    A_USUARIO u = new A_USUARIO();

                    //Verificando el estado de la sesion
                    int estado_sesion = u.getEstadoSesion(((MV_DetalleUsuario)Session["usuario"]).ID_USUARIO, Session.SessionID);

                    if (estado_sesion == A_USUARIO.SESION_EXISTENTE)
                    {
                        redirigir(((MV_DetalleUsuario)Session["usuario"]).ID_USUARIO, ((MV_DetalleUsuario)Session["usuario"]).ID_ROL);
                    }
                }
            }
        }

        /// <summary>
        /// Método que autentica al usuario con las credenciales ingresadas. Si se comprueban correctas, lo redirige a su pantalla de inicio (según su rol); sino, le permite un nuevo intento de corregir sus credenciales
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btn_login_Click(object sender, EventArgs e)
        {
            A_USUARIO u = new A_USUARIO();
            A_PERSONA p = new A_PERSONA();

            TB_PERSONA persona = p.getPersonaByCorreoE(txt_email.Text);     //Si las credenciales son correctas, se busca la información de la persona

            if (persona == null)
            {
                lbl_errors.Attributes.Remove("hidden");
                lbl_errors.Text = "Usuario o contraseña incorrectos";
                return;
            }

            TB_USUARIO usuario = u.getUsuarioByPersona(persona.ID_PERSONA);               //A partir de la persona se extrae el resto de la información del usuario

            //Verificando las credenciales
            if (!u.Autenticar(txt_email.Text, txt_password.Text))
            {
                lbl_errors.Attributes.Remove("hidden");
                lbl_errors.Text = "Usuario o contraseña incorrectos";
                return;
            }

            //Verificando el estado de la sesion
            int estado_sesion = u.getEstadoSesion(usuario.ID_USUARIO, Session.SessionID);

            //Tomando acciones segun resultado de la comprobacion:
            switch (estado_sesion)
            {
                case A_USUARIO.SESION_EXISTENTE_NO_EQUIVALENTE:
                    //Sesion abierta, del que no es propietario. Preguntar si cerrar
                    btn_restart_sesion.Visible = true;
                    //btn_login.Visible = false;
                    txt_password.Attributes.Remove("required");
                    Session["old_email"] = txt_email.Text;
                    return;

                case A_USUARIO.SESION_NO_EXISTENTE:
                    //Sesion nueva
                    u.updateUsuarioAsAutenticado(usuario.ID_USUARIO, Session.SessionID, true);
                    redirigir(usuario.ID_USUARIO, usuario.ID_ROL);
                    break;

                case A_USUARIO.SESION_EXISTENTE:
                    //Sesion abierta, pero del que es propietario
                    redirigir(usuario.ID_USUARIO, usuario.ID_ROL);
                    break;
            }
        }

        protected void btn_restart_sesion_Click(object sender, EventArgs e)
        {
            A_USUARIO u = new A_USUARIO();
            A_PERSONA p = new A_PERSONA();

            //Evitando el robo de sesion
            string email = txt_email.Text;

            //Si se ha habilitado el boton para cerrar la sesion anterior, la contrasena no sera requerida,
            //Pero si intenta iniciar sesion con otro usuario, la contrasena sera requerida
            if (!email.Equals(Session["old_email"]))
            {
                //Ocultando boton de cerrar sesion activa
                btn_restart_sesion.Visible = true;

                //Haciendo obligatoria la contrasena
                txt_password.Attributes.Add("required", "true");

                //Mostrando errores
                lbl_errors.Attributes.Remove("hidden");
                lbl_errors.Text = "Usuario o contraseña incorrectos";

                //Ocultando boton magico
                btn_restart_sesion.Visible = false;

                //Borrando la información de la Sesión
                Session.Remove("old_email");

                return;
            }

            //Borrando la información de la Sesión
            Session.Remove("old_email");

            TB_PERSONA persona = p.getPersonaByCorreoE(txt_email.Text);     //Si las credenciales son correctas, se busca la información de la persona

            TB_USUARIO usuario = u.getUsuarioByPersona(persona.ID_PERSONA);               //A partir de la persona se extrae el resto de la información del usuario

            //Escribiendo en BD que se actualizara el ID de la sesion que usara el usuario
            u.updateUsuarioAsAutenticado(usuario.ID_USUARIO, Session.SessionID, true);

            //Redirigiendo hacia la pagina correspondiente del rol
            redirigir(usuario.ID_USUARIO, usuario.ID_ROL);
        }

        protected void redirigir(int id_usuario, int id_rol)
        {
            A_ROL r = new A_ROL();
            A_USUARIO u = new A_USUARIO();

            //Guardando la información del usuario en la sesión
            Session["usuario"] = u.getUsuarioDetallesById(id_usuario);
            
            //Extrayendo el rol del usuario
            string rol = ((MV_DetalleUsuario)Session["usuario"]).NOMBRE_ROL.ToUpper();

            //Redirigiendo hacia la página correcta
            switch (rol)
            {
                case "ADMINISTRADOR":
                    Response.RedirectToRoute("AdministrarUsuarios");     //crud de usuarios
                    break;

                case "BENEFICIARIO":
                    Response.RedirectToRoute("ConsultarPropuestas");     //Consultar propuestas de solución
                    break;

                case "CONSULTOR":
                    Response.RedirectToRoute("ConsultarBeneficiario"); 
                    break;

                case "COORDINADOR":
                    Response.RedirectToRoute("ConsultarBeneficiario");
                    break;
                case "FORMULADOR":
                    Response.RedirectToRoute("RegistrarExperiencia");
                    break;
                case "COMITÉ EVALUADOR":
                    Response.RedirectToRoute("ConsultarIniciativa");
                    break;
                case "PRESIDENTE":
                    Response.RedirectToRoute("ConsultarIniciativa");
                    break;
            }
        }
    }
}