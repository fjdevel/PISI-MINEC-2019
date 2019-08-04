using BLL.Modelos.ModelosVistas;
using MinecPISI.ViewModels;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL.Acciones;
using System.Globalization;

namespace MinecPISI.Views.Beneficiarios
{
    public partial class RegistrarInformacionComplementariaVinculacion2 : Page
    {
        private MV_DetalleBeneficiario _detalleBeneficiario = new MV_DetalleBeneficiario();

        protected void Page_Load(object sender, EventArgs e)
        {
            _detalleBeneficiario = (MV_DetalleBeneficiario)Session["beneficiarioData"];

            if (IsPostBack)
                return;

            #region Llenar Labels

            lbl_nombre.Text = _detalleBeneficiario.NOMBRES + ' ' + _detalleBeneficiario.APELLIDOS;
            lbl_telefono.Text = _detalleBeneficiario.TEL_FIJO;
            lbl_nit.Text = _detalleBeneficiario.NIT;
            lbl_muni.Text = _detalleBeneficiario.MUNICIPIO;

            #endregion
        }

        protected void btn_registrar_OnClick(object sender, EventArgs e)
        {
            var infoComplementariaArchivosViewModel = (List<InfoComplementariaArchivosViewModel>)Session["infoArchivosData"] ??
                                                      new List<InfoComplementariaArchivosViewModel>();

            var usuario = (MV_DetalleUsuario)Session["usuario"];

            foreach (var info in infoComplementariaArchivosViewModel)
            {
                SubirArchivo(info.FileUpload, info.NombreArchivo, _detalleBeneficiario.ID_BENEFICIARIO);
            }

            var i = (InfoComplementariaViewModel) Session["infoComplementaria"]; //informacion del paso anterior
            var res = A_BENEFICIARIO.UpdateInfoComplementaria(_detalleBeneficiario.ID_BENEFICIARIO, i.Dui, i.Nit,
                i.ExistenActivos, i.MasAnyoEnLugar, i.PuedeComprobarVentas, i.IdMunicipio, i.IdSector,
                i.InfoComplementaria, i.Lat, i.Lng, i.MedioContacto, usuario.ID_USUARIO);

            if(res.IDENTITY != null)
                ScriptManager.RegisterStartupScript(this, GetType(),
                    "alert",
                    "alert('información complementaria agregada exitosamante!');window.location.href ='/dicapisitest/Beneficiario/Consultar/Beneficiario';",
                    true);
        }


