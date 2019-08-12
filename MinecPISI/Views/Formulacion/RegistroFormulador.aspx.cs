using BLL.Acciones;
using BLL.Helpers;
using BLL.Modelos;
using BLL.Modelos.ModelosVistas;
using MinecPISI.ViewModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MinecPISI.Views.Formulacion
{
    public partial class RegistroFormulador : System.Web.UI.Page
    {
        protected void RegistrarFormuladorClick(object sender, EventArgs e)
        {
            var aUsuario = new A_USUARIO();
            var aPersona = new A_PERSONA();
            var aRol = new A_ROL();

            var aFormulador = new A_FORMULADOR();

            lbl_error_password2.Text = "";
            lbl_errorCorreo.Text = "";

            if (txt_pass1.Text != txt_pass2.Text)
            {
                lbl_error_password2.Text = "Las contraseñas deben coincidir";
                lbl_error_password2.ForeColor = System.Drawing.Color.Red;
                return;
            }
            else
            {
                if (aPersona.EsCorreoUnico(txt_correo.Text) == 1)
                {
                    lbl_errorCorreo.Text = "Este correo ya fue registrado anteriormente";
                    return;
                }
            }
        


        var persona = new TB_PERSONA
            {
                NOMBRES = txt_nombre.Text,
                APELLIDOS = txt_apellido.Text,
                CORREO_E = txt_correo.Text,
                DIRECCION = txt_dir.Text,
                TEL_FIJO = txt_tel.Text,
                TEL_CEL = txt_cel.Text
            };

            var idRol = aRol.getRolByNombre("Formulador").ID_ROL;
            var res = new MV_Exception();

            res = aPersona.AlmacenarPersona(persona, 0);

            if (res.IDENTITY != null)
            {

                int idPersona = Convert.ToInt32(res.IDENTITY);

                var usuario = new TB_USUARIO
                {
                    NOMBRE_USUARIO = txt_correo.Text,
                    ID_PERSONA = idPersona,
                    ID_ROL = idRol,
                    CONTRASENA = txt_pass1.Text
                };

                res = aUsuario.createUsuario(usuario, 0);

                int idUsuario = Convert.ToInt32(res.IDENTITY);

                var formulador = new TB_FORMULADOR
                {
                    ID_PERSONA = idPersona,
                    GRADO_ACADEMICO = txt_grado.Text,
                    ANIOS_EXPERIENCIA = Convert.ToInt16(txt_experiencia.Text),
                    ACTIVO = false
                };

                res = aFormulador.insertFormulador(formulador, idUsuario);
                formulador.ID_FORMULADOR = Convert.ToInt32(res.IDENTITY);
                A_NOTIFICACION.GuardarNotificacion(A_USUARIO.obtenerCoordinador().ID_USUARIO, 0, "IF02");
                ////Guardando el formulador en la sesión
                //Session["formulador"] = formulador;

                ////Guardando la información del usuario en la sesión
                //Session["usuario"] = aUsuario.getUsuarioDetallesById(idUsuario);

                //aUsuario.updateUsuarioAsAutenticado(idUsuario, Session.SessionID, true);
                ScriptManager.RegisterStartupScript(this, GetType(), "Pop", "ShowMessage('Registro de formulador exitoso, ahora debera agregar su experiencia al momento de loguearse', 'success');", true);
                btn.Visible = false;
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "Pop", "ShowMessage('Error al guardar el registro de datos personales</strong>', 'error');", true);
            }
        }
    }
}