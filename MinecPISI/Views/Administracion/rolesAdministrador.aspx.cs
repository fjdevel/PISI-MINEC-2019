using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL.Acciones;
using BLL.Modelos;
using BLL.Helpers;
using System.Web.Script.Serialization;

namespace MinecPISI.Views.Administracion
{
    public partial class rolesAdministrador : System.Web.UI.Page
    {
        public List<TB_ROL> data;
        public List<Dictionary<string, string>> recursos = new List<Dictionary<string, string>>();
        public string temp;

        public string errores;
        public string info;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["usuario"] == null)
            {
                Response.RedirectToRoute("Login");
                return;
            }
                errores = "";
                info = "";

            switch (Request.Form["m"])
            {
                case "pos":
                    agregarRol();
                    break;

                case "put":
                    editarRol();
                    break;

                case "del":
                    eliminarRol();
                    break;
            }


            data = new A_ROL().getAll();
            listarRecursos();
        }

        protected void listarRecursos()
        {
            List<TB_RECURSO> list = new A_RECURSO().getAll();

            foreach(var r in list)
            {
                Dictionary<string, string> t = new Dictionary<string, string>();
                t.Add("id", r.ID_RECURSO.ToString());
                t.Add("recurso", r.NOMBRE);

                recursos.Add(t);
            }
        }

        protected void agregarRol()
        {
            List<string> res = new List<string>();

            TB_ROL rol = new TB_ROL();

            rol.NOMBRE = Request.Form["txt_editar_nombre"];
            rol.DESCRIPCION = Request.Form["txt_editar_descripcion"];

            res = new A_ROL().insertRol(rol, ((BLL.Modelos.ModelosVistas.MV_DetalleUsuario)Session["usuario"]).ID_USUARIO);

            if (res != null)
            {
                errores = H_Objetos.ListMensajesToString(res);
            }

            //Después de haber guardado el rol, se procederá a guardar los permisos
            res = guardarPermisos(Request.Form["txt_editar_permisos"], rol);
            
            if (res != null)
            {
                errores = H_Objetos.ListMensajesToString(res);
                return;
            }

            info = "Rol creado correctamente";
        }

        protected void editarRol()
        {
            List<string> res = new List<string>();

            TB_ROL rol = new TB_ROL();

            rol.ID_ROL = int.Parse(Request.Form["txt_editar_id_rol"]);
            rol.NOMBRE = Request.Form["txt_editar_nombre"];
            rol.DESCRIPCION = Request.Form["txt_editar_descripcion"];

            res = new A_ROL().updateRol(rol, ((BLL.Modelos.ModelosVistas.MV_DetalleUsuario)Session["usuario"]).ID_USUARIO);

            if (res != null)
            {
                errores = H_Objetos.ListMensajesToString(res);
                return;
            }

            borrarPermisos(rol);

            //Creando los nuevos permisos
            res = guardarPermisos(Request.Form["txt_editar_permisos"], rol);

            if (res != null)
            {
                errores = H_Objetos.ListMensajesToString(res);
                return;
            }

            info = "Rol actualizado correctamente";
        }

        protected void eliminarRol()
        {
            string res;

            TB_ROL rol = new TB_ROL();

            rol.ID_ROL = int.Parse(Request.Form["txt_borrar_id_rol"]);

            borrarPermisos(rol);

            res = new A_ROL().softDeleteRol(rol, ((BLL.Modelos.ModelosVistas.MV_DetalleUsuario)Session["usuario"]).ID_USUARIO);

            if (!string.IsNullOrEmpty(res))
            {
                errores = res;
                return;
            }

            info = "Rol eliminado correctamente";
        }

        protected List<string> guardarPermisos(string recursos, TB_ROL rol)
        {
            List<string> err = null;

            if (!string.IsNullOrEmpty(recursos))
            {
                try
                {
                    rol = new A_ROL().getRolByNombre(rol.NOMBRE);       //Consultado el rol que acaba de ser guardado

                    string[] r = recursos.Split(',');   //Separando los PK de los recursos por coma

                    foreach (string i in r)
                    {
                        if (!string.IsNullOrEmpty(i))
                        {
                            TB_RECURSO recurso = new TB_RECURSO();
                            recurso.ID_RECURSO = int.Parse(i);
                            err = new A_PERMISO().createPermiso(rol, recurso, ((BLL.Modelos.ModelosVistas.MV_DetalleUsuario)Session["usuario"]).ID_USUARIO);
                        }
                    }
                }
                catch (Exception e)
                {
                    err = new List<string>();
                    err.Add(e.Message);
                }
            }

            return err;
        }

        protected void borrarPermisos(TB_ROL rol)
        {
            //Borrando permisos anteriores
            List<TB_RECURSO> p_old = new A_PERMISO().getRecursosByRol(rol.ID_ROL);

            foreach (TB_RECURSO p in p_old)
            {
                TB_PERMISO temp = new TB_PERMISO();
                temp.ID_ROL = rol.ID_ROL;
                temp.ID_PERMISO = p.ID_RECURSO;

                new A_PERMISO().hardDeletePermiso(temp);
            }
        }
    }
}