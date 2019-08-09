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
    public partial class FormularIniciativaAsistenciaTecnicaFormulador : System.Web.UI.Page
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
            }
            problema = A_PROBLEMA.getByIdProblema(proyecto.ID_PROBLEMA);
        }
        private void GuardarDetalle()
        {
            List<TB_DETALLE_INICIATIVA> detalle = new List<TB_DETALLE_INICIATIVA>();
            detalle.Add(new TB_DETALLE_INICIATIVA(planteamiento.Text, 31, proyecto.ID_PROYECTO));
            detalle.Add(new TB_DETALLE_INICIATIVA(descripcionSolucion.Text, 32, proyecto.ID_PROYECTO));
            detalle.Add(new TB_DETALLE_INICIATIVA(descripcionRelevancia.Text, 33, proyecto.ID_PROYECTO));
            detalle.Add(new TB_DETALLE_INICIATIVA(incrementosEsperados.Text, 34, proyecto.ID_PROYECTO));
            detalle.Add(new TB_DETALLE_INICIATIVA(incrementosEnVentas.Text, 35, proyecto.ID_PROYECTO));
            detalle.Add(new TB_DETALLE_INICIATIVA((ejecucionSolo.Checked) ? "1" : "0", 36, proyecto.ID_PROYECTO));
            detalle.Add(new TB_DETALLE_INICIATIVA((ejecucionAsistida.Checked) ? "1" : "0", 37, proyecto.ID_PROYECTO));
            detalle.Add(new TB_DETALLE_INICIATIVA(metodologia.Text, 38, proyecto.ID_PROYECTO));
            detalle.Add(new TB_DETALLE_INICIATIVA((conocLocal.Checked) ? "1" : "0", 39, proyecto.ID_PROYECTO));
            detalle.Add(new TB_DETALLE_INICIATIVA((atenderLocal.Checked) ? "1" : "0", 40, proyecto.ID_PROYECTO));
            detalle.Add(new TB_DETALLE_INICIATIVA((entrenamiento.Checked) ? "1" : "0", 41, proyecto.ID_PROYECTO));
            detalle.Add(new TB_DETALLE_INICIATIVA((mixta.Checked) ? "1" : "0", 42, proyecto.ID_PROYECTO));
            detalle.Add(new TB_DETALLE_INICIATIVA(duracionDias.Text, 43, proyecto.ID_PROYECTO));
            detalle.Add(new TB_DETALLE_INICIATIVA(location.Text == "" ? "" : location.Text, 44, proyecto.ID_PROYECTO));
            detalle.Add(new TB_DETALLE_INICIATIVA((recursosAdicionales.Checked) ? "1" : "0", 45, proyecto.ID_PROYECTO));
            detalle.Add(new TB_DETALLE_INICIATIVA((conocPrevio.Checked) ? "1" : "0", 46, proyecto.ID_PROYECTO));
            detalle.Add(new TB_DETALLE_INICIATIVA(requerimientosPrevios.Text, 47, proyecto.ID_PROYECTO));
            detalle.Add(new TB_DETALLE_INICIATIVA((cumple.Checked) ? "1" : "0", 48, proyecto.ID_PROYECTO));
            detalle.Add(new TB_DETALLE_INICIATIVA(componentes.Text, 49, proyecto.ID_PROYECTO));
            detalle.Add(new TB_DETALLE_INICIATIVA(efectosProblema.Text, 50, proyecto.ID_PROYECTO));
            detalle.Add(new TB_DETALLE_INICIATIVA(efectosNegocio.Text, 51, proyecto.ID_PROYECTO));
            detalle.Add(new TB_DETALLE_INICIATIVA(incrementoUtilidad.Text, 52, proyecto.ID_PROYECTO));
            detalle.Add(new TB_DETALLE_INICIATIVA(reduccionTiempo.Text, 53, proyecto.ID_PROYECTO));
            detalle.Add(new TB_DETALLE_INICIATIVA(disminuirConsumo.Text, 54, proyecto.ID_PROYECTO));
            detalle.Add(new TB_DETALLE_INICIATIVA(reducirConsumo.Text, 55, proyecto.ID_PROYECTO));
            detalle.Add(new TB_DETALLE_INICIATIVA(otros.Text, 56, proyecto.ID_PROYECTO));
            detalle.Add(new TB_DETALLE_INICIATIVA(descripcionContrapartida.Text, 57, proyecto.ID_PROYECTO));
            detalle.Add(new TB_DETALLE_INICIATIVA(montoAsistencia.Text, 58, proyecto.ID_PROYECTO));
            detalle.Add(new TB_DETALLE_INICIATIVA(montoRecursos.Text, 59, proyecto.ID_PROYECTO));
            detalle.Add(new TB_DETALLE_INICIATIVA(montoOtros.Text, 60, proyecto.ID_PROYECTO));
            detalle.Add(new TB_DETALLE_INICIATIVA(descripMontoEspecies.Text, 61, proyecto.ID_PROYECTO));
            detalle.Add(new TB_DETALLE_INICIATIVA(montoEspecies.Text, 62, proyecto.ID_PROYECTO));
            detalle.Add(new TB_DETALLE_INICIATIVA(descripMontoEfectivo.Text, 63, proyecto.ID_PROYECTO));
            detalle.Add(new TB_DETALLE_INICIATIVA(montoEfectivo.Text, 64, proyecto.ID_PROYECTO));
            detalle.Add(new TB_DETALLE_INICIATIVA(inputfecha.Text, 65, proyecto.ID_PROYECTO));
            detalle.Add(new TB_DETALLE_INICIATIVA(semanasSelec.Text, 66, proyecto.ID_PROYECTO));
            detalle.Add(new TB_DETALLE_INICIATIVA(montoTotalContrapartida.Text, 185, proyecto.ID_PROYECTO));


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
            Response.RedirectToRoute("ConsultarCasos");
        }
        private void ActualizarDetalle()
        {
            detalle.Find(x => x.ID_CAMPO == 31).VALOR = planteamiento.Text;
            detalle.Find(x => x.ID_CAMPO == 32).VALOR = descripcionSolucion.Text;
            detalle.Find(x => x.ID_CAMPO == 33).VALOR = descripcionRelevancia.Text;
            detalle.Find(x => x.ID_CAMPO == 34).VALOR = incrementosEsperados.Text;
            detalle.Find(x => x.ID_CAMPO == 35).VALOR = incrementosEnVentas.Text;
            detalle.Find(x => x.ID_CAMPO == 36).VALOR = (ejecucionSolo.Checked) ? "1" : "0";
            detalle.Find(x => x.ID_CAMPO == 37).VALOR = (ejecucionAsistida.Checked) ? "1" : "0";
            detalle.Find(x => x.ID_CAMPO == 38).VALOR = metodologia.Text;
            detalle.Find(x => x.ID_CAMPO == 39).VALOR = (conocLocal.Checked) ? "1" : "0";
            detalle.Find(x => x.ID_CAMPO == 40).VALOR = (atenderLocal.Checked) ? "1" : "0";
            detalle.Find(x => x.ID_CAMPO == 41).VALOR = (entrenamiento.Checked) ? "1" : "0";
            detalle.Find(x => x.ID_CAMPO == 42).VALOR = (mixta.Checked) ? "1" : "0";
            detalle.Find(x => x.ID_CAMPO == 43).VALOR = duracionDias.Text;
            detalle.Find(x => x.ID_CAMPO == 44).VALOR = location.Text;
            detalle.Find(x => x.ID_CAMPO == 45).VALOR = recursosAdicionales.Checked ? "1" : "0"; ;
            detalle.Find(x => x.ID_CAMPO == 46).VALOR = conocPrevio.Checked ? "1" : "0"; ;
            detalle.Find(x => x.ID_CAMPO == 47).VALOR = requerimientosPrevios.Text;
            detalle.Find(x => x.ID_CAMPO == 48).VALOR = cumple.Checked ? "1" : "0"; ;
            detalle.Find(x => x.ID_CAMPO == 49).VALOR = componentes.Text;
            detalle.Find(x => x.ID_CAMPO == 50).VALOR = efectosProblema.Text;
            detalle.Find(x => x.ID_CAMPO == 51).VALOR = efectosNegocio.Text;
            detalle.Find(x => x.ID_CAMPO == 52).VALOR = incrementoUtilidad.Text;
            detalle.Find(x => x.ID_CAMPO == 53).VALOR = reduccionTiempo.Text;
            detalle.Find(x => x.ID_CAMPO == 54).VALOR = disminuirConsumo.Text;
            detalle.Find(x => x.ID_CAMPO == 55).VALOR = reducirConsumo.Text;
            detalle.Find(x => x.ID_CAMPO == 56).VALOR = otros.Text;
            detalle.Find(x => x.ID_CAMPO == 57).VALOR = descripcionContrapartida.Text;
            detalle.Find(x => x.ID_CAMPO == 58).VALOR = montoAsistencia.Text;
            detalle.Find(x => x.ID_CAMPO == 59).VALOR = montoRecursos.Text;
            detalle.Find(x => x.ID_CAMPO == 60).VALOR = montoOtros.Text;
            detalle.Find(x => x.ID_CAMPO == 61).VALOR = descripMontoEspecies.Text;
            detalle.Find(x => x.ID_CAMPO == 62).VALOR = montoEspecies.Text;
            detalle.Find(x => x.ID_CAMPO == 63).VALOR = descripMontoEfectivo.Text;
            detalle.Find(x => x.ID_CAMPO == 64).VALOR = montoEfectivo.Text;
            detalle.Find(x => x.ID_CAMPO == 65).VALOR = inputfecha.Text;
            detalle.Find(x => x.ID_CAMPO == 66).VALOR = semanasSelec.Text;

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
    }
}