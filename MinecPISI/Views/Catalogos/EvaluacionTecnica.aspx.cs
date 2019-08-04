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
    public partial class EvaluacionTecnica : System.Web.UI.Page
    {
        public List<TBC_CAMPOS_EVALUACION_TECNICA> data;
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

            data = new A_CAMPOS_EVALUACION_TECNICA().ObtenerEvaluacionTecnica();
        }

        public void agregarDepartamento()
        {
            try
            {
                //Creamos la accion del departamento
                A_CAMPOS_EVALUACION_TECNICA a_evaluacion_tecnica = new A_CAMPOS_EVALUACION_TECNICA();

                var id_criterio_tecnica_sup = Request.Form["select_id_criterio_tecnica"];
                var criterio_evaluacion_tecnica = Request.Form["txt_criterio_evaluacion_tecnica"];
                var tipo_evaluacion_tecnica = Request.Form["txt_tipo_evaluacion_tecnica"];

                if (string.IsNullOrWhiteSpace(id_criterio_tecnica_sup) || string.IsNullOrWhiteSpace(criterio_evaluacion_tecnica) || string.IsNullOrWhiteSpace(tipo_evaluacion_tecnica))
                {
                    errores = "Evaluacion tecnica no guardada. Los campos no puede estar vacíos ni contener solo espacios";
                    return;
                }

                //Construyendo Departamento
                TBC_CAMPOS_EVALUACION_TECNICA evaluacion_tecnica = new TBC_CAMPOS_EVALUACION_TECNICA();

                evaluacion_tecnica.ID_CRITERIO_EVAL_TECNICO_SUP = int.Parse(Request.Form["select_id_criterio_tecnica"]);
                evaluacion_tecnica.CRITERIO = Request.Form["txt_criterio_evaluacion_tecnica"];
                evaluacion_tecnica.TIPO_EVAL = Request.Form["txt_tipo_evaluacion_tecnica"];

                MV_Exception res = a_evaluacion_tecnica.GuardarEvaluacionTecnica(evaluacion_tecnica, ((MV_DetalleUsuario)Session["usuario"]).ID_USUARIO);

                if (res.IDENTITY == null)
                    throw new Exception(res.ERROR_MESSAGE);

                evaluacion_tecnica.ID_CRITERIO_EVAL_TECNICO = int.Parse(res.IDENTITY.ToString());

                info = "Evaluacion tecnica agregado correctamente";
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
                TBC_CAMPOS_EVALUACION_TECNICA evaluacion_tecnica = new TBC_CAMPOS_EVALUACION_TECNICA();

                evaluacion_tecnica.ID_CRITERIO_EVAL_TECNICO = int.Parse(Request.Form["txt_id_evaluacion_tecnica"]);
                evaluacion_tecnica.ID_CRITERIO_EVAL_TECNICO_SUP = int.Parse(Request.Form["select_id_criterio_tecnica"]);
                evaluacion_tecnica.CRITERIO = Request.Form["txt_criterio_evaluacion_tecnica"];
                evaluacion_tecnica.TIPO_EVAL = Request.Form["txt_tipo_evaluacion_tecnica"];

                new A_CAMPOS_EVALUACION_TECNICA().editarEvaluacionTecnica(evaluacion_tecnica, ((MV_DetalleUsuario)Session["usuario"]).ID_USUARIO);

                info = "Evaluacion tecnica editado correctamente";
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
                TBC_CAMPOS_EVALUACION_TECNICA evaluacion_tecnica = new A_CAMPOS_EVALUACION_TECNICA().geEvaluacionTecnicaById(int.Parse(Request.Form["txt_borrar_id_evaluacion_tecnica"]));

                MV_Exception res = new A_CAMPOS_EVALUACION_TECNICA().softDeleteEvaluacionTecnica(evaluacion_tecnica, ((BLL.Modelos.ModelosVistas.MV_DetalleUsuario)Session["usuario"]).ID_USUARIO);
                info = "Evaluacion Tecnica eliminada correctamente";
            }
            catch (Exception e)
            {
                errores = e.Message;
                H_LogErrorEXC.GuardarRegistroLogError(e);
            }
        }
    }
}