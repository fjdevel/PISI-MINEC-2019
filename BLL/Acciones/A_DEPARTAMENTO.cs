using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL.DB;
using BLL.Modelos.ModelosVistas;
using TBC_DEPARTAMENTO = BLL.Modelos.TBC_DEPARTAMENTO;
using BLL.Helpers;


namespace BLL.Acciones
{
    public class A_DEPARTAMENTO
    {
        private readonly PISIDataContext _context = new PISIDataContext();

        /// <summary>
        /// Método encargado de obtener la lista de departamentos
        /// </summary>
        /// <returns>Retorna la lista de departamentos</returns>
        public List<TBC_DEPARTAMENTO> ObtenerDeptos()
        {
            List<TBC_DEPARTAMENTO> list = new List<TBC_DEPARTAMENTO>();
            var result = _context.SP_TBC_DEPARTAMENTO_GetDepartamentos();

            
            foreach (var item in result)
            {
                TBC_DEPARTAMENTO tmp = new TBC_DEPARTAMENTO();
                tmp.ID_DEPARTAMENTO = item.ID_DEPARTAMENTO;
                tmp.COD_DEPARTAMENTO = item.COD_DEPARTAMENTO;
                tmp.NOMBRE = item.NOMBRE_DEPTO;
                list.Add(tmp);
            }

            return list;
        }

        public MV_Exception GuardarDepartamento(TBC_DEPARTAMENTO depto, int idUsuario)
        {
            var result = new MV_Exception();
            try
            {
                result = H_LogErrorEXC.resultToException(_context.SP_TBC_DEPARTAMENTO_INSERT(depto.COD_DEPARTAMENTO, depto.NOMBRE, idUsuario).FirstOrDefault());
                if (result.IDENTITY == null)
                    throw new Exception(result.ERROR_MESSAGE);
            }
            catch (Exception e)
            {
                H_LogErrorEXC.GuardarRegistroLogError(e);
            }
            return result;
        }

        public MV_Exception editarDepartamento(TBC_DEPARTAMENTO depto, int usuario_actualiza)
        {
            try
            {
                MV_Exception res = H_LogErrorEXC.resultToException(_context.SP_TBC_DEPARTAMENTO_UPDATE(depto.ID_DEPARTAMENTO, depto.COD_DEPARTAMENTO, depto.NOMBRE, usuario_actualiza).FirstOrDefault());

                if (res.IDENTITY == null)
                    throw new Exception(res.ERROR_MESSAGE);

                return res;
            }
            catch (Exception)
            {
                throw;
            }
        }

        public Modelos.TBC_DEPARTAMENTO geDepartamentoById(int id)
        {
            Modelos.TBC_DEPARTAMENTO departamento = null;

            var res = _context.SP_TBC_DEPARTAMENTO_GetDepartamentosById(id).FirstOrDefault();   //Buscando a un usuario 

            //Si el usuario existe es convertido en un objeto Usuario y es devuelto
            if (res != null)
            {
                departamento = new Modelos.TBC_DEPARTAMENTO();

                departamento.ID_DEPARTAMENTO = res.ID_DEPARTAMENTO;
                departamento.COD_DEPARTAMENTO = res.COD_DEPARTAMENTO;
                departamento.NOMBRE = res.NOMBRE_DEPTO;
                
            }

            return departamento;
        }
    
        public MV_Exception softDeleteDepartamento(Modelos.TBC_DEPARTAMENTO departamento, int usuario_borra)
        {
            try
            {
                var res = H_LogErrorEXC.resultToException(_context.SP_TBC_DEPARTAMENTO_DELETE_SOFT(departamento.ID_DEPARTAMENTO, usuario_borra).FirstOrDefault());

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
