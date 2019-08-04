using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL.Acciones;
using BLL.Modelos;
using BLL.Modelos.ModelosVistas;
using BLL.Helpers;

namespace MinecPISI.Views.Catalagos
{
    public partial class Departamentos : System.Web.UI.Page
    {
        public List<TBC_DEPARTAMENTO> data;
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
                    agregarDepartamento();
                    break;

                case "put":
                    editarDepartamento();
                    break;

                case "del":
                    eliminarDepartamento();
                    break;
            }

            data = new A_DEPARTAMENTO().ObtenerDeptos();
        }

        public void agregarDepartamento()
        {
            try
            {
                //Creamos la accion del departamento
                A_DEPARTAMENTO a_departamento = new A_DEPARTAMENTO();

                var codigo_departamento = Request.Form["txt_codigo_departamento"];
                var nombre_departamento = Request.Form["txt_nombre_departamento"];

                if (string.IsNullOrWhiteSpace(codigo_departamento) || string.IsNullOrWhiteSpace(nombre_departamento))
                {
                    errores = "Departamento no guardado. Los campos no puede estar vacíos ni contener solo espacios";
                    return;
                }

                //Construyendo Departamento
                TBC_DEPARTAMENTO departamento = new TBC_DEPARTAMENTO();

                departamento.COD_DEPARTAMENTO = Request.Form["txt_codigo_departamento"];
                departamento.NOMBRE = Request.Form["txt_nombre_departamento"];

                MV_Exception res = a_departamento.GuardarDepartamento(departamento, ((MV_DetalleUsuario)Session["usuario"]).ID_USUARIO);

                if (res.IDENTITY == null)
                    throw new Exception(res.ERROR_MESSAGE);

                departamento.ID_DEPARTAMENTO = int.Parse(res.IDENTITY.ToString());

                info = "Departamento agregado correctamente";
            }
            catch (Exception e)
            {
                errores = e.Message;
                H_LogErrorEXC.GuardarRegistroLogError(e);
            }
        }

        public void editarDepartamento()
        {
            try
            {
                //Construyendo al departamento
                TBC_DEPARTAMENTO departamento = new TBC_DEPARTAMENTO();

                departamento.ID_DEPARTAMENTO = int.Parse(Request.Form["txt_id_departamento"]);
                departamento.COD_DEPARTAMENTO = Request.Form["txt_codigo_departamento"];
                departamento.NOMBRE = Request.Form["txt_nombre_departamento"];

                new A_DEPARTAMENTO().editarDepartamento(departamento, ((MV_DetalleUsuario)Session["usuario"]).ID_USUARIO);

                info = "Departamento editado correctamente";
            }
            catch (Exception e)
            {
                errores = e.Message;
                H_LogErrorEXC.GuardarRegistroLogError(e);
            }
        }

        public void eliminarDepartamento()
        {
            try
            {
                //Borrando al usuario
                TBC_DEPARTAMENTO departamento = new A_DEPARTAMENTO().geDepartamentoById(int.Parse(Request.Form["txt_borrar_id_departamento"]));

                MV_Exception res = new A_DEPARTAMENTO().softDeleteDepartamento(departamento, ((BLL.Modelos.ModelosVistas.MV_DetalleUsuario)Session["usuario"]).ID_USUARIO);
                info = "Departamento eliminado correctamente";
            }
            catch (Exception e)
            {
                errores = e.Message;
                H_LogErrorEXC.GuardarRegistroLogError(e);
            }
        }



    }
}