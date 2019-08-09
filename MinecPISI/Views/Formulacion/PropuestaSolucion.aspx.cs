using BLL.Acciones;
using System;
using System.Web.UI;
using BLL.Modelos.ModelosVistas;
using BLL.Modelos;
using System.Collections.Generic;
using System.Linq;
using System.IO;

namespace MinecPISI.Views.Formulacion
{
    public partial class PropuestaSolucion : Page
    {
        protected string tipoSolucion;
        protected string usuario;
        public List<MV_DetalleFormulador> detallesFormulador = new List<MV_DetalleFormulador>();
        public MV_DetalleFormulador infoFormulador = new MV_DetalleFormulador();
        protected void Page_Load(object sender, EventArgs e)
        {
            tipoSolucion = "";

            var Usuario = (Session["usuario"] as MV_DetalleUsuario);
            usuario = Usuario.NOMBRE_ROL.ToLower();

            if (IsPostBack) return;

            var idPropuesta = Convert.ToInt32(Page.RouteData.Values["idProblema"].ToString());

            if (idPropuesta <= 0) return;

            var propuesta = A_PROPUESTA.BuscarPropuestaXId(idPropuesta);

            if (propuesta == null) return;
            p_tipoPropuesta.InnerText = tipoSolucion = propuesta.NOMBRE_INICIATIVA.ToLower();
            p_nombreFormulador.InnerText = propuesta.NOMBRE_FORMULADOR;
            p_fechaPresenta.InnerText = propuesta.FECHA_CREA.ToString();
            p_propuesta.InnerText = propuesta.NOMBRE_INICIATIVA;
            p_adopcion.InnerText = propuesta.SOLUCION_ADOPCION;
            p_asistencia.InnerText = propuesta.SOLUCION_ASISTENCIA;
            p_inovacion.InnerText = propuesta.SOLUCION_INNOVACION;
            p_compBasicos.InnerText = propuesta.COMPONENTES_BASICOS;
            p_infoAdicional.InnerText = propuesta.INFORMACION_ADICIONAL;
            p_presupuesto.InnerText = propuesta.PRESUPUESTO_CONTRAPARTIDA;

            int idPersona = propuesta.ID_USUARIO_FORMULA;

            var aFormulador = new A_FORMULADOR();

            //Recuperar la experiencia del formulador
            detallesFormulador = aFormulador.getDetalleFormulador(idPersona);

            if (detallesFormulador != null)
            {
                //Recuperamos los datos del formulador
                infoFormulador = detallesFormulador.First();
            }
        }

        protected void lnk_aceptar_OnClick(object sender, EventArgs e)
        {
            var idPropuesta = Convert.ToInt32(Page.RouteData.Values["idProblema"].ToString());
            TB_PROYECTO proyecto = new TB_PROYECTO();
            A_PROYECTO a_PROYECTO = new A_PROYECTO();
            var propuesta = A_PROPUESTA.BuscarPropuestaXId(idPropuesta);
            proyecto.COD_PROYECTO = "Proy" + idPropuesta + DateTime.Now.Year.ToString();
            proyecto.ID_PROBLEMA = propuesta.ID_PROBLEMA;
            proyecto.ID_TIPO_INICIATIVA = propuesta.ID_TIPO_INICIATIVA;
            proyecto.USUARIO_CREA = ((MV_DetalleUsuario)Session["usuario"]).ID_USUARIO;
            proyecto.ID_PROPUESTA = idPropuesta;
            a_PROYECTO.guardarRegistro(proyecto);
           

            A_NOTIFICACION.GuardarNotificacion(propuesta.ID_USUARIO_FORMULA, ((MV_DetalleUsuario)Session["usuario"]).ID_USUARIO, "S02");
            lnk_aceptar.Visible = false;
            lnk_rechazar.Visible = false;
            var problema = A_PROBLEMA.getByIdProblema(propuesta.ID_PROBLEMA);
            A_PROBLEMA.cambiarEstadoProblema((int)problema.ID_PROBLEMA, "S02", ((MV_DetalleUsuario)Session["usuario"]).ID_USUARIO);
            var aBeneficiario = new A_BENEFICIARIO();

            var idBeneficiario = A_BENEFICIARIO.ObtenerBeneficiario(((MV_DetalleUsuario)Session["usuario"]).ID_USUARIO).ID_BENEFICIARIO;
            var listado = A_PROPUESTA.ObtenerPropuestasByIdBeneficiario(idBeneficiario);
            foreach(var p in listado)
            {
                A_PROPUESTA.CambiarEstadoProceso("S03", p.IdPropuesta, ((MV_DetalleUsuario)Session["usuario"]).ID_USUARIO);
            }
            var res = A_PROPUESTA.CambiarEstadoProceso("S02", idPropuesta,
                ((MV_DetalleUsuario)Session["usuario"]).ID_USUARIO);

            ScriptManager.RegisterStartupScript(this, GetType(),
                    "alert",
                    "alert('felicidades! has aceptado una propuesta de solución...');window.location.href ='/dicapisitest/Casos/Consulta/Propuestas';",
                    true);
        }
        protected void lnk_rechazar_OnClick(object sender, EventArgs e)
        {
            var idPropuesta = Convert.ToInt32(Page.RouteData.Values["idProblema"].ToString());
            var propuesta = A_PROPUESTA.BuscarPropuestaXId(idPropuesta);
            var res = A_PROPUESTA.CambiarEstadoProceso("S03", idPropuesta,
                ((MV_DetalleUsuario)Session["usuario"]).ID_USUARIO);

            A_NOTIFICACION.GuardarNotificacion(propuesta.ID_USUARIO_FORMULA, ((MV_DetalleUsuario)Session["usuario"]).ID_USUARIO, "S03");

            lnk_aceptar.Visible = false;
            lnk_rechazar.Visible = false;

            ScriptManager.RegisterStartupScript(this, GetType(),
                    "alert",
                    "alert('Has rechazado una propuesta de solución, intenta con otra propuesta...');window.location.href ='/dicapisitest/Casos/Consulta/Propuestas';",
                    true);
        }
        public void DescargarArchivo(string fileName)
        {
            var idPropuesta = Convert.ToInt32(Page.RouteData.Values["idProblema"].ToString());
            var propuesta = A_PROPUESTA.BuscarPropuestaXId(idPropuesta);
            var problema = A_PROBLEMA.getByIdProblema(propuesta.ID_PROBLEMA);
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
            DescargarArchivo("propuesta");
        }
    }
}