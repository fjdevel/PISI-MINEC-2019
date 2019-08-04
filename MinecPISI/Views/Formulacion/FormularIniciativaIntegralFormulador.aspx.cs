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
    public partial class FormularIniciativaIntegralFormulador : System.Web.UI.Page
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
                pnl_observaciones.Visible = true;
                var idProyecto = proyecto.ID_PROYECTO;
                detalle = A_TB_DETALLE_INICIATIVA.ObtenerDetalleByProyecto(idProyecto);
                if (!Page.IsPostBack)
                {
                    planteamiento.Text = detalle.Find(x => x.ID_CAMPO == 108).VALOR;
                    descripcionSolucion.Text = detalle.Find(x => x.ID_CAMPO == 109).VALOR;
                    descripcionRelevancia.Text = detalle.Find(x => x.ID_CAMPO == 110).VALOR;
                    incrementosEsperados.Text = detalle.Find(x => x.ID_CAMPO == 111).VALOR;
                    incrementosEnVentas.Text = detalle.Find(x => x.ID_CAMPO == 112).VALOR;
                    ejecucionSolo.Checked = detalle.Find(x => x.ID_CAMPO == 113).VALOR == "1" ? true : false;
                    ejecucionAsistida.Checked = detalle.Find(x => x.ID_CAMPO == 114).VALOR == "1" ? true : false;
                    adopcionTec.Text = detalle.Find(x => x.ID_CAMPO == 115).VALOR;
                    efectosEsperados.Text = detalle.Find(x => x.ID_CAMPO == 116).VALOR;
                    efectosEsperadosNegocio.Text = detalle.Find(x => x.ID_CAMPO == 117).VALOR;
                    justificacion.Text = detalle.Find(x => x.ID_CAMPO == 118).VALOR;
                    margenUtilidad.Text = detalle.Find(x => x.ID_CAMPO == 119).VALOR;
                    incrementoProduccion.Text = detalle.Find(x => x.ID_CAMPO == 120).VALOR;
                    nuevoVolumen.Text = detalle.Find(x => x.ID_CAMPO == 121).VALOR;
                    reducirTiempo.Text = detalle.Find(x => x.ID_CAMPO == 122).VALOR;
                    disminucionConsumo.Text = detalle.Find(x => x.ID_CAMPO == 123).VALOR;
                    disminucionConsumoMateria.Text = detalle.Find(x => x.ID_CAMPO == 124).VALOR;
                    otrosInfo.Text = detalle.Find(x => x.ID_CAMPO == 125).VALOR;
                    componentesAdicionales.Text = detalle.Find(x => x.ID_CAMPO == 126).VALOR;
                    metodologia.Text = detalle.Find(x => x.ID_CAMPO == 127).VALOR;
                    conocLocal.Checked = detalle.Find(x => x.ID_CAMPO == 128).VALOR == "1" ? true : false;
                    atenderLocal.Checked = detalle.Find(x => x.ID_CAMPO == 129).VALOR == "1" ? true : false;
                    entrenamiento.Checked = detalle.Find(x => x.ID_CAMPO == 130).VALOR == "1" ? true : false;
                    mixta.Checked = detalle.Find(x => x.ID_CAMPO == 131).VALOR == "1" ? true : false;
                    duracionDias.Text = detalle.Find(x => x.ID_CAMPO == 132).VALOR;
                    location.Text = detalle.Find(x => x.ID_CAMPO == 133).VALOR;
                    recursosAdicionales.Checked = detalle.Find(x => x.ID_CAMPO == 134).VALOR == "1" ? true : false;
                    conocPrevio.Checked = detalle.Find(x => x.ID_CAMPO == 135).VALOR == "1" ? true : false;
                    requerimientosPrevios.Text = detalle.Find(x => x.ID_CAMPO == 136).VALOR;
                    cumple.Checked = detalle.Find(x => x.ID_CAMPO == 137).VALOR == "1" ? true : false;
                    componentes.Text = detalle.Find(x => x.ID_CAMPO == 138).VALOR;
                    efectosProblema.Text = detalle.Find(x => x.ID_CAMPO == 139).VALOR;
                    efectosNegocio.Text = detalle.Find(x => x.ID_CAMPO == 140).VALOR;
                    incrementoUtilidad.Text = detalle.Find(x => x.ID_CAMPO == 141).VALOR;
                    reduccionTiempo.Text = detalle.Find(x => x.ID_CAMPO == 142).VALOR;
                    disminuirConsumo.Text = detalle.Find(x => x.ID_CAMPO == 143).VALOR;
                    reducirConsumo.Text = detalle.Find(x => x.ID_CAMPO == 144).VALOR;
                    otros.Text = detalle.Find(x => x.ID_CAMPO == 145).VALOR;
                    producto.Text = detalle.Find(x => x.ID_CAMPO == 146).VALOR;
                    proceso.Text = detalle.Find(x => x.ID_CAMPO == 147).VALOR;
                    modelo.Text = detalle.Find(x => x.ID_CAMPO == 148).VALOR;
                    insumoLocal.Checked = detalle.Find(x => x.ID_CAMPO == 149).VALOR == "1" ? true : false;
                    generic.Text = detalle.Find(x => x.ID_CAMPO == 150).VALOR;
                    insumoBene.Checked = detalle.Find(x => x.ID_CAMPO == 151).VALOR == "1" ? true : false;
                    insumoDescrip.Text = detalle.Find(x => x.ID_CAMPO == 152).VALOR;
                    atenderLocal2.Checked = detalle.Find(x => x.ID_CAMPO == 153).VALOR == "1" ? true : false;
                    entrenamiento2.Checked = detalle.Find(x => x.ID_CAMPO == 154).VALOR == "1" ? true : false;
                    mixta2.Checked = detalle.Find(x => x.ID_CAMPO == 155).VALOR == "1" ? true : false;
                    dias2.Text = detalle.Find(x => x.ID_CAMPO == 156).VALOR;
                    location2.Text = detalle.Find(x => x.ID_CAMPO == 157).VALOR;
                    recursos2.Checked = detalle.Find(x => x.ID_CAMPO == 158).VALOR == "1" ? true : false;
                    necesidadC2.Checked = detalle.Find(x => x.ID_CAMPO == 159).VALOR == "1" ? true : false;
                    previos.Text = detalle.Find(x => x.ID_CAMPO == 160).VALOR;
                    cumple2.Checked = detalle.Find(x => x.ID_CAMPO == 161).VALOR == "1" ? true : false;
                    compo2.Text = detalle.Find(x => x.ID_CAMPO == 162).VALOR;
                    efectPro2.Text = detalle.Find(x => x.ID_CAMPO == 163).VALOR;
                    efectNeg2.Text = detalle.Find(x => x.ID_CAMPO == 164).VALOR;
                    margen2.Text = detalle.Find(x => x.ID_CAMPO == 165).VALOR;
                    reduc2.Text = detalle.Find(x => x.ID_CAMPO == 166).VALOR;
                    dismConsu.Text = detalle.Find(x => x.ID_CAMPO == 167).VALOR;
                    reduCon.Text = detalle.Find(x => x.ID_CAMPO == 168).VALOR;
                    otro2.Text = detalle.Find(x => x.ID_CAMPO == 169).VALOR;
                    descripcionContrapartida.Text = detalle.Find(x => x.ID_CAMPO == 170).VALOR;
                    montoAdopcion.Text = detalle.Find(x => x.ID_CAMPO == 171).VALOR;
                    montoComponentes.Text = detalle.Find(x => x.ID_CAMPO == 172).VALOR;
                    montoAsistencia.Text = detalle.Find(x => x.ID_CAMPO == 173).VALOR;
                    recursosAsistencia.Text = detalle.Find(x => x.ID_CAMPO == 174).VALOR;
                    montoInnovacion.Text = detalle.Find(x => x.ID_CAMPO == 175).VALOR;
                    recursosInnovacion.Text = detalle.Find(x => x.ID_CAMPO == 176).VALOR;
                    montoOtros.Text = detalle.Find(x => x.ID_CAMPO == 177).VALOR;
                    descripMontoEspecies.Text = detalle.Find(x => x.ID_CAMPO == 178).VALOR;
                    montoEspecies.Text = detalle.Find(x => x.ID_CAMPO == 179).VALOR;
                    descripMontoEfectivo.Text = detalle.Find(x => x.ID_CAMPO == 180).VALOR;
                    montoEfectivo.Text = detalle.Find(x => x.ID_CAMPO == 181).VALOR;
                    inputfecha.Text = detalle.Find(x => x.ID_CAMPO == 182).VALOR;
                    semanasSelec.Text = detalle.Find(x => x.ID_CAMPO == 183).VALOR;
                }
            }
        }
        private void GuardarDetalle()
        {
            List<TB_DETALLE_INICIATIVA> detalle = new List<TB_DETALLE_INICIATIVA>();
            detalle.Add(new TB_DETALLE_INICIATIVA(planteamiento.Text, 108, proyecto.ID_PROYECTO));
            detalle.Add(new TB_DETALLE_INICIATIVA(descripcionSolucion.Text, 109, proyecto.ID_PROYECTO));
            detalle.Add(new TB_DETALLE_INICIATIVA(descripcionRelevancia.Text, 110, proyecto.ID_PROYECTO));
            detalle.Add(new TB_DETALLE_INICIATIVA(incrementosEsperados.Text, 111, proyecto.ID_PROYECTO));
            detalle.Add(new TB_DETALLE_INICIATIVA(incrementosEnVentas.Text, 112, proyecto.ID_PROYECTO));
            detalle.Add(new TB_DETALLE_INICIATIVA((ejecucionSolo.Checked) ? "1" : "0", 113, proyecto.ID_PROYECTO));
            detalle.Add(new TB_DETALLE_INICIATIVA((ejecucionAsistida.Checked) ? "1" : "0", 114, proyecto.ID_PROYECTO));
            detalle.Add(new TB_DETALLE_INICIATIVA(adopcionTec.Text, 115, proyecto.ID_PROYECTO));
            detalle.Add(new TB_DETALLE_INICIATIVA(efectosEsperados.Text, 116, proyecto.ID_PROYECTO));
            detalle.Add(new TB_DETALLE_INICIATIVA(efectosEsperadosNegocio.Text, 117, proyecto.ID_PROYECTO));
            detalle.Add(new TB_DETALLE_INICIATIVA(justificacion.Text, 118, proyecto.ID_PROYECTO));
            detalle.Add(new TB_DETALLE_INICIATIVA(margenUtilidad.Text, 119, proyecto.ID_PROYECTO));
            detalle.Add(new TB_DETALLE_INICIATIVA(incrementoProduccion.Text, 120, proyecto.ID_PROYECTO));
            detalle.Add(new TB_DETALLE_INICIATIVA(nuevoVolumen.Text, 121, proyecto.ID_PROYECTO));
            detalle.Add(new TB_DETALLE_INICIATIVA(reducirTiempo.Text, 122, proyecto.ID_PROYECTO));
            detalle.Add(new TB_DETALLE_INICIATIVA(disminucionConsumo.Text, 123, proyecto.ID_PROYECTO));
            detalle.Add(new TB_DETALLE_INICIATIVA(disminucionConsumoMateria.Text, 124, proyecto.ID_PROYECTO));
            detalle.Add(new TB_DETALLE_INICIATIVA(otrosInfo.Text, 125, proyecto.ID_PROYECTO));
            detalle.Add(new TB_DETALLE_INICIATIVA(componentesAdicionales.Text, 126, proyecto.ID_PROYECTO));
            detalle.Add(new TB_DETALLE_INICIATIVA(metodologia.Text, 127, proyecto.ID_PROYECTO));
            detalle.Add(new TB_DETALLE_INICIATIVA((conocLocal.Checked) ? "1" : "0", 128, proyecto.ID_PROYECTO));
            detalle.Add(new TB_DETALLE_INICIATIVA((atenderLocal.Checked) ? "1" : "0", 129, proyecto.ID_PROYECTO));
            detalle.Add(new TB_DETALLE_INICIATIVA((entrenamiento.Checked) ? "1" : "0", 130, proyecto.ID_PROYECTO));
            detalle.Add(new TB_DETALLE_INICIATIVA((mixta.Checked) ? "1" : "0", 131, proyecto.ID_PROYECTO));
            detalle.Add(new TB_DETALLE_INICIATIVA(duracionDias.Text, 132, proyecto.ID_PROYECTO));
            detalle.Add(new TB_DETALLE_INICIATIVA(location.Text == "" ? "" : location.Text, 133, proyecto.ID_PROYECTO));
            detalle.Add(new TB_DETALLE_INICIATIVA((recursosAdicionales.Checked) ? "1" : "0", 134, proyecto.ID_PROYECTO));
            detalle.Add(new TB_DETALLE_INICIATIVA((conocPrevio.Checked) ? "1" : "0", 135, proyecto.ID_PROYECTO));
            detalle.Add(new TB_DETALLE_INICIATIVA(requerimientosPrevios.Text, 136, proyecto.ID_PROYECTO));
            detalle.Add(new TB_DETALLE_INICIATIVA((cumple.Checked) ? "1" : "0", 137, proyecto.ID_PROYECTO));
            detalle.Add(new TB_DETALLE_INICIATIVA(componentes.Text, 138, proyecto.ID_PROYECTO));
            detalle.Add(new TB_DETALLE_INICIATIVA(efectosProblema.Text, 139, proyecto.ID_PROYECTO));
            detalle.Add(new TB_DETALLE_INICIATIVA(efectosNegocio.Text, 140, proyecto.ID_PROYECTO));
            detalle.Add(new TB_DETALLE_INICIATIVA(incrementoUtilidad.Text, 141, proyecto.ID_PROYECTO));
            detalle.Add(new TB_DETALLE_INICIATIVA(reduccionTiempo.Text, 142, proyecto.ID_PROYECTO));
            detalle.Add(new TB_DETALLE_INICIATIVA(disminuirConsumo.Text, 143, proyecto.ID_PROYECTO));
            detalle.Add(new TB_DETALLE_INICIATIVA(reducirConsumo.Text, 144, proyecto.ID_PROYECTO));
            detalle.Add(new TB_DETALLE_INICIATIVA(otros.Text, 145, proyecto.ID_PROYECTO));
            detalle.Add(new TB_DETALLE_INICIATIVA(producto.Text, 146, proyecto.ID_PROYECTO));
            detalle.Add(new TB_DETALLE_INICIATIVA(proceso.Text, 147, proyecto.ID_PROYECTO));
            detalle.Add(new TB_DETALLE_INICIATIVA(modelo.Text, 148, proyecto.ID_PROYECTO));
            detalle.Add(new TB_DETALLE_INICIATIVA((insumoLocal.Checked) ? "1" : "0", 149, proyecto.ID_PROYECTO));
            detalle.Add(new TB_DETALLE_INICIATIVA(generic.Text, 150, proyecto.ID_PROYECTO));
            detalle.Add(new TB_DETALLE_INICIATIVA((insumoBene.Checked) ? "1" : "0", 151, proyecto.ID_PROYECTO));
            detalle.Add(new TB_DETALLE_INICIATIVA(insumoDescrip.Text, 152, proyecto.ID_PROYECTO));
            detalle.Add(new TB_DETALLE_INICIATIVA((atenderLocal2.Checked) ? "1" : "0", 153, proyecto.ID_PROYECTO));
            detalle.Add(new TB_DETALLE_INICIATIVA((entrenamiento2.Checked) ? "1" : "0", 154, proyecto.ID_PROYECTO));
            detalle.Add(new TB_DETALLE_INICIATIVA((mixta2.Checked) ? "1" : "0", 155, proyecto.ID_PROYECTO));
            detalle.Add(new TB_DETALLE_INICIATIVA(dias2.Text, 156, proyecto.ID_PROYECTO));
            detalle.Add(new TB_DETALLE_INICIATIVA(location2.Text == "" ? "" : location.Text, 157, proyecto.ID_PROYECTO));
            detalle.Add(new TB_DETALLE_INICIATIVA((recursos2.Checked) ? "1" : "0", 158, proyecto.ID_PROYECTO));
            detalle.Add(new TB_DETALLE_INICIATIVA((necesidadC2.Checked) ? "1" : "0", 159, proyecto.ID_PROYECTO));
            detalle.Add(new TB_DETALLE_INICIATIVA(previos.Text, 160, proyecto.ID_PROYECTO));
            detalle.Add(new TB_DETALLE_INICIATIVA((cumple2.Checked) ? "1" : "0", 161, proyecto.ID_PROYECTO));
            detalle.Add(new TB_DETALLE_INICIATIVA(compo2.Text, 162, proyecto.ID_PROYECTO));
            detalle.Add(new TB_DETALLE_INICIATIVA(efectPro2.Text, 163, proyecto.ID_PROYECTO));
            detalle.Add(new TB_DETALLE_INICIATIVA(efectNeg2.Text, 164, proyecto.ID_PROYECTO));
            detalle.Add(new TB_DETALLE_INICIATIVA(margen2.Text, 165, proyecto.ID_PROYECTO));
            detalle.Add(new TB_DETALLE_INICIATIVA(reduc2.Text, 166, proyecto.ID_PROYECTO));
            detalle.Add(new TB_DETALLE_INICIATIVA(dismConsu.Text, 167, proyecto.ID_PROYECTO));
            detalle.Add(new TB_DETALLE_INICIATIVA(reduCon.Text, 168, proyecto.ID_PROYECTO));
            detalle.Add(new TB_DETALLE_INICIATIVA(otro2.Text, 169, proyecto.ID_PROYECTO));
            detalle.Add(new TB_DETALLE_INICIATIVA(descripcionContrapartida.Text, 170, proyecto.ID_PROYECTO));
            detalle.Add(new TB_DETALLE_INICIATIVA(montoAdopcion.Text, 171, proyecto.ID_PROYECTO));
            detalle.Add(new TB_DETALLE_INICIATIVA(montoComponentes.Text, 172, proyecto.ID_PROYECTO));
            detalle.Add(new TB_DETALLE_INICIATIVA(montoAsistencia.Text, 173, proyecto.ID_PROYECTO));
            detalle.Add(new TB_DETALLE_INICIATIVA(recursosAsistencia.Text, 174, proyecto.ID_PROYECTO));
            detalle.Add(new TB_DETALLE_INICIATIVA(montoInnovacion.Text, 175, proyecto.ID_PROYECTO));
            detalle.Add(new TB_DETALLE_INICIATIVA(recursosInnovacion.Text, 176, proyecto.ID_PROYECTO));
            detalle.Add(new TB_DETALLE_INICIATIVA(montoOtros.Text, 177, proyecto.ID_PROYECTO));
            detalle.Add(new TB_DETALLE_INICIATIVA(descripMontoEspecies.Text, 178, proyecto.ID_PROYECTO));
            detalle.Add(new TB_DETALLE_INICIATIVA(montoEspecies.Text, 179, proyecto.ID_PROYECTO));
            detalle.Add(new TB_DETALLE_INICIATIVA(descripMontoEfectivo.Text, 180, proyecto.ID_PROYECTO));
            detalle.Add(new TB_DETALLE_INICIATIVA(montoEfectivo.Text, 181, proyecto.ID_PROYECTO));
            detalle.Add(new TB_DETALLE_INICIATIVA(inputfecha.Text, 182, proyecto.ID_PROYECTO));
            detalle.Add(new TB_DETALLE_INICIATIVA(semanasSelec.Text, 183, proyecto.ID_PROYECTO));
            detalle.Add(new TB_DETALLE_INICIATIVA(montoTotalContrapartida.Text, 187, proyecto.ID_PROYECTO));

            A_TB_DETALLE_INICIATIVA.guardarDetalle(detalle);
        }
        private void ActualizarDetalle()
        {
            detalle.Find(x => x.ID_CAMPO == 108).VALOR = planteamiento.Text;
            detalle.Find(x => x.ID_CAMPO == 109).VALOR = descripcionSolucion.Text;
            detalle.Find(x => x.ID_CAMPO == 110).VALOR = descripcionRelevancia.Text;
            detalle.Find(x => x.ID_CAMPO == 111).VALOR = incrementosEsperados.Text;
            detalle.Find(x => x.ID_CAMPO == 112).VALOR = incrementosEnVentas.Text;
            detalle.Find(x => x.ID_CAMPO == 113).VALOR = (ejecucionSolo.Checked) ? "1" : "0";
            detalle.Find(x => x.ID_CAMPO == 114).VALOR = (ejecucionAsistida.Checked) ? "1" : "0";
            detalle.Find(x => x.ID_CAMPO == 115).VALOR = adopcionTec.Text;
            detalle.Find(x => x.ID_CAMPO == 116).VALOR = efectosEsperados.Text;
            detalle.Find(x => x.ID_CAMPO == 117).VALOR = efectosEsperadosNegocio.Text;
            detalle.Find(x => x.ID_CAMPO == 118).VALOR = justificacion.Text;
            detalle.Find(x => x.ID_CAMPO == 119).VALOR = margenUtilidad.Text;
            detalle.Find(x => x.ID_CAMPO == 120).VALOR = incrementoProduccion.Text;
            detalle.Find(x => x.ID_CAMPO == 121).VALOR = nuevoVolumen.Text;
            detalle.Find(x => x.ID_CAMPO == 122).VALOR = reducirTiempo.Text;
            detalle.Find(x => x.ID_CAMPO == 123).VALOR = disminucionConsumo.Text;
            detalle.Find(x => x.ID_CAMPO == 124).VALOR = disminucionConsumoMateria.Text;
            detalle.Find(x => x.ID_CAMPO == 125).VALOR = otrosInfo.Text;
            detalle.Find(x => x.ID_CAMPO == 126).VALOR = componentesAdicionales.Text;
            detalle.Find(x => x.ID_CAMPO == 127).VALOR = metodologia.Text;
            detalle.Find(x => x.ID_CAMPO == 128).VALOR = conocLocal.Checked ? "1" : "0";
            detalle.Find(x => x.ID_CAMPO == 129).VALOR = atenderLocal.Checked ? "1" : "0";
            detalle.Find(x => x.ID_CAMPO == 130).VALOR = entrenamiento.Checked ? "1" : "0";
            detalle.Find(x => x.ID_CAMPO == 131).VALOR = mixta.Checked ? "1" : "0";
            detalle.Find(x => x.ID_CAMPO == 132).VALOR = duracionDias.Text;
            detalle.Find(x => x.ID_CAMPO == 133).VALOR = location.Text;
            detalle.Find(x => x.ID_CAMPO == 134).VALOR = recursosAdicionales.Checked ? "1" : "0";
            detalle.Find(x => x.ID_CAMPO == 135).VALOR = conocPrevio.Checked ? "1" : "0";
            detalle.Find(x => x.ID_CAMPO == 136).VALOR = requerimientosPrevios.Text;
            detalle.Find(x => x.ID_CAMPO == 137).VALOR = cumple.Checked ? "1" : "0";
            detalle.Find(x => x.ID_CAMPO == 138).VALOR = componentes.Text;
            detalle.Find(x => x.ID_CAMPO == 139).VALOR = efectosProblema.Text;
            detalle.Find(x => x.ID_CAMPO == 140).VALOR = efectosNegocio.Text;
            detalle.Find(x => x.ID_CAMPO == 141).VALOR = incrementoUtilidad.Text;
            detalle.Find(x => x.ID_CAMPO == 142).VALOR = reduccionTiempo.Text;
            detalle.Find(x => x.ID_CAMPO == 143).VALOR = disminuirConsumo.Text;
            detalle.Find(x => x.ID_CAMPO == 144).VALOR = reducirConsumo.Text;
            detalle.Find(x => x.ID_CAMPO == 145).VALOR = otros.Text;
            detalle.Find(x => x.ID_CAMPO == 146).VALOR = producto.Text;
            detalle.Find(x => x.ID_CAMPO == 147).VALOR = proceso.Text;
            detalle.Find(x => x.ID_CAMPO == 148).VALOR = modelo.Text;
            detalle.Find(x => x.ID_CAMPO == 149).VALOR = insumoLocal.Checked ? "1" : "0";
            detalle.Find(x => x.ID_CAMPO == 150).VALOR = generic.Text;
            detalle.Find(x => x.ID_CAMPO == 151).VALOR = insumoBene.Checked ? "1" : "0";
            detalle.Find(x => x.ID_CAMPO == 152).VALOR = insumoDescrip.Text;
            detalle.Find(x => x.ID_CAMPO == 153).VALOR = atenderLocal2.Checked ? "1" : "0";
            detalle.Find(x => x.ID_CAMPO == 154).VALOR = entrenamiento2.Checked ? "1" : "0";
            detalle.Find(x => x.ID_CAMPO == 155).VALOR = mixta2.Checked ? "1" : "0";
            detalle.Find(x => x.ID_CAMPO == 156).VALOR = dias2.Text;
            detalle.Find(x => x.ID_CAMPO == 157).VALOR = location2.Text;
            detalle.Find(x => x.ID_CAMPO == 158).VALOR = recursos2.Checked ? "1" : "0";
            detalle.Find(x => x.ID_CAMPO == 159).VALOR = necesidadC2.Checked ? "1" : "0";
            detalle.Find(x => x.ID_CAMPO == 160).VALOR = previos.Text;
            detalle.Find(x => x.ID_CAMPO == 151).VALOR = cumple2.Checked ? "1" : "0";
            detalle.Find(x => x.ID_CAMPO == 162).VALOR = compo2.Text;
            detalle.Find(x => x.ID_CAMPO == 163).VALOR = efectPro2.Text;
            detalle.Find(x => x.ID_CAMPO == 164).VALOR = efectNeg2.Text;
            detalle.Find(x => x.ID_CAMPO == 165).VALOR = margen2.Text;
            detalle.Find(x => x.ID_CAMPO == 166).VALOR = reduc2.Text;
            detalle.Find(x => x.ID_CAMPO == 167).VALOR = dismConsu.Text;
            detalle.Find(x => x.ID_CAMPO == 168).VALOR = reduCon.Text;
            detalle.Find(x => x.ID_CAMPO == 169).VALOR = otro2.Text;
            detalle.Find(x => x.ID_CAMPO == 170).VALOR = descripcionContrapartida.Text;
            detalle.Find(x => x.ID_CAMPO == 171).VALOR = montoAdopcion.Text;
            detalle.Find(x => x.ID_CAMPO == 172).VALOR = montoComponentes.Text;
            detalle.Find(x => x.ID_CAMPO == 173).VALOR = montoAsistencia.Text;
            detalle.Find(x => x.ID_CAMPO == 174).VALOR = recursosAsistencia.Text;
            detalle.Find(x => x.ID_CAMPO == 175).VALOR = montoInnovacion.Text;
            detalle.Find(x => x.ID_CAMPO == 176).VALOR = recursosInnovacion.Text;
            detalle.Find(x => x.ID_CAMPO == 177).VALOR = montoOtros.Text;
            detalle.Find(x => x.ID_CAMPO == 178).VALOR = descripMontoEspecies.Text;
            detalle.Find(x => x.ID_CAMPO == 179).VALOR = montoEspecies.Text;
            detalle.Find(x => x.ID_CAMPO == 180).VALOR = descripMontoEfectivo.Text;
            detalle.Find(x => x.ID_CAMPO == 181).VALOR = montoEfectivo.Text;
            detalle.Find(x => x.ID_CAMPO == 182).VALOR = inputfecha.Text;
            detalle.Find(x => x.ID_CAMPO == 183).VALOR = semanasSelec.Text;

            A_TB_DETALLE_INICIATIVA.ActualizarDetalle(detalle);
        }
        protected void btnguardar_Click(object sender, EventArgs e)
        {

            GuardarDetalle();
            if (proyecto.ID_PROPUESTA == 0)
            {
                A_PROYECTO.CambiarEstadoProceso(A_ESTADO_PROCESO.ObtenerPorCodigo("PY03").ID_ESTADO_PROCESO, proyecto.ID_PROYECTO, ((MV_DetalleUsuario)Session["usuario"]).ID_USUARIO);

            }
            else
            {
                A_PROYECTO.CambiarEstadoProceso(A_ESTADO_PROCESO.ObtenerPorCodigo("PY02").ID_ESTADO_PROCESO, proyecto.ID_PROYECTO, ((MV_DetalleUsuario)Session["usuario"]).ID_USUARIO);
                A_NOTIFICACION.GuardarNotificacion(proyecto.USUARIO_CREA, ((MV_DetalleUsuario)Session["usuario"]).ID_USUARIO, "PY03");
            }

            ScriptManager.RegisterStartupScript(this, GetType(),
                    "alert",
                    "alert('felicidades! has presentado una iniciativa...');",
                    true);

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