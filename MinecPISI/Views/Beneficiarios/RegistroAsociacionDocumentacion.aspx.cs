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
    public partial class RegistroAsociacionP3Documentacion : System.Web.UI.Page
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

            if (_registroViewModel.InfoDocumentacion != null)
                _infoDocumentacionViewModel = _registroViewModel.InfoDocumentacion;
            else
                return;

            #region Validar Subidos

            if (_registroViewModel.InfoDocumentacion.InfoDocumentacionPersonaJuridica.ConstanciaAlcaldiaFile != null)
            {
                lbl_constancia.Text = "Este archivo ya ha sido subido...";
                lbl_constancia.ForeColor = System.Drawing.Color.Orange;
            }
            if (_registroViewModel.InfoDocumentacion.InfoDocumentacionPersonaJuridica.EscrituraConstitucionFile != null)
            {
                lbl_escritura.Text = "Este archivo ya ha sido subido...";
                lbl_escritura.ForeColor = System.Drawing.Color.Orange;
            }
            if (_registroViewModel.InfoDocumentacion.InfoDocumentacionPersonaJuridica.CredencialCuerpoFile != null)
            {
                lbl_cuerpo.Text = "Este archivo ya ha sido subido...";
                lbl_cuerpo.ForeColor = System.Drawing.Color.Orange;
            }
            if (_registroViewModel.InfoDocumentacion.InfoDocumentacionPersonaJuridica.EstadoIngresosEgresosFile != null)
            {
                lbl_estadoie.Text = "Este archivo ya ha sido subido...";
                lbl_estadoie.ForeColor = System.Drawing.Color.Orange;
            }
            if (_registroViewModel.InfoDocumentacion.InfoDocumentacionPersonaJuridica.EstadoResultadosFile != null)
            {
                lbl_estadore.Text = "Este archivo ya ha sido subido...";
                lbl_estadore.ForeColor = System.Drawing.Color.Orange;
            }

            #endregion    
        }

        protected void OnAnteriorClick(object sender, EventArgs e)
        {
            Response.RedirectToRoute("RegistroBeneficiario03");
        }
        protected void OnFinalizarClick(object sender, EventArgs e)
        {
            #region Validaciones

            if(_registroViewModel == null)
                return;

            var isNull = H_Objetos.TienePropiedadesNulas(_registroViewModel);

            if (isNull)
            {
                ScriptManager.RegisterStartupScript(this, GetType(), Guid.NewGuid().ToString("N"), "alert('Debes completar todos los pasos antes de finalizar el proceso de registro.');", true);
                return;
            }

            var tieneNulos = H_Objetos.TienePropiedadesNulas(_registroViewModel.InfoDocumentacion.InfoDocumentacionPersonaJuridica);

            if (tieneNulos)
            {
                ScriptManager.RegisterStartupScript(this, GetType(), Guid.NewGuid().ToString("N"), "alert('Debes subir todos los archivos solicitados');", true);
                return;
            }

            #endregion

            AlmacenarDatos(_registroViewModel); //almacenamiento de datos del beneficiario
            Session.Remove("registroData"); //se elimina la informacion del formulario de registro de la sesion
            Session.Remove("tipoPersona"); //se elimina variable con el tipo de persona  

            int idUsuario = (Session["usuario"] as MV_DetalleUsuario)?.ID_USUARIO ?? 0;

            ScriptManager.RegisterStartupScript(this, GetType(),
                "alert",
                idUsuario != 0
                    ? "alert('registro completado exitosamente!');"
                    : "alert('registro completado exitosamente!, debes estar pendiente de tus medios de contacto, cuando se valide tu registro podras iniciar sesión en la plataforma');",
                true);
        }

        protected void btn_upload_escritura_OnClick(object sender, EventArgs e)
        {
            if (ValidarArchivo(lbl_escritura, fl_escritura))
                AlmacenarEnSesion(lbl_escritura, fl_escritura, "escrituraConstitucion");
        }
        protected void btn_upload_estadoie_OnClick(object sender, EventArgs e)
        {
            if (ValidarArchivo(lbl_estadoie, fl_estadoie))
                AlmacenarEnSesion(lbl_estadoie, fl_estadoie, "estadoIngresosEgresos");
        }
        protected void btn_upload_cuerpo_OnClick(object sender, EventArgs e)
        {
            if (ValidarArchivo(lbl_cuerpo, fl_cuerpo))
                AlmacenarEnSesion(lbl_cuerpo, fl_cuerpo, "credencialCuerpo");
        }
        protected void btn_constancia_OnClick(object sender, EventArgs e)
        {
            if (ValidarArchivo(lbl_constancia, fl_constancia))
                AlmacenarEnSesion(lbl_constancia, fl_constancia, "constanciaAlcaldia");
        }
        protected void btn_estadore_OnClick(object sender, EventArgs e)
        {
            if (ValidarArchivo(lbl_estadore, fl_estadore))
                AlmacenarEnSesion(lbl_estadore, fl_estadore, "estadoResultados");
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
        //Sube el archivo al servidor
        private void SubirArchivo(Label label, FileUpload fileUpload, string nombreArchivo, int idBeneficiario)
        {
            string fileName = nombreArchivo + "_" + idBeneficiario + "_" + fileUpload.PostedFile.FileName;
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
        private void AlmacenarEnSesion(Label label, FileUpload fileUpload, string nombreArchivo)
        {
            label.Text = "";

            _infoDocumentacionViewModel = _registroViewModel.InfoDocumentacion ?? new InformacionDocumentacionViewModel();

            switch (nombreArchivo)
            {
                case "escrituraConstitucion":
                    {
                        _infoDocumentacionViewModel.InfoDocumentacionPersonaJuridica.EscrituraConstitucionFile = fileUpload;
                        _infoDocumentacionViewModel.InfoDocumentacionPersonaJuridica.EscrituraConstitucionNombre = nombreArchivo;
                        break;
                    }
                case "estadoIngresosEgresos":
                    {
                        _infoDocumentacionViewModel.InfoDocumentacionPersonaJuridica.EstadoIngresosEgresosFile = fileUpload;
                        _infoDocumentacionViewModel.InfoDocumentacionPersonaJuridica.EstadoIngresosEgresosNombre = nombreArchivo;
                        break;
                    }
                case "estadoResultados":
                    {
                        _infoDocumentacionViewModel.InfoDocumentacionPersonaJuridica.EstadoResultadosFile = fileUpload;
                        _infoDocumentacionViewModel.InfoDocumentacionPersonaJuridica.EstadoResultadosNombre = nombreArchivo;
                        break;
                    }
                case "credencialCuerpo":
                    {
                        _infoDocumentacionViewModel.InfoDocumentacionPersonaJuridica.CredencialCuerpoFile = fileUpload;
                        _infoDocumentacionViewModel.InfoDocumentacionPersonaJuridica.CredencialCuerpoNombre = nombreArchivo;
                        break;
                    }
                case "constanciaAlcaldia":
                    {
                        _infoDocumentacionViewModel.InfoDocumentacionPersonaJuridica.ConstanciaAlcaldiaFile = fileUpload;
                        _infoDocumentacionViewModel.InfoDocumentacionPersonaJuridica.ConstanciaAlcaldiaNombre = nombreArchivo;
                        break;
                    }
            }

            _registroViewModel.InfoDocumentacion = _infoDocumentacionViewModel;

            Session["registroData"] = _registroViewModel;

            EnviarMensaje(label, "Archivo subido exitosamente!", "exito");
        }
        //Envia mensaje a la vista
        private static void EnviarMensaje(Label label, string mensaje, string tipo)
        {
            switch (tipo)
            {
                case "exito":
                    {
                        label.Text = mensaje;
                        label.ForeColor = System.Drawing.Color.Green;
                        break;
                    }
                case "advertencia":
                    {
                        label.Text = mensaje;
                        label.ForeColor = System.Drawing.Color.Yellow;
                        break;
                    }
                case "error":
                    {
                        label.Text = mensaje;
                        label.ForeColor = System.Drawing.Color.Red;
                        break;
                    }

            }
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
            };

            var idUsuario = ((MV_DetalleUsuario)Session["usuario"])?.ID_USUARIO ?? 0;

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
                ID_ROL = 2, // no debe ir quemado
                NOMBRE_USUARIO = registro.InfoCredenciales.Correo
            };

            #endregion

            aUsuario.createUsuario(usuario, idUsuario);
            var idBeneficiario = Convert.ToInt32(aBenericiario.GuardarBeneficiario(beneficiario, idUsuario).IDENTITY);

            #region Subida de Archivos al Servidor

            SubirArchivo(lbl_cuerpo, _registroViewModel.InfoDocumentacion.InfoDocumentacionPersonaJuridica.CredencialCuerpoFile, _registroViewModel.InfoDocumentacion.InfoDocumentacionPersonaJuridica.CredencialCuerpoNombre, idBeneficiario);
            SubirArchivo(lbl_constancia, _registroViewModel.InfoDocumentacion.InfoDocumentacionPersonaJuridica.ConstanciaAlcaldiaFile, _registroViewModel.InfoDocumentacion.InfoDocumentacionPersonaJuridica.ConstanciaAlcaldiaNombre, idBeneficiario);
            SubirArchivo(lbl_estadoie, _registroViewModel.InfoDocumentacion.InfoDocumentacionPersonaJuridica.EstadoIngresosEgresosFile, _registroViewModel.InfoDocumentacion.InfoDocumentacionPersonaJuridica.EstadoIngresosEgresosNombre, idBeneficiario);
            SubirArchivo(lbl_estadore, _registroViewModel.InfoDocumentacion.InfoDocumentacionPersonaJuridica.EstadoResultadosFile, _registroViewModel.InfoDocumentacion.InfoDocumentacionPersonaJuridica.EstadoResultadosNombre, idBeneficiario);
            SubirArchivo(lbl_escritura, _registroViewModel.InfoDocumentacion.InfoDocumentacionPersonaJuridica.EscrituraConstitucionFile, _registroViewModel.InfoDocumentacion.InfoDocumentacionPersonaJuridica.EscrituraConstitucionNombre, idBeneficiario);

            #endregion

            
            A_NOTIFICACION.GuardarNotificacion(A_USUARIO.obtenerCoordinador().ID_USUARIO, idUsuario, "B02");
        }
    }
}