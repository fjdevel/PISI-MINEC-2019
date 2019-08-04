using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL.DB;
using BLL.Modelos.ModelosVistas;
using TBC_TIPO_INICIATIVA = BLL.Modelos.TBC_TIPO_INICIATIVA;
using BLL.Helpers;

namespace BLL.Acciones
{
    
    public class A_TIPO_INICIATIVA
    {
        private readonly PISIDataContext _context = new PISIDataContext();

        /// <summary>
        /// Método encargado de obtener la lista de departamentos
        /// </summary>
        /// <returns>Retorna la lista de departamentos</returns>
        public List<TBC_TIPO_INICIATIVA> ObtenerIniciativas()
        {
            List<TBC_TIPO_INICIATIVA> list = new List<TBC_TIPO_INICIATIVA>();
            var result = _context.SP_TBC_TIPO_INICIATIVA_SelectAll();


            foreach (var item in result)
            {
                TBC_TIPO_INICIATIVA tmp = new TBC_TIPO_INICIATIVA();
                tmp.ID_TIPO_INICIATIVA = item.ID_TIPO_INICIATIVA;
                tmp.NOMBRE = item.NOMBRE;
                tmp.CODIGO_TIPO_INICIATIVA = item.CODIGO_TIPO_INICIATVA;
                list.Add(tmp);
            }

            return list;
        }

        public MV_Exception GuardarIniciativa(TBC_TIPO_INICIATIVA tipo_iniciativa, int idUsuario)
        {
            var result = new MV_Exception();
            try
            {
                result = H_LogErrorEXC.resultToException(_context.SP_TBC_TIPO_INICIATIVA_Insert(tipo_iniciativa.NOMBRE, tipo_iniciativa.CODIGO_TIPO_INICIATIVA, idUsuario).FirstOrDefault());
                if (result.IDENTITY == null)
                    throw new Exception(result.ERROR_MESSAGE);
            }
            catch (Exception e)
            {
                H_LogErrorEXC.GuardarRegistroLogError(e);
            }
            return result;
        }

        public MV_Exception editarIniciativa(TBC_TIPO_INICIATIVA tipo_iniciativa, int usuario_actualiza)
        {
            try
            {
                MV_Exception res = H_LogErrorEXC.resultToException(_context.SP_TBC_TIPO_INICIATIVA_Update(tipo_iniciativa.ID_TIPO_INICIATIVA, tipo_iniciativa.NOMBRE, tipo_iniciativa.CODIGO_TIPO_INICIATIVA, usuario_actualiza).FirstOrDefault());

                if (res.IDENTITY == null)
                    throw new Exception(res.ERROR_MESSAGE);

                return res;
            }
            catch (Exception)
            {
                throw;
            }
        }

        public Modelos.TBC_TIPO_INICIATIVA geIniciativaById(int id)
        {
            Modelos.TBC_TIPO_INICIATIVA tipo_iniciativa = null;

            var res = _context.SP_TBC_TIPO_INICIATIVA_SelectRow(id).FirstOrDefault();   //Buscando a un usuario 

            //Si el usuario existe es convertido en un objeto Usuario y es devuelto
            if (res != null)
            {
                tipo_iniciativa = new Modelos.TBC_TIPO_INICIATIVA();

                tipo_iniciativa.ID_TIPO_INICIATIVA = res.ID_TIPO_INICIATIVA;
                tipo_iniciativa.CODIGO_TIPO_INICIATIVA = res.CODIGO_TIPO_INICIATVA;
                tipo_iniciativa.NOMBRE = res.NOMBRE;

            }

            return tipo_iniciativa;
        }

        public MV_Exception softDeleteIniciativa(Modelos.TBC_TIPO_INICIATIVA tipo_iniciativa, int usuario_borra)
        {
            try
            {
                var res = H_LogErrorEXC.resultToException(_context.SP_TBC_TIPO_INICIATIVA_DeleteRow(tipo_iniciativa.ID_TIPO_INICIATIVA, usuario_borra).FirstOrDefault());

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
