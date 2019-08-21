using BLL.Acciones;
using BLL.Helpers;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MinecPISI.Views.Administracion
{
    public partial class DocumentosGenerales : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btn_upload_declaracion_Click(object sender, EventArgs e)
        {
            if (ValidarArchivo(lbl_declaracion, fl_declaracion))
                AlmacenarArchivo(lbl_declaracion, fl_declaracion, "declaracion");
        }

        private void AlmacenarArchivo(Label label, FileUpload fileUpload, string nombreArchivo)
        {
            string fileName = nombreArchivo + "_" + fileUpload.PostedFile.FileName;
            string folderPath = Server.MapPath("~/Data/");
            string saveLocation = folderPath + "\\" + fileName;

            if (!Directory.Exists(folderPath))
                Directory.CreateDirectory(folderPath);

            try
            {
                fileUpload.PostedFile.SaveAs(saveLocation);

                A_DOCUMENTO.GuardarDocumento(0, saveLocation, nombreArchivo);

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

        //Valida el archivo que se va subir al servidor
        private static bool ValidarArchivo(Label label, FileUpload fileUpload)
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