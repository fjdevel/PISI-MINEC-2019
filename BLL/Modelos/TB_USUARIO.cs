using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL.DB;

namespace BLL.Modelos
{
    public class TB_USUARIO
    {
        public int  ID_USUARIO { get; set; }
        public int ID_ROL { get; set; }
        public int? ID_PERSONA { get; set; }
        public string NOMBRE_USUARIO { get; set; }
        public string CONTRASENA { get; set; }
        public int USUARIO_CREA { get; set; }
        public int USUARIO_ACTUALIZA { get; set; }
        public DateTime FECHA_CREA { get; set; }
        public DateTime FECHA_ACTUALIZA { get; set; }
        public DateTime FECHA_BORRADO { get; set; }

        public static explicit operator TB_USUARIO(SP_TB_ASIGNACION_GetUsuarioBeneficiarioByIdBeneficiarioResult v)
        {
            return new TB_USUARIO {
                ID_USUARIO = v.ID_USUARIO,
                ID_ROL = v.ID_ROL,
                ID_PERSONA = v.ID_PERSONA,
                NOMBRE_USUARIO = v.NOMBRE_USUARIO
            };
        }
    }
}
