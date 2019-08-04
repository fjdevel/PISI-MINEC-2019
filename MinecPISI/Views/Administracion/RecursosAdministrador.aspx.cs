using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL.Modelos;
using BLL.Acciones;
using System.Web.Script.Serialization;

namespace MinecPISI.Views.Administracion
{
    public partial class RecursosAdministrador : System.Web.UI.Page
    {

        public List<TB_RECURSO> data;

        public string errores, info;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["usuario"] == null)
                Response.RedirectToRoute("Login");

            errores = info = "";

            switch(Request.Form["m"])
            {
                case "pos":
                    agregarRecurso();
                    break;

                case "put":
                    editarRecurso();
                    break;

                case "del":
                    eliminarRecurso();
                    break;
            }

            data = new A_RECURSO().getAll();
        }

        protected void agregarRecurso()
        {
            List<string> res = new List<string>();

            TB_RECURSO recurso = new TB_RECURSO();

            recurso.NOMBRE = Request.Form["txt_crear_nombre"];
            recurso.URL_RECURSO = Request.Form["txt_crear_url"];

            res = new A_RECURSO().createRecurso(recurso, ((BLL.Modelos.ModelosVistas.MV_DetalleUsuario)Session["usuario"]).ID_USUARIO);

            if (res != null)
            {
                errores = BLL.Helpers.H_Objetos.ListMensajesToString(res);
                return;
            }


            info = "Recurso registrado correctamente";
        }

        protected void editarRecurso()
        {
            List<string> res = new List<string>();

            TB_RECURSO recurso = new TB_RECURSO();

            recurso.ID_RECURSO = int.Parse(Request.Form["txt_editar_id_recurso"]);
            recurso.NOMBRE = Request.Form["txt_editar_nombre"];
            recurso.URL_RECURSO = Request.Form["txt_editar_url"];

            res = new A_RECURSO().updateRecurso(recurso, ((BLL.Modelos.ModelosVistas.MV_DetalleUsuario)Session["usuario"]).ID_USUARIO);

            if (res != null)
            {
                errores = BLL.Helpers.H_Objetos.ListMensajesToString(res);
                return;
            }

            info = "Recurso editado correctamente";
        }

        protected void eliminarRecurso()
        {
            TB_RECURSO recurso = new TB_RECURSO();

            recurso.ID_RECURSO = int.Parse(Request.Form["txt_borrar_id_recurso"]);

            new A_RECURSO().softDeleteRecurso(recurso, ((BLL.Modelos.ModelosVistas.MV_DetalleUsuario)Session["usuario"]).ID_USUARIO);

            info = "Recurso eliminado correctamente";
        }
    }
}