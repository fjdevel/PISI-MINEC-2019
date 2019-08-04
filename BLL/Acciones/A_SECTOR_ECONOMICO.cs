using BLL.Helpers;
using BLL.Modelos.ModelosVistas;
using DAL.DB;
using System;
using System.Collections.Generic;
using System.Linq;
using TBC_SECTOR_ECONOMICO = BLL.Modelos.TBC_SECTOR_ECONOMICO;

namespace BLL.Acciones
{
    public class A_SECTOR_ECONOMICO
    {
        private readonly PISIDataContext _context = new PISIDataContext();

        /// <summary>
        /// Método encargado de obtener la lista de sectores economicos
        /// </summary>
        /// <returns>Retorna la lista de sectores economicos</returns>
        public List<TBC_SECTOR_ECONOMICO> ObtenerSectores()
        {
            List<TBC_SECTOR_ECONOMICO> sectores = new List<TBC_SECTOR_ECONOMICO>();

            var result = _context.SP_TBC_SECTOR_ECONOMICO_GetSectores();
            foreach (var n in result)
            {
                TBC_SECTOR_ECONOMICO sec = new TBC_SECTOR_ECONOMICO();
                sec.ID_SECTOR_ECONOMICO = n.ID_SECTOR_ECONOMICO;
                sec.NOMBRE = n.NOMBRE_SECTOR;
                sectores.Add(sec);

            }

                return sectores;

        }

        public List<TBC_SECTOR_ECONOMICO> ObtenerSectoresEconomicos()
        {
            List<TBC_SECTOR_ECONOMICO> list = new List<TBC_SECTOR_ECONOMICO>();
            var result = _context.SP_TBC_SECTOR_ECONOMICO_SelectAll();


            foreach (var item in result)
            {
                TBC_SECTOR_ECONOMICO tmp = new TBC_SECTOR_ECONOMICO();
                tmp.ID_SECTOR_ECONOMICO = item.ID_SECTOR_ECONOMICO;
                tmp.COD_SECTOR_ECONOMICO = item.COD_SECTOR_ECONOMICO;
                tmp.NOMBRE = item.NOMBRE_SECTOR;
                list.Add(tmp);
            }

            return list;
        }

        public MV_Exception GuardarSectoresEconomicos(TBC_SECTOR_ECONOMICO sector_economico, int idUsuario)
        {
            var result = new MV_Exception();
            try
            {
                result = H_LogErrorEXC.resultToException(_context.SP_TBC_SECTOR_ECONOMICO_Insert(sector_economico.COD_SECTOR_ECONOMICO,
                                                                                               sector_economico.NOMBRE,
                                                                                               idUsuario).FirstOrDefault());
                if (result.IDENTITY == null)
                    throw new Exception(result.ERROR_MESSAGE);
            }
            catch (Exception e)
            {
                H_LogErrorEXC.GuardarRegistroLogError(e);
            }
            return result;
        }

        public MV_Exception editarSectoresEconomicos(TBC_SECTOR_ECONOMICO sector_economico, int usuario_actualiza)
        {
            try
            {
                MV_Exception res = H_LogErrorEXC.resultToException(_context.SP_TBC_SECTOR_ECONOMICO_Update(sector_economico.ID_SECTOR_ECONOMICO,
                                                                                                    sector_economico.COD_SECTOR_ECONOMICO,
                                                                                                    sector_economico.NOMBRE,
                                                                                                    usuario_actualiza).FirstOrDefault());

                if (res.IDENTITY == null)
                    throw new Exception(res.ERROR_MESSAGE);

                return res;
            }
            catch (Exception)
            {
                throw;
            }
        }

        public MV_Exception softDeleteSectoresEconomicos(Modelos.TBC_SECTOR_ECONOMICO sector_economico, int usuario_borra)
        {
            try
            {
                var res = H_LogErrorEXC.resultToException(_context.SP_TBC_SECTOR_ECONOMICO_DeleteRow(sector_economico.ID_SECTOR_ECONOMICO, usuario_borra).FirstOrDefault());

                if (res.IDENTITY == null)
                    throw new System.Exception(res.ERROR_MESSAGE);

                return res;
            }
            catch (Exception e)
            {
                throw new Exception(e.Message);
            }
        }

        public Modelos.TBC_SECTOR_ECONOMICO geSectorEconomicoById(int id)
        {
            Modelos.TBC_SECTOR_ECONOMICO sector_economico = null;

            var res = _context.SP_TBC_SECTOR_ECONOMICO_SelectRow(id).FirstOrDefault();   //Buscando a un usuario 

            //Si el usuario existe es convertido en un objeto Usuario y es devuelto
            if (res != null)
            {
                sector_economico = new Modelos.TBC_SECTOR_ECONOMICO();
                sector_economico.ID_SECTOR_ECONOMICO = res.ID_SECTOR_ECONOMICO;
                sector_economico.COD_SECTOR_ECONOMICO = res.COD_SECTOR_ECONOMICO;
                sector_economico.NOMBRE = res.NOMBRE_SECTOR;

            }

            return sector_economico;
        }
    }
}
