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
    
    public partial class SP_TB_PERSONA_GetDeleted_Result
    {
        public int ID_PERSONA { get; set; }
        public Nullable<int> USUARIO_CREA { get; set; }
        public Nullable<int> USUARIO_ACTUALIZA { get; set; }
        public Nullable<int> ID_MUNICIPIO { get; set; }
        public string NOMBRES { get; set; }
        public string APELLIDOS { get; set; }
        public string CORREO_E { get; set; }
        public string DIRECCION { get; set; }
        public string TEL_FIJO { get; set; }
        public string TEL_CEL { get; set; }
        public Nullable<System.DateTime> FECHA_CREA { get; set; }
        public Nullable<System.DateTime> FECHA_ACTUALIZA { get; set; }
        public Nullable<System.DateTime> FECHA_BORRADO { get; set; }
    }
}
