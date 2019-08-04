using System;
using System.Collections.Generic;
using BLL.Helpers;
using System.Linq;
using BLL.Modelos.ModelosVistas;
using DAL.DB;

namespace BLL.Acciones
{
    public class A_ASIG_CONSULTOR
    {
        private static readonly PISIDataContext _context = new PISIDataContext();

        public static MV_Exception AsignarConsultorABeneficiario(int? idMuni, int? idSector, int? idPersonaBeneficiario, int? idConsultor)
        {
            var res = new MV_Exception();
            try
            {
                res = H_LogErrorEXC.resultToException(_context.SP_TB_ASIG_CONSULTOR_VINCULACION_AsignarConsultorABeneficiario(idMuni, idSector, idPersonaBeneficiario, idConsultor).SingleOrDefault());

                if (res.IDENTITY == null)
                    throw new Exception(res.ERROR_MESSAGE);
            }
            catch (Exception e)
            {
                H_LogErrorEXC.GuardarRegistroLogError(e);
            }

            return res;
        }

        public static List<Object> ObtenerXMuniYSector(int idMuni, int idSector)
        {
            var res = _context.SP_TB_ASIG_CONSULTOR_VINCULACION_ObtenerXMuniYSector(idMuni, idSector);
            List<Object> dic = new List<object>();
            foreach(var a in res)
            {
                dic.Add(a);
            }
            return dic;
        }

        public static Modelos.ModelosVistas.MV_Exception GuardarAsignacion(int idPersonaConsultor,int idMunicipio,int idSector)
        {
            return H_LogErrorEXC.resultToException(_context.SP_TB_ASIG_CONSULTOR_VINCULACION_Insert(idMunicipio,idSector,idPersonaConsultor).FirstOrDefault());
        }

        public static BLL.Modelos.TB_PERSONA ObtenerConsultor(int idMunicipio, int idSector)
        {
            BLL.Modelos.TB_PERSONA con = null;
            var res = _context.SP_TB_ASIG_CONSULTOR_VINCULACION_ObtenerConsultor(idSector, idMunicipio).FirstOrDefault();
            if (res != null)
            {
                con = new BLL.Modelos.TB_PERSONA
                {
                    ID_PERSONA = res.ID_PERSONA
                };
            }
            else
            {
                con = new BLL.Modelos.TB_PERSONA
                {
                    ID_PERSONA = 0
                };
            }
            return con;
        }
    }
}
