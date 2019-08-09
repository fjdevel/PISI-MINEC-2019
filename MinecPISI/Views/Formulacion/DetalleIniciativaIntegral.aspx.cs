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
    public partial class DetalleIniciativaIntegral : System.Web.UI.Page
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
            planteamiento.Text = detalle.Find(x => x.ID_CAMPO == 108).VALOR;
            descripcionSolucion.Text = detalle.Find(x => x.ID_CAMPO == 109).VALOR;
            descripcionRelevancia.Text = detalle.Find(x => x.ID_CAMPO == 110).VALOR;
            incrementosEsperados.Text = detalle.Find(x => x.ID_CAMPO == 111).VALOR;
            incrementosEnVentas.Text = detalle.Find(x => x.ID_CAMPO == 112).VALOR;
            ejecucionSolo.Checked = detalle.Find(x => x.ID_CAMPO == 113).VALOR == "1" ? true : false;
            ejecucionAsistida.Checked = detalle.Find(x => x.ID_CAMPO ==114).VALOR == "1" ? true : false;
            adopcionTec.Text = detalle.Find(x => x.ID_CAMPO == 115).VALOR;
            efectosEsperados.Text = detalle.Find(x => x.ID_CAMPO == 116).VALOR;
            efectosEsperadosNegocio.Text = detalle.Find(x => x.ID_CAMPO == 117).VALOR;
            justificacion.Text = detalle.Find(x => x.ID_CAMPO == 118).VALOR;
            margenUtilidad.Text = detalle.Find(x => x.ID_CAMPO ==119).VALOR;
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
            conocPrevio.Checked = detalle.Find(x => x.ID_CAMPO ==135).VALOR == "1" ? true : false;
            requerimientosPrevios.Text = detalle.Find(x => x.ID_CAMPO == 136).VALOR;
            cumple.Checked = detalle.Find(x => x.ID_CAMPO ==137).VALOR == "1" ? true : false;
            componentes.Text = detalle.Find(x => x.ID_CAMPO == 138).VALOR;
            efectosProblema.Text = detalle.Find(x => x.ID_CAMPO == 139).VALOR;
            efectosNegocio.Text = detalle.Find(x => x.ID_CAMPO == 140).VALOR;
            incrementoUtilidad.Text = detalle.Find(x => x.ID_CAMPO == 141).VALOR;
            reduccionTiempo.Text = detalle.Find(x => x.ID_CAMPO == 142).VALOR;
            disminuirConsumo.Text = detalle.Find(x => x.ID_CAMPO == 143).VALOR;
            reducirConsumo.Text = detalle.Find(x => x.ID_CAMPO == 144).VALOR;
            otros.Text = detalle.Find(x => x.ID_CAMPO == 145).VALOR;
            producto.Text = detalle.Find(x => x.ID_CAMPO ==146).VALOR;
            proceso.Text = detalle.Find(x => x.ID_CAMPO == 147).VALOR;
            modelo.Text = detalle.Find(x => x.ID_CAMPO == 148).VALOR;
            insumoLocal.Checked = detalle.Find(x => x.ID_CAMPO == 149).VALOR == "1" ? true : false;
            generic.Text = detalle.Find(x => x.ID_CAMPO == 150).VALOR;
            insumoBene.Checked = detalle.Find(x => x.ID_CAMPO == 151).VALOR == "1" ? true : false;
            insumoDescrip.Text = detalle.Find(x => x.ID_CAMPO == 152).VALOR;
            atenderLocal2.Checked = detalle.Find(x => x.ID_CAMPO == 153).VALOR == "1" ? true : false;
            entrenamiento2.Checked = detalle.Find(x => x.ID_CAMPO == 154).VALOR == "1" ? true : false;
            mixta2.Checked = detalle.Find(x => x.ID_CAMPO ==155).VALOR == "1" ? true : false;
            dias2.Text = detalle.Find(x => x.ID_CAMPO ==156).VALOR;
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
            dismConsu2.Text = detalle.Find(x => x.ID_CAMPO == 167).VALOR;
            reduCon2.Text = detalle.Find(x => x.ID_CAMPO ==168).VALOR;
            otros2.Text = detalle.Find(x => x.ID_CAMPO == 169).VALOR;
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
            problema = A_PROBLEMA.getByIdProblema(A_PROYECTO.ObtenerProyectoPorId(idProyecto).ID_PROBLEMA);
        }
        protected void Btn_aprobar_Click(object sender, EventArgs e)
        {
            A_PROYECTO.CambiarEstadoProceso(A_ESTADO_PROCESO.ObtenerPorCodigo("PY03").ID_ESTADO_PROCESO, idProyecto, usuario.ID_USUARIO);
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