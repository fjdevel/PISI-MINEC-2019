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
    public partial class EstadoProceso : System.Web.UI.Page
    {
        public List<TBC_ESTADO_PROCESO> data;
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
                    agregarEstadoProceso();
                    break;

                case "put":
                    editarEstadoProceso();
                    break;

                case "del":
                    eliminarEstadoProceso();
                    break;
            }

            data = new A_ESTADO_PROCESO().ObtenerEstadosProcesos();
        }

        public void agregarEstadoProceso()
        {
            try
            {
                //Creamos la accion del estado_proceso
                A_ESTADO_PROCESO a_estado_proceso = new A_ESTADO_PROCESO();

                var codigo_estado_proceso = Request.Form["txt_codigo_estado_proceso"];
                var descripcion_estado_proceso = Request.Form["txt_descripcion_estado_proceso"];
                var icono_estado_proceso = Request.Form["txt_icono_estado_proceso"];
                var color_estado_proceso = Request.Form["txt_color_estado_proceso"];

                if (string.IsNullOrWhiteSpace(codigo_estado_proceso) || 
                    string.IsNullOrWhiteSpace(descripcion_estado_proceso) ||
                    string.IsNullOrWhiteSpace(icono_estado_proceso) || string.IsNullOrWhiteSpace(color_estado_proceso))
                {
                    errores = "Estado de Proceso no guardado. Los campos no puede estar vacíos ni contener solo espacios";
                    return;
                }

                //Construyendo estado_proceso
                TBC_ESTADO_PROCESO estado_proceso = new TBC_ESTADO_PROCESO();

                estado_proceso.CODIGO_ESTADO_PROCESO = Request.Form["txt_codigo_estado_proceso"];
                estado_proceso.DESCRIPCION_ESTADO_PROCESO  = Request.Form["txt_descripcion_estado_proceso"];
                estado_proceso.ICONO_ESTADO_PROCESO = Request.Form["txt_icono_estado_proceso"];
                estado_proceso.COLOR_ESTADO_PROCESO  = Request.Form["txt_color_estado_proceso"];

                MV_Exception res = a_estado_proceso.GuardarEstadosProcesos(estado_proceso, ((MV_DetalleUsuario)Session["usuario"]).ID_USUARIO);

                if (res.IDENTITY == null)
                    throw new Exception(res.ERROR_MESSAGE);

                estado_proceso.ID_ESTADO_PROCESO = int.Parse(res.IDENTITY.ToString());

                info = "Estado de Proceso agregado correctamente";
            }
            catch (Exception e)
            {
                errores = e.Message;
                H_LogErrorEXC.GuardarRegistroLogError(e);
            }
        }

        public void editarEstadoProceso()
        {
            try
            {
                //Construyendo al estado_proceso
                TBC_ESTADO_PROCESO estado_proceso = new TBC_ESTADO_PROCESO();
                estado_proceso.ID_ESTADO_PROCESO = int.Parse(Request.Form["txt_id_estado_proceso"]);
                estado_proceso.CODIGO_ESTADO_PROCESO = Request.Form["txt_codigo_estado_proceso"];
                estado_proceso.DESCRIPCION_ESTADO_PROCESO = Request.Form["txt_descripcion_estado_proceso"];
                estado_proceso.ICONO_ESTADO_PROCESO = Request.Form["txt_icono_estado_proceso"];
                estado_proceso.COLOR_ESTADO_PROCESO = Request.Form["txt_color_estado_proceso"];


                new A_ESTADO_PROCESO().editarEstadosProcesos(estado_proceso, ((MV_DetalleUsuario)Session["usuario"]).ID_USUARIO);

                info = "Estado de Proceso editado correctamente";
            }
            catch (Exception e)
            {
                errores = e.Message;
                H_LogErrorEXC.GuardarRegistroLogError(e);
            }
        }

        public void eliminarEstadoProceso()
        {
            try
            {
                //Borrando al estado_proceso
                TBC_ESTADO_PROCESO estado_proceso = new A_ESTADO_PROCESO().geEstadoProcesoById(int.Parse(Request.Form["txt_borrar_id_estado_proceso"]));

                MV_Exception res = new A_ESTADO_PROCESO().softEstadosProcesos(estado_proceso, ((BLL.Modelos.ModelosVistas.MV_DetalleUsuario)Session["usuario"]).ID_USUARIO);
                info = "Estado de Proceso eliminado correctamente";
            }
            catch (Exception e)
            {
                errores = e.Message;
                H_LogErrorEXC.GuardarRegistroLogError(e);
            }
        }
    }
}