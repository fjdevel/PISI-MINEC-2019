using BLL.Helpers;
using BLL.Modelos.ModelosVistas;
using DAL.DB;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TBC_CAMPOS_INICIATIVA = BLL.Modelos.TBC_CAMPOS_INICIATIVA;

namespace BLL.Acciones
{
    public class A_CAMPOS_INICIATIVA
    {
        private readonly PISIDataContext _context = new PISIDataContext();

        /// <summary>
        /// Método encargado de obtener la lista de iniciativas
        /// </summary>
        /// <returns>Retorna la lista de departamentos</returns>
        public List<TBC_CAMPOS_INICIATIVA> ObtenerCamposIniciativas()
        {
            List<TBC_CAMPOS_INICIATIVA> list = new List<TBC_CAMPOS_INICIATIVA>();
            var result = _context.SP_TBC_CAMPOS_INICIATIVA_SelectAll();


            foreach (var item in result)
            {
                TBC_CAMPOS_INICIATIVA tmp = new TBC_CAMPOS_INICIATIVA();
                tmp.ID_CAMPO = item.ID_CAMPO;
                tmp.ID_TIPO_INICIATIVA = item.ID_TIPO_INICIATIVA;
                tmp.NOMBRE_CAMPO = item.NOMBRE_CAMPO;
                list.Add(tmp);
            }

            return list;
        }

        public MV_Exception GuardarCamposIniciativas(TBC_CAMPOS_INICIATIVA campos_iniciativas, int idUsuario)
        {
            var result = new MV_Exception();
            try
            {
                result = H_LogErrorEXC.resultToException(_context.SP_TBC_CAMPOS_INICIATIVA_Insert(campos_iniciativas.ID_CAMPO,campos_iniciativas.ID_TIPO_INICIATIVA,campos_iniciativas.NOMBRE_CAMPO,idUsuario));
                if (result.IDENTITY == null)
                    throw new Exception(result.ERROR_MESSAGE);
            }
            catch (Exception e)
            {
                H_LogErrorEXC.GuardarRegistroLogError(e);
            }
            return result;
        }

        public MV_Exception editarCamposIniciativas(TBC_CAMPOS_INICIATIVA campos_iniciativas, int usuario_actualiza)
        {
            try
            {
                MV_Exception res = H_LogErrorEXC.resultToException(_context.SP_TBC_CAMPOS_INICIATIVA_Update(campos_iniciativas.ID_CAMPO, campos_iniciativas.ID_TIPO_INICIATIVA, campos_iniciativas.NOMBRE_CAMPO, usuario_actualiza).FirstOrDefault());

                if (res.IDENTITY == null)
                    throw new Exception(res.ERROR_MESSAGE);

                return res;
            }
            catch (Exception)
            {
                throw;
            }
        }

        public Modelos.TBC_CAMPOS_INICIATIVA geCamposIniciativasById(int id)
        {
            Modelos.TBC_CAMPOS_INICIATIVA campos_iniciativas = null;

            var res = _context.SP_TBC_CAMPOS_INICIATIVA_SelectRow(id).FirstOrDefault();   //Buscando a un usuario 
         
            //Si el usuario existe es convertido en un objeto Usuario y es devuelto
            if (res != null)
            {
                campos_iniciativas = new Modelos.TBC_CAMPOS_INICIATIVA();
                campos_iniciativas.ID_CAMPO = res.ID_CAMPO;
                campos_iniciativas.ID_TIPO_INICIATIVA = res.ID_TIPO_INICIATIVA;
                campos_iniciativas.NOMBRE_CAMPO = res.NOMBRE_CAMPO;
            }

            return campos_iniciativas;
        }

        public MV_Exception softDeleteCamposIniciativas(Modelos.TBC_CAMPOS_INICIATIVA campos_iniciativas, int usuario_borra)
        {
            try
            {
                var res = H_LogErrorEXC.resultToException(_context.SP_TBC_CAMPOS_INICIATIVA_DeleteRow(campos_iniciativas.ID_CAMPO, usuario_borra).FirstOrDefault());

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
