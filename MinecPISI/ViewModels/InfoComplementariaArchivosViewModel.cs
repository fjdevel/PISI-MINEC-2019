using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;

namespace MinecPISI.ViewModels
{
    public class InfoComplementariaArchivosViewModel
    {
        public FileUpload FileUpload { get; set; }
        public string NombreArchivo { get; set; }

        public InfoComplementariaArchivosViewModel(FileUpload fileUpload, string nombreArchivo)
        {
            FileUpload = fileUpload;
            NombreArchivo = nombreArchivo;
        }
    }
}