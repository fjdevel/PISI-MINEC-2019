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
    public partial class CriterioEvaluacion : System.Web.UI.Page
    {
        public List<TBC_CAMPO_CRITERIO_EVALUACION> data;
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
                    agregarCriterioEvaluacion();
                    break;

                case "put":
                    editarCriterioEvaluacion();
                    break;

                case "del":
                    eliminarCriterioEvaluacion();
                    break;
            }

            data = new A_CAMPO_CRITERIO_EVALUACION().ObtenerCriteriosEvaluacion();
        }

        public void agregarCriterioEvaluacion()
        {
            try
            {
                //Creamos la accion del departamento
                A_CAMPO_CRITERIO_EVALUACION a_criterio_evaluacion = new A_CAMPO_CRITERIO_EVALUACION();

                var id_criterio_tecnica = Request.Form["select_id_criterio_tecnica"];
                var campo_evaluacion_tecnica = Request.Form["txt_campo_evaluacion_tecnica"];
                var puntaje_maximo_evaluacion_tecnica = Request.Form["txt_puntaje_maximo_evaluacion_tecnica"];

                if (string.IsNullOrWhiteSpace(id_criterio_tecnica) || string.IsNullOrWhiteSpace(campo_evaluacion_tecnica)|| string.IsNullOrWhiteSpace(puntaje_maximo_evaluacion_tecnica))
                {
                    errores = "Criterio de evaluacion no guardado. Los campos no puede estar vacíos ni contener solo espacios";
                    return;
                }

                //Construyendo Departamento
                TBC_CAMPO_CRITERIO_EVALUACION criterio_evaluacion = new TBC_CAMPO_CRITERIO_EVALUACION();
                criterio_evaluacion.ID_CRITERIO_EVAL_TECNICO = int.Parse(Request.Form["select_id_criterio_tecnica"]);
                criterio_evaluacion.PUNTAJE_MAX = short.Parse(Request.Form["txt_puntaje_maximo_evaluacion_tecnica"]);
                criterio_evaluacion.CAMPO = Request.Form["txt_campo_evaluacion_tecnica"];

                MV_Exception res = a_criterio_evaluacion.GuardarCriteriosEvaluacion(criterio_evaluacion, ((MV_DetalleUsuario)Session["usuario"]).ID_USUARIO);

                if (res.IDENTITY == null)
                    throw new Exception(res.ERROR_MESSAGE);

                criterio_evaluacion.ID_CAMPO_CRITERIO_EVAL = int.Parse(res.IDENTITY.ToString());

                info = "Criterio de evaluacion agregado correctamente";
            }
            catch (Exception e)
            {
                errores = e.Message;
                H_LogErrorEXC.GuardarRegistroLogError(e);
            }
        }

        public void editarCriterioEvaluacion()
        {
            try
            {
                //Construyendo al departamento
                TBC_CAMPO_CRITERIO_EVALUACION criterio_evaluacion = new TBC_CAMPO_CRITERIO_EVALUACION();
                criterio_evaluacion.ID_CAMPO_CRITERIO_EVAL = int.Parse(Request.Form["txt_id_evaluacion_tecnica"]);
                criterio_evaluacion.ID_CRITERIO_EVAL_TECNICO = int.Parse(Request.Form["select_id_criterio_tecnica"]);
                criterio_evaluacion.PUNTAJE_MAX = short.Parse(Request.Form["txt_puntaje_maximo_evaluacion_tecnica"]);
                criterio_evaluacion.CAMPO = Request.Form["txt_campo_evaluacion_tecnica"];

                new A_CAMPO_CRITERIO_EVALUACION().editarCriteriosEvaluacion(criterio_evaluacion, ((MV_DetalleUsuario)Session["usuario"]).ID_USUARIO);

                info = "Criterio de evaluacion editado correctamente";
            }
            catch (Exception e)
            {
                errores = e.Message;
                H_LogErrorEXC.GuardarRegistroLogError(e);
            }
        }

        public void eliminarCriterioEvaluacion()
        {
            try
            {
                //Borrando al usuario
                TBC_CAMPO_CRITERIO_EVALUACION criterio_evaluacion = new A_CAMPO_CRITERIO_EVALUACION().geCriteriosEvaluacionById(int.Parse(Request.Form["txt_borrar_id_evaluacion_tecnica"]));

                MV_Exception res = new A_CAMPO_CRITERIO_EVALUACION().softDeleteCriteriosEvaluacion(criterio_evaluacion, ((BLL.Modelos.ModelosVistas.MV_DetalleUsuario)Session["usuario"]).ID_USUARIO);
                info = "Criterio de evaluacion eliminado correctamente";
            }
            catch (Exception e)
            {
                errores = e.Message;
                H_LogErrorEXC.GuardarRegistroLogError(e);
            }
        }

    }
}