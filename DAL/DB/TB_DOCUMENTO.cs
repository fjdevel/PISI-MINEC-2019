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
    
    public partial class TB_DOCUMENTO
    {
        public int ID_DOCUMENTO { get; set; }
        public int ID_TIPO_DOCUMENTO { get; set; }
        public int ID_BENEFICIARIO { get; set; }
        public string URL { get; set; }
        public Nullable<System.DateTime> FECHA_CREA { get; set; }
        public Nullable<System.DateTime> FECHA_ACTUALIZA { get; set; }
        public Nullable<System.DateTime> FECHA_BORRADO { get; set; }
    
        public virtual TB_BENEFICIARIO TB_BENEFICIARIO { get; set; }
        public virtual TBC_TIPO_DOCUMENTO TBC_TIPO_DOCUMENTO { get; set; }
    }
}
