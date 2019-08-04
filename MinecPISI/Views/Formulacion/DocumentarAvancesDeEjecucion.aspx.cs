using BLL.Acciones;
using BLL.Modelos;
using BLL.Modelos.ModelosVistas;
using System;
using System.Collections.Generic;
using System.Globalization;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MinecPISI.Views.Formulacion
{
    public partial class DocumentarAvancesDeEjecucuin : System.Web.UI.Page
    {
        protected BLL.Modelos.TB_PROYECTO proyecto;
        protected List<TB_DETALLE_INICIATIVA> detalles;
        protected List<dynamic> detalleActividad;
        protected List<dynamic> detalleSolicitudes;
        protected List<Object> detalleEjecucion;
        protected MV_DetalleUsuario usuario;
        protected MV_DetalleProblema problema;
        protected List<TBC_CAMPOS_INICIATIVA> campos;
        protected bool terminado;
        protected void Page_Load(object sender, EventArgs e)
        {
            usuario = ((MV_DetalleUsuario)Session["usuario"]);
           Btn_GuardarEjecucion.Click += new System.EventHandler(Btn_GuardarEjecucion_Click);
            btn_guardarSolicitud.Click += new System.EventHandler(btn_guardarSolicitud_Click);
            
            proyecto = A_PROYECTO.ObtenerProyectoPorId(Convert.ToInt32(Page.RouteData.Values["idIniciativa"]));
            problema = A_PROBLEMA.getByIdProblema(proyecto.ID_PROBLEMA);
            detalles = A_TB_DETALLE_INICIATIVA.ObtenerDetalleByProyecto(proyecto.ID_PROYECTO);
            campos = A_TBC_CAMPOS_INICIATIVA.ObtenerCamposByTipoIniciativa(proyecto.ID_TIPO_INICIATIVA);
            inputfecha.Text = detalles.Find(x => x.ID_CAMPO == campos.Find(y=>y.NOMBRE_CAMPO=="fecha inicio").ID_CAMPO).VALOR;
            semanasSelec.Text = detalles.Find(x => x.ID_CAMPO == campos.Find(y => y.NOMBRE_CAMPO == "cronograma").ID_CAMPO).VALOR;
            detalleEjecucion = A_PROYECTO_ACTIVIDAD.ObtenerDetalleEjecucion(proyecto.ID_PROYECTO);
            detalleActividad = A_PROYECTO_ACTIVIDAD.ObtenerDetalleActividades(proyecto.ID_PROYECTO);
            detalleSolicitudes = A_PROYECTO_ACTIVIDAD.ObtenerDetalleEjecucion(proyecto.ID_PROYECTO);
            terminado = detalleActividad.Find(x => x.PORCENTAJE_AVACE < 100)==null?true:false;

            
        }

        protected void Btn_GuardarEjecucion_Click(object sender, EventArgs e)
        { var camp = campos.Find(y => y.NOMBRE_CAMPO == nombreActividadSelec.Text);
            var detal = detalles.Find(x => x.ID_CAMPO ==camp.ID_CAMPO);
            string montoPresupuestado =detal.VALOR;
            List<string> actividades = new List<string>();
            foreach(var a in detalleActividad)
            {
                actividades.Add(a.DESCRIPCION);
            }
            var prue = actividades.Find(x => x==camp.NOMBRE_CAMPO);
            var pacti = detalleActividad.Find(
                p => p.DESCRIPCION == camp.NOMBRE_CAMPO);
            CultureInfo culture = new CultureInfo("en-US");
            int porcentajeAgregar = Convert.ToInt32((decimal.Parse(monto.Text,culture) / decimal.Parse(montoPresupuestado,culture)) * 100);
            int porcentajeAvance =  porcentajeAgregar+(pacti.PORCENTAJE_AVACE==0?0: pacti.PORCENTAJE_AVACE);
            A_PROYECTO_ACTIVIDAD.ActualizarAvance(pacti.ID_PROYECTO_ACTIVIDAD, porcentajeAvance, usuario.ID_USUARIO);
            var f = datestart.Text.Split('/');
            DateTime semanI = new DateTime(Convert.ToInt32(f[2]), Convert.ToInt32(f[1]), Convert.ToInt32(f[0]));
            var j = dateend.Text.Split('/');
            DateTime semanF = new DateTime(Convert.ToInt32(j[2]), Convert.ToInt32(j[1]), Convert.ToInt32(j[0]));
            A_PROYECTO_ACTIVIDAD.GuardarEjecucion(pacti.ID_PROYECTO_ACTIVIDAD, descripcion.Text, monto.Text, semanI, semanF);
            Response.Redirect(Request.RawUrl);

        }

        protected void FinProy_Click(object sender, EventArgs e)
        {
            A_PROYECTO.CambiarEstadoProceso(A_ESTADO_PROCESO.ObtenerPorCodigo("PY12").ID_ESTADO_PROCESO, proyecto.ID_PROYECTO, usuario.ID_USUARIO);
            A_NOTIFICACION.GuardarNotificacion(A_USUARIO.obtenerCoordinador().ID_USUARIO, usuario.ID_USUARIO, "PY12");
            Response.Redirect(Request.RawUrl);

        }

        protected void btn_guardarSolicitud_Click(object sender, EventArgs e)
        {
            TB_PROYECTO pro = A_PROYECTO.ObtenerProyectoPorId(proyecto.ID_PROYECTO);
            int b = (int)A_PROBLEMA.getByIdProblema(pro.ID_PROBLEMA).ID_BENEFICIARIO;
            var bene = A_USUARIO.ObtenerUsuarioPorIdBeneficiario(b);
            var consultor = A_ASIGNACION.geConsultorByIdBeneficiario(b);
            var userCon = new A_USUARIO().getUsuarioByPersona(consultor.ID_PERSONA);
            A_NOTIFICACION.GuardarNotificacion(userCon.ID_USUARIO, usuario.ID_USUARIO, "IF06");
            A_PROYECTO_ACTIVIDAD.GuardarSolicitud(proyecto.ID_PROYECTO, usuario.ID_USUARIO, direccionCita.Value);
            ScriptManager.RegisterStartupScript(this, GetType(),
                   "alert",
                   "alert('Se ha Enviado la solicitud a su consultor de vinculación');",
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
            DescargarArchivo("factura");
        }
    }
}