using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL.Modelos;
using BLL.Acciones;
using BLL.Helpers;
using BLL.Modelos.ModelosVistas;

namespace MinecPISI.Views.Administracion
{
    public partial class usuariosAdministrador : System.Web.UI.Page
    {
        public List<TB_PERSONA> data;
        public List<TBC_DEPARTAMENTO> departamentos;

        //VARIABLES DE MENSAJES
        public string errores;
        public string info;

        //BANDERA DE VISUALIZACION DE MENSAJE
        public bool showed;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["usuario"] == null)
                Response.RedirectToRoute("Login");


            errores = "";
            info = "";

            switch (Request.Form["m"])
            {
                case "pos":
                    agregarUsuario();
                    break;

                case "put":
                    editarUsuario();
                    break;

                case "del":
                    eliminarUsuario();
                    break;
            }

            data = new A_PERSONA().getAll();
            departamentos = new A_DEPARTAMENTO().ObtenerDeptos();

            //Desactivando mensajes
            showed = false;
        }

        public void agregarUsuario()
        {
            try
            {
                A_USUARIO u = new A_USUARIO();
                A_PERSONA p = new A_PERSONA();

                var contrasena1 = Request.Form["txt_contrasena1"];
                var contrasena2 = Request.Form["txt_contrasena2"];

                if (string.IsNullOrWhiteSpace(contrasena1) || string.IsNullOrWhiteSpace(contrasena2) || !u.testContraseñas(contrasena1, contrasena2))
                {
                    errores = "Usuario no guardado. La contraseña no puede estar vacía ni contener solo espacios";
                    return;
                }
                
                if (contrasena1.Length < A_USUARIO.MAX_CARACTERES_CONTRASEÑA)
                {
                    errores = "La contraseña debe contener " + A_USUARIO.MAX_CARACTERES_CONTRASEÑA + " caractes o mas";
                    return;
                }

                //Construyendo a la persona
                TB_PERSONA persona = new TB_PERSONA();

                persona.NOMBRES = Request.Form["txt_nombres"];
                persona.APELLIDOS = Request.Form["txt_apellidos"];
                persona.CORREO_E = Request.Form["txt_correo"];
                persona.TEL_FIJO = Request.Form["txt_telefono_fijo"];
                persona.TEL_FIJO = Request.Form["txt_telefono_cel"];

                string municipio = Request.Form["sel_id_municipio"];

                persona.ID_MUNICIPIO = int.Parse(municipio);

                //Probando si el correo no fue registrado para otra persona antes:
                TB_PERSONA p_prueba = p.getPersonaByCorreoE(persona.CORREO_E);

                if (p_prueba != null)
                {
                    errores = "El correo electrónico ya está registrado";
                    return;
                }

                MV_Exception res = p.AlmacenarPersona(persona, ((MV_DetalleUsuario)Session["usuario"]).ID_USUARIO);

                if (res.IDENTITY == null)
                    throw new Exception(res.ERROR_MESSAGE);

                persona.ID_PERSONA = int.Parse(res.IDENTITY.ToString());

                //Construyendo al usuario
                TB_USUARIO usuario = new TB_USUARIO();

                usuario.NOMBRE_USUARIO = Request.Form["txt_nombre_usuario"];
                usuario.CONTRASENA = Request.Form["txt_contrasena1"];
                usuario.ID_ROL = int.Parse(Request.Form["sel_id_rol"]);
                usuario.NOMBRE_USUARIO = Request.Form["txt_nombre_usuario"];
                usuario.ID_PERSONA = persona.ID_PERSONA;

                res = u.createUsuario(usuario, ((MV_DetalleUsuario)Session["usuario"]).ID_USUARIO);
                
                info = "Usuario agregado correctamente";
            }
            catch (Exception e)
            {
                errores = e.Message;
                H_LogErrorEXC.GuardarRegistroLogError(e);
            }
        }

        public void editarUsuario()
        {
            try
            {
                //Construyendo a la persona
                TB_PERSONA persona = new TB_PERSONA();

                persona.ID_PERSONA = int.Parse(Request.Form["txt_id_persona"]);
                persona.NOMBRES = Request.Form["txt_nombres"];
                persona.APELLIDOS = Request.Form["txt_apellidos"];
                persona.CORREO_E = Request.Form["txt_correo"];
                persona.TEL_FIJO = Request.Form["txt_telefono_fijo"];
                persona.TEL_CEL = Request.Form["txt_telefono_cel"];
                persona.ID_MUNICIPIO = int.Parse(Request.Form["sel_id_municipio"]);

                new A_PERSONA().editarPersona(persona, ((MV_DetalleUsuario)Session["usuario"]).ID_USUARIO);

                //Construyendo al usuario
                TB_USUARIO usuario = new TB_USUARIO();

                usuario.ID_USUARIO = int.Parse(Request.Form["txt_id_usuario"]);
                usuario.NOMBRE_USUARIO = Request.Form["txt_nombre_usuario"];
                usuario.ID_ROL = int.Parse(Request.Form["sel_id_rol"]);
                usuario.ID_PERSONA = new A_PERSONA().getPersonaByCorreoE(persona.CORREO_E).ID_PERSONA;

                //Controlando si se cambia o no la contraseña
                string contrasena = Request.Form["txt_contrasena1"];

                if (!string.IsNullOrWhiteSpace(contrasena))  //Si la contraseña NO está en blanco es porque QUIERE cambiarla
                    usuario.CONTRASENA = contrasena;
                else
                    usuario.CONTRASENA = null;

                new A_USUARIO().updateUsuario(usuario, ((BLL.Modelos.ModelosVistas.MV_DetalleUsuario)Session["usuario"]).ID_USUARIO);
                
                info = "Usuario editado correctamente";
            }
            catch (Exception e)
            {
                errores = e.Message;
                H_LogErrorEXC.GuardarRegistroLogError(e);
            }
        }

        public void eliminarUsuario()
        {
            try
            {
                //Borrando al usuario
                TB_USUARIO usuario = new A_USUARIO().getUsuarioById(int.Parse(Request.Form["txt_borrar_id_usuario"]));

                MV_Exception res = new A_USUARIO().softDeleteUsuario(usuario, ((BLL.Modelos.ModelosVistas.MV_DetalleUsuario)Session["usuario"]).ID_USUARIO);

                //Borrando a la persona
                TB_PERSONA persona = new A_PERSONA().getPersonaById(int.Parse(Request.Form["txt_borrar_id_persona"]));

                new A_PERSONA().softDeletePersona(persona, ((MV_DetalleUsuario)Session["usuario"]).ID_USUARIO);

                info = "Usuario eliminado correctamente";
            }
            catch (Exception e)
            {
                errores = e.Message;
                H_LogErrorEXC.GuardarRegistroLogError(e);
            }
        }
    }
}