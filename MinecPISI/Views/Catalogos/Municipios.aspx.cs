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
    public partial class Municipios : System.Web.UI.Page
    {
        public List<TBC_MUNICIPIO> data;
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
                    agregarMunicipio();
                    break;

                case "put":
                    editarMunicipio();
                    break;

                case "del":
                    eliminarMunicipio();
                    break;
            }

            data = new A_MUNICIPIO().ObtenerMunicipios();
        }

        public void agregarMunicipio()
        {
            try
            {
                //Creamos la accion del departamento
                A_MUNICIPIO a_municipio = new A_MUNICIPIO();

                var id_departamento = Request.Form["select_id_departamento"];
                var codigo_departamento = Request.Form["txt_codigo_municipio"];
                var nombre_departamento = Request.Form["txt_nombre_municipio"];

                if (string.IsNullOrWhiteSpace(codigo_departamento) || string.IsNullOrWhiteSpace(nombre_departamento) || string.IsNullOrWhiteSpace(id_departamento))
                {
                    errores = "Municipio no guardado. Los campos no puede estar vacíos ni contener solo espacios";
                    return;
                }

                //Construyendo Departamento
                TBC_MUNICIPIO municipio = new TBC_MUNICIPIO();
                municipio.ID_DEPARTAMENTO = int.Parse(Request.Form["select_id_departamento"]);
                municipio.COD_MUNICIPIO = Request.Form["txt_codigo_municipio"];
                municipio.NOMBRE = Request.Form["txt_nombre_municipio"];

                MV_Exception res = a_municipio.GuardarMunicipios(municipio, ((MV_DetalleUsuario)Session["usuario"]).ID_USUARIO);

                if (res.IDENTITY == null)
                    throw new Exception(res.ERROR_MESSAGE);

                municipio.ID_DEPARTAMENTO = int.Parse(res.IDENTITY.ToString());

                info = "Municipio agregado correctamente";
            }
            catch (Exception e)
            {
                errores = e.Message;
                H_LogErrorEXC.GuardarRegistroLogError(e);
            }
        }

        public void editarMunicipio()
        {
            try
            {
                //Construyendo al departamento
                TBC_MUNICIPIO municipio = new TBC_MUNICIPIO();
                municipio.ID_MUNICIPIO = int.Parse(Request.Form["txt_id_municipio"]);
                municipio.ID_DEPARTAMENTO = int.Parse(Request.Form["select_id_departamento"]);
                municipio.COD_MUNICIPIO = Request.Form["txt_codigo_municipio"];
                municipio.NOMBRE = Request.Form["txt_nombre_municipio"];

                new A_MUNICIPIO().editarMunicipios(municipio, ((MV_DetalleUsuario)Session["usuario"]).ID_USUARIO);

                info = "Municipio editado correctamente";
            }
            catch (Exception e)
            {
                errores = e.Message;
                H_LogErrorEXC.GuardarRegistroLogError(e);
            }
        }

        public void eliminarMunicipio()
        {
            try
            {
                //Borrando al municipio
                TBC_MUNICIPIO municipio = new A_MUNICIPIO().geMunicpioById(int.Parse(Request.Form["txt_borrar_id_municipio"]));

                MV_Exception res = new A_MUNICIPIO().softDeleteMunicipios(municipio, ((BLL.Modelos.ModelosVistas.MV_DetalleUsuario)Session["usuario"]).ID_USUARIO);
                info = "Municipio eliminado correctamente";
            }
            catch (Exception e)
            {
                errores = e.Message;
                H_LogErrorEXC.GuardarRegistroLogError(e);
            }
        }
    }
}