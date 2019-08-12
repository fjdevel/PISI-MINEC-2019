using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL.Acciones;
using BLL.Helpers;
using BLL.Modelos.ModelosVistas;
using MinecPISI.ViewModels;

namespace MinecPISI.Views.Beneficiarios
{
    public partial class ConsultarBeneficiarios : Page
    {
        protected string Usuario;
        public MV_DetalleBeneficiario beneficiario;
        MV_DetalleUsuario usuario;
        public List<BLL.Modelos.TB_OBSERVACION> observaciones = new List<BLL.Modelos.TB_OBSERVACION>();
        private readonly A_BENEFICIARIO aBeneficiario = new A_BENEFICIARIO();
        private readonly A_USUARIO aUsuario = new A_USUARIO();

        protected void Page_Load(object sender, EventArgs e)
        {
            int i;
            usuario= (MV_DetalleUsuario)Session["usuario"];

            Usuario = usuario.NOMBRE_ROL.ToString().ToUpper();

            var idBeneficiario = Convert.ToInt32(Page.RouteData.Values["id"].ToString());

            var editMode = int.TryParse(Request.QueryString["editMode"], out i) ? i : (int?)null;

            if (i == 1) //si es edit mode se cambian los elementos de la pagina.
                CambiarElementos(Page);

            if (idBeneficiario <= 0) return;

            beneficiario = aBeneficiario.BuscarBeneficiarioXId(idBeneficiario); // se obtiene el beneficiario 
            observaciones = A_OBSERVACION.ObtenerXIdBeneficiario(beneficiario.ID_BENEFICIARIO); // observaciones del beneficiario
            if (IsPostBack) return;

            if (beneficiario == null) return;
            Session["beneficiarioData"] = beneficiario;

            #region Inicializacion de Elementos

            txt_nombres.Text = beneficiario.NOMBRES;
            txt_apellidos.Text = beneficiario.APELLIDOS;
            txt_celular.Text = beneficiario.TEL_CEL;
            txt_telefono.Text = beneficiario.TEL_FIJO;
            lbl_correo.Text = beneficiario.Correo;
            lbl_dui.Text = beneficiario.DUI;
            lbl_nit.Text = beneficiario.NIT;
            lbl_depto.Text = beneficiario.Departamento;
            lbl_muni.Text = beneficiario.MUNICIPIO;
            lbl_tipoPersona.Text = beneficiario.TipoBeneficiario == 2 ? "Persona Natural" : "Persona Juridica";
            lbl_sector.Text = beneficiario.NOMBRE_SECTOR;
            lbl_direccion.Text = beneficiario.DIRECCION;

            txt_nombreUsuario.Text =
                H_Usuario.GenerarNombreUsuario(beneficiario.NOMBRES, beneficiario.APELLIDOS, idBeneficiario);
            lbl_nombreCompleto.Text = beneficiario.NOMBRES + ' ' + beneficiario.APELLIDOS;

            #endregion

            #region Visibilidad de Panels

            if (beneficiario.TipoBeneficiario == 2) //visibilidad del panel de documentacion segun el tipo de persona
                pnl_personaNatural.Visible = true;
            else
                pnl_personaJuridica.Visible = true;

            if (beneficiario.ESTADO_PROCESO == "B05")
                pnl_estadoVerificado.Visible = true;
            else if ((beneficiario.ESTADO_PROCESO == "B03" && i == 1) && observaciones.Count > 0) //panel de observaciones
                pnl_observaciones.Visible = true;

            #endregion

        }

        protected void lnk_constancia_OnClick(object sender, EventArgs e)
        {
            DescargarArchivo("constanciaAlcaldia");
        }
        protected void lnk_declaracion_OnClick(object sender, EventArgs e)
        {
            DescargarArchivo("declaracionJurada");
        }
        protected void lnk_otro_OnClick(object sender, EventArgs e)
        {
            DescargarArchivo("otro");
        }
        protected void lnk_escritura_OnClick(object sender, EventArgs e)
        {
            DescargarArchivo("escrituraConstitucion");
        }
        protected void lnk_estadoie_OnClick(object sender, EventArgs e)
        {
            DescargarArchivo("estadoIngresosEgresos");
        }
        protected void lnk_cuerpo_OnClick(object sender, EventArgs e)
        {
            DescargarArchivo("credencialCuerpo");
        }
        protected void lnk_estadore_OnClick(object sender, EventArgs e)
        {
            DescargarArchivo("estadoResultados");
        }

        public void DescargarArchivo(string fileName)
        {
            var documentos = A_DOCUMENTO.ObtenerXIdBeneficiario(beneficiario.ID_BENEFICIARIO, fileName);

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

        protected void btn_pre_OnClick(object sender, EventArgs e)
        {
            var usuarioBeneficiario = aUsuario.getUsuarioByPersona(beneficiario.ID_PERSONA);

            if (rb_elegible.Checked)
            {
                A_BENEFICIARIO.CambiarEstadoProceso("B06", beneficiario.ID_BENEFICIARIO,
                    ((MV_DetalleUsuario)Session["usuario"]).ID_USUARIO);

                A_NOTIFICACION.GuardarNotificacion(usuarioBeneficiario.ID_USUARIO, usuario.ID_USUARIO, "B06");
                A_CORREO.BeneficiarioElegible(beneficiario.Correo);
                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Pop",
                    "ShowMessage('Beneficiario seleccionado como <strong>elegible</strong>', 'success');", true);
                Response.RedirectToRoute("ConsultarBeneficiario");
            }

            else if (rb_noElegible.Checked)
            {
                A_BENEFICIARIO.CambiarEstadoProceso("B07", beneficiario.ID_BENEFICIARIO,
                    ((MV_DetalleUsuario)Session["usuario"]).ID_USUARIO);

                A_NOTIFICACION.GuardarNotificacion(usuarioBeneficiario.ID_USUARIO, usuario.ID_USUARIO, "B07");

                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Pop",
                    "ShowMessage('Beneficiario seleccionado como <strong>No elegible</strong>', 'error');", true);
            }

            btn_pre.Enabled = false;
            QuitarBackDropModal("preCalificacionModal", Page);
        }
        protected void btn_generarUsuario_OnClick(object sender, EventArgs e)
        {
            var aBeneficiario = new A_BENEFICIARIO();

            aBeneficiario.CambiarCodigo(txt_nombreUsuario.Text,
                Convert.ToInt32(Page.RouteData.Values["id"].ToString()),
                ((MV_DetalleUsuario)Session["usuario"]).ID_USUARIO);

            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Pop",
                "ShowMessage('Codigo de beneficiario asignado <strong>correctamente!</strong>', 'success');", true);

            btn_generarUsuario.Enabled = false;
            QuitarBackDropModal("usuarioModal", Page);
        }
        protected void lnk_registrarCita_OnClick(object sender, EventArgs e)
        {
            Response.RedirectToRoute("ProgramarCita", new { id = beneficiario.ID_BENEFICIARIO });
        }
        protected void lnk_agregarInfo_OnClick(object sender, EventArgs e)
        {
            Response.RedirectToRoute("DatosComplementariosBeneficiario", new { id = beneficiario.ID_BENEFICIARIO });
        }

        protected void btn_verificarBeneficiario_OnClick(object sender, EventArgs e)
        {
            A_BENEFICIARIO.CambiarEstadoProceso("B05", beneficiario.ID_BENEFICIARIO,
                ((MV_DetalleUsuario)Session["usuario"]).ID_USUARIO);

            var usuarioConsultor = aUsuario.getUsuarioByPersona(beneficiario.IdPersonaConsultor);

            A_NOTIFICACION.GuardarNotificacion(usuarioConsultor.ID_USUARIO, usuario.ID_USUARIO, "B05");

            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Pop",
                "ShowMessage('Beneficiario seleccionado como <strong>elegible</strong>', 'success');", true);

            pnl_coordinador.Visible = false;
        }
        protected void btn_denegarBeneficiario_OnClick(object sender, EventArgs e)
        {
            A_BENEFICIARIO.CambiarEstadoProceso("B04", beneficiario.ID_BENEFICIARIO,
                ((MV_DetalleUsuario)Session["usuario"]).ID_USUARIO);

            var usuarioConsultor = aUsuario.getUsuarioByPersona(beneficiario.IdPersonaConsultor);

            A_NOTIFICACION.GuardarNotificacion(usuarioConsultor.ID_USUARIO, usuario.ID_USUARIO, "B04");

            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Pop",
                "ShowMessage('Beneficiario seleccionado como <strong>No elegible</strong>', 'error');", true);

            pnl_coordinador.Visible = false;

        }
        protected void btn_hacerObservaciones_OnClick(object sender, EventArgs e)
        {
            A_BENEFICIARIO.CambiarEstadoProceso("B03", beneficiario.ID_BENEFICIARIO,
                ((MV_DetalleUsuario)Session["usuario"]).ID_USUARIO);

            var usuarioConsultor = aUsuario.getUsuarioByPersona(beneficiario.IdPersonaConsultor);

            A_OBSERVACION.CrearObservacion(A_ESTADO_PROCESO.ObtenerPorCodigo("B03").ID_ESTADO_PROCESO, txt_observa.Text, "TB_BENEFICIARIO", beneficiario.ID_BENEFICIARIO, 0);

            A_NOTIFICACION.GuardarNotificacion(usuarioConsultor.ID_USUARIO, usuario.ID_USUARIO, "B03");

            QuitarBackDropModal("RecomendacionesModal", Page);

            pnl_coordinador.Visible = false;

            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Pop",
                "ShowMessage('Has hecho una observación al <strong>beneficiario</strong>', 'warning');", true);
        }

        public static void QuitarBackDropModal(string modalName, Page page)
        {
            ScriptManager.RegisterStartupScript(page, page.GetType(), "Pop1", "$('#" + modalName + "').modal('hide');", true);
            ScriptManager.RegisterStartupScript(page, page.GetType(), "Pop2", "$('body').removeClass('modal-open');", true);
            ScriptManager.RegisterStartupScript(page, page.GetType(), "Pop3", "$('.modal-backdrop').remove();", true);
        }

        protected void CambiarElementos(Control p1)
        {
            //foreach (Control ctrl in p1.Controls)
            //{
            //    if (ctrl is TextBox t)
            //    {
            //        t.Enabled = true;
            //    }
            //    else if (ctrl is LinkButton lnk)
            //    {
            //        lnk.Visible = false;
            //    }
            //    else
            //    {
            //        if (ctrl.Controls.Count > 0)
            //        {
            //            CambiarElementos(ctrl);
            //        }
            //    }
            //}
        }

        //Valida el archivo que se va subir al servidor
        private static bool ValidarArchivo(FileUpload fileUpload, Page page)
        {
            if (fileUpload.HasFile)
            {
                var fileExt = Path.GetExtension(fileUpload.PostedFile.FileName).ToLower();
                var fileSize = fileUpload.PostedFile.ContentLength;

                if (fileExt != ".jpeg" && fileExt != ".jpg" && fileExt != ".png" && fileExt != ".pdf")
                {
                    ScriptManager.RegisterStartupScript(page, page.GetType(), "Pop",
                        "ShowMessage('Solo se permiten archivos de tipo : <strong>imagen o con extensión .pdf </strong>', 'error');", true);
                }
                else
                {
                    if (fileSize > 2097152)
                        ScriptManager.RegisterStartupScript(page, page.GetType(), "Pop",
                            "ShowMessage('Tamaño maximo de 2(MB) excedido', 'error');", true);
                    else
                        return true;
                }
            }
            else
            {
                ScriptManager.RegisterStartupScript(page, page.GetType(), "Pop",
                    "ShowMessage('No se ha seleccionado ningun archivo.', 'error');", true);
            }

            return false;
        }
        //Sube el archivo al servidor
        private void SubirArchivo(Page page, FileUpload fileUpload, string nombreArchivo, int idBeneficiario)
        {
            string fileName = nombreArchivo + "_" + idBeneficiario + "_" + fileUpload.FileName;
            string folderPath = Server.MapPath("~/Data/");
            string saveLocation = folderPath + "\\" + fileName;

            if (!Directory.Exists(folderPath))
                Directory.CreateDirectory(folderPath);

            try
            {
                fileUpload.PostedFile.SaveAs(saveLocation);

                A_DOCUMENTO.GuardarDocumento(idBeneficiario, saveLocation, nombreArchivo);

                ScriptManager.RegisterStartupScript(page, page.GetType(), "Pop",
                    "alert('Se almaceno correctamente el archivo en el servidor');", true);

            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(page, page.GetType(), "Pop",
                    "alert('Ocurrio un error al intentar subir el archivo al servidor " + ex.Message + " ');", true);

                H_LogErrorEXC.GuardarRegistroLogError(ex);
            }

        }

        protected void btn_uploadDeclaracion_OnClick(object sender, EventArgs e)
        {
            if (ValidarArchivo(fl_declaracion, Page))
                SubirArchivo(Page, fl_declaracion, "declaracionJurada", beneficiario.ID_BENEFICIARIO);
        }
        protected void btn_uploadConstancia_OnClick(object sender, EventArgs e)
        {
            if(ValidarArchivo(fl_constancia, Page))
                SubirArchivo(Page, fl_constancia, "constanciaAlcaldia", beneficiario.ID_BENEFICIARIO);
        }
        protected void btn_uploadOtro_OnClick(object sender, EventArgs e)
        {
            if (ValidarArchivo(fl_otro, Page))
                SubirArchivo(Page, fl_otro, "otro", beneficiario.ID_BENEFICIARIO);
        }

        protected void txt_nombres_OnTextChanged(object sender, EventArgs e)
        {
            A_PERSONA.CambiarDatos(beneficiario.ID_PERSONA, txt_nombres.Text, "nombre");
        }

        protected void txt_apellidos_OnTextChanged(object sender, EventArgs e)
        {
            A_PERSONA.CambiarDatos(beneficiario.ID_PERSONA, txt_apellidos.Text, "apellido");
        }

        protected void txt_telefono_OnTextChanged(object sender, EventArgs e)
        {
            A_PERSONA.CambiarDatos(beneficiario.ID_PERSONA, txt_telefono.Text, "fijo");
        }

        protected void txt_celular_OnTextChanged(object sender, EventArgs e)
        {
            A_PERSONA.CambiarDatos(beneficiario.ID_PERSONA, txt_celular.Text, "cel");
        }

        protected void btn_resolverObservacion_OnClick(object sender, EventArgs e)
        {
            A_OBSERVACION.CambiarAResuelto("TB_BENEFICIARIO", beneficiario.ID_BENEFICIARIO);

            A_BENEFICIARIO.CambiarEstadoProceso("B02", beneficiario.ID_BENEFICIARIO,
                ((MV_DetalleUsuario)Session["usuario"]).ID_USUARIO);

            A_NOTIFICACION.GuardarNotificacion(4, usuario.ID_USUARIO, "B02");

            ScriptManager.RegisterStartupScript(this, GetType(),
                "alert", "alert('has resuelto las observaciones que tenía este beneficiario espera una notificación cuando el coordinador valide la informacion que subiste.');window.location.href ='/dicapisitest/Beneficiario/Consultar/Beneficiario';", true);
        }
    }
}