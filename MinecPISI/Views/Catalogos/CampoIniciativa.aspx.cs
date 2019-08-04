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
    public partial class CampoIniciativa : System.Web.UI.Page
    {
        public List<TBC_CAMPOS_INICIATIVA> data;
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
                    agregarCamposIniciativas();
                    break;

                case "put":
                    editarCamposIniciativas();
                    break;

                case "del":
                    eliminarCamposIniciativas();
                    break;
            }

            data = new A_CAMPOS_INICIATIVA().ObtenerCamposIniciativas();
        }

        public void agregarCamposIniciativas()
        {
            try
            {
                //Creamos la accion del campo de iniciativa
                A_CAMPOS_INICIATIVA a_campos_iniciativa = new A_CAMPOS_INICIATIVA();

                var id_tipo_iniciativa = Request.Form["select_id_tipo_iniciativa"];
                var nombre_campo_iniciativa = Request.Form["txt_nombre_campo_iniciativa"];

                if (string.IsNullOrWhiteSpace(id_tipo_iniciativa) || string.IsNullOrWhiteSpace(nombre_campo_iniciativa))
                {
                    errores = "Campo Iniciativa no guardado. Los campos no puede estar vacíos ni contener solo espacios";
                    return;
                }

                //Construyendo Departamento
                TBC_CAMPOS_INICIATIVA campo_iniciativa = new TBC_CAMPOS_INICIATIVA();

                campo_iniciativa.NOMBRE_CAMPO = Request.Form["txt_nombre_campo_iniciativa"];
                campo_iniciativa.ID_TIPO_INICIATIVA = int.Parse(Request.Form["select_id_tipo_iniciativa"]);

                MV_Exception res = a_campos_iniciativa.GuardarCamposIniciativas(campo_iniciativa, ((MV_DetalleUsuario)Session["usuario"]).ID_USUARIO);

                if (res.IDENTITY == null)
                    throw new Exception(res.ERROR_MESSAGE);

                campo_iniciativa.ID_CAMPO = int.Parse(res.IDENTITY.ToString());

                info = "Campo de iniciativas agregado correctamente";
            }
            catch (Exception e)
            {
                errores = e.Message;
                H_LogErrorEXC.GuardarRegistroLogError(e);
            }
        }

        public void editarCamposIniciativas()
        {
            try
            {
                
                TBC_CAMPOS_INICIATIVA campo_iniciativa = new TBC_CAMPOS_INICIATIVA();
                campo_iniciativa.ID_CAMPO = int.Parse(Request.Form["txt_id_campo_iniciativa"]);
                campo_iniciativa.NOMBRE_CAMPO = Request.Form["txt_nombre_campo_iniciativa"];
                campo_iniciativa.ID_TIPO_INICIATIVA = int.Parse(Request.Form["select_id_tipo_iniciativa"]);

                new A_CAMPOS_INICIATIVA().editarCamposIniciativas(campo_iniciativa, ((MV_DetalleUsuario)Session["usuario"]).ID_USUARIO);

                info = "Campo de iniciativas editado correctamente";
            }
            catch (Exception e)
            {
                errores = e.Message;
                H_LogErrorEXC.GuardarRegistroLogError(e);
            }
        }

        public void eliminarCamposIniciativas()
        {
            try
            {
                //Borrando al usuario
                TBC_CAMPOS_INICIATIVA campo_iniciativa = new A_CAMPOS_INICIATIVA().geCamposIniciativasById(int.Parse(Request.Form["txt_borrar_id_campo_iniciativa"]));
                Console.WriteLine(campo_iniciativa.ID_CAMPO);
                MV_Exception res = new A_CAMPOS_INICIATIVA().softDeleteCamposIniciativas(campo_iniciativa, ((BLL.Modelos.ModelosVistas.MV_DetalleUsuario)Session["usuario"]).ID_USUARIO);
                info = "Campo de iniciativas eliminado correctamente";
            }
            catch (Exception e)
            {
                errores = e.Message;
                H_LogErrorEXC.GuardarRegistroLogError(e);
            }
        }

    }
}