using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL.Acciones;
using BLL.Helpers;
using BLL.Modelos;
namespace MinecPISI.Views.Formulacion
{
    public partial class FormularSolucionFormulador : System.Web.UI.Page
    {   
        // 1. adopcion 2. asistencia 3.innovacion 4.integral
        public string TipoSolucion { get; private set; }
        public string IdProblema{ get; private set; }
        public TB_PROBLEMA problema;
        protected void Page_Load(object sender, EventArgs e)
        {
            TipoSolucion = Page.RouteData.Values["tipoSolucion"].ToString();
            IdProblema = Page.RouteData.Values["idProblema"].ToString();
            A_PROBLEMA accionesProblema = new A_PROBLEMA();
            problema = accionesProblema.ObtenerProblemaPorId(int.Parse(IdProblema));

        }
        public void enviar_solucion(Object sender,EventArgs e)
        {
            TB_PROPUESTA propuesta = new TB_PROPUESTA();
            A_PROPUESTA AccionesPropuesta = new A_PROPUESTA();
            
            
            propuesta.ID_PROBLEMA = int.Parse(IdProblema);
            propuesta.COMPONENTES_BASICOS = componentesProyecto.Text;
            propuesta.INFORMACION_ADICIONAL = infoSustento.Text;
            propuesta.PRESUPUESTO_CONTRAPARTIDA = presupuesto.Text;
            propuesta.ID_USUARIO_FORMULA = (((BLL.Modelos.ModelosVistas.MV_DetalleUsuario)Session["usuario"]).ID_USUARIO);
            propuesta.ID_TIPO_INICIATIVA = int.Parse(TipoSolucion);
            propuesta.USUARIO_CREA = (((BLL.Modelos.ModelosVistas.MV_DetalleUsuario)Session["usuario"]).ID_USUARIO);
            propuesta.ID_ESTADO_PROCESO = 12;
            propuesta.FECHA_CREA = DateTime.Today;
            switch (TipoSolucion)
            {
                case "1":
                    propuesta.SOLUCION_ADOPCION = solucionAdopcion.Text;
                break;
                case "2":
                    propuesta.SOLUCION_ASISTENCIA = solucionAsistencia.Text;
                break;
                case "3":
                    propuesta.SOLUCION_INNOVACION = solucioninnovacion.Text;
                    break;
                case "4":
                    propuesta.SOLUCION_ADOPCION = solucionAdopcion.Text;
                    propuesta.SOLUCION_ASISTENCIA = solucionAsistencia.Text;
                    propuesta.SOLUCION_INNOVACION = solucioninnovacion.Text;
                    break;
            }
            
            if (AccionesPropuesta.ObtenerPropuestaDeFormuladorPorProblema(propuesta.ID_USUARIO_FORMULA, propuesta.ID_PROBLEMA) == null){
                AccionesPropuesta.guardarRegistro(propuesta);
                A_NOTIFICACION.GuardarNotificacion(A_ASIGNACION.gUsuarioBeneficiarioByIdBeneficiario(problema.ID_BENEFICIARIO).ID_USUARIO, ((BLL.Modelos.ModelosVistas.MV_DetalleUsuario)Session["usuario"]).ID_USUARIO, "S01");
                ScriptManager.RegisterStartupScript(this, GetType(),
                    "alert", "alert('¡Registro completado exitosamente, se ha notificado al beneficiario!');",
                    true);
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, GetType(),
                   "alert", "alert('¡Error usted ya ha presentado una solucion a este problema!');",
                   true);
            }



        }
        protected void btn_upload_factura_Click(object sender, EventArgs e)
        {
            if (ValidarArchivo(lbl_factura, fl_factura))
                SubirArchivo(lbl_factura, fl_factura, "propuesta", (int)problema.ID_BENEFICIARIO);
        }

        private void SubirArchivo(Label label, FileUpload fileUpload, string nombreArchivo, int idBeneficiario)
        {
            string fileName = nombreArchivo +  "_" + idBeneficiario + "_" + fileUpload.PostedFile.FileName;
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