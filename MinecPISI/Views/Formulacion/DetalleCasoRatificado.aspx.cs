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
    public partial class DetalleCasoRatificado : System.Web.UI.Page
    {
        protected BLL.Modelos.TB_PROYECTO proyecto;
        protected double monto;
        protected BLL.Modelos.TB_PERSONA formulador;
        protected MV_DetalleProblema problema;
        protected MV_DetalleUsuario usuario;
        protected void Page_Load(object sender, EventArgs e)
        {
            proyecto = A_PROYECTO.ObtenerProyectoPorId(Convert.ToInt32(Page.RouteData.Values["idIniciativa"]));
            List<BLL.Modelos.TB_DETALLE_INICIATIVA> detalle = A_TB_DETALLE_INICIATIVA.ObtenerDetalleByProyecto(proyecto.ID_PROYECTO);
            monto = 0;
            usuario = ((MV_DetalleUsuario)Session["usuario"]);
            problema = A_PROBLEMA.getByIdProblema(proyecto.ID_PROBLEMA);
            switch (proyecto.ID_TIPO_INICIATIVA)
            {
                case 1:
                    monto = Convert.ToDouble(detalle.Find(x => x.ID_CAMPO == 23).VALOR) + Convert.ToDouble(detalle.Find(x => x.ID_CAMPO == 22).VALOR) + Convert.ToDouble(detalle.Find(x => x.ID_CAMPO == 21).VALOR);
                    
                    formulador = A_FORMULADOR.ObtenerFormuladorPorIdProyecto(proyecto.ID_PROYECTO);
                    break;
                case 2:
                    monto = Convert.ToDouble(detalle.Find(x => x.ID_CAMPO == 58).VALOR);
                    monto += Convert.ToDouble(detalle.Find(x => x.ID_CAMPO == 59).VALOR);
                    monto += Convert.ToDouble(detalle.Find(x => x.ID_CAMPO == 60).VALOR);
                    formulador = A_FORMULADOR.ObtenerFormuladorPorIdProyecto(proyecto.ID_PROYECTO);
                    break;
                case 3:
                    monto = Convert.ToDouble(detalle.Find(x => x.ID_CAMPO == 99).VALOR) + Convert.ToDouble(detalle.Find(x => x.ID_CAMPO == 100).VALOR) + Convert.ToDouble(detalle.Find(x => x.ID_CAMPO == 101).VALOR);
                    formulador = A_FORMULADOR.ObtenerFormuladorPorIdProyecto(proyecto.ID_PROYECTO);
                    break;
                case 4:
                    monto = Convert.ToDouble(detalle.Find(x => x.ID_CAMPO == 171).VALOR)
                        + Convert.ToDouble(detalle.Find(x => x.ID_CAMPO == 172).VALOR)
                        + Convert.ToDouble(detalle.Find(x => x.ID_CAMPO == 173).VALOR)
                        + Convert.ToDouble(detalle.Find(x => x.ID_CAMPO == 174).VALOR)
                        + Convert.ToDouble(detalle.Find(x => x.ID_CAMPO == 175).VALOR)
                        + Convert.ToDouble(detalle.Find(x => x.ID_CAMPO == 176).VALOR)
                        + Convert.ToDouble(detalle.Find(x => x.ID_CAMPO == 177).VALOR);

                    break;
            }

        }

        protected void btn_upload_factura_Click(object sender, EventArgs e)
        {
            if (ValidarArchivo(lbl_factura, fl_factura))
                SubirArchivo(lbl_factura, fl_factura, "factura",(int)problema.ID_BENEFICIARIO);
        }

        private void SubirArchivo(Label label, FileUpload fileUpload, string nombreArchivo, int idBeneficiario)
        {
            string fileName = nombreArchivo + proyecto.ID_PROYECTO  + "_" + idBeneficiario + "_" + fileUpload.PostedFile.FileName;
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

        protected void facturarBtn_Click(object sender, EventArgs e)
        {
            A_PROYECTO.CambiarEstadoProceso(A_ESTADO_PROCESO.ObtenerPorCodigo("PY11").ID_ESTADO_PROCESO,proyecto.ID_PROYECTO,usuario.ID_USUARIO);
            switch (proyecto.ID_TIPO_INICIATIVA)
            {
                case 1:
                    A_PROYECTO_ACTIVIDAD.GuardarActividadProyecto(new TB_PROYECTO_ACTIVIDAD(1, proyecto.ID_PROYECTO, usuario.ID_USUARIO), usuario.ID_USUARIO);
                    A_PROYECTO_ACTIVIDAD.GuardarActividadProyecto(new TB_PROYECTO_ACTIVIDAD(2, proyecto.ID_PROYECTO, usuario.ID_USUARIO), usuario.ID_USUARIO);
                    A_PROYECTO_ACTIVIDAD.GuardarActividadProyecto(new TB_PROYECTO_ACTIVIDAD(3, proyecto.ID_PROYECTO, usuario.ID_USUARIO), usuario.ID_USUARIO);
                    A_PROYECTO_ACTIVIDAD.GuardarActividadProyecto(new TB_PROYECTO_ACTIVIDAD(4, proyecto.ID_PROYECTO, usuario.ID_USUARIO), usuario.ID_USUARIO);
                    break;
                case 2:
                    A_PROYECTO_ACTIVIDAD.GuardarActividadProyecto(new TB_PROYECTO_ACTIVIDAD(5, proyecto.ID_PROYECTO, usuario.ID_USUARIO), usuario.ID_USUARIO);
                    A_PROYECTO_ACTIVIDAD.GuardarActividadProyecto(new TB_PROYECTO_ACTIVIDAD(6, proyecto.ID_PROYECTO, usuario.ID_USUARIO), usuario.ID_USUARIO);
                    A_PROYECTO_ACTIVIDAD.GuardarActividadProyecto(new TB_PROYECTO_ACTIVIDAD(7, proyecto.ID_PROYECTO, usuario.ID_USUARIO), usuario.ID_USUARIO);
                    A_PROYECTO_ACTIVIDAD.GuardarActividadProyecto(new TB_PROYECTO_ACTIVIDAD(8, proyecto.ID_PROYECTO, usuario.ID_USUARIO), usuario.ID_USUARIO);
                    break;
                case 3:
                    A_PROYECTO_ACTIVIDAD.GuardarActividadProyecto(new TB_PROYECTO_ACTIVIDAD(9, proyecto.ID_PROYECTO, usuario.ID_USUARIO), usuario.ID_USUARIO);
                    A_PROYECTO_ACTIVIDAD.GuardarActividadProyecto(new TB_PROYECTO_ACTIVIDAD(10, proyecto.ID_PROYECTO, usuario.ID_USUARIO), usuario.ID_USUARIO);
                    A_PROYECTO_ACTIVIDAD.GuardarActividadProyecto(new TB_PROYECTO_ACTIVIDAD(11, proyecto.ID_PROYECTO, usuario.ID_USUARIO), usuario.ID_USUARIO);
                    A_PROYECTO_ACTIVIDAD.GuardarActividadProyecto(new TB_PROYECTO_ACTIVIDAD(12, proyecto.ID_PROYECTO, usuario.ID_USUARIO), usuario.ID_USUARIO);
                    break;
                case 4:
                    A_PROYECTO_ACTIVIDAD.GuardarActividadProyecto(new TB_PROYECTO_ACTIVIDAD(13, proyecto.ID_PROYECTO, usuario.ID_USUARIO), usuario.ID_USUARIO);
                    A_PROYECTO_ACTIVIDAD.GuardarActividadProyecto(new TB_PROYECTO_ACTIVIDAD(14, proyecto.ID_PROYECTO, usuario.ID_USUARIO), usuario.ID_USUARIO);
                    A_PROYECTO_ACTIVIDAD.GuardarActividadProyecto(new TB_PROYECTO_ACTIVIDAD(15, proyecto.ID_PROYECTO, usuario.ID_USUARIO), usuario.ID_USUARIO);
                    A_PROYECTO_ACTIVIDAD.GuardarActividadProyecto(new TB_PROYECTO_ACTIVIDAD(16, proyecto.ID_PROYECTO, usuario.ID_USUARIO), usuario.ID_USUARIO);
                    A_PROYECTO_ACTIVIDAD.GuardarActividadProyecto(new TB_PROYECTO_ACTIVIDAD(17, proyecto.ID_PROYECTO, usuario.ID_USUARIO), usuario.ID_USUARIO);
                    A_PROYECTO_ACTIVIDAD.GuardarActividadProyecto(new TB_PROYECTO_ACTIVIDAD(18, proyecto.ID_PROYECTO, usuario.ID_USUARIO), usuario.ID_USUARIO);
                    A_PROYECTO_ACTIVIDAD.GuardarActividadProyecto(new TB_PROYECTO_ACTIVIDAD(19, proyecto.ID_PROYECTO, usuario.ID_USUARIO), usuario.ID_USUARIO);
                    A_PROYECTO_ACTIVIDAD.GuardarActividadProyecto(new TB_PROYECTO_ACTIVIDAD(20, proyecto.ID_PROYECTO, usuario.ID_USUARIO), usuario.ID_USUARIO);
                    break;
            }
            TB_PROYECTO pro = A_PROYECTO.ObtenerProyectoPorId(proyecto.ID_PROYECTO);
            int b = (int)A_PROBLEMA.getByIdProblema(pro.ID_PROBLEMA).ID_BENEFICIARIO;
            var bene = A_USUARIO.ObtenerUsuarioPorIdBeneficiario(b);
            A_PROYECTO.CambiarEstadoProceso(A_ESTADO_PROCESO.ObtenerPorCodigo("PY11").ID_ESTADO_PROCESO, proyecto.ID_PROYECTO, usuario.ID_USUARIO);
            A_NOTIFICACION.GuardarNotificacion(bene.ID_USUARIO, usuario.ID_USUARIO, "PY11");
            Response.RedirectToRoute("ConsultarIniciativa");
        }
    }
}