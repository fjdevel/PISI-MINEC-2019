using BLL.Acciones;
using BLL.Helpers;
using BLL.Modelos;
using BLL.Modelos.ModelosVistas;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MinecPISI.Views.Catalogos
{
    public partial class TipoIniciativa : System.Web.UI.Page
    {

        public List<TBC_TIPO_INICIATIVA> data;
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
                    agregarTipoIniciativa();
                    break;

                case "put":
                    editarTipoIniciativa();
                    break;

                case "del":
                    eliminarTipoIniciativa();
                    break;
            }

            data = new A_TIPO_INICIATIVA().ObtenerIniciativas();
        }

        public void agregarTipoIniciativa()
        {
            try
            {
                //Creamos la accion del departamento
                A_TIPO_INICIATIVA a_tipo_iniciativa = new A_TIPO_INICIATIVA();

                var codigo_tipo_iniciativa = Request.Form["txt_codigo_tipo_iniciativa"];
                var nombre_tipo_iniciativa = Request.Form["txt_nombre_tipo_iniciativa"];

                if (string.IsNullOrWhiteSpace(codigo_tipo_iniciativa) || string.IsNullOrWhiteSpace(nombre_tipo_iniciativa))
                {
                    errores = "Tipo de iniciativa no guardada. Los campos no puede estar vacíos ni contener solo espacios";
                    return;
                }

                //Construyendo Departamento
                TBC_TIPO_INICIATIVA tipo_iniciativa = new TBC_TIPO_INICIATIVA();

                tipo_iniciativa.CODIGO_TIPO_INICIATIVA = Request.Form["txt_codigo_tipo_iniciativa"];
                tipo_iniciativa.NOMBRE = Request.Form["txt_nombre_tipo_iniciativa"];

                MV_Exception res = a_tipo_iniciativa.GuardarIniciativa(tipo_iniciativa, ((MV_DetalleUsuario)Session["usuario"]).ID_USUARIO);

                if (res.IDENTITY == null)
                    throw new Exception(res.ERROR_MESSAGE);

                tipo_iniciativa.ID_TIPO_INICIATIVA = int.Parse(res.IDENTITY.ToString());

                info = "Tipo de iniciativa agregada correctamente";
            }
            catch (Exception e)
            {
                errores = e.Message;
                H_LogErrorEXC.GuardarRegistroLogError(e);
            }
        }

        public void editarTipoIniciativa()
        {
            try
            {
                //Construyendo al departamento
                TBC_TIPO_INICIATIVA tipo_iniciativa = new TBC_TIPO_INICIATIVA();

                tipo_iniciativa.ID_TIPO_INICIATIVA = int.Parse(Request.Form["txt_id_tipo_iniciativa"]);
                tipo_iniciativa.CODIGO_TIPO_INICIATIVA = Request.Form["txt_codigo_tipo_iniciativa"];
                tipo_iniciativa.NOMBRE = Request.Form["txt_nombre_tipo_iniciativa"];

                new A_TIPO_INICIATIVA().editarIniciativa(tipo_iniciativa, ((MV_DetalleUsuario)Session["usuario"]).ID_USUARIO);

                info = "Departamento editado correctamente";
            }
            catch (Exception e)
            {
                errores = e.Message;
                H_LogErrorEXC.GuardarRegistroLogError(e);
            }
        }

        public void eliminarTipoIniciativa()
        {
            try
            {
                //Borrando al usuario
                TBC_TIPO_INICIATIVA tipo_iniciativa = new A_TIPO_INICIATIVA().geIniciativaById(int.Parse(Request.Form["txt_borrar_id_tipo_iniciativa"]));

                MV_Exception res = new A_TIPO_INICIATIVA().softDeleteIniciativa(tipo_iniciativa, ((BLL.Modelos.ModelosVistas.MV_DetalleUsuario)Session["usuario"]).ID_USUARIO);
                info = "Tipo de iniciativa eliminada correctamente";
            }
            catch (Exception e)
            {
                errores = e.Message;
                H_LogErrorEXC.GuardarRegistroLogError(e);
            }
        }

    }
}