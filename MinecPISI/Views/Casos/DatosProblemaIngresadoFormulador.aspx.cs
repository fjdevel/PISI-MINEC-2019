using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL.Modelos;
using BLL.Acciones;
using BLL.Modelos.ModelosVistas;
using System.Web.UI.HtmlControls;

namespace MinecPISI.Views.Casos
{
    public partial class DatosProblemaIngresado : System.Web.UI.Page
    {
        protected string rol;
        protected MV_DetalleBeneficiario beneficiario;
        protected MV_DetalleProblema problema;
        protected TB_PERSONA consultor;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["usuario"] == null)
            {
                Response.RedirectToRoute("Login");
                return;
            }

            rol = ((MV_DetalleUsuario)Session["usuario"]).NOMBRE_ROL.ToUpper();

            string param = (string)Page.RouteData.Values["idProblema"];

            int id_problema;

            if (!int.TryParse(param, out id_problema))
            {
                Response.Clear();
                Response.End();
                return;
            }

            problema = A_PROBLEMA.getByIdProblema(id_problema);

            if (problema == null)
            {
                Response.End();
                return;
            }

            beneficiario = A_BENEFICIARIO.getDetalleBeneficiarioById(problema.ID_BENEFICIARIO);
            consultor = A_ASIGNACION.geConsultorByIdBeneficiario((int)problema.ID_BENEFICIARIO);

            if (Request.Form.Count > 0)
            {
                switch (Request.Form["act"])
                {
                    case "app":         //Aprobar
                        aprobar();
                        break;

                    case "obs":         //Añadir una observacion
                        editObservacion();
                        break;

                    case "desc":        //Descartar la notificación

                        break;
                }
            }
        }

        protected void aprobar()
        {
            MV_Exception exception;
            if (problema.REQUIERE_APOYO) {
                exception = A_PROBLEMA.cambiarEstadoProblema(problema.ID_PROBLEMA.Value, "P02", ((MV_DetalleUsuario)Session["usuario"]).ID_USUARIO);
                A_NOTIFICACION.GuardarNotificacion(new A_USUARIO().getUsuarioByPersona((int)beneficiario.ID_PERSONA).ID_USUARIO, ((MV_DetalleUsuario)Session["usuario"]).ID_USUARIO, "P02");
                List<TB_USUARIO> formuladores = new A_USUARIO().getAllByRol("Formulador");
                foreach (var f in formuladores)
                {
                    A_NOTIFICACION.GuardarNotificacion(f.ID_USUARIO, ((MV_DetalleUsuario)Session["usuario"]).ID_USUARIO, "P02");
                }
            }
            else {
                exception = A_PROBLEMA.cambiarEstadoProblema(problema.ID_PROBLEMA.Value, "PY01", ((MV_DetalleUsuario)Session["usuario"]).ID_USUARIO);
                A_NOTIFICACION.GuardarNotificacion(new A_USUARIO().getUsuarioByPersona((int)beneficiario.ID_PERSONA).ID_USUARIO, ((MV_DetalleUsuario)Session["usuario"]).ID_USUARIO, "PY01");
                TB_PROYECTO proyecto = new TB_PROYECTO();
                A_PROYECTO a_PROYECTO = new A_PROYECTO();
                proyecto.COD_PROYECTO = "Proy" + problema.ID_PROBLEMA + DateTime.Now.Year.ToString();
                proyecto.ID_PROBLEMA = (int)problema.ID_PROBLEMA;
                proyecto.ID_TIPO_INICIATIVA = 4;
                proyecto.USUARIO_CREA = ((MV_DetalleUsuario)Session["usuario"]).ID_USUARIO;
                proyecto.ID_PROPUESTA = 0;
                a_PROYECTO.guardarRegistro(proyecto);
            }

            if (string.IsNullOrEmpty(exception.ERROR_MESSAGE))
            {
            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Pop", "ShowMessage('Ha aprobado el problema planteado por el beneficiario <strong>correctamente!</strong>', 'success');", true);

                
                
                Response.RedirectToRoute("ConsultarCasos");
            }
        }

        /// <summary>
        /// Aquí se crea, edita o borra la observacion sobre el problema
        /// </summary>
        protected void editObservacion()
        {
            if (String.IsNullOrEmpty(Request.Form["id_observacion"]))          //Si no se envia ID es porque no tenia
            {
                //Como no habia una observacion que editar, se crea una nueva
                MV_Exception exception = A_OBSERVACION.CrearObservacion(8, Request.Form["txt_observacion"], "TB_PROBLEMA", problema.ID_PROBLEMA.Value, 0);
                MV_Exception exception2 = A_PROBLEMA.cambiarEstadoProblema(problema.ID_PROBLEMA.Value, "P03", ((MV_DetalleUsuario)Session["usuario"]).ID_USUARIO);

                A_NOTIFICACION.GuardarNotificacion(new A_USUARIO().getUsuarioByPersona((int)beneficiario.ID_PERSONA).ID_USUARIO, ((MV_DetalleUsuario)Session["usuario"]).ID_USUARIO, "P03");

            }
            else
            {
                var checkbox = Request.Form["chk_descartar"];
                short estado;

                if (checkbox == null)       //Si es nulo, es FALSE
                {
                    //Marcando observacion como NO resuelta
                    estado = 0;
                }
                else
                {
                    //Marcando observacion como resuelta
                    estado = 1;
                }

                if (!string.IsNullOrEmpty(Request.Form["txt_observacion"]))
                {
                    //Como ya habia una observacion, se edita la que estaba
                    MV_Exception exception = A_OBSERVACION.updateObservacion(int.Parse(Request.Form["id_observacion"]), "02.021", Request.Form["txt_observacion"], "TB_PROBLEMA", problema.ID_PROBLEMA.Value, estado);
                }
            }

            Response.Redirect(Request.RawUrl);
        }

        protected void descartarObservacion()
        {

        }
    }
}