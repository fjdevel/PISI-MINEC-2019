using BLL.Acciones;
using BLL.Helpers;
using BLL.Modelos;
using BLL.Modelos.ModelosVistas;
using MinecPISI.ViewModels;
using System;
using System.IO;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MinecPISI.Views.Beneficiarios
{
    public partial class RegistroBeneficiarioP3Documentacion : Page
    {
        private InformacionDocumentacionViewModel _infoDocumentacionViewModel;
        private RegistroBeneficiarioViewModel _registroViewModel;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["registroData"] != null)
                _registroViewModel = (RegistroBeneficiarioViewModel)Session["registroData"];
            else
            {
                Response.RedirectToRoute("RegistroBeneficiario01");
                return;
            }

            if (IsPostBack) return;

            if (_registroViewModel.InfoDocumentacion == null)
                return;

            _infoDocumentacionViewModel = _registroViewModel.InfoDocumentacion;

            if (_registroViewModel.InfoDocumentacion.InfoDocumentacionPersonaNatural.ConstanciaAlcaldia != null)
            {
                lbl_constancia.Text = "Este archivo ya ha sido subido...";
                lbl_constancia.ForeColor = System.Drawing.Color.Orange;
            }
            if (_registroViewModel.InfoDocumentacion.InfoDocumentacionPersonaNatural.Otro != null)
            {
                lbl_otro.Text = "Este archivo ya ha sido subido...";
                lbl_otro.ForeColor = System.Drawing.Color.Orange;
            }

        }

        protected void OnAnteriorClick(object sender, EventArgs e)
        {
            Response.RedirectToRoute("RegistroBeneficiario03");
        }
        protected void OnFinalizarClick(object sender, EventArgs e)
        {
            #region Validaciones
            if (_registroViewModel == null)
                return;

            if (_registroViewModel.InfoDocumentacion == null)
            {
                lbl_constancia.Text = "Debes subir un archivo";
                lbl_constancia.ForeColor = System.Drawing.Color.Red;
                return;
            }

            if (H_Objetos.TienePropiedadesNulas(_registroViewModel))
            {
                ScriptManager.RegisterStartupScript(this, GetType(), Guid.NewGuid().ToString("N"), "alert('Debes completar todos los pasos antes de finalizar el proceso de registro.');", true);
                return;
            }

            #endregion

            AlmacenarDatos(_registroViewModel); //almacenamiento de datos del beneficiario
            Session.Remove("registroData"); //se elimina la informacion del formulario de registro de la sesion
            Session.Remove("tipoPersona"); //se elimina variable con el tipo de persona

                ScriptManager.RegisterStartupScript(this, GetType(), "Pop", "ShowMessage('Registro de postulante Finalizado, Espere instrucciones para poder acceder al sistema', 'success');", true);

                btn_finalizar.Visible = false;
        }

        protected void btn_upload_constancia_OnClick(object sender, EventArgs e)
        {
            if (ValidarArchivo(lbl_constancia, fl_constancia_alcaldia))
                AlmacenarArchivo(lbl_constancia, fl_constancia_alcaldia, "constancia");
        }
        protected void btn_upload_otro_OnClick(object sender, EventArgs e)
        {
            if (ValidarArchivo(lbl_otro, fl_otro))
                AlmacenarArchivo(lbl_otro, fl_otro, "otro");
        }


        //Valida el archivo que se va subir al servidor
        private static bool ValidarArchivo(Label label, FileUpload fileUpload)
        {
            label.Text = "";

            if (fileUpload.HasFile)
            {
                string fileExt = Path.GetExtension(fileUpload.PostedFile.FileName).ToLower();
                int fileSize = fileUpload.PostedFile.ContentLength;

                if (fileExt != ".jpeg" && fileExt!= ".jpg" && fileExt != ".png" && fileExt != ".pdf")
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
        //Sube el archivo al servidor
        private void SubirArchivo(Label label, FileUpload fileUpload, string nombreArchivo, int idBeneficiario)
        {
            string fileName = nombreArchivo + "_"+ idBeneficiario + "_" + fileUpload.PostedFile.FileName;
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
        //Almacena archivo en variable de session
        private void AlmacenarArchivo(Label label, FileUpload fileUpload, string nombreArchivo)
        {
            label.Text = "";

            _infoDocumentacionViewModel = _registroViewModel.InfoDocumentacion ?? new InformacionDocumentacionViewModel();

            switch (nombreArchivo)
            {
                case "constancia":
                    _infoDocumentacionViewModel.InfoDocumentacionPersonaNatural.ConstanciaAlcaldia = fileUpload;
                    break;
                case "otro":
                    _infoDocumentacionViewModel.InfoDocumentacionPersonaNatural.Otro = fileUpload;
                    break;
            }

            _registroViewModel.InfoDocumentacion = _infoDocumentacionViewModel;

            Session["registroData"] = _registroViewModel;

            label.Text = "Archivo subido exitosamente!";
            label.ForeColor = System.Drawing.Color.Green;
        }

        private void AlmacenarDatos(RegistroBeneficiarioViewModel registro)
        {
            var aBenericiario = new A_BENEFICIARIO();
            var aPersona = new A_PERSONA();
            var aUsuario = new A_USUARIO();

            #region Subida a Base de Datos

            var persona = new TB_PERSONA
            {
                NOMBRES = registro.InfoPersonal.Nombres,
                APELLIDOS = registro.InfoPersonal.Apellidos,
                CORREO_E = registro.InfoCredenciales.Correo,
                DIRECCION = registro.InfoActividadEconomica.Direccion,
                ID_MUNICIPIO = registro.InfoActividadEconomica.MunicipioId,
                TEL_CEL = registro.InfoPersonal.Celular,
                TEL_FIJO = registro.InfoPersonal.Telefono,
                ID_PERSONA = registro.InfoCredenciales.PersonaId
            };

            var idUsuario = ((MV_DetalleUsuario) Session["usuario"])?.ID_USUARIO ?? 0;

            var idPersona = registro.InfoCredenciales.PersonaId != 0 ? aPersona.ActualizarPersona(persona, idUsuario) : aPersona.AlmacenarPersona(persona, idUsuario);

            var beneficiario = new TB_BENEFICIARIO
            {
                ID_PERSONA = Convert.ToInt32(idPersona.IDENTITY),
                ID_SECTOR_ECONOMICO = registro.InfoActividadEconomica.SectorId,
                CODIGO_BENEFICIARIO = "",
                ID_ESTADO_PROCESO = A_ESTADO_PROCESO.ObtenerPorCodigo("B02").ID_ESTADO_PROCESO,
                DUI = registro.InfoPersonal.Dui,
                NIT = registro.InfoPersonal.Nit,
                TIPO_PERSONA = Session["tipoPersona"].ToString() == "personaNatural" ? (short)2 : (short)1
            };

            var usuario = new TB_USUARIO
            {
                CONTRASENA = registro.InfoCredenciales.Password,
                ID_PERSONA = Convert.ToInt32(idPersona.IDENTITY),
                ID_ROL = 2, //no debe ir quemado
                NOMBRE_USUARIO = registro.InfoCredenciales.Correo
            };

            #endregion

            aUsuario.createUsuario(usuario, idUsuario);
            var idBeneficiario = Convert.ToInt32(aBenericiario.GuardarBeneficiario(beneficiario, idUsuario).IDENTITY);

            #region Subida de Archivos al Servidor

            if (_registroViewModel.InfoDocumentacion.InfoDocumentacionPersonaNatural.ConstanciaAlcaldia != null)
                SubirArchivo(lbl_constancia, _registroViewModel.InfoDocumentacion.InfoDocumentacionPersonaNatural.ConstanciaAlcaldia, "constanciaAlcaldia", idBeneficiario);

            if (_registroViewModel.InfoDocumentacion.InfoDocumentacionPersonaNatural.Otro != null)
                SubirArchivo(lbl_otro, _registroViewModel.InfoDocumentacion.InfoDocumentacionPersonaNatural.Otro, "otro", idBeneficiario);

            #endregion
            TB_PERSONA con = A_ASIG_CONSULTOR.ObtenerConsultor((int)persona.ID_MUNICIPIO, (int)beneficiario.ID_SECTOR_ECONOMICO);
            var p = new A_PERSONA().getPersonaByCorreoE(registro.InfoCredenciales.Correo);
            if (con.ID_PERSONA != 0)
                A_ASIGNACION.Asignar(p.ID_PERSONA, con.ID_PERSONA);
            A_NOTIFICACION.GuardarNotificacion(A_USUARIO.obtenerCoordinador().ID_USUARIO, idUsuario, "B02");
        }
    }
}