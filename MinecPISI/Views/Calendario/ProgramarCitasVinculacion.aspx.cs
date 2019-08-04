using BLL.Acciones;
using BLL.Modelos;
using BLL.Modelos.ModelosVistas;
using System;
using System.Web.UI;
using BLL.Helpers;
using System.Collections.Generic;

namespace MinecPISI.Views.Calendario
{
    public partial class ProgramarCitasVinculacion : System.Web.UI.Page
    {
        protected List<TB_ACTIVIDAD> citas;
        protected void Page_Load(object sender, EventArgs e)
        {
            MV_DetalleBeneficiario beneficiario = (MV_DetalleBeneficiario)Session["beneficiarioData"];
            TB_USUARIO userBen = A_USUARIO.ObtenerUsuarioPorIdBeneficiario(Convert.ToInt32(Page.RouteData.Values["id"].ToString()));
            MV_DetalleUsuario usuario = (MV_DetalleUsuario)Session["usuario"];
            citas = A_ACTIVIDAD.ConsultarCitas(usuario.ID_USUARIO, userBen.ID_USUARIO);
            lbl_nombre.Text = beneficiario.NOMBRES + ' ' + beneficiario.APELLIDOS;
            lbl_telefono.Text = beneficiario.TEL_FIJO;
            lbl_nit.Text = beneficiario.NIT;
            lbl_muni.Text = beneficiario.MUNICIPIO;
        }

        protected void btn_guardarCita_OnClick(object sender, EventArgs e)
        {
            var aActividad = new A_ACTIVIDAD();
            var beneficiario = (MV_DetalleBeneficiario)Session["beneficiarioData"];
            var usuario = (MV_DetalleUsuario)Session["usuario"];

            var direccion = direccionCita.Value;
            var hora = txt_hora.Value;
            var fecha = hf_fechaCompleta.Value;

            var fechaF = fecha.Split('-');
            var horaF = hora.Split(':');

            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Pop1", "$('#modalCita').modal('hide');", true);
            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Pop2", "$('body').removeClass('modal-open');", true);
            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Pop3", "$('.modal-backdrop').remove();", true);

            try
            {
                var fechaCompleta = new DateTime(int.Parse(fechaF[0]), int.Parse(fechaF[1]), int.Parse(fechaF[2]),
                    int.Parse(horaF[0]), int.Parse(horaF[1]), 0);
                var p = new A_USUARIO().getUsuarioByPersona(beneficiario.ID_PERSONA);
                var actividad = new TB_ACTIVIDAD
                {
                    FECHA_CREA = DateTime.Now,
                    HORA = fechaCompleta,
                    FECHA = fechaCompleta,
                    DIRECCION = direccion,
                    DESCRIPCION = null,
                    ID_USUARIO_BENEFICIARIO = p.ID_USUARIO,
                    ID_USUARIO_CONSULTOR = usuario.ID_USUARIO
                };

            MV_Exception result = aActividad.GuardarCita(actividad, ((MV_DetalleUsuario)Session["usuario"]).ID_USUARIO);
                A_NOTIFICACION.GuardarNotificacion(p.ID_USUARIO, usuario.ID_USUARIO, "IF04");
                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Pop4",
                         "ShowMessage('Cita guardada <strong>correctamente!</strong>', 'success');"
                       , true);
                Response.RedirectToRoute("ProgramarCita");
            }
            catch (Exception exception)
            {
                H_LogErrorEXC.GuardarRegistroLogError(exception);
                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Pop3", "ShowMessage('error al guardar cita<strong>" + exception.Message + "</strong>', 'error');", true);
            }
        }
    }
}