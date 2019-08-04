using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL.DB;

namespace BLL.Modelos.ModelosVistas
{
    public class MV_DetalleFormulador
    {

        public int ID_PERSONA { get; set; }
        public int? ID_MUNICIPIO { get; set; }
        public string NOMBRES { get; set; }
        public string APELLIDOS { get; set; }
        public string CORREO_E { get; set; }
        public string DIRECCION { get; set; }
        public string TEL_FIJO { get; set; }
        public string TEL_CEL { get; set; }
        public int? ID_FORMULADOR { get; set; }
        public string GRADO_ACADEMICO { get; set; }
        public int? ANIOS_EXPERIENCIA { get; set; }
        public short? ACTIVO { get; set; }
        public int? ID_EXPERIENCIA { get; set; }
        public string INSTITUCION { get; set; }
        public string CARGO { get; set; }
        public string TIEMPO { get; set; }
        public string PROYECTO { get; set; }

        public static explicit operator MV_DetalleFormulador(SP_VIEW_DETALLE_FORMULADOR_GetByIdPersonaResult f)
        {
            return new MV_DetalleFormulador()
            {
                ID_PERSONA = f.ID_PERSONA,
                ID_MUNICIPIO = f.ID_MUNICIPIO,
                NOMBRES = f.NOMBRES,
                APELLIDOS = f.APELLIDOS,
                CORREO_E = f.CORREO_E,
                DIRECCION = f.DIRECCION,
                TEL_FIJO = f.TEL_FIJO,
                TEL_CEL = f.TEL_CEL,
                ID_FORMULADOR = f.ID_FORMULADOR,
                GRADO_ACADEMICO = f.GRADO_ACADEMICO,
                ANIOS_EXPERIENCIA = f.ANIOS_EXPERIENCIA,
                ACTIVO = f.ACTIVO,
                ID_EXPERIENCIA = f.ID_EXPERIENCIA,
                INSTITUCION = f.INSTITUCION,
                CARGO = f.CARGO,
                TIEMPO = f.TIEMPO,
                PROYECTO = f.PROYECTO

            };

        }

    }
}
