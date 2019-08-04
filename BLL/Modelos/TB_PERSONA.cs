using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL.DB;

namespace BLL.Modelos
{
    public class TB_PERSONA
    {
        public int ID_PERSONA { get; set; }
        public int? ID_MUNICIPIO { get; set; }
        public string NOMBRES { get; set; }
        public string APELLIDOS { get; set; }
        public string DIRECCION { get; set; }
        public string CORREO_E { get; set; }
        public string TEL_FIJO { get; set; }
        public string TEL_CEL { get; set; }
        public int USUARIO_CREA { get; set; }
        public int USUARIO_ACTUALIZA { get; set; }
        public DateTime? FECHA_CREA { get; set; }
        public DateTime? FECHA_ACTUALIZA { get; set; }
        public DateTime? FECHA_BORRADO { get; set; }
        public int ID_DEPARTAMENTO { get; set; }

        public static explicit operator TB_PERSONA(SP_TB_ASIGNACION_GetConsultorByIdBeneficiarioResult p)
        {
            if (p != null)
                return new TB_PERSONA()
                {
                    APELLIDOS = p.APELLIDOS,
                    CORREO_E = p.CORREO_E,
                    DIRECCION = p.DIRECCION,
                    FECHA_CREA = p.FECHA_CREA,
                    ID_MUNICIPIO = p.ID_MUNICIPIO.HasValue ? p.ID_MUNICIPIO.Value : 0,
                    ID_PERSONA = p.ID_PERSONA,
                    NOMBRES = p.NOMBRES,
                    TEL_CEL = p.TEL_CEL,
                    TEL_FIJO = p.TEL_FIJO,
                    USUARIO_ACTUALIZA = p.USUARIO_ACTUALIZA.HasValue ? p.USUARIO_ACTUALIZA.Value : 0,
                    USUARIO_CREA = p.USUARIO_CREA.HasValue ? p.USUARIO_CREA.Value : 0
                };
            else
                return null;
        }

        public static explicit operator TB_PERSONA(SP_TB_ASIGNACION_GetPersonaByIdBeneficiarioResult p)
        {
            if (p != null)
                return new TB_PERSONA()
                {
                    APELLIDOS = p.APELLIDOS,
                    CORREO_E = p.CORREO_E,
                    DIRECCION = p.DIRECCION,
                    FECHA_ACTUALIZA = p.FECHA_ACTUALIZA,
                    FECHA_BORRADO = p.FECHA_BORRADO,
                    FECHA_CREA = p.FECHA_CREA,
                    ID_MUNICIPIO = p.ID_MUNICIPIO.HasValue ? p.ID_MUNICIPIO.Value : 0,
                    ID_PERSONA = p.ID_PERSONA,
                    NOMBRES = p.NOMBRES,
                    TEL_CEL = p.TEL_CEL,
                    TEL_FIJO = p.TEL_FIJO,
                    USUARIO_ACTUALIZA = p.USUARIO_ACTUALIZA.HasValue ? p.USUARIO_ACTUALIZA.Value : 0,
                    USUARIO_CREA = p.USUARIO_CREA.HasValue ? p.USUARIO_CREA.Value : 0
                };
            else
                return null;
        }
    }
}
