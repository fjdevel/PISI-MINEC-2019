using BLL.Acciones;
using BLL.Helpers;
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
    public partial class FormularIniciativaProyectoInnovacionFormulador : System.Web.UI.Page
    {
        protected TB_PROYECTO proyecto = new TB_PROYECTO();
        protected MV_DetalleUsuario usuario;
        protected int edit = 0;
        public List<BLL.Modelos.TB_OBSERVACION> observaciones = new List<BLL.Modelos.TB_OBSERVACION>();
        protected List<TB_DETALLE_INICIATIVA> detalle;
        protected MV_DetalleProblema problema;

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
                usuario = ((MV_DetalleUsuario)Session["usuario"]);
                detalle = A_TB_DETALLE_INICIATIVA.ObtenerDetalleByProyecto(idProyecto);
                if (!Page.IsPostBack)
                {
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
                    montoTotalContrapartida.Text = detalle.Find(x => x.ID_CAMPO == 186).VALOR;
                }
            }
            problema = A_PROBLEMA.getByIdProblema(proyecto.ID_PROBLEMA);
        }
        protected void btn_upload_factura_Click(object sender, EventArgs e)
        {
            if (ValidarArchivo(lbl_factura, fl_factura))
                SubirArchivo(lbl_factura, fl_factura, "formulacion", (int)problema.ID_BENEFICIARIO);
        }
        private void SubirArchivo(Label label, FileUpload fileUpload, string nombreArchivo, int idBeneficiario)
        {
            string fileName = nombreArchivo + proyecto.ID_PROYECTO + "_" + idBeneficiario + "_" + fileUpload.PostedFile.FileName;
            string folderPath = Server.MapPath("~/Data/");
            string saveLocation = folderPath + "\\" + fileName;

            if (!Directory.Exists(folderPath))
                Directory.CreateDirectory(folderPath);

            try
            {
                fileUpload.PostedFile.SaveAs(saveLocation);

                A_DOCUMENTO.GuardarDocumento(idBeneficiario, saveLocation, nombreArchivo);

                label.Text = "Se almaceno correctamente el archivo en el servidor";
                label.ForeColor = System.Drawing.Color.Green;
            }
            catch (Exception ex)
            {
                label.Text = "Ocurrio un error al intentar subir el archivo al servidor " + ex.Message;
                label.ForeColor = System.Drawing.Color.Red;
                H_LogErrorEXC.GuardarRegistroLogError(ex);
            }

        }

        private bool ValidarArchivo(Label label, FileUpload fileUpload)
        {
            label.Text = "";

            if (fileUpload.HasFile)
            {
                string fileExt = Path.GetExtension(fileUpload.PostedFile.FileName).ToLower();
                int fileSize = fileUpload.PostedFile.ContentLength;

                if (fileExt != ".jpeg" && fileExt != ".jpg" && fileExt != ".png" && fileExt != ".pdf")
                {
                    label.Text = "Solo se permiten archivos de tipo imagen o con extensión .pdf";
                    label.ForeColor = System.Drawing.Color.Red;
                }
                else
                {
                    if (fileSize > 2097152)
                    {
                        label.Text = "Tamaño maximo de 2(MB) excedido";
                        label.ForeColor = System.Drawing.Color.Red;
                    }
                    else
                    {
                        return true;
                    }
                }
            }
            else
            {
                label.Text = "No se ha seleccionado ningun archivo.";
                label.ForeColor = System.Drawing.Color.Red;
            }

            return false;
        }
        private void GuardarDetalle()
        {
            List<TB_DETALLE_INICIATIVA> detalle = new List<TB_DETALLE_INICIATIVA>();
            detalle.Add(new TB_DETALLE_INICIATIVA(planteamiento.Text, 67, proyecto.ID_PROYECTO));
            detalle.Add(new TB_DETALLE_INICIATIVA(descripcionSolucion.Text, 68, proyecto.ID_PROYECTO));
            detalle.Add(new TB_DETALLE_INICIATIVA(descripcionRelevancia.Text, 69, proyecto.ID_PROYECTO));
            detalle.Add(new TB_DETALLE_INICIATIVA(incrementosEsperados.Text, 70, proyecto.ID_PROYECTO));
            detalle.Add(new TB_DETALLE_INICIATIVA(incrementosEnVentas.Text, 71, proyecto.ID_PROYECTO));
            detalle.Add(new TB_DETALLE_INICIATIVA((ejecucionSolo.Checked) ? "1" : "0", 72, proyecto.ID_PROYECTO));
            detalle.Add(new TB_DETALLE_INICIATIVA((ejecucionAsistida.Checked) ? "1" : "0", 73, proyecto.ID_PROYECTO));
            detalle.Add(new TB_DETALLE_INICIATIVA(producto.Text, 74, proyecto.ID_PROYECTO));
            detalle.Add(new TB_DETALLE_INICIATIVA(proceso.Text, 75, proyecto.ID_PROYECTO));
            detalle.Add(new TB_DETALLE_INICIATIVA(modelo.Text, 76, proyecto.ID_PROYECTO));
            detalle.Add(new TB_DETALLE_INICIATIVA((insumoLocal.Checked) ? "1" : "0", 77, proyecto.ID_PROYECTO));
            detalle.Add(new TB_DETALLE_INICIATIVA(generic.Text, 78, proyecto.ID_PROYECTO));
            detalle.Add(new TB_DETALLE_INICIATIVA((insumoBene.Checked) ? "1" : "0", 79, proyecto.ID_PROYECTO));
            detalle.Add(new TB_DETALLE_INICIATIVA(insumoDescrip.Text, 80, proyecto.ID_PROYECTO));
            detalle.Add(new TB_DETALLE_INICIATIVA((atenderLocal.Checked) ? "1" : "0", 81, proyecto.ID_PROYECTO));
            detalle.Add(new TB_DETALLE_INICIATIVA((entrenamiento.Checked) ? "1" : "0", 82, proyecto.ID_PROYECTO));
            detalle.Add(new TB_DETALLE_INICIATIVA((mixta.Checked) ? "1" : "0", 83, proyecto.ID_PROYECTO));
            detalle.Add(new TB_DETALLE_INICIATIVA(duracionDias.Text, 84, proyecto.ID_PROYECTO));
            detalle.Add(new TB_DETALLE_INICIATIVA(location.Text == "" ? "" : location.Text, 85, proyecto.ID_PROYECTO));
            detalle.Add(new TB_DETALLE_INICIATIVA((recursosAdicionales.Checked) ? "1" : "0", 86, proyecto.ID_PROYECTO));
            detalle.Add(new TB_DETALLE_INICIATIVA((conocPrevio.Checked) ? "1" : "0", 87, proyecto.ID_PROYECTO));
            detalle.Add(new TB_DETALLE_INICIATIVA(requerimientosPrevios.Text, 88, proyecto.ID_PROYECTO));
            detalle.Add(new TB_DETALLE_INICIATIVA((cumple.Checked) ? "1" : "0", 89, proyecto.ID_PROYECTO));
            detalle.Add(new TB_DETALLE_INICIATIVA(componentes.Text, 90, proyecto.ID_PROYECTO));
            detalle.Add(new TB_DETALLE_INICIATIVA(efectosProblema.Text, 91, proyecto.ID_PROYECTO));
            detalle.Add(new TB_DETALLE_INICIATIVA(efectosNegocio.Text, 92, proyecto.ID_PROYECTO));
            detalle.Add(new TB_DETALLE_INICIATIVA(incrementoUtilidad.Text, 93, proyecto.ID_PROYECTO));
            detalle.Add(new TB_DETALLE_INICIATIVA(reduccionTiempo.Text, 94, proyecto.ID_PROYECTO));
            detalle.Add(new TB_DETALLE_INICIATIVA(disminuirConsumo.Text, 95, proyecto.ID_PROYECTO));
            detalle.Add(new TB_DETALLE_INICIATIVA(reducirConsumo.Text, 96, proyecto.ID_PROYECTO));
            detalle.Add(new TB_DETALLE_INICIATIVA(otros.Text, 97, proyecto.ID_PROYECTO));
            detalle.Add(new TB_DETALLE_INICIATIVA(descripcionContrapartida.Text, 98, proyecto.ID_PROYECTO));
            detalle.Add(new TB_DETALLE_INICIATIVA(montoAsistencia.Text, 99, proyecto.ID_PROYECTO));
            detalle.Add(new TB_DETALLE_INICIATIVA(montoRecursos.Text, 100, proyecto.ID_PROYECTO));
            detalle.Add(new TB_DETALLE_INICIATIVA(montoOtros.Text, 101, proyecto.ID_PROYECTO));
            detalle.Add(new TB_DETALLE_INICIATIVA(descripMontoEspecies.Text, 102, proyecto.ID_PROYECTO));
            detalle.Add(new TB_DETALLE_INICIATIVA(montoEspecies.Text, 103, proyecto.ID_PROYECTO));
            detalle.Add(new TB_DETALLE_INICIATIVA(descripMontoEfectivo.Text, 104, proyecto.ID_PROYECTO));
            detalle.Add(new TB_DETALLE_INICIATIVA(montoEfectivo.Text, 105, proyecto.ID_PROYECTO));
            detalle.Add(new TB_DETALLE_INICIATIVA(inputfecha.Text, 106, proyecto.ID_PROYECTO));
            detalle.Add(new TB_DETALLE_INICIATIVA(semanasSelec.Text, 107, proyecto.ID_PROYECTO));
            detalle.Add(new TB_DETALLE_INICIATIVA(montoTotalContrapartida.Text, 186, proyecto.ID_PROYECTO));


            A_TB_DETALLE_INICIATIVA.guardarDetalle(detalle);
        }

            protected void btnguardar_Click(object sender, EventArgs e)
        {

            GuardarDetalle();
            A_PROYECTO.CambiarEstadoProceso(A_ESTADO_PROCESO.ObtenerPorCodigo("PY02").ID_ESTADO_PROCESO, proyecto.ID_PROYECTO, ((MV_DetalleUsuario)Session["usuario"]).ID_USUARIO);
            A_NOTIFICACION.GuardarNotificacion(proyecto.USUARIO_CREA, ((MV_DetalleUsuario)Session["usuario"]).ID_USUARIO, "PY02");
            ScriptManager.RegisterStartupScript(this, GetType(),
                    "alert",
                    "alert('felicidades! has presentado una iniciativa...');",
                    true);

        }
        private void ActualizarDetalle()
        {
            detalle.Find(x => x.ID_CAMPO == 67).VALOR = planteamiento.Text;
            detalle.Find(x => x.ID_CAMPO == 68).VALOR = descripcionSolucion.Text;
            detalle.Find(x => x.ID_CAMPO == 69).VALOR = descripcionRelevancia.Text;
            detalle.Find(x => x.ID_CAMPO == 70).VALOR = incrementosEsperados.Text;
            detalle.Find(x => x.ID_CAMPO == 71).VALOR = incrementosEnVentas.Text;
            detalle.Find(x => x.ID_CAMPO == 72).VALOR = (ejecucionSolo.Checked) ? "1" : "0";
            detalle.Find(x => x.ID_CAMPO == 73).VALOR = (ejecucionAsistida.Checked) ? "1" : "0";
            detalle.Find(x => x.ID_CAMPO == 74).VALOR = producto.Text;
            detalle.Find(x => x.ID_CAMPO == 75).VALOR = proceso.Text;
            detalle.Find(x => x.ID_CAMPO == 76).VALOR = modelo.Text;
            detalle.Find(x => x.ID_CAMPO == 77).VALOR = insumoLocal.Checked ? "1" : "0";
            detalle.Find(x => x.ID_CAMPO == 78).VALOR = generic.Text;
            detalle.Find(x => x.ID_CAMPO == 79).VALOR = insumoBene.Checked ? "1" : "0";
            detalle.Find(x => x.ID_CAMPO == 80).VALOR = insumoDescrip.Text;
            detalle.Find(x => x.ID_CAMPO == 81).VALOR = atenderLocal.Checked ? "1" : "0";
            detalle.Find(x => x.ID_CAMPO == 82).VALOR = entrenamiento.Checked ? "1" : "0";
            detalle.Find(x => x.ID_CAMPO == 83).VALOR = mixta.Checked ? "1" : "0";
            detalle.Find(x => x.ID_CAMPO == 84).VALOR = duracionDias.Text;
            detalle.Find(x => x.ID_CAMPO == 85).VALOR = location.Text;
            detalle.Find(x => x.ID_CAMPO == 86).VALOR = recursosAdicionales.Checked ? "1" : "0";
            detalle.Find(x => x.ID_CAMPO == 87).VALOR = conocPrevio.Checked ? "1" : "0";
            detalle.Find(x => x.ID_CAMPO == 88).VALOR = requerimientosPrevios.Text;
            detalle.Find(x => x.ID_CAMPO == 89).VALOR = cumple.Checked ? "1" : "0";
            detalle.Find(x => x.ID_CAMPO == 90).VALOR = componentes.Text;
            detalle.Find(x => x.ID_CAMPO == 91).VALOR = efectosProblema.Text;
            detalle.Find(x => x.ID_CAMPO == 92).VALOR = efectosNegocio.Text;
            detalle.Find(x => x.ID_CAMPO == 93).VALOR = incrementoUtilidad.Text;
            detalle.Find(x => x.ID_CAMPO == 94).VALOR = reduccionTiempo.Text;
            detalle.Find(x => x.ID_CAMPO == 95).VALOR = disminuirConsumo.Text;
            detalle.Find(x => x.ID_CAMPO == 96).VALOR = reducirConsumo.Text;
            detalle.Find(x => x.ID_CAMPO == 97).VALOR = otros.Text;
            detalle.Find(x => x.ID_CAMPO == 98).VALOR = descripcionContrapartida.Text;
            detalle.Find(x => x.ID_CAMPO == 99).VALOR = montoAsistencia.Text;
            detalle.Find(x => x.ID_CAMPO == 100).VALOR = montoRecursos.Text;
            detalle.Find(x => x.ID_CAMPO == 101).VALOR = montoOtros.Text;
            detalle.Find(x => x.ID_CAMPO == 102).VALOR = descripMontoEspecies.Text;
            detalle.Find(x => x.ID_CAMPO == 103).VALOR = montoEspecies.Text;
            detalle.Find(x => x.ID_CAMPO == 104).VALOR = descripMontoEfectivo.Text;
            detalle.Find(x => x.ID_CAMPO == 105).VALOR = montoEfectivo.Text;
            detalle.Find(x => x.ID_CAMPO == 106).VALOR = inputfecha.Text;
            detalle.Find(x => x.ID_CAMPO == 107).VALOR = semanasSelec.Text;
            detalle.Find(x => x.ID_CAMPO == 186).VALOR = montoTotalContrapartida.Text;


            A_TB_DETALLE_INICIATIVA.ActualizarDetalle(detalle);
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