//------------------------------------------------------------------------------
// <auto-generated>
//     Este código se generó a partir de una plantilla.
//
//     Los cambios manuales en este archivo pueden causar un comportamiento inesperado de la aplicación.
//     Los cambios manuales en este archivo se sobrescribirán si se regenera el código.
// </auto-generated>
//------------------------------------------------------------------------------

namespace DAL.DB
{
    using System;
    
    public partial class SP_TB_BENEFICIARIO_GetByIdPersona_Result
    {
        public int ID_BENEFICIARIO { get; set; }
        public Nullable<int> ID_SECTOR_ECONOMICO { get; set; }
        public Nullable<int> ID_PERSONA { get; set; }
        public Nullable<int> ID_ESTADO_PROCESO { get; set; }
        public Nullable<int> USUARIO_CREA { get; set; }
        public Nullable<int> USUARIO_ACTUALIZA { get; set; }
        public string CODIGO_BENEFICIARIO { get; set; }
        public short TIPO_PERSONA { get; set; }
        public string DUI { get; set; }
        public string NIT { get; set; }
        public Nullable<decimal> LAT { get; set; }
        public Nullable<decimal> LONG { get; set; }
        public Nullable<System.DateTime> FECHA_CREA { get; set; }
        public Nullable<System.DateTime> FECHA_ACTUALIZA { get; set; }
        public Nullable<System.DateTime> FECHA_BORRADO { get; set; }
        public Nullable<bool> EXISTEN_ACTIVOS { get; set; }
        public Nullable<bool> MAS_ANIOS_EN_LUGAR { get; set; }
        public Nullable<bool> PUEDE_COMPROBAR_VENTAS { get; set; }
        public string MEDIO_CONTACTO { get; set; }
        public string INFO_COMPLEMENTARIA { get; set; }
    }
}