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
    
    public partial class TBC_MUNICIPIO
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public TBC_MUNICIPIO()
        {
            this.TB_PERSONA = new HashSet<TB_PERSONA>();
        }
    
        public int ID_MUNICIPIO { get; set; }
        public Nullable<int> ID_DEPARTAMENTO { get; set; }
        public string COD_MUNICIPIO { get; set; }
        public string NOMBRE_MUNIC { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<TB_PERSONA> TB_PERSONA { get; set; }
        public virtual TBC_DEPARTAMENTO TBC_DEPARTAMENTO { get; set; }
    }
}
