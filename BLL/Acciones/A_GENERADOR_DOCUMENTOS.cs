using BLL.Modelos;
using System;
using System.Collections.Generic;
using System.Globalization;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web.Hosting;

namespace BLL.Acciones
{
    public static class A_GENERADOR_DOCUMENTOS
    {
        private static string HtmlResponse;
        private static StreamReader str;
        private static List<TBC_CAMPOS_INICIATIVA> campos;
        public static string generarDetalleIniciativa(int idproyecto, List<TB_DETALLE_INICIATIVA> detalle)
        {
            TB_PROYECTO proyecto = A_PROYECTO.ObtenerProyectoPorId(idproyecto);
            campos = A_TBC_CAMPOS_INICIATIVA.ObtenerCamposByTipoIniciativa(proyecto.ID_TIPO_INICIATIVA);
            string path="";
            path = HostingEnvironment.MapPath("~/Views/Formulacion/Plantillas/DetalleIniciativa.html");
            str = new StreamReader(path);
            HtmlResponse = str.ReadToEnd();
            string contentDetalle = "";
            foreach (var detail in detalle)
            {
                if (detail != null)
                {
                    var cam = campos.Find((x => x.ID_CAMPO == detail.ID_CAMPO));
                    if (cam != null)
                    {
                        if (cam.NOMBRE_CAMPO != "cronograma")
                        {
                            string row = "<tr><td class='t tdpdf'>[campo]</td><td class='tdpdf'>[valor]</td></tr>";
                            row = row.Replace("[campo]", cam.NOMBRE_CAMPO);
                            if (detail.VALOR == "0" || detail.VALOR == "1")
                                row = row.Replace("[valor]", detail.VALOR == "1" ? "Sí" : "No");
                            else
                                row = row.Replace("[valor]", detail.VALOR);
                            contentDetalle += row;
                        }
                    }
                }
                
            }
            var beneficiario = A_PROPUESTA.ObtenerBeneficiarioPorIdPropuesta(proyecto.ID_PROPUESTA);
            var benePersona = new A_PERSONA().getPersonaById(beneficiario.ID_PERSONA);
            var propuesta = A_PROPUESTA.BuscarPropuestaXId(proyecto.ID_PROPUESTA);
            if (propuesta != null)
            {
                var formulador = A_PERSONA.getPersonaByIdFormulador(propuesta.ID_USUARIO_FORMULA);
                HtmlResponse = HtmlResponse.Replace("[nombreFormulador]", formulador.NOMBRES+" "+formulador.APELLIDOS);
            }
            else
            {
                HtmlResponse = HtmlResponse.Replace("[nombreFormulador]", "el beneficiario presentó sin apoyo de formulador");

            }
            HtmlResponse = HtmlResponse.Replace("[nombreTipoIniciativa]", new A_TIPO_INICIATIVA().geIniciativaById(proyecto.ID_TIPO_INICIATIVA).NOMBRE);
            var consu = A_ASIGNACION.geConsultorByIdBeneficiario(beneficiario.ID_BENEFICIARIO);
            HtmlResponse = HtmlResponse.Replace("[nombreConsultor]", consu.NOMBRES+" "+consu.APELLIDOS);
            HtmlResponse = HtmlResponse.Replace("[nombreBeneficiario]", benePersona.NOMBRES + " " + benePersona.APELLIDOS);
            var culture = new CultureInfo("en-US");
            HtmlResponse = HtmlResponse.Replace("[fechaCreacionReporte]", DateTime.Now.ToString(culture));
            HtmlResponse = HtmlResponse.Replace("[fechaCreacion]", proyecto.FECHA_CREA.ToString(culture));
            HtmlResponse = HtmlResponse.Replace("[codProyecto]", proyecto.COD_PROYECTO);
            HtmlResponse = HtmlResponse.Replace("[idProyecto]", proyecto.ID_PROYECTO.ToString());
            HtmlResponse = HtmlResponse.Replace("[detalle]", contentDetalle);
            return HtmlResponse;
        }
    }
}
