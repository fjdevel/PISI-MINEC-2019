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
    
    public partial class TB_USUARIO
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public TB_USUARIO()
        {
            this.TB_ACTIVIDAD = new HashSet<TB_ACTIVIDAD>();
            this.TB_ACTIVIDAD1 = new HashSet<TB_ACTIVIDAD>();
            this.TB_BENEFICIARIO = new HashSet<TB_BENEFICIARIO>();
            this.TB_BENEFICIARIO1 = new HashSet<TB_BENEFICIARIO>();
            this.TB_NOTIFICACION = new HashSet<TB_NOTIFICACION>();
            this.TB_NOTIFICACION1 = new HashSet<TB_NOTIFICACION>();
            this.TB_PERMISO = new HashSet<TB_PERMISO>();
            this.TB_PERMISO1 = new HashSet<TB_PERMISO>();
            this.TB_PERSONA = new HashSet<TB_PERSONA>();
            this.TB_PERSONA1 = new HashSet<TB_PERSONA>();
            this.TB_PROBLEMA = new HashSet<TB_PROBLEMA>();
            this.TB_PROPUESTA = new HashSet<TB_PROPUESTA>();
            this.TB_PROYECTO = new HashSet<TB_PROYECTO>();
            this.TB_PROYECTO1 = new HashSet<TB_PROYECTO>();
            this.TB_PROYECTO_ACTIVIDAD = new HashSet<TB_PROYECTO_ACTIVIDAD>();
            this.TB_PROYECTO_ACTIVIDAD1 = new HashSet<TB_PROYECTO_ACTIVIDAD>();
            this.TB_RECURSO = new HashSet<TB_RECURSO>();
            this.TB_RECURSO1 = new HashSet<TB_RECURSO>();
            this.TB_ROL = new HashSet<TB_ROL>();
            this.TB_ROL1 = new HashSet<TB_ROL>();
            this.TB_SOLICITUD_SEGUIMIENTO = new HashSet<TB_SOLICITUD_SEGUIMIENTO>();
            this.TB_SOLICITUD_SEGUIMIENTO1 = new HashSet<TB_SOLICITUD_SEGUIMIENTO>();
            this.TBC_ACTIVIDAD_INICIATIVA = new HashSet<TBC_ACTIVIDAD_INICIATIVA>();
            this.TBC_ACTIVIDAD_INICIATIVA1 = new HashSet<TBC_ACTIVIDAD_INICIATIVA>();
            this.TB_USUARIO1 = new HashSet<TB_USUARIO>();
            this.TB_USUARIO11 = new HashSet<TB_USUARIO>();
        }
    
        public int ID_USUARIO { get; set; }
        public int ID_ROL { get; set; }
        public Nullable<int> ID_PERSONA { get; set; }
        public Nullable<int> USUARIO_CREA { get; set; }
        public Nullable<int> USUARIO_ACTUALIZA { get; set; }
        public string NOMBRE_USUARIO { get; set; }
        public string CONTRASENA { get; set; }
        public string ID_SESION { get; set; }
        public Nullable<System.DateTime> FECHA_CREA { get; set; }
        public Nullable<System.DateTime> FECHA_ACTUALIZA { get; set; }
        public Nullable<System.DateTime> FECHA_BORRADO { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<TB_ACTIVIDAD> TB_ACTIVIDAD { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<TB_ACTIVIDAD> TB_ACTIVIDAD1 { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<TB_BENEFICIARIO> TB_BENEFICIARIO { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<TB_BENEFICIARIO> TB_BENEFICIARIO1 { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<TB_NOTIFICACION> TB_NOTIFICACION { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<TB_NOTIFICACION> TB_NOTIFICACION1 { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<TB_PERMISO> TB_PERMISO { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<TB_PERMISO> TB_PERMISO1 { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<TB_PERSONA> TB_PERSONA { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<TB_PERSONA> TB_PERSONA1 { get; set; }
        public virtual TB_PERSONA TB_PERSONA2 { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<TB_PROBLEMA> TB_PROBLEMA { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<TB_PROPUESTA> TB_PROPUESTA { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<TB_PROYECTO> TB_PROYECTO { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<TB_PROYECTO> TB_PROYECTO1 { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<TB_PROYECTO_ACTIVIDAD> TB_PROYECTO_ACTIVIDAD { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<TB_PROYECTO_ACTIVIDAD> TB_PROYECTO_ACTIVIDAD1 { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<TB_RECURSO> TB_RECURSO { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<TB_RECURSO> TB_RECURSO1 { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<TB_ROL> TB_ROL { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<TB_ROL> TB_ROL1 { get; set; }
        public virtual TB_ROL TB_ROL2 { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<TB_SOLICITUD_SEGUIMIENTO> TB_SOLICITUD_SEGUIMIENTO { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<TB_SOLICITUD_SEGUIMIENTO> TB_SOLICITUD_SEGUIMIENTO1 { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<TBC_ACTIVIDAD_INICIATIVA> TBC_ACTIVIDAD_INICIATIVA { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<TBC_ACTIVIDAD_INICIATIVA> TBC_ACTIVIDAD_INICIATIVA1 { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<TB_USUARIO> TB_USUARIO1 { get; set; }
        public virtual TB_USUARIO TB_USUARIO2 { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<TB_USUARIO> TB_USUARIO11 { get; set; }
        public virtual TB_USUARIO TB_USUARIO3 { get; set; }
    }
}
