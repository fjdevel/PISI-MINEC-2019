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
    
    public partial class TBC_DEPARTAMENTO
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public TBC_DEPARTAMENTO()
        {
            this.TBC_MUNICIPIO = new HashSet<TBC_MUNICIPIO>();
        }
    
        public int ID_DEPARTAMENTO { get; set; }
        public string COD_DEPARTAMENTO { get; set; }
        public string NOMBRE_DEPTO { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<TBC_MUNICIPIO> TBC_MUNICIPIO { get; set; }
    }
}