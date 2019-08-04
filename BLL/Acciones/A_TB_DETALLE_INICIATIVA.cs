using DAL.DB;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL.Acciones
{
    public class A_TB_DETALLE_INICIATIVA
    {
        private static readonly PISIDataContext _context = new PISIDataContext();
        public static void ActualizarDetalle(List<BLL.Modelos.TB_DETALLE_INICIATIVA> detalles)
        {
            foreach (var d in detalles)
            {
                _context.SP_TB_DETALLE_INICIATIVA_Update(d.ID_PROYECTO, d.ID_CAMPO, d.VALOR, d.ID_DETALLE_INICIATIVA);
            }
        }
        public static void guardarDetalle(List<BLL.Modelos.TB_DETALLE_INICIATIVA> detalles)
        {
           foreach(var d in detalles)
            {
                _context.SP_TB_DETALLE_INICIATIVA_Insert(d.ID_PROYECTO, d.ID_CAMPO, d.VALOR);
            }
        }
        public static List<BLL.Modelos.TB_DETALLE_INICIATIVA> ObtenerDetalleByProyecto(int _id)
        {
            List<BLL.Modelos.TB_DETALLE_INICIATIVA> detalle = new List<BLL.Modelos.TB_DETALLE_INICIATIVA>();
            var res = _context.SP_TB_DETALLE_INICIATIVA_SelectAllByProyecto(_id);
            foreach (var c in res)
            {
                var detal = new BLL.Modelos.TB_DETALLE_INICIATIVA();
                detal.ID_CAMPO = (int)c.ID_CAMPO;
                detal.ID_DETALLE_INICIATIVA = c.ID_DETALLE_INICIATIVA;
                detal.ID_PROYECTO = (int)c.ID_PROYECTO;
                detal.VALOR = c.VALOR;
                detalle.Add(detal);
            }
            return detalle;
        }
    }
}
