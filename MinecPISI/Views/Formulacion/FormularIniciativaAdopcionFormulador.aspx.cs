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
    public partial class FormularIniciativaAdopcionFormulador : System.Web.UI.Page
    {

        protected TB_PROYECTO proyecto = new TB_PROYECTO();
        protected MV_DetalleUsuario usuario;
        protected int edit = 0;
        public List<BLL.Modelos.TB_OBSERVACION> observaciones = new List<BLL.Modelos.TB_OBSERVACION>();
        protected List<TB_DETALLE_INICIATIVA> detalle;

        protected void Page_Load(object sender, EventArgs e)
        {
            btnProg.Click += new System.EventHandler(btnProg_Click);
            btnEditarProgreso.Click += new System.EventHandler(btnEditarProgreso_Click);
            btn_resolverObservacion.Click += new System.EventHandler(btn_resolverObservacion_OnClick);
            btnguardar.Click += new System.EventHandler(btnguardar_Click);
            usuario = ((MV_DetalleUsuario)Session["usuario"]);
            if (Page.RouteData.Values["idProblema"] != null)
            {
                proyecto = A_PROYECTO.ObtenerProyectoPorId(Convert.ToInt32(Page.RouteData.Values["idProblema"].ToString()));
            }
            if (Page.RouteData.Values["idIniciativa"] != null)
            {
                
                    edit = 1;
                    proyecto = A_PROYECTO.ObtenerProyectoPorId(Convert.ToInt32(Page.RouteData.Values["idIniciativa"].ToString()));
                    observaciones = A_OBSERVACION.ObtenerPorProyecto(proyecto.ID_PROYECTO); // observaciones del beneficiario
                    if(observaciones.Count!=0)
                        pnl_observaciones.Visible = true;
                    var idProyecto = proyecto.ID_PROYECTO;
                    
                    detalle = A_TB_DETALLE_INICIATIVA.ObtenerDetalleByProyecto(idProyecto);
                if (!Page.IsPostBack)
                {
                    planteamiento.Text = detalle.Find(x => x.ID_CAMPO == 1).VALOR;
                    descripcionSolucion.Text = detalle.Find(x => x.ID_CAMPO == 2).VALOR;
                    descripcionRelevancia.Text = detalle.Find(x => x.ID_CAMPO == 3).VALOR;
                    incrementosEsperados.Text = detalle.Find(x => x.ID_CAMPO == 4).VALOR;
                    incrementosEnVentas.Text = detalle.Find(x => x.ID_CAMPO == 5).VALOR;
                    ejecucionSolo.Checked = detalle.Find(x => x.ID_CAMPO == 6).VALOR == "1" ? true : false;
                    ejecucionAsistida.Checked = detalle.Find(x => x.ID_CAMPO == 7).VALOR == "1" ? true : false;
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
                }
            }
        }

        protected void btnguardar_Click(object sender, EventArgs e)
        {
            GuardarDetalle();
            A_NOTIFICACION.GuardarNotificacion(proyecto.USUARIO_CREA, ((MV_DetalleUsuario)Session["usuario"]).ID_USUARIO, "PY02");
            A_PROYECTO.CambiarEstadoProceso(A_ESTADO_PROCESO.ObtenerPorCodigo("PY02").ID_ESTADO_PROCESO, proyecto.ID_PROYECTO, ((MV_DetalleUsuario)Session["usuario"]).ID_USUARIO);
            ScriptManager.RegisterStartupScript(this, GetType(),
                    "alert",
                    "alert('felicidades! has presentado una iniciativa...');",
                    true);
            Response.RedirectToRoute("ConsultarCasos");

        }
        protected void btn_resolverObservacion_OnClick(object sender, EventArgs e)
        {
            ActualizarDetalle();
            A_OBSERVACION.CambiarAResuelto("TB_PROYECTO", proyecto.ID_PROYECTO);
            int b = (int)A_PROBLEMA.getByIdProblema(proyecto.ID_PROBLEMA).ID_BENEFICIARIO;
            var bene = A_USUARIO.ObtenerUsuarioPorIdBeneficiario(b);
            var consultor = A_ASIGNACION.geConsultorByIdBeneficiario(b);
            var userCon = new A_USUARIO().getUsuarioByPersona(consultor.ID_PERSONA);
            A_PROYECTO.CambiarEstadoProceso(A_ESTADO_PROCESO.ObtenerPorCodigo("PY02").ID_ESTADO_PROCESO, proyecto.ID_PROYECTO, usuario.ID_USUARIO);

            A_NOTIFICACION.GuardarNotificacion(bene.ID_USUARIO, usuario.ID_USUARIO, "IF05");
            A_NOTIFICACION.GuardarNotificacion(A_USUARIO.obtenerCoordinador().ID_USUARIO, usuario.ID_USUARIO, "IF05");
            A_NOTIFICACION.GuardarNotificacion(userCon.ID_USUARIO, usuario.ID_USUARIO, "IF05");

            ScriptManager.RegisterStartupScript(this, GetType(),
                    "alert",
                    "alert('felicidades! has resuelto la observación de la iniciativa...');",
                    true);
            Response.RedirectToRoute("ConsultarIniciativa");

        }
        private void GuardarDetalle()
        {
            List<TB_DETALLE_INICIATIVA> detalle = new List<TB_DETALLE_INICIATIVA>();
            detalle.Add(new TB_DETALLE_INICIATIVA(planteamiento.Text, 1, proyecto.ID_PROYECTO));
            detalle.Add(new TB_DETALLE_INICIATIVA(descripcionSolucion.Text, 2, proyecto.ID_PROYECTO));
            detalle.Add(new TB_DETALLE_INICIATIVA(descripcionRelevancia.Text, 3, proyecto.ID_PROYECTO));
            detalle.Add(new TB_DETALLE_INICIATIVA(incrementosEsperados.Text, 4, proyecto.ID_PROYECTO));
            detalle.Add(new TB_DETALLE_INICIATIVA(incrementosEnVentas.Text, 5, proyecto.ID_PROYECTO));
            detalle.Add(new TB_DETALLE_INICIATIVA((ejecucionSolo.Checked) ? "1" : "0", 6, proyecto.ID_PROYECTO));
            detalle.Add(new TB_DETALLE_INICIATIVA((ejecucionAsistida.Checked) ? "1" : "0", 7, proyecto.ID_PROYECTO));
            detalle.Add(new TB_DETALLE_INICIATIVA(adopcionTec.Text, 8, proyecto.ID_PROYECTO));
            detalle.Add(new TB_DETALLE_INICIATIVA(efectosEsperados.Text, 9, proyecto.ID_PROYECTO));
            detalle.Add(new TB_DETALLE_INICIATIVA(efectosEsperadosNegocio.Text, 10, proyecto.ID_PROYECTO));
            detalle.Add(new TB_DETALLE_INICIATIVA(justificacion.Text, 11, proyecto.ID_PROYECTO));
            detalle.Add(new TB_DETALLE_INICIATIVA(margenUtilidad.Text, 12, proyecto.ID_PROYECTO));
            detalle.Add(new TB_DETALLE_INICIATIVA(incrementoProduccion.Text, 13, proyecto.ID_PROYECTO));
            detalle.Add(new TB_DETALLE_INICIATIVA(nuevoVolumen.Text, 14, proyecto.ID_PROYECTO));
            detalle.Add(new TB_DETALLE_INICIATIVA(reducirTiempo.Text, 15, proyecto.ID_PROYECTO));
            detalle.Add(new TB_DETALLE_INICIATIVA(disminucionConsumo.Text, 16, proyecto.ID_PROYECTO));
            detalle.Add(new TB_DETALLE_INICIATIVA(disminucionConsumoMateria.Text, 17, proyecto.ID_PROYECTO));
            detalle.Add(new TB_DETALLE_INICIATIVA(otrosInfo.Text, 18, proyecto.ID_PROYECTO));
            detalle.Add(new TB_DETALLE_INICIATIVA(componentesAdicionales.Text, 19, proyecto.ID_PROYECTO));
            detalle.Add(new TB_DETALLE_INICIATIVA(descripcionfondepro.Text, 20, proyecto.ID_PROYECTO));
            detalle.Add(new TB_DETALLE_INICIATIVA(montoAdopcion.Text, 21, proyecto.ID_PROYECTO));
            detalle.Add(new TB_DETALLE_INICIATIVA(montoComponentes.Text, 22, proyecto.ID_PROYECTO));
            detalle.Add(new TB_DETALLE_INICIATIVA(montoOtros.Text, 23, proyecto.ID_PROYECTO));
            detalle.Add(new TB_DETALLE_INICIATIVA(descripMontoEspecies.Text, 24, proyecto.ID_PROYECTO));
            detalle.Add(new TB_DETALLE_INICIATIVA(montoEspecies.Text, 25, proyecto.ID_PROYECTO));
            detalle.Add(new TB_DETALLE_INICIATIVA(descripMontoEfectivo.Text, 26, proyecto.ID_PROYECTO));
            detalle.Add(new TB_DETALLE_INICIATIVA(montoEfectivo.Text, 27, proyecto.ID_PROYECTO));
            detalle.Add(new TB_DETALLE_INICIATIVA(inputfecha.Text, 28, proyecto.ID_PROYECTO));
            detalle.Add(new TB_DETALLE_INICIATIVA((checkCron.Checked) ? "1" : "0", 29, proyecto.ID_PROYECTO));
            detalle.Add(new TB_DETALLE_INICIATIVA(semanasSelec.Text, 30, proyecto.ID_PROYECTO));
            detalle.Add(new TB_DETALLE_INICIATIVA(montoTotalContrapartida.Text, 184, proyecto.ID_PROYECTO));
            A_TB_DETALLE_INICIATIVA.guardarDetalle(detalle);
        }
        private void ActualizarDetalle()
        {
            detalle.Find(x => x.ID_CAMPO == 1).VALOR = planteamiento.Text;
            detalle.Find(x => x.ID_CAMPO == 2).VALOR = descripcionSolucion.Text;
            detalle.Find(x => x.ID_CAMPO == 3).VALOR = descripcionRelevancia.Text;
            detalle.Find(x => x.ID_CAMPO == 4).VALOR = incrementosEsperados.Text;
            detalle.Find(x => x.ID_CAMPO == 5).VALOR = incrementosEnVentas.Text;
            detalle.Find(x => x.ID_CAMPO == 6).VALOR = (ejecucionSolo.Checked) ? "1" : "0";
            detalle.Find(x => x.ID_CAMPO == 7).VALOR = (ejecucionAsistida.Checked) ? "1" : "0";
            detalle.Find(x => x.ID_CAMPO == 8).VALOR = adopcionTec.Text;
            detalle.Find(x => x.ID_CAMPO == 9).VALOR = efectosEsperados.Text;
            detalle.Find(x => x.ID_CAMPO == 10).VALOR = efectosEsperadosNegocio.Text;
            detalle.Find(x => x.ID_CAMPO == 11).VALOR = justificacion.Text;
            detalle.Find(x => x.ID_CAMPO == 12).VALOR = margenUtilidad.Text;
            detalle.Find(x => x.ID_CAMPO == 13).VALOR = incrementoProduccion.Text;
            detalle.Find(x => x.ID_CAMPO == 14).VALOR = nuevoVolumen.Text;
            detalle.Find(x => x.ID_CAMPO == 15).VALOR = reducirTiempo.Text;
            detalle.Find(x => x.ID_CAMPO == 16).VALOR = disminucionConsumo.Text;
            detalle.Find(x => x.ID_CAMPO == 17).VALOR = disminucionConsumoMateria.Text;
            detalle.Find(x => x.ID_CAMPO == 18).VALOR = otrosInfo.Text;
            detalle.Find(x => x.ID_CAMPO == 19).VALOR = componentesAdicionales.Text;
            detalle.Find(x => x.ID_CAMPO == 20).VALOR = descripcionfondepro.Text;
            detalle.Find(x => x.ID_CAMPO == 21).VALOR = montoAdopcion.Text;
            detalle.Find(x => x.ID_CAMPO == 22).VALOR = montoComponentes.Text;
            detalle.Find(x => x.ID_CAMPO == 23).VALOR = montoOtros.Text;
            detalle.Find(x => x.ID_CAMPO == 24).VALOR = descripMontoEspecies.Text;
            detalle.Find(x => x.ID_CAMPO == 25).VALOR = montoEspecies.Text;
            detalle.Find(x => x.ID_CAMPO == 26).VALOR = descripMontoEfectivo.Text;
            detalle.Find(x => x.ID_CAMPO == 27).VALOR = montoEfectivo.Text;
            detalle.Find(x => x.ID_CAMPO == 28).VALOR = inputfecha.Text;
            detalle.Find(x => x.ID_CAMPO == 29).VALOR = (checkCron.Checked) ? "1" : "0";
            detalle.Find(x => x.ID_CAMPO == 30).VALOR = semanasSelec.Text;

            A_TB_DETALLE_INICIATIVA.ActualizarDetalle(detalle);
        }
        protected void btnProg_Click(object sender, EventArgs e)
        {
            
                
            
            A_PROYECTO.CambiarEstadoProceso(A_ESTADO_PROCESO.ObtenerPorCodigo("PY13").ID_ESTADO_PROCESO, proyecto.ID_PROYECTO, usuario.ID_USUARIO);
            GuardarDetalle();
            ScriptManager.RegisterStartupScript(this, GetType(),
                  "alert",
                  "alert('felicidades! ha guardado el progreso de la iniciativa...');",
                  true);
        }
        protected void btnEditarProgreso_Click(object sender, EventArgs e)
        {

            ActualizarDetalle();

            A_PROYECTO.CambiarEstadoProceso(A_ESTADO_PROCESO.ObtenerPorCodigo("PY13").ID_ESTADO_PROCESO, proyecto.ID_PROYECTO, usuario.ID_USUARIO);
            ScriptManager.RegisterStartupScript(this, GetType(),
                  "alert",
                  "alert('felicidades! ha guardado el progreso de la iniciativa...');",
                  true);
        }
    }
}