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
    public partial class DetalleIniciativaInnovacion : System.Web.UI.Page
    {
        protected MV_DetalleUsuario usuario;
        protected int idProyecto;
        protected List<TB_DETALLE_INICIATIVA> detalle;
        protected void Page_Load(object sender, EventArgs e)
        {
            idProyecto = Convert.ToInt32(Page.RouteData.Values["idIniciativa"].ToString());
            usuario = ((MV_DetalleUsuario)Session["usuario"]);
            detalle = A_TB_DETALLE_INICIATIVA.ObtenerDetalleByProyecto(idProyecto);
            planteamiento.Text = detalle.Find(x => x.ID_CAMPO == 67).VALOR;
            descripcionSolucion.Text = detalle.Find(x => x.ID_CAMPO == 68).VALOR;
            descripcionRelevancia.Text = detalle.Find(x => x.ID_CAMPO == 69).VALOR;
            incrementosEsperados.Text = detalle.Find(x => x.ID_CAMPO == 70).VALOR;
            incrementosEnVentas.Text = detalle.Find(x => x.ID_CAMPO == 71).VALOR;
            ejecucionSolo.Checked = detalle.Find(x => x.ID_CAMPO == 72).VALOR == "1" ? true : false;
            ejecucionAsistida.Checked = detalle.Find(x => x.ID_CAMPO == 73).VALOR == "1" ? true : false;
            producto.Text = detalle.Find(x => x.ID_CAMPO == 74).VALOR;
            proceso.Text = detalle.Find(x => x.ID_CAMPO == 75).VALOR;
            modelo.Text = detalle.Find(x => x.ID_CAMPO == 76).VALOR;
            insumoLocal.Checked = detalle.Find(x => x.ID_CAMPO == 77).VALOR == "1" ? true : false;
            generic.Text = detalle.Find(x => x.ID_CAMPO == 78).VALOR;
            insumoBene.Checked = detalle.Find(x => x.ID_CAMPO == 79).VALOR == "1" ? true : false;
            insumoDescrip.Text = detalle.Find(x => x.ID_CAMPO == 80).VALOR;
            atenderLocal.Checked = detalle.Find(x => x.ID_CAMPO == 81).VALOR == "1" ? true : false;
            entrenamiento.Checked = detalle.Find(x => x.ID_CAMPO == 82).VALOR == "1" ? true : false;
            mixta.Checked = detalle.Find(x => x.ID_CAMPO == 83).VALOR == "1" ? true : false;
            duracionDias.Text = detalle.Find(x => x.ID_CAMPO == 84).VALOR;
            location.Text = detalle.Find(x => x.ID_CAMPO == 85).VALOR;
            recursosAdicionales.Checked = detalle.Find(x => x.ID_CAMPO == 86).VALOR == "1" ? true : false;
            conocPrevio.Checked = detalle.Find(x => x.ID_CAMPO == 87).VALOR == "1" ? true : false;
            requerimientosPrevios.Text = detalle.Find(x => x.ID_CAMPO == 88).VALOR;
            cumple.Checked = detalle.Find(x => x.ID_CAMPO == 89).VALOR == "1" ? true : false;
            componentes.Text = detalle.Find(x => x.ID_CAMPO == 90).VALOR;
            efectosProblema.Text = detalle.Find(x => x.ID_CAMPO == 91).VALOR;
            efectosNegocio.Text = detalle.Find(x => x.ID_CAMPO == 92).VALOR;
            incrementoUtilidad.Text = detalle.Find(x => x.ID_CAMPO == 93).VALOR;
            reduccionTiempo.Text = detalle.Find(x => x.ID_CAMPO == 94).VALOR;
            disminuirConsumo.Text = detalle.Find(x => x.ID_CAMPO == 95).VALOR;
            reducirConsumo.Text = detalle.Find(x => x.ID_CAMPO == 96).VALOR;
            otros.Text = detalle.Find(x => x.ID_CAMPO == 97).VALOR;
            descripcionContrapartida.Text = detalle.Find(x => x.ID_CAMPO == 98).VALOR;
            montoAsistencia.Text = detalle.Find(x => x.ID_CAMPO == 99).VALOR;
            montoRecursos.Text = detalle.Find(x => x.ID_CAMPO == 100).VALOR;
            montoOtros.Text = detalle.Find(x => x.ID_CAMPO == 101).VALOR;
            descripMontoEspecies.Text = detalle.Find(x => x.ID_CAMPO == 102).VALOR;
            montoEspecies.Text = detalle.Find(x => x.ID_CAMPO == 103).VALOR;
            descripMontoEfectivo.Text = detalle.Find(x => x.ID_CAMPO == 104).VALOR;
            montoEfectivo.Text = detalle.Find(x => x.ID_CAMPO == 105).VALOR;
            inputfecha.Text = detalle.Find(x => x.ID_CAMPO == 106).VALOR;
            semanasSelec.Text = detalle.Find(x => x.ID_CAMPO == 107).VALOR;
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
            Response.RedirectToRoute("ConsultarIniciativa");

        }
    }
}