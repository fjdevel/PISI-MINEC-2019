using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL.DB;
using BLL.Helpers;

namespace BLL.Modelos.ModelosVistas
{
    public class MV_Exception
    {
        public decimal? IDENTITY { get; set; }
        public int? ERROR_NUMBER { get; set; }
        public string ERROR_MESSAGE { get; set; }
        public string ERROR_PROCEDURE { get; set; }
        public int? ERROR_LINE { get; set; }

        public static explicit operator MV_Exception(SP_TB_PROBLEMA_UPDATE_ID_ESTADO_PROCESOResult r)
        {
            if (r != null)
                return new MV_Exception()
                {
                    ERROR_LINE = r.ERROR_LINE,
                    ERROR_MESSAGE = r.ERROR_MESSAGE,
                    ERROR_NUMBER = r.ERROR_NUMBER,
                    ERROR_PROCEDURE = r.ERROR_PROCEDURE,
                    IDENTITY = r.IDENTITY
                };
            else
                return null;
        }
    }
}
