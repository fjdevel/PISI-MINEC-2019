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
    
    public partial class SP_TB_RECURSO_GetById_Result
    {
        public int ID_RECURSO { get; set; }
        public Nullable<int> USUARIO_CREA { get; set; }
        public Nullable<int> USUARIO_ACTUALIZA { get; set; }
        public string URL_RECURSO { get; set; }
        public string NOMBRE { get; set; }
        public Nullable<System.DateTime> FECHA_CREA { get; set; }
        public Nullable<System.DateTime> FECHA_ACTUALIZA { get; set; }
        public Nullable<System.DateTime> FECHA_BORRADO { get; set; }
    }
}
