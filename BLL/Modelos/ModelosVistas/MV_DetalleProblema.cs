using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL.DB;

namespace BLL.Modelos.ModelosVistas
{
    public class MV_DetalleProblema
    {
        public int? ID_PROBLEMA { get; set; }
        public string NOMBRE_PROBLEMA { get; set; }
        public int? ID_ESTADO_PROCESO { get; set; }
        public string NOMBRE_ESTADO { get; set; }
        public string NOMBRE_BENEFICIARIO { get; set; }
        public int? DIAS_ACTUALIZA { get; set; }
        public int? DIAS_CREA { get; set; }
        public DateTime? FECHA_CREA { get; set; }
        public DateTime? FECHA_ACTUALIZA { get; set; }
        public int? ID_PERSONA {get; set; }
        public int? ID_BENEFICIARIO {get; set;}
        public string MERCADO { get; set; }
        public int CANT_EMPLEADOS { get; set; }
        public bool REQUIERE_APOYO { get; set; }
        public string DESCRIPCION_NEGOCIO { get; set; }
        public string VENTA_DIA { get; set; }
        public decimal? VENTA_MES { get; set; }
        public string DESCRIPCION_PROBLEMA { get; set; }
        public string DESCRIPCION_OTRO_PROBLEMA { get; set; }
        public string OBSERVACION_DESCRIPCION { get; set; }
        public DateTime? OBSERVACION_FECHA { get; set; }
        public bool OBSERVACION_RESUELTO { get; set; }
        public int? ID_OBSERVACION { get; set; }
        public int DIAS_RESTANTES { get; set; }
        //public int USUARIO_CREA { get; set; }
        //public int USUARIO_ACTUALIZA { get; set; }
        //public DateTime FECHA_BORRADO { get; set; }

        public static explicit operator MV_DetalleProblema(SP_VIEW_DETALLE_PROBLEMA_GetNotResolvedResult p)
        {
            return new MV_DetalleProblema()
            {
                ID_PROBLEMA = p.ID_PROBLEMA,
                NOMBRE_PROBLEMA = p.NOMBRE_PROBLEMA,
                ID_ESTADO_PROCESO = p.ID_ESTADO_PROCESO,
                NOMBRE_BENEFICIARIO = p.NOMBRE_BENEFICIARIO,
                DIAS_ACTUALIZA = p.DIAS_ACTUALIZA,
                DIAS_CREA = p.DIAS_CREA,
                ID_BENEFICIARIO = p.ID_BENEFICIARIO,
                ID_PERSONA = p.ID_PERSONA,
                FECHA_ACTUALIZA = p.FECHA_ACTUALIZA,
                FECHA_CREA = p.FECHA_CREA,
                NOMBRE_ESTADO = p.NOMBRE_ESTADO,
                CANT_EMPLEADOS = p.CANT_EMPLEADOS,
                DESCRIPCION_NEGOCIO = p.DESCRIPCION_NEGOCIO,
                DESCRIPCION_OTRO_PROBLEMA = p.DESCRIPCION_OTRO_PROBLEMA,
                DESCRIPCION_PROBLEMA = p.DESCRIPCION_PROBLEMA,
                MERCADO = p.MERCADO,
                REQUIERE_APOYO = p.REQUIERE_APOYO,
                VENTA_DIA = p.VENTA_DIA,
                VENTA_MES = p.VENTA_MES,
                OBSERVACION_DESCRIPCION = p.OBSERVACION_DESCRIPCION,
                OBSERVACION_FECHA = p.OBSERVACION_FECHA,
                OBSERVACION_RESUELTO = p.OBSERVACION_RESUELTO == 1 ? true : false,
                ID_OBSERVACION = p.ID_OBSERVACION,
                DIAS_RESTANTES = 5-(int)p.DIAS_ACTUALIZA
            };
        }

        public static explicit operator MV_DetalleProblema(SP_VIEW_DETALLE_PROBLEMA_GetByIdProblemaResult p)
        {
            return new MV_DetalleProblema()
            {
                ID_PROBLEMA = p.ID_PROBLEMA,
                NOMBRE_PROBLEMA = p.NOMBRE_PROBLEMA,
                ID_ESTADO_PROCESO = p.ID_ESTADO_PROCESO,
                NOMBRE_BENEFICIARIO = p.NOMBRE_BENEFICIARIO,
                DIAS_ACTUALIZA = p.DIAS_ACTUALIZA,
                DIAS_CREA = p.DIAS_CREA,
                ID_BENEFICIARIO = p.ID_BENEFICIARIO,
                ID_PERSONA = p.ID_PERSONA,
                FECHA_ACTUALIZA = p.FECHA_ACTUALIZA,
                FECHA_CREA = p.FECHA_CREA,
                NOMBRE_ESTADO = p.NOMBRE_ESTADO,
                CANT_EMPLEADOS = p.CANT_EMPLEADOS,
                DESCRIPCION_NEGOCIO = p.DESCRIPCION_NEGOCIO,
                DESCRIPCION_OTRO_PROBLEMA = p.DESCRIPCION_OTRO_PROBLEMA,
                DESCRIPCION_PROBLEMA = p.DESCRIPCION_PROBLEMA,
                MERCADO = p.MERCADO,
                REQUIERE_APOYO = p.REQUIERE_APOYO,
                VENTA_DIA = p.VENTA_DIA,
                VENTA_MES = p.VENTA_MES,
                OBSERVACION_DESCRIPCION = p.OBSERVACION_DESCRIPCION,
                OBSERVACION_FECHA = p.OBSERVACION_FECHA,
                OBSERVACION_RESUELTO = p.OBSERVACION_RESUELTO == 1 ? true : false,
                ID_OBSERVACION = p.ID_OBSERVACION
            };
        }

        public static explicit operator MV_DetalleProblema(SP_VIEW_DETALLE_PROBLEMA_GetAllResult p)
        {
            return new MV_DetalleProblema()
            {
                ID_PROBLEMA = p.ID_PROBLEMA,
                NOMBRE_PROBLEMA = p.NOMBRE_PROBLEMA,
                ID_ESTADO_PROCESO = p.ID_ESTADO_PROCESO,
                NOMBRE_BENEFICIARIO = p.NOMBRE_BENEFICIARIO,
                DIAS_ACTUALIZA = p.DIAS_ACTUALIZA,
                DIAS_CREA = p.DIAS_CREA,
                ID_BENEFICIARIO = p.ID_BENEFICIARIO,
                ID_PERSONA = p.ID_PERSONA,
                FECHA_ACTUALIZA = p.FECHA_ACTUALIZA,
                FECHA_CREA = p.FECHA_CREA,
                NOMBRE_ESTADO = p.NOMBRE_ESTADO,
                CANT_EMPLEADOS = p.CANT_EMPLEADOS,
                DESCRIPCION_NEGOCIO = p.DESCRIPCION_NEGOCIO,
                DESCRIPCION_OTRO_PROBLEMA = p.DESCRIPCION_OTRO_PROBLEMA,
                DESCRIPCION_PROBLEMA = p.DESCRIPCION_PROBLEMA,
                MERCADO = p.MERCADO,
                REQUIERE_APOYO = p.REQUIERE_APOYO,
                VENTA_DIA = p.VENTA_DIA,
                VENTA_MES = p.VENTA_MES,
                OBSERVACION_DESCRIPCION = p.OBSERVACION_DESCRIPCION,
                OBSERVACION_FECHA = p.OBSERVACION_FECHA,
                OBSERVACION_RESUELTO = p.OBSERVACION_RESUELTO == 1 ? true : false,
                ID_OBSERVACION = p.ID_OBSERVACION
            };
        }

        public static explicit operator MV_DetalleProblema(SP_VIEW_DETALLE_PROBLEMA_GetByIdPersonaConsultorResult p)
        {
            return new MV_DetalleProblema()
            {
                ID_PROBLEMA = p.ID_PROBLEMA,
                NOMBRE_PROBLEMA = p.NOMBRE_PROBLEMA,
                ID_ESTADO_PROCESO = p.ID_ESTADO_PROCESO,
                NOMBRE_BENEFICIARIO = p.NOMBRE_BENEFICIARIO,
                DIAS_ACTUALIZA = p.DIAS_ACTUALIZA,
                DIAS_CREA = p.DIAS_CREA,
                ID_BENEFICIARIO = p.ID_BENEFICIARIO,
                ID_PERSONA = p.ID_PERSONA,
                FECHA_ACTUALIZA = p.FECHA_ACTUALIZA==null? p.FECHA_CREA: p.FECHA_ACTUALIZA,
                FECHA_CREA = p.FECHA_CREA,
                NOMBRE_ESTADO = p.NOMBRE_ESTADO,
                CANT_EMPLEADOS = p.CANT_EMPLEADOS,
                DESCRIPCION_NEGOCIO = p.DESCRIPCION_NEGOCIO,
                DESCRIPCION_OTRO_PROBLEMA = p.DESCRIPCION_OTRO_PROBLEMA,
                DESCRIPCION_PROBLEMA = p.DESCRIPCION_PROBLEMA,
                MERCADO = p.MERCADO,
                REQUIERE_APOYO = p.REQUIERE_APOYO,
                VENTA_DIA = p.VENTA_DIA,
                VENTA_MES = p.VENTA_MES,
                OBSERVACION_DESCRIPCION = p.OBSERVACION_DESCRIPCION,
                OBSERVACION_FECHA = p.OBSERVACION_FECHA,
                OBSERVACION_RESUELTO = p.OBSERVACION_RESUELTO == 1 ? true : false,
                ID_OBSERVACION = p.ID_OBSERVACION
            };
        }


        public static explicit operator MV_DetalleProblema(SP_VIEW_DETALLE_PROBLEMA_GetByIdBeneficiarioResult p)
        {
            return new MV_DetalleProblema()
            {
                ID_PROBLEMA = p.ID_PROBLEMA,
                NOMBRE_PROBLEMA = p.NOMBRE_PROBLEMA,
                ID_ESTADO_PROCESO = p.ID_ESTADO_PROCESO,
                NOMBRE_BENEFICIARIO = p.NOMBRE_BENEFICIARIO,
                DIAS_ACTUALIZA = p.DIAS_ACTUALIZA,
                DIAS_CREA = p.DIAS_CREA,
                ID_BENEFICIARIO = p.ID_BENEFICIARIO,
                ID_PERSONA = p.ID_PERSONA,
                FECHA_ACTUALIZA = p.FECHA_ACTUALIZA == null ? p.FECHA_CREA : p.FECHA_ACTUALIZA,
                FECHA_CREA = p.FECHA_CREA,
                NOMBRE_ESTADO = p.NOMBRE_ESTADO,
                CANT_EMPLEADOS = p.CANT_EMPLEADOS,
                DESCRIPCION_NEGOCIO = p.DESCRIPCION_NEGOCIO,
                DESCRIPCION_OTRO_PROBLEMA = p.DESCRIPCION_OTRO_PROBLEMA,
                DESCRIPCION_PROBLEMA = p.DESCRIPCION_PROBLEMA,
                MERCADO = p.MERCADO,
                REQUIERE_APOYO = p.REQUIERE_APOYO,
                VENTA_DIA = p.VENTA_DIA,
                VENTA_MES = p.VENTA_MES,
                OBSERVACION_DESCRIPCION = p.OBSERVACION_DESCRIPCION,
                OBSERVACION_FECHA = p.OBSERVACION_FECHA,
                OBSERVACION_RESUELTO = p.OBSERVACION_RESUELTO == 1 ? true : false,
                ID_OBSERVACION = p.ID_OBSERVACION
            };
        }
    }
}