        //Valida el archivo que se va subir al servidor
        private static bool ValidarArchivo(Label label, FileUpload fileUpload, string tipoArchivo)
        {
            label.Text = "";
            bool response = true;

            if (fileUpload.HasFile)
            {
                int fileSize = fileUpload.PostedFile.ContentLength;
                string fileExt = Path.GetExtension(fileUpload.PostedFile.FileName).ToLower();

                if (fileSize > 2097152)
                {
                    label.Text = "Tamaño maximo de 2(MB) excedido";
                    label.ForeColor = System.Drawing.Color.Red;
                    response = false;
                }

                if (tipoArchivo == "imagen")
                {
                    if (fileExt.ToLower() != ".jpeg" && fileExt.ToLower() != ".jpg" && fileExt.ToLower() != ".png")
                    {
                        label.Text = "Solo se permiten archivos .jpeg | .jpg | .png";
                        label.ForeColor = System.Drawing.Color.Red;
                        response = false;
                    }
                }
                else if (tipoArchivo == "pdf")
                {
                    if (fileExt.ToLower() != ".pdf")
                    {
                        label.Text = "Solo se permiten archivos .pdf";
                        label.ForeColor = System.Drawing.Color.Red;
                        response = false;
                    }
                }
            }
            else
            {
                label.Text = "No se ha seleccionado ningun archivo.";
                label.ForeColor = System.Drawing.Color.Red;
                response = false;
            }

            return response;
        }
        //Sube el archivo al servidor
        private void SubirArchivo(FileUpload fileUpload, string nombreArchivo, int idBeneficiario)
        {
            string fileName = nombreArchivo + "_" + idBeneficiario + "_" + fileUpload.PostedFile.FileName;
            string folderPath = Server.MapPath("~/Data/");
            string saveLocation = folderPath + "\\" + fileName;

            if (!Directory.Exists(folderPath))
            {
                Directory.CreateDirectory(folderPath);
            }

            if(fileUpload.AllowMultiple)
            {
                int i = 1;
                foreach (var uploadedFile in fileUpload.PostedFiles)
                {
                    saveLocation = folderPath + "\\" + i + "_" + fileName;
                    A_DOCUMENTO.GuardarDocumento(idBeneficiario, saveLocation, nombreArchivo);
                    uploadedFile.SaveAs(saveLocation);
                    i++;
                }

            }
            else
            {
                A_DOCUMENTO.GuardarDocumento(idBeneficiario, saveLocation, nombreArchivo);
                fileUpload.PostedFile.SaveAs(saveLocation);
            }
        }
        //Almacena archivo en variable de session
        private void AlmacenarArchivo(Label label, FileUpload fileUpload, string nombreArchivo)
        {
            label.Text = "";

            var infoComplementariaArchivosViewModel = (List<InfoComplementariaArchivosViewModel>) Session["infoArchivosData"] ??
                                                      new List<InfoComplementariaArchivosViewModel>();

            var item = infoComplementariaArchivosViewModel.FirstOrDefault(i => i.NombreArchivo == nombreArchivo);
            var index = infoComplementariaArchivosViewModel.IndexOf(item);

            if (index != -1)
                infoComplementariaArchivosViewModel[index] = new InfoComplementariaArchivosViewModel(fileUpload, nombreArchivo);
            else
                infoComplementariaArchivosViewModel.Add(new InfoComplementariaArchivosViewModel(fileUpload, nombreArchivo));

            Session["infoArchivosData"] = infoComplementariaArchivosViewModel;

            label.Text = "Archivo subido exitosamente!";
            label.ForeColor = System.Drawing.Color.Green;
        }
        

        protected void btn_uploadDui_OnClick(object sender, EventArgs e)
        {
            if (ValidarArchivo(lbl_duiT, fl_dui, "imagen"))
                AlmacenarArchivo(lbl_duiT, fl_dui, "dui");
        }
        protected void btn_uploadNit_OnClick(object sender, EventArgs e)
        {
            if (ValidarArchivo(lbl_nitT, fl_nit, "imagen"))
                AlmacenarArchivo(lbl_nitT, fl_nit, "nit");
        }
        protected void btn_uploadImagenLugar_OnClick(object sender, EventArgs e)
        {
            if (ValidarArchivo(lbl_imagenLugar, fl_imagenLugar, "imagen"))
                AlmacenarArchivo(lbl_imagenLugar, fl_imagenLugar, "lugar");
        }
        protected void btn_uploadImagenVentas_OnClick(object sender, EventArgs e)
        {
            if (ValidarArchivo(lbl_imagenVentas, fl_imagenVentas, "imagen"))
                AlmacenarArchivo(lbl_imagenVentas, fl_imagenVentas, "ventas");
        }
        protected void btn_uploadImagenActivos_OnClick(object sender, EventArgs e)
        {
            if (ValidarArchivo(lbl_imagenActivos, fl_imagenActivos, "imagen"))
                AlmacenarArchivo(lbl_imagenActivos, fl_imagenActivos, "activos");
        }
        protected void btn_uploadImagenProductos_OnClick(object sender, EventArgs e)
        {
            if (ValidarArchivo(lbl_imagenProductos, fl_imagenProductos, "imagen"))
                AlmacenarArchivo(lbl_imagenProductos, fl_imagenProductos, "productos");
        }

        protected void btn_cancelar_OnClick(object sender, EventArgs e)
        {
            Response.RedirectToRoute("DatosComplementariosBeneficiario", new { id = _detalleBeneficiario.ID_BENEFICIARIO });
        }
    }
}