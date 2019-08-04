using BLL.Helpers;
using BLL.Modelos.ModelosVistas;
using DAL.DB;
using System;
using System.Collections.Generic;
using System.Linq;
using TBC_ESTADO_PROCESO = BLL.Modelos.TBC_ESTADO_PROCESO;

namespace BLL.Acciones
{
    public class A_ESTADO_PROCESO
    {
        private static readonly PISIDataContext _context = new PISIDataContext();
        public static TBC_ESTADO_PROCESO ObtenerPorCodigo(string _codigo) {
            var res = _context.SP_TBC_ESTADO_PROCESO_GetByCodigo(_codigo).FirstOrDefault();

            if (res == null) return null;

            var estado= new TBC_ESTADO_PROCESO
            {
                ID_ESTADO_PROCESO = res.ID_ESTADO_PROCESO,
                CODIGO_ESTADO_PROCESO = res.CODIGO_ESTADO_PROCESO,
                DESCRIPCION_ESTADO_PROCESO = res.DESCRIPCION_ESTADO_PROCESO,
                ICONO_ESTADO_PROCESO = res.ICONO_ESTADO_PROCESO,
                COLOR_ESTADO_PROCESO = res.COLOR_ESTADO_PROCESO
            };

            return estado;
        }
        public static TBC_ESTADO_PROCESO ObtenerPorId(int _id)
        {
            var res = _context.SP_TBC_ESTADO_PROCESO_GetByiD(_id).FirstOrDefault();

            if (res == null) return null;

            var estado = new TBC_ESTADO_PROCESO
            {
                ID_ESTADO_PROCESO = res.ID_ESTADO_PROCESO,
                CODIGO_ESTADO_PROCESO = res.CODIGO_ESTADO_PROCESO,
                DESCRIPCION_ESTADO_PROCESO = res.DESCRIPCION_ESTADO_PROCESO,
                ICONO_ESTADO_PROCESO = res.ICONO_ESTADO_PROCESO,
                COLOR_ESTADO_PROCESO = res.COLOR_ESTADO_PROCESO
            };

            return estado;
        }

        public Modelos.TBC_ESTADO_PROCESO geEstadoProcesoById(int id)
        {
            Modelos.TBC_ESTADO_PROCESO estado_proceso = null;

            var res = _context.SP_TBC_ESTADO_PROCESO_SelectRow(id).FirstOrDefault();   //Buscando a un usuario 

            //Si el usuario existe es convertido en un objeto Usuario y es devuelto
            if (res != null)
            {
                estado_proceso = new Modelos.TBC_ESTADO_PROCESO();
                estado_proceso.ID_ESTADO_PROCESO = res.ID_ESTADO_PROCESO;
                estado_proceso.CODIGO_ESTADO_PROCESO = res.CODIGO_ESTADO_PROCESO;
                estado_proceso.DESCRIPCION_ESTADO_PROCESO = res.DESCRIPCION_ESTADO_PROCESO;
                estado_proceso.ICONO_ESTADO_PROCESO = res.ICONO_ESTADO_PROCESO;
                estado_proceso.COLOR_ESTADO_PROCESO = res.COLOR_ESTADO_PROCESO;

            }

            return estado_proceso;
        }

        public List<TBC_ESTADO_PROCESO> ObtenerEstadosProcesos()
        {
            List<TBC_ESTADO_PROCESO> list = new List<TBC_ESTADO_PROCESO>();
            var result = _context.SP_TBC_ESTADO_PROCESO_SelectAll();


            foreach (var item in result)
            {
                TBC_ESTADO_PROCESO tmp = new TBC_ESTADO_PROCESO();
                tmp.ID_ESTADO_PROCESO = item.ID_ESTADO_PROCESO;
                tmp.CODIGO_ESTADO_PROCESO = item.CODIGO_ESTADO_PROCESO;
                tmp.DESCRIPCION_ESTADO_PROCESO = item.DESCRIPCION_ESTADO_PROCESO;
                tmp.ICONO_ESTADO_PROCESO = item.ICONO_ESTADO_PROCESO;
                tmp.COLOR_ESTADO_PROCESO = item.COLOR_ESTADO_PROCESO;
               
                list.Add(tmp);
            }

            return list;
        }

        public MV_Exception GuardarEstadosProcesos(TBC_ESTADO_PROCESO estado_proceso, int idUsuario)
        {
            var result = new MV_Exception();
            try
            {
                result = H_LogErrorEXC.resultToException(_context.SP_TBC_ESTADO_PROCESO_Insert(estado_proceso.CODIGO_ESTADO_PROCESO, 
                                                                                               estado_proceso.DESCRIPCION_ESTADO_PROCESO,
                                                                                               estado_proceso.ICONO_ESTADO_PROCESO,
                                                                                               estado_proceso.COLOR_ESTADO_PROCESO,
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

        public MV_Exception editarEstadosProcesos(TBC_ESTADO_PROCESO estado_proceso, int usuario_actualiza)
        {
            try
            {
                MV_Exception res = H_LogErrorEXC.resultToException(_context.SP_TBC_ESTADO_PROCESO_Update(estado_proceso.ID_ESTADO_PROCESO, 
                                                                                                         estado_proceso.CODIGO_ESTADO_PROCESO, 
                                                                                                         estado_proceso.DESCRIPCION_ESTADO_PROCESO,
                                                                                                         estado_proceso.ICONO_ESTADO_PROCESO,
                                                                                                         estado_proceso.COLOR_ESTADO_PROCESO,
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

        public MV_Exception softEstadosProcesos(Modelos.TBC_ESTADO_PROCESO estado_proceso, int usuario_borra)
        {
            try
            {
                var res = H_LogErrorEXC.resultToException(_context.SP_TBC_ESTADO_PROCESO_DeleteRow(estado_proceso.ID_ESTADO_PROCESO, usuario_borra).FirstOrDefault());

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
