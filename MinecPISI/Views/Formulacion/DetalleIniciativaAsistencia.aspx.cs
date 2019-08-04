using BLL.Acciones;
using BLL.Modelos;
using BLL.Modelos.ModelosVistas;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MinecPISI.Views.Formulacion
{
    public partial class DetalleIniciativaAsistencia : System.Web.UI.Page
    {
        protected MV_DetalleUsuario usuario;
        protected int idProyecto;
        protected List<TB_DETALLE_INICIATIVA> detalle;
        protected void Page_Load(object sender, EventArgs e)
        {
            idProyecto = Convert.ToInt32(Page.RouteData.Values["idIniciativa"].ToString());
            usuario = ((MV_DetalleUsuario)Session["usuario"]);
            detalle = A_TB_DETALLE_INICIATIVA.ObtenerDetalleByProyecto(idProyecto);
            planteamiento.Text = detalle.Find(x => x.ID_CAMPO == 31).VALOR;
            descripcionSolucion.Text = detalle.Find(x => x.ID_CAMPO == 32).VALOR;
            descripcionRelevancia.Text = detalle.Find(x => x.ID_CAMPO == 33).VALOR;
            incrementosEsperados.Text = detalle.Find(x => x.ID_CAMPO == 34).VALOR;
            incrementosEnVentas.Text = detalle.Find(x => x.ID_CAMPO == 35).VALOR;
            ejecucionSolo.Checked = detalle.Find(x => x.ID_CAMPO == 36).VALOR == "1" ? true : false;
            ejecucionAsistida.Checked = detalle.Find(x => x.ID_CAMPO == 37).VALOR == "1" ? true : false;
            metodologia.Text = detalle.Find(x => x.ID_CAMPO == 38).VALOR;
            conocLocal.Checked = detalle.Find(x => x.ID_CAMPO == 39).VALOR == "1" ? true : false;
            atenderLocal.Checked = detalle.Find(x => x.ID_CAMPO == 40).VALOR == "1" ? true : false;
            entrenamiento.Checked = detalle.Find(x => x.ID_CAMPO == 41).VALOR == "1" ? true : false;
            mixta.Checked = detalle.Find(x => x.ID_CAMPO == 42).VALOR == "1" ? true : false;
            duracionDias.Text = detalle.Find(x => x.ID_CAMPO == 43).VALOR;
            location.Text = detalle.Find(x => x.ID_CAMPO == 44).VALOR;
            recursosAdicionales.Checked = detalle.Find(x => x.ID_CAMPO == 45).VALOR == "1" ? true : false;
            conocPrevio.Checked = detalle.Find(x => x.ID_CAMPO == 46).VALOR == "1" ? true : false;
            requerimientosPrevios.Text = detalle.Find(x => x.ID_CAMPO == 47).VALOR;
            cumple.Checked = detalle.Find(x => x.ID_CAMPO == 48).VALOR == "1" ? true : false;
            componentes.Text = detalle.Find(x => x.ID_CAMPO == 49).VALOR;
            efectosProblema.Text = detalle.Find(x => x.ID_CAMPO == 50).VALOR;
            efectosNegocio.Text = detalle.Find(x => x.ID_CAMPO == 51).VALOR;
            incrementoUtilidad.Text = detalle.Find(x => x.ID_CAMPO == 52).VALOR;
            reduccionTiempo.Text = detalle.Find(x => x.ID_CAMPO == 53).VALOR;
            disminuirConsumo.Text = detalle.Find(x => x.ID_CAMPO == 54).VALOR;
            reducirConsumo.Text = detalle.Find(x => x.ID_CAMPO == 55).VALOR;
            otros.Text = detalle.Find(x => x.ID_CAMPO == 56).VALOR;
            descripcionContrapartida.Text = detalle.Find(x => x.ID_CAMPO == 57).VALOR;
            montoAsistencia.Text = detalle.Find(x => x.ID_CAMPO == 58).VALOR;
            montoRecursos.Text = detalle.Find(x => x.ID_CAMPO == 59).VALOR;
            montoOtros.Text = detalle.Find(x => x.ID_CAMPO == 60).VALOR;
            descripMontoEspecies.Text = detalle.Find(x => x.ID_CAMPO == 61).VALOR;
            montoEspecies.Text = detalle.Find(x => x.ID_CAMPO == 62).VALOR;
            descripMontoEfectivo.Text = detalle.Find(x => x.ID_CAMPO == 63).VALOR;
            montoEfectivo.Text = detalle.Find(x => x.ID_CAMPO == 64).VALOR;
            inputfecha.Text = detalle.Find(x => x.ID_CAMPO == 65).VALOR;
            semanasSelec.Text = detalle.Find(x => x.ID_CAMPO == 66).VALOR;
        }

        protected void Btn_aprobar_Click(object sender, EventArgs e)
        {
            TB_PROYECTO pro = A_PROYECTO.ObtenerProyectoPorId(idProyecto);
            A_PROYECTO.CambiarEstadoProceso(A_ESTADO_PROCESO.ObtenerPorCodigo("PY03").ID_ESTADO_PROCESO, idProyecto, usuario.ID_USUARIO);
            int b = (int)A_PROBLEMA.getByIdProblema(pro.ID_PROBLEMA).ID_BENEFICIARIO;
            var bene = A_USUARIO.ObtenerUsuarioPorIdBeneficiario(b);
            var consultor = A_ASIGNACION.geConsultorByIdBeneficiario(b);
            var userCon = new A_USUARIO().getUsuarioByPersona(consultor.ID_PERSONA);
            A_NOTIFICACION.GuardarNotificacion(A_USUARIO.obtenerCoordinador().ID_USUARIO, usuario.ID_USUARIO, "PY03");
            var propuesta = A_PROPUESTA.BuscarPropuestaXId(pro.ID_PROPUESTA);
            if (propuesta != null)
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
            Response.RedirectToRoute("ConsultarIniciativa");
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
    }
}