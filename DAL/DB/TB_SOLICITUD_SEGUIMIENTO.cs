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
    using System.Collections.Generic;
    
    public partial class TB_SOLICITUD_SEGUIMIENTO
    {
        public int ID_SOLICITUD_SEGUIMIENTO { get; set; }
        public Nullable<int> ID_PROYECTO { get; set; }
        public Nullable<int> USUARIO_CREA { get; set; }
        public Nullable<int> USUARIO_ACTUALIZA { get; set; }
        public System.DateTime FECHA { get; set; }
        public string DESCRIPCION { get; set; }
        public Nullable<System.DateTime> FECHA_CREA { get; set; }
        public Nullable<System.DateTime> FECHA_ACTUALIZA { get; set; }
        public Nullable<System.DateTime> FECHA_BORRADO { get; set; }
    
        public virtual TB_PROYECTO TB_PROYECTO { get; set; }
        public virtual TB_USUARIO TB_USUARIO { get; set; }
        public virtual TB_USUARIO TB_USUARIO1 { get; set; }
    }
}