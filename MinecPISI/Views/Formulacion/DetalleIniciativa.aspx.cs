using BLL.Acciones;
using BLL.Modelos;
using BLL.Modelos.ModelosVistas;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MinecPISI.Views.Formulacion
{
    public partial class DetalleIniciativa : System.Web.UI.Page
    {
        protected MV_DetalleUsuario usuario;
        protected int idProyecto;
        protected List<TB_DETALLE_INICIATIVA> detalle;
        protected MV_DetalleProblema problema;
        protected void Page_Load(object sender, EventArgs e)
        {
            idProyecto = Convert.ToInt32(Page.RouteData.Values["idIniciativa"].ToString());
            usuario = ((MV_DetalleUsuario)Session["usuario"]);
            detalle = A_TB_DETALLE_INICIATIVA.ObtenerDetalleByProyecto(idProyecto);
            planteamiento.Text = detalle.Find(x => x.ID_CAMPO == 1).VALOR;
            descripcionSolucion.Text = detalle.Find(x => x.ID_CAMPO == 2).VALOR;
            descripcionRelevancia.Text = detalle.Find(x => x.ID_CAMPO == 3).VALOR;
            incrementosEsperados.Text = detalle.Find(x => x.ID_CAMPO == 4).VALOR;
            incrementosEnVentas.Text = detalle.Find(x => x.ID_CAMPO == 5).VALOR;
            ejecucionSolo.Checked = detalle.Find(x => x.ID_CAMPO == 6).VALOR == "1"?true:false;
            ejecucionAsistida.Checked = detalle.Find(x => x.ID_CAMPO == 7).VALOR == "1"?true:false;
            adopcionTec.Text = detalle.Find(x => x.ID_CAMPO == 8).VALOR;
            efectosEsperados.Text = detalle.Find(x => x.ID_CAMPO == 9).VALOR;
            efectosEsperadosNegocio.Text = detalle.Find(x => x.ID_CAMPO == 10).VALOR;
            justificacion.Text = detalle.Find(x => x.ID_CAMPO == 11).VALOR;
            margenUtilidad.Text = detalle.Find(x => x.ID_CAMPO == 12).VALOR;
            incrementoProduccion.Text = detalle.Find(x => x.ID_CAMPO == 13).VALOR;
            nuevoVolumen.Text = detalle.Find(x => x.ID_CAMPO == 14).VALOR;
            reducirTiempo.Text = detalle.Find(x => x.ID_CAMPO == 15).VALOR;
            disminucionConsumo.Text = detalle.Find(x => x.ID_CAMPO == 16).VALOR;
            disminucionConsumoMateria.Text = detalle.Find(x => x.ID_CAMPO == 17).VALOR;
            otrosInfo.Text = detalle.Find(x => x.ID_CAMPO == 18).VALOR;
            componentesAdicionales.Text = detalle.Find(x => x.ID_CAMPO == 19).VALOR;
            descripcionfondepro.Text = detalle.Find(x => x.ID_CAMPO == 20).VALOR;
            montoAdopcion.Text = detalle.Find(x => x.ID_CAMPO == 21).VALOR;
            montoComponentes.Text = detalle.Find(x => x.ID_CAMPO == 22).VALOR;
            montoOtros.Text = detalle.Find(x => x.ID_CAMPO == 23).VALOR;
            descripMontoEspecies.Text = detalle.Find(x => x.ID_CAMPO == 24).VALOR;
            montoEspecies.Text = detalle.Find(x => x.ID_CAMPO == 25).VALOR;
            descripMontoEfectivo.Text = detalle.Find(x => x.ID_CAMPO == 26).VALOR;
            montoEfectivo.Text = detalle.Find(x => x.ID_CAMPO == 27).VALOR;
            inputfecha.Text = detalle.Find(x => x.ID_CAMPO == 28).VALOR;
            checkCron.Checked = detalle.Find(x => x.ID_CAMPO == 29).VALOR == "1" ? true : false;
            semanasSelec.Text = detalle.Find(x => x.ID_CAMPO == 30).VALOR;
            problema = A_PROBLEMA.getByIdProblema(A_PROYECTO.ObtenerProyectoPorId(idProyecto).ID_PROBLEMA);
        }

        protected void btnguardar_Click(object sender, EventArgs e)
        {
            TB_PROYECTO pro = A_PROYECTO.ObtenerProyectoPorId(idProyecto);
            A_PROYECTO.CambiarEstadoProceso(A_ESTADO_PROCESO.ObtenerPorCodigo("PY03").ID_ESTADO_PROCESO, idProyecto, usuario.ID_USUARIO);
            int b = (int)A_PROBLEMA.getByIdProblema(pro.ID_PROBLEMA).ID_BENEFICIARIO;
            var bene = A_USUARIO.ObtenerUsuarioPorIdBeneficiario(b);
            var consultor = A_ASIGNACION.geConsultorByIdBeneficiario(b);
            var userCon = new A_USUARIO().getUsuarioByPersona(consultor.ID_PERSONA);
            A_NOTIFICACION.GuardarNotificacion(userCon.ID_USUARIO, usuario.ID_USUARIO, "PY03");
            A_NOTIFICACION.GuardarNotificacion(A_USUARIO.obtenerCoordinador().ID_USUARIO, usuario.ID_USUARIO, "PY03");
            var propuesta = A_PROPUESTA.BuscarPropuestaXId(pro.ID_PROPUESTA);
            if(propuesta!=null)
            A_NOTIFICACION.GuardarNotificacion(propuesta.ID_USUARIO_FORMULA, usuario.ID_USUARIO, "PY03");
            ScriptManager.RegisterStartupScript(this, GetType(),
                    "alert",
                    "alert('felicidades! has aceptado una iniciativa...');",
                    true);
            

        }

        protected void btnRechazar_Click(object sender, EventArgs e)
        {
            A_PROYECTO.CambiarEstadoProceso(A_ESTADO_PROCESO.ObtenerPorCodigo("PY04").ID_ESTADO_PROCESO, idProyecto, usuario.ID_USUARIO);
            ScriptManager.RegisterStartupScript(this, GetType(),
                    "alert",
                    "alert('Atencion has observado una iniciativa...');",
                    true);
        }

        protected void contrapartidaSi_Click(object sender, EventArgs e)
        {
            TB_PROYECTO pro = A_PROYECTO.ObtenerProyectoPorId(idProyecto);
            var propuesta = A_PROPUESTA.BuscarPropuestaXId(pro.ID_PROPUESTA);
            int b = (int)A_PROBLEMA.getByIdProblema(pro.ID_PROBLEMA).ID_BENEFICIARIO;
            var bene = A_USUARIO.ObtenerUsuarioPorIdBeneficiario(b);
            A_NOTIFICACION.GuardarNotificacion(bene.ID_USUARIO, usuario.ID_USUARIO, "PY05");
            A_NOTIFICACION.GuardarNotificacion(A_USUARIO.obtenerCoordinador().ID_USUARIO, usuario.ID_USUARIO, "PY05");
            A_NOTIFICACION.GuardarNotificacion(propuesta.ID_USUARIO_FORMULA, usuario.ID_USUARIO, "PY05");
            A_PROYECTO.CambiarEstadoProceso(A_ESTADO_PROCESO.ObtenerPorCodigo("PY05").ID_ESTADO_PROCESO, idProyecto, usuario.ID_USUARIO);
            ScriptManager.RegisterStartupScript(this, GetType(),
                    "alert",
                    "alert('felicidades! Ha verificado la contrapartida...');",
                    true);

        }

        protected void contrapartidaNo_Click(object sender, EventArgs e)
        {

        }

        protected void ratificarBtn_Click(object sender, EventArgs e)
        {
            TB_PROYECTO pro = A_PROYECTO.ObtenerProyectoPorId(idProyecto);
            int b = (int)A_PROBLEMA.getByIdProblema(pro.ID_PROBLEMA).ID_BENEFICIARIO;
            var bene = A_USUARIO.ObtenerUsuarioPorIdBeneficiario(b);
            A_PROYECTO.CambiarEstadoProceso(A_ESTADO_PROCESO.ObtenerPorCodigo("PY10").ID_ESTADO_PROCESO, idProyecto, usuario.ID_USUARIO);
            A_NOTIFICACION.GuardarNotificacion(bene.ID_USUARIO, usuario.ID_USUARIO, "PY10");
            var propuesta = A_PROPUESTA.BuscarPropuestaXId(pro.ID_PROPUESTA);
            A_NOTIFICACION.GuardarNotificacion(propuesta.ID_USUARIO_FORMULA, usuario.ID_USUARIO, "PY10");
            ScriptManager.RegisterStartupScript(this, GetType(),
                    "alert",
                    "alert('felicidades! Ha verificado la Ratificado el Proyecto...');",
                    true);

        }

        protected void ObservarIniciativa_Click(object sender, EventArgs e)
        {
            MV_Exception exception = A_OBSERVACION.CrearObservacion(18, detalleIniciativa.Text, "TB_PROYECTO", idProyecto, 0);
            A_PROYECTO.CambiarEstadoProceso(A_ESTADO_PROCESO.ObtenerPorCodigo("PY04").ID_ESTADO_PROCESO, idProyecto, usuario.ID_USUARIO);
            TB_PROYECTO pro = A_PROYECTO.ObtenerProyectoPorId(idProyecto);
            int b = (int)A_PROBLEMA.getByIdProblema(pro.ID_PROBLEMA).ID_BENEFICIARIO;
            var bene = A_USUARIO.ObtenerUsuarioPorIdBeneficiario(b);
            A_NOTIFICACION.GuardarNotificacion(bene.ID_USUARIO, usuario.ID_USUARIO, "PY04");
            A_NOTIFICACION.GuardarNotificacion(A_USUARIO.obtenerCoordinador().ID_USUARIO, usuario.ID_USUARIO, "PY04");
            var propuesta = A_PROPUESTA.BuscarPropuestaXId(pro.ID_PROPUESTA);
            A_NOTIFICACION.GuardarNotificacion(propuesta.ID_USUARIO_FORMULA, usuario.ID_USUARIO, "PY04");
            ScriptManager.RegisterStartupScript(this, GetType(),
                    "alert",
                    "alert('Has observado la iniciativa...');",
                    true);

        }
        public void DescargarArchivo(string fileName)
        {
            var documentos = A_DOCUMENTO.ObtenerXIdBeneficiario((int)problema.ID_BENEFICIARIO, fileName);

            foreach (var doc in documentos)
            {
                var file = new FileInfo(doc.DIRECCION);
                var ext = Path.GetExtension(doc.DIRECCION).ToLower();

                if (!file.Exists) return;

                Response.Clear();

                if (ext == ".jpg" || ext == ".jpeg")
                    Response.ContentType = "image/jpeg";
                else if (ext == ".png")
                    Response.ContentType = "image/png";
                else
                    Response.ContentType = "application/pdf";

                Response.AppendHeader("Content-Disposition",
                    "attachment; filename=" + file.Name);
                Response.TransmitFile(doc.DIRECCION);
                Response.End();
            }
        }
        protected void lnk_factura_Click(object sender, EventArgs e)
        {
            DescargarArchivo("formulacion");
        }
    }
}