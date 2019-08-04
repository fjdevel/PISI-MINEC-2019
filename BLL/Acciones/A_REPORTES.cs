using BLL.Modelos;
using DAL.DB;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL.Acciones
{
    public class A_REPORTES
    {
        private static readonly PISIDataContext _context = new PISIDataContext();

        public List<REPORTE> ObtenerReporte() {
            List<REPORTE> reporte = new List<REPORTE>();
            var consulta = _context.SP_REPORTES().ToList();
            foreach(var l in consulta){
                REPORTE report = new REPORTE();
                report.CODIGO_BENEFICIARIO = l.CODIGO_BENEFICIARIO;
                report.NOMBRE_SECTOR = l.NOMBRE_SECTOR;
                report.COD_SECTOR_ECONOMICO = l.COD_SECTOR_ECONOMICO;
                report.NOMBRES = l.NOMBRES;
                report.APELLIDOS = l.APELLIDOS;
                report.nombre_formulador = l.nombre_formulador;
                report.apellidos_formulador = l.apellidos_formulador;
                report.NOMBRE_PROBLEMA = l.NOMBRE_PROBLEMA;
                report.ID_ESTADO = l.ID_ESTADO_PROCESO;
                report.CODIGO_ESTADO = l.CODIGO_ESTADO_PROCESO;
                report.DESCRIPCION_ESTADO_PROCESO = l.DESCRIPCION_ESTADO_PROCESO;
                report.codigo_estado_proyecto = l.codigo_estado_proyecto;
                report.descripcion_estado_proyecto = l.descripcion_estado_proyecto;
                report.MONTO = l.MONTO;
                report.ID_TIPO_INICIATIVA = l.ID_TIPO_INICIATIVA;
                report.CODIGO_TIPO_INICIATIVA = l.CODIGO_TIPO_INICIATVA;
                report.NOMBRE = l.NOMBRE;
                report.COD_PROYECTO = l.COD_PROYECTO;
                report.PRESUPUESTO_CONTRAPARTIDA = l.PRESUPUESTO_CONTRAPARTIDA;
                report.nombres_consultor_vinculacion = l.nombres_consultor_vinculacion;
                report.apellidos_consultor_vinculacion = l.apellidos_consultor_vinculacion;
                report.ID_SECTOR_ECONOMICO = l.ID_SECTOR_ECONOMICO;
                report.ID_BENEFICIARIO = l.ID_BENEFICIARIO;
                report.id_formulador = l.id_persona_formulador;
                report.id_consultor_vinculacion = l.id_persona_consultor;
                report.FECHA = l.FECHA_CREA;
                reporte.Add(report);
            }
            return reporte;
        }
    }
}
