using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using BLL;
using DAL.DB;

namespace BLL.Acciones
{
    public class A_ASIGNACION
    {
        public static Modelos.TB_PERSONA getPersonaByIdBeneficiario(int id_beneficiario)
        {
            PISIDataContext _context = new PISIDataContext();

            return (Modelos.TB_PERSONA)_context.SP_TB_ASIGNACION_GetPersonaByIdBeneficiario(id_beneficiario).FirstOrDefault();
        }
        public static Modelos.TB_PERSONA geConsultorByIdBeneficiario(int id_beneficiario)
        {
            PISIDataContext _context = new PISIDataContext();

            return (Modelos.TB_PERSONA)_context.SP_TB_ASIGNACION_GetConsultorByIdBeneficiario(id_beneficiario).FirstOrDefault();
        }
        public static Modelos.TB_USUARIO gUsuarioBeneficiarioByIdBeneficiario(int id_beneficiario)
        {
            PISIDataContext _context = new PISIDataContext();

            return (Modelos.TB_USUARIO)_context.SP_TB_ASIGNACION_GetUsuarioBeneficiarioByIdBeneficiario(id_beneficiario).FirstOrDefault();
        }
        public static void Asignar(int bene,int consu)
        {
            PISIDataContext _context = new PISIDataContext();
            _context.SP_TB_ASIGNACION_InsertAsignacion(consu, bene);
        }
    }
}
