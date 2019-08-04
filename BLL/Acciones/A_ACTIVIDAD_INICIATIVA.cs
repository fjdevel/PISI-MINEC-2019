using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL.DB;
using BLL.Modelos.ModelosVistas;
using TBC_ACTIVIDAD_INICIATIVA = BLL.Modelos.TBC_ACTIVIDAD_INICIATIVA;
using BLL.Helpers;

namespace BLL.Acciones
{
    public class A_ACTIVIDAD_INICIATIVA
    {
        private readonly PISIDataContext _context = new PISIDataContext();

        /// <summary>
        /// Método encargado de obtener la lista de actividades iniciativas
        /// </summary>
        /// <returns>Retorna la lista de departamentos</returns>
        public List<TBC_ACTIVIDAD_INICIATIVA> ObtenerActividadesIniciativa()
        {
            List<TBC_ACTIVIDAD_INICIATIVA> list = new List<TBC_ACTIVIDAD_INICIATIVA>();
            var result = _context.SP_TBC_ACTIVIDAD_INICIATIVA_SelectAll();


            foreach (var item in result)
            {
                TBC_ACTIVIDAD_INICIATIVA tmp = new TBC_ACTIVIDAD_INICIATIVA();
                tmp.ID_ACTIVIDAD_INICIATIVA = item.ID_ACTIVIDAD_INICIATIVA;
                tmp.ID_TIPO_INICIATIVA = item.ID_TIPO_INICIATIVA;
                tmp.COD_ACTIVIDAD_PROY = item.COD_ACTIVIDAD_PROY;
                tmp.DESCRIPCION = item.DESCRIPCION;
                list.Add(tmp);
            }

            return list;
        }

        public MV_Exception GuardarActividadesIniciativa(TBC_ACTIVIDAD_INICIATIVA actividad_iniciativa, int idUsuario)
        {
            var result = new MV_Exception();
            try
            {
                result = H_LogErrorEXC.resultToException(_context.SP_TBC_ACTIVIDAD_INICIATIVA_Insert(actividad_iniciativa.ID_TIPO_INICIATIVA, idUsuario, actividad_iniciativa.COD_ACTIVIDAD_PROY, actividad_iniciativa.DESCRIPCION).FirstOrDefault());
                if (result.IDENTITY == null)
                    throw new Exception(result.ERROR_MESSAGE);
            }
            catch (Exception e)
            {
                H_LogErrorEXC.GuardarRegistroLogError(e);
            }
            return result;
        }

        public MV_Exception editarActividadesIniciativa(TBC_ACTIVIDAD_INICIATIVA actividad_iniciativa, int usuario_actualiza)
        {
            try
            {
                MV_Exception res = H_LogErrorEXC.resultToException(_context.SP_TBC_ACTIVIDAD_INICIATIVA_Update(actividad_iniciativa.ID_ACTIVIDAD_INICIATIVA, actividad_iniciativa.ID_TIPO_INICIATIVA, usuario_actualiza, actividad_iniciativa.COD_ACTIVIDAD_PROY, actividad_iniciativa.DESCRIPCION).FirstOrDefault());

                if (res.IDENTITY == null)
                    throw new Exception(res.ERROR_MESSAGE);

                return res;
            }
            catch (Exception)
            {
                throw;
            }
        }

        public Modelos.TBC_ACTIVIDAD_INICIATIVA geActividadesIniciativaById(int id)
        {
            Modelos.TBC_ACTIVIDAD_INICIATIVA actividad_iniciativa = null;

            var res = _context.SP_TBC_ACTIVIDAD_INICIATIVA_SelectRow(id).FirstOrDefault();   //Buscando a un usuario 

            //Si el usuario existe es convertido en un objeto Usuario y es devuelto
            if (res != null)
            {
                actividad_iniciativa = new Modelos.TBC_ACTIVIDAD_INICIATIVA();

                actividad_iniciativa.ID_ACTIVIDAD_INICIATIVA = res.ID_ACTIVIDAD_INICIATIVA;
                actividad_iniciativa.ID_TIPO_INICIATIVA = res.ID_TIPO_INICIATIVA;
                actividad_iniciativa.COD_ACTIVIDAD_PROY = res.COD_ACTIVIDAD_PROY;
                actividad_iniciativa.DESCRIPCION = res.DESCRIPCION;

            }

            return actividad_iniciativa;
        }

        public MV_Exception softDeleteActividadesIniciativa(TBC_ACTIVIDAD_INICIATIVA actividad_iniciativa, int usuario_borra)
        {
            try
            {
                var res = H_LogErrorEXC.resultToException(_context.SP_TBC_ACTIVIDAD_INICIATIVA_DeleteRow(actividad_iniciativa.ID_ACTIVIDAD_INICIATIVA, usuario_borra).FirstOrDefault());

                if (res.IDENTITY == null)
                    throw new System.Exception(res.ERROR_MESSAGE);

                return res;
            }
            catch (Exception e)
            {
                throw new Exception(e.Message);
            }
        }
    }
}
