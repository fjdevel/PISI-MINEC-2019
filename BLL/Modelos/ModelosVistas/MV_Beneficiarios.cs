using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL.DB;

namespace BLL.Modelos.ModelosVistas
{
    public class MV_Beneficiarios
    {
        public int? ID_PERSONA { get; set; }
        public string NOMBRE { get; set; }
        public string APELLIDOS { get; set; }

        public static explicit operator MV_Beneficiarios(SP_VIEW_TB_USUARIO_GetByIdBeneficiarioResult d)
        {
            return new MV_Beneficiarios()
            {
                ID_PERSONA = d.ID_PERSONA,
                NOMBRE=d.NOMBRES,
                APELLIDOS=d.APELLIDOS

            };


        }
        public static explicit operator MV_Beneficiarios(SP_VIEW_TB_USUARIO_GetByIdConsultorResult d)
        {
            return new MV_Beneficiarios()
            {
                ID_PERSONA = d.ID_PERSONA,
                NOMBRE = d.NOMBRES,
                APELLIDOS = d.APELLIDOS

            };


        }
        public static explicit operator MV_Beneficiarios(SP_VIEW_TB_USUARIO_GetByIdFormuladorResult d)
        {
            return new MV_Beneficiarios()
            {
                ID_PERSONA = d.ID_PERSONA,
                NOMBRE = d.NOMBRES,
                APELLIDOS = d.APELLIDOS

            };


        }

    }
   
}
