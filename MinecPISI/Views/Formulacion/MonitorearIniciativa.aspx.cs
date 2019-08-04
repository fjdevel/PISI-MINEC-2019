using BLL.Acciones;
using BLL.Modelos;
using BLL.Modelos.ModelosVistas;
using MinecPISI.ViewModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MinecPISI.Views.Formulacion
{
    public partial class MonitorearIniciativa : System.Web.UI.Page
    {
        protected A_CRITERIO_EVAL_TEC a_criterioEvalTec = new A_CRITERIO_EVAL_TEC();
        int IdProyecto;
        string codProyEstado;
        protected TB_PROYECTO proyecto;

        protected void Page_Load(object sender, EventArgs e)
        {
                IdProyecto = Convert.ToInt32(Page.RouteData.Values["IdIniciativa"]);

                codProyEstado = a_criterioEvalTec.GetCodigoProyecto(IdProyecto);
                var approveProject = a_criterioEvalTec.CanApproveProject(21, IdProyecto);
                GVMonitorearComite.Enabled = false;

                if (codProyEstado != null && codProyEstado == "PY08" )
                    {

                    BtnAprobar.Enabled = false;
                    BtnAprobar.CssClass = BtnAprobar.CssClass + " disabled";

                    ScriptManager.RegisterStartupScript(this, GetType(), "alert", "alert('El proyecto ya esta aprobado, no puede realizar ningun cambio');", true);
                    }
                //else if(codProyEstado != null && codProyEstado == "PY06")
                //    {

                //    BtnAprobar.Enabled = false;
                //    BtnAprobar.CssClass = BtnAprobar.CssClass + " disabled";
      
                //    ScriptManager.RegisterStartupScript(this, GetType(), "alert", "alert('El proyecto debe haber aprobado el filtro técnico, no puede realizarse la aprobación del comité');", true);
                //    }
                else if (!approveProject)
                    {

                    BtnAprobar.Enabled = false;
                    BtnAprobar.CssClass = BtnAprobar.CssClass + " disabled";

                    ScriptManager.RegisterStartupScript(this, GetType(), "alert", "alert('El proyecto debe tener completas las evaluaciones del comité, no puede realizarse la aprobación del comité');", true);
                    }



                var listCriteriosComite = a_criterioEvalTec.ObtenerCriteriosByEvaluaciones(21, IdProyecto);
                var listEvaluadores = a_criterioEvalTec.ObtenerEvaluadores(21, IdProyecto);


                GVEvaluadores.DataSource = listEvaluadores;
                GVEvaluadores.DataBind();

            if (!IsPostBack)
                {
                    GVMonitorearComite.DataSource = listCriteriosComite;

                    GVMonitorearComite.DataBind();
                }
                
                //Agregando Footer de puntaje total de Tabla
                GVMonitorearComite.FooterRow.Cells[0].ColumnSpan = 2;
                GVMonitorearComite.FooterRow.Cells.RemoveAt(1);

                GVMonitorearComite.FooterRow.Cells[0].Text = "Total";
                GVMonitorearComite.FooterRow.Cells[0].HorizontalAlign = HorizontalAlign.Center;
       
                TextBox lblTotal = new TextBox();
                lblTotal.CssClass = "lbltotal";
                lblTotal.ReadOnly = true;

                double? totalPer = 0;
                foreach (MV_ComiteEvaluacionCriterioCampo criterio in listCriteriosComite)
                {
                    totalPer = totalPer + criterio.Puntaje;
                }
                lblTotal.Text = totalPer.ToString();

                GVMonitorearComite.FooterRow.Cells[1].Controls.Add(lblTotal);


            proyecto = A_PROYECTO.ObtenerProyectoPorId(IdProyecto);
            var detalle = A_TB_DETALLE_INICIATIVA.ObtenerDetalleByProyecto(IdProyecto);
            switch (proyecto.ID_TIPO_INICIATIVA)
            {
                case 1:
                    panelAdopcion.Visible = true;

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
                    break;
                case 2:
                    panelAsistenica.Visible = true;
                    detalle = A_TB_DETALLE_INICIATIVA.ObtenerDetalleByProyecto(IdProyecto);
                    planteamiento2.Text = detalle.Find(x => x.ID_CAMPO == 31).VALOR;
                    descripcionSolucion2.Text = detalle.Find(x => x.ID_CAMPO == 32).VALOR;
                    descripcionRelevancia2.Text = detalle.Find(x => x.ID_CAMPO == 33).VALOR;
                    incrementosEsperados2.Text = detalle.Find(x => x.ID_CAMPO == 34).VALOR;
                    incrementosEnVentas2.Text = detalle.Find(x => x.ID_CAMPO == 35).VALOR;
                    ejecucionSolo2.Checked = detalle.Find(x => x.ID_CAMPO == 36).VALOR == "1" ? true : false;
                    ejecucionAsistida2.Checked = detalle.Find(x => x.ID_CAMPO == 37).VALOR == "1" ? true : false;
                    metodologia2.Text = detalle.Find(x => x.ID_CAMPO == 38).VALOR;
                    conocLocal2.Checked = detalle.Find(x => x.ID_CAMPO == 39).VALOR == "1" ? true : false;
                    atenderLocal2.Checked = detalle.Find(x => x.ID_CAMPO == 40).VALOR == "1" ? true : false;
                    entrenamiento2.Checked = detalle.Find(x => x.ID_CAMPO == 41).VALOR == "1" ? true : false;
                    mixta2.Checked = detalle.Find(x => x.ID_CAMPO == 42).VALOR == "1" ? true : false;
                    duracionDias2.Text = detalle.Find(x => x.ID_CAMPO == 43).VALOR;
                    location2.Text = detalle.Find(x => x.ID_CAMPO == 44).VALOR;
                    recursosAdicionales2.Checked = detalle.Find(x => x.ID_CAMPO == 45).VALOR == "1" ? true : false;
                    conocPrevio2.Checked = detalle.Find(x => x.ID_CAMPO == 46).VALOR == "1" ? true : false;
                    requerimientosPrevios2.Text = detalle.Find(x => x.ID_CAMPO == 47).VALOR;
                    cumple2.Checked = detalle.Find(x => x.ID_CAMPO == 48).VALOR == "1" ? true : false;
                    componentes2.Text = detalle.Find(x => x.ID_CAMPO == 49).VALOR;
                    efectosProblema2.Text = detalle.Find(x => x.ID_CAMPO == 50).VALOR;
                    efectosNegocio2.Text = detalle.Find(x => x.ID_CAMPO == 51).VALOR;
                    incrementoUtilidad2.Text = detalle.Find(x => x.ID_CAMPO == 52).VALOR;
                    reduccionTiempo2.Text = detalle.Find(x => x.ID_CAMPO == 53).VALOR;
                    disminuirConsumo2.Text = detalle.Find(x => x.ID_CAMPO == 54).VALOR;
                    reducirConsumo2.Text = detalle.Find(x => x.ID_CAMPO == 55).VALOR;
                    otros2.Text = detalle.Find(x => x.ID_CAMPO == 56).VALOR;
                    descripcionContrapartida2.Text = detalle.Find(x => x.ID_CAMPO == 57).VALOR;
                    montoAsistencia2.Text = detalle.Find(x => x.ID_CAMPO == 58).VALOR;
                    montoRecursos2.Text = detalle.Find(x => x.ID_CAMPO == 59).VALOR;
                    montoOtros2.Text = detalle.Find(x => x.ID_CAMPO == 60).VALOR;
                    descripMontoEspecies2.Text = detalle.Find(x => x.ID_CAMPO == 61).VALOR;
                    montoEspecies2.Text = detalle.Find(x => x.ID_CAMPO == 62).VALOR;
                    descripMontoEfectivo2.Text = detalle.Find(x => x.ID_CAMPO == 63).VALOR;
                    montoEfectivo2.Text = detalle.Find(x => x.ID_CAMPO == 64).VALOR;
                    inputfecha2.Text = detalle.Find(x => x.ID_CAMPO == 65).VALOR;
                    semanasSelec2.Text = detalle.Find(x => x.ID_CAMPO == 66).VALOR;
                    break;
                case 3:
                    Innovacion.Visible = true;
                    detalle = A_TB_DETALLE_INICIATIVA.ObtenerDetalleByProyecto(IdProyecto);
                    planteamiento3.Text = detalle.Find(x => x.ID_CAMPO == 67).VALOR;
                    descripcionSolucion3.Text = detalle.Find(x => x.ID_CAMPO == 68).VALOR;
                    descripcionRelevancia3.Text = detalle.Find(x => x.ID_CAMPO == 69).VALOR;
                    incrementosEsperados3.Text = detalle.Find(x => x.ID_CAMPO == 70).VALOR;
                    incrementosEnVentas3.Text = detalle.Find(x => x.ID_CAMPO == 71).VALOR;
                    ejecucionSolo3.Checked = detalle.Find(x => x.ID_CAMPO == 72).VALOR == "1" ? true : false;
                    ejecucionAsistida3.Checked = detalle.Find(x => x.ID_CAMPO == 73).VALOR == "1" ? true : false;
                    producto3.Text = detalle.Find(x => x.ID_CAMPO == 74).VALOR;
                    proceso3.Text = detalle.Find(x => x.ID_CAMPO == 75).VALOR;
                    modelo3.Text = detalle.Find(x => x.ID_CAMPO == 76).VALOR;
                    insumoLocal3.Checked = detalle.Find(x => x.ID_CAMPO == 77).VALOR == "1" ? true : false;
                    generic3.Text = detalle.Find(x => x.ID_CAMPO == 78).VALOR;
                    insumoBene3.Checked = detalle.Find(x => x.ID_CAMPO == 79).VALOR == "1" ? true : false;
                    insumoDescrip3.Text = detalle.Find(x => x.ID_CAMPO == 80).VALOR;
                    atenderLocal3.Checked = detalle.Find(x => x.ID_CAMPO == 81).VALOR == "1" ? true : false;
                    entrenamiento3.Checked = detalle.Find(x => x.ID_CAMPO == 82).VALOR == "1" ? true : false;
                    mixta3.Checked = detalle.Find(x => x.ID_CAMPO == 83).VALOR == "1" ? true : false;
                    duracionDias3.Text = detalle.Find(x => x.ID_CAMPO == 84).VALOR;
                    location3.Text = detalle.Find(x => x.ID_CAMPO == 85).VALOR;
                    recursosAdicionales3.Checked = detalle.Find(x => x.ID_CAMPO == 86).VALOR == "1" ? true : false;
                    conocPrevio3.Checked = detalle.Find(x => x.ID_CAMPO == 87).VALOR == "1" ? true : false;
                    requerimientosPrevios3.Text = detalle.Find(x => x.ID_CAMPO == 88).VALOR;
                    cumple3.Checked = detalle.Find(x => x.ID_CAMPO == 89).VALOR == "1" ? true : false;
                    componentes3.Text = detalle.Find(x => x.ID_CAMPO == 90).VALOR;
                    efectosProblema3.Text = detalle.Find(x => x.ID_CAMPO == 91).VALOR;
                    efectosNegocio3.Text = detalle.Find(x => x.ID_CAMPO == 92).VALOR;
                    incrementoUtilidad3.Text = detalle.Find(x => x.ID_CAMPO == 93).VALOR;
                    reduccionTiempo3.Text = detalle.Find(x => x.ID_CAMPO == 94).VALOR;
                    disminuirConsumo3.Text = detalle.Find(x => x.ID_CAMPO == 95).VALOR;
                    reducirConsumo3.Text = detalle.Find(x => x.ID_CAMPO == 96).VALOR;
                    otros3.Text = detalle.Find(x => x.ID_CAMPO == 97).VALOR;
                    descripcionContrapartida3.Text = detalle.Find(x => x.ID_CAMPO == 98).VALOR;
                    montoAsistencia3.Text = detalle.Find(x => x.ID_CAMPO == 99).VALOR;
                    montoRecursos3.Text = detalle.Find(x => x.ID_CAMPO == 100).VALOR;
                    montoOtros3.Text = detalle.Find(x => x.ID_CAMPO == 101).VALOR;
                    descripMontoEspecies3.Text = detalle.Find(x => x.ID_CAMPO == 102).VALOR;
                    montoEspecies3.Text = detalle.Find(x => x.ID_CAMPO == 103).VALOR;
                    descripMontoEfectivo3.Text = detalle.Find(x => x.ID_CAMPO == 104).VALOR;
                    montoEfectivo3.Text = detalle.Find(x => x.ID_CAMPO == 105).VALOR;
                    inputfecha3.Text = detalle.Find(x => x.ID_CAMPO == 106).VALOR;
                    semanasSelec3.Text = detalle.Find(x => x.ID_CAMPO == 107).VALOR;
                    break;
                case 4:
                    panelIntegral.Visible = true;
                    planteamiento4.Text = detalle.Find(x => x.ID_CAMPO == 108).VALOR;
                    descripcionSolucion4.Text = detalle.Find(x => x.ID_CAMPO == 109).VALOR;
                    descripcionRelevancia4.Text = detalle.Find(x => x.ID_CAMPO == 110).VALOR;
                    incrementosEsperados4.Text = detalle.Find(x => x.ID_CAMPO == 111).VALOR;
                    incrementosEnVentas4.Text = detalle.Find(x => x.ID_CAMPO == 112).VALOR;
                    ejecucionSolo4.Checked = detalle.Find(x => x.ID_CAMPO == 113).VALOR == "1" ? true : false;
                    ejecucionAsistida4.Checked = detalle.Find(x => x.ID_CAMPO == 114).VALOR == "1" ? true : false;
                    adopcionTec4.Text = detalle.Find(x => x.ID_CAMPO == 115).VALOR;
                    efectosEsperados4.Text = detalle.Find(x => x.ID_CAMPO == 116).VALOR;
                    efectosEsperadosNegocio4.Text = detalle.Find(x => x.ID_CAMPO == 117).VALOR;
                    justificacion4.Text = detalle.Find(x => x.ID_CAMPO == 118).VALOR;
                    margenUtilidad4.Text = detalle.Find(x => x.ID_CAMPO == 119).VALOR;
                    incrementoProduccion4.Text = detalle.Find(x => x.ID_CAMPO == 120).VALOR;
                    nuevoVolumen4.Text = detalle.Find(x => x.ID_CAMPO == 121).VALOR;
                    reducirTiempo4.Text = detalle.Find(x => x.ID_CAMPO == 122).VALOR;
                    disminucionConsumo4.Text = detalle.Find(x => x.ID_CAMPO == 123).VALOR;
                    disminucionConsumoMateria4.Text = detalle.Find(x => x.ID_CAMPO == 124).VALOR;
                    otrosInfo4.Text = detalle.Find(x => x.ID_CAMPO == 125).VALOR;
                    componentesAdicionales4.Text = detalle.Find(x => x.ID_CAMPO == 126).VALOR;
                    metodologia4.Text = detalle.Find(x => x.ID_CAMPO == 127).VALOR;
                    conocLocal4.Checked = detalle.Find(x => x.ID_CAMPO == 128).VALOR == "1" ? true : false;
                    atenderLocal4.Checked = detalle.Find(x => x.ID_CAMPO == 129).VALOR == "1" ? true : false;
                    entrenamiento4.Checked = detalle.Find(x => x.ID_CAMPO == 130).VALOR == "1" ? true : false;
                    mixta4.Checked = detalle.Find(x => x.ID_CAMPO == 131).VALOR == "1" ? true : false;
                    duracionDias4.Text = detalle.Find(x => x.ID_CAMPO == 132).VALOR;
                    location4.Text = detalle.Find(x => x.ID_CAMPO == 133).VALOR;
                    recursosAdicionales4.Checked = detalle.Find(x => x.ID_CAMPO == 134).VALOR == "1" ? true : false;
                    conocPrevio4.Checked = detalle.Find(x => x.ID_CAMPO == 135).VALOR == "1" ? true : false;
                    requerimientosPrevios4.Text = detalle.Find(x => x.ID_CAMPO == 136).VALOR;
                    cumple4.Checked = detalle.Find(x => x.ID_CAMPO == 137).VALOR == "1" ? true : false;
                    componentes4.Text = detalle.Find(x => x.ID_CAMPO == 138).VALOR;
                    efectosProblema4.Text = detalle.Find(x => x.ID_CAMPO == 139).VALOR;
                    efectosNegocio4.Text = detalle.Find(x => x.ID_CAMPO == 140).VALOR;
                    incrementoUtilidad4.Text = detalle.Find(x => x.ID_CAMPO == 141).VALOR;
                    reduccionTiempo4.Text = detalle.Find(x => x.ID_CAMPO == 142).VALOR;
                    disminuirConsumo4.Text = detalle.Find(x => x.ID_CAMPO == 143).VALOR;
                    reducirConsumo4.Text = detalle.Find(x => x.ID_CAMPO == 144).VALOR;
                    otros4.Text = detalle.Find(x => x.ID_CAMPO == 145).VALOR;
                    producto4.Text = detalle.Find(x => x.ID_CAMPO == 146).VALOR;
                    proceso4.Text = detalle.Find(x => x.ID_CAMPO == 147).VALOR;
                    modelo4.Text = detalle.Find(x => x.ID_CAMPO == 148).VALOR;
                    insumoLocal4.Checked = detalle.Find(x => x.ID_CAMPO == 149).VALOR == "1" ? true : false;
                    generic4.Text = detalle.Find(x => x.ID_CAMPO == 150).VALOR;
                    insumoBene4.Checked = detalle.Find(x => x.ID_CAMPO == 151).VALOR == "1" ? true : false;
                    insumoDescrip4.Text = detalle.Find(x => x.ID_CAMPO == 152).VALOR;
                    atenderLocal44.Checked = detalle.Find(x => x.ID_CAMPO == 153).VALOR == "1" ? true : false;
                    entrenamiento44.Checked = detalle.Find(x => x.ID_CAMPO == 154).VALOR == "1" ? true : false;
                    mixta44.Checked = detalle.Find(x => x.ID_CAMPO == 155).VALOR == "1" ? true : false;
                    dias4.Text = detalle.Find(x => x.ID_CAMPO == 156).VALOR;
                    location44.Text = detalle.Find(x => x.ID_CAMPO == 157).VALOR;
                    recursos4.Checked = detalle.Find(x => x.ID_CAMPO == 158).VALOR == "1" ? true : false;
                    necesidadC4.Checked = detalle.Find(x => x.ID_CAMPO == 159).VALOR == "1" ? true : false;
                    previos4.Text = detalle.Find(x => x.ID_CAMPO == 160).VALOR;
                    cumple44.Checked = detalle.Find(x => x.ID_CAMPO == 161).VALOR == "1" ? true : false;
                    compo4.Text = detalle.Find(x => x.ID_CAMPO == 162).VALOR;
                    efectPro4.Text = detalle.Find(x => x.ID_CAMPO == 163).VALOR;
                    efectNeg4.Text = detalle.Find(x => x.ID_CAMPO == 164).VALOR;
                    margen4.Text = detalle.Find(x => x.ID_CAMPO == 165).VALOR;
                    reduc4.Text = detalle.Find(x => x.ID_CAMPO == 166).VALOR;
                    dismConsu4.Text = detalle.Find(x => x.ID_CAMPO == 167).VALOR;
                    reduCon4.Text = detalle.Find(x => x.ID_CAMPO == 168).VALOR;
                    otros44.Text = detalle.Find(x => x.ID_CAMPO == 169).VALOR;
                    descripcionContrapartida4.Text = detalle.Find(x => x.ID_CAMPO == 170).VALOR;
                    montoAdopcion4.Text = detalle.Find(x => x.ID_CAMPO == 171).VALOR;
                    montoComponentes4.Text = detalle.Find(x => x.ID_CAMPO == 172).VALOR;
                    montoAsistencia4.Text = detalle.Find(x => x.ID_CAMPO == 173).VALOR;
                    recursosAsistencia4.Text = detalle.Find(x => x.ID_CAMPO == 174).VALOR;
                    montoInnovacion4.Text = detalle.Find(x => x.ID_CAMPO == 175).VALOR;
                    recursosInnovacion4.Text = detalle.Find(x => x.ID_CAMPO == 176).VALOR;
                    montoOtros4.Text = detalle.Find(x => x.ID_CAMPO == 177).VALOR;
                    descripMontoEspecies4.Text = detalle.Find(x => x.ID_CAMPO == 178).VALOR;
                    montoEspecies4.Text = detalle.Find(x => x.ID_CAMPO == 179).VALOR;
                    descripMontoEfectivo4.Text = detalle.Find(x => x.ID_CAMPO == 180).VALOR;
                    montoEfectivo4.Text = detalle.Find(x => x.ID_CAMPO == 181).VALOR;
                    inputfecha4.Text = detalle.Find(x => x.ID_CAMPO == 182).VALOR;
                    semanasSelec4.Text = detalle.Find(x => x.ID_CAMPO == 183).VALOR;
                    break;
            }



        }

        protected void GVMonitorearComite_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            int RowSpan = 2;
            for (int i = GVMonitorearComite.Rows.Count - 2; i >= 0; i--)
            {
                GridViewRow currRow = GVMonitorearComite.Rows[i];
                GridViewRow prevRow = GVMonitorearComite.Rows[i + 1];

                if (currRow.Cells[0].Text == prevRow.Cells[0].Text)
                {
                    currRow.Cells[0].RowSpan = RowSpan;
                    prevRow.Cells[0].Visible = false;
                    RowSpan += 1;
                }
                else
                {
                    RowSpan = 2;
                }
            }
        }

        protected void GVEvaluadores_OnRowDataBound(object sender, GridViewRowEventArgs e)
        {
        

        }

        protected void AprobarClick(object sender, EventArgs e)
        {
            var usuario = (MV_DetalleUsuario)Session["usuario"];
            var res = false;
            res = a_criterioEvalTec.AprovarProyecto(IdProyecto, "PY08", usuario.ID_USUARIO);
            A_NOTIFICACION.GuardarNotificacion(A_USUARIO.obtenerCoordinador().ID_USUARIO, usuario.ID_USUARIO, "PY08");
             if (res)
             {
               ScriptManager.RegisterStartupScript(this, GetType(), "alert", "alert('¡Proyecto aprobado exitosamente!');", true);
             }         
        }

        protected void btn_hacerObservaciones_OnClick(object sender, EventArgs e)
        {

           
            A_OBSERVACION.CrearObservacion(A_ESTADO_PROCESO.ObtenerPorCodigo(codProyEstado).ID_ESTADO_PROCESO, txt_observa.Text, "TB_PROYECTO", IdProyecto, 0);

            //A_NOTIFICACION.GuardarNotificacion(usuarioConsultor.ID_USUARIO, usuario.ID_USUARIO, "B03");

            QuitarBackDropModal("RecomendacionesModal", Page);
            txt_observa.Text = "";

            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Pop",
                "ShowMessage('Has hecho una observación al <strong>proyecto</strong>', 'warning');", true);
        }

        public static void QuitarBackDropModal(string modalName, Page page)
        {
            ScriptManager.RegisterStartupScript(page, page.GetType(), "Pop1", "$('#" + modalName + "').modal('hide');", true);
            ScriptManager.RegisterStartupScript(page, page.GetType(), "Pop2", "$('body').removeClass('modal-open');", true);
            ScriptManager.RegisterStartupScript(page, page.GetType(), "Pop3", "$('.modal-backdrop').remove();", true);
        }
    }
}