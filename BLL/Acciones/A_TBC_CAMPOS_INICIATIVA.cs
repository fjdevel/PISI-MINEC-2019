using DAL.DB;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL.Acciones
{
    public class A_TBC_CAMPOS_INICIATIVA
    {
        private static readonly PISIDataContext _context = new PISIDataContext();
        public static List<BLL.Modelos.TBC_CAMPOS_INICIATIVA> ObtenerCamposByTipoIniciativa(int _id)
        {
            List < BLL.Modelos.TBC_CAMPOS_INICIATIVA > campos = new List<BLL.Modelos.TBC_CAMPOS_INICIATIVA>();
            var res = _context.SP_TBC_CAMPOS_INICIATIVA_SELECT_ALL_BY_TIPO_INICIATIVA(_id);
            foreach(var c in res)
            {
                var campo = new BLL.Modelos.TBC_CAMPOS_INICIATIVA();
                campo.ID_CAMPO = c.ID_CAMPO;
                campo.ID_TIPO_INICIATIVA = (int)c.ID_TIPO_INICIATIVA;
                campo.NOMBRE_CAMPO = c.NOMBRE_CAMPO;
                campos.Add(campo);
            }
            return campos;
        }

    }
}
