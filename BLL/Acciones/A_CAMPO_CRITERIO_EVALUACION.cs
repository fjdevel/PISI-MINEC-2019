using BLL.Helpers;
using BLL.Modelos.ModelosVistas;
using DAL.DB;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TBC_CAMPO_CRITERIO_EVALUACION = BLL.Modelos.TBC_CAMPO_CRITERIO_EVALUACION;

namespace BLL.Acciones
{
    public class A_CAMPO_CRITERIO_EVALUACION
    {
        private readonly PISIDataContext _context = new PISIDataContext();

        /// <summary>
        /// Método encargado de obtener la lista de departamentos
        /// </summary>
        /// <returns>Retorna la lista de departamentos</returns>
        public List<TBC_CAMPO_CRITERIO_EVALUACION> ObtenerCriteriosEvaluacion()
        {
            List<TBC_CAMPO_CRITERIO_EVALUACION> list = new List<TBC_CAMPO_CRITERIO_EVALUACION>();
            var result = _context.SP_TBC_CAMPO_CRITERIO_EVAL_SelectAll();


            foreach (var item in result)
            {
                TBC_CAMPO_CRITERIO_EVALUACION tmp = new TBC_CAMPO_CRITERIO_EVALUACION();
                tmp.ID_CAMPO_CRITERIO_EVAL = item.ID_CAMPO_CRITERIO_EVAL;
                tmp.ID_CRITERIO_EVAL_TECNICO = item.ID_CRITERIO_EVAL_TECNICO;
                tmp.CAMPO = item.CAMPO;
                tmp.PUNTAJE_MAX = item.PUNTAJE_MAX;
                list.Add(tmp);
            }

            return list;
        }

        public MV_Exception GuardarCriteriosEvaluacion(TBC_CAMPO_CRITERIO_EVALUACION criterio_evaluacion, int idUsuario)
        {
            var result = new MV_Exception();
            try
            {
                result = H_LogErrorEXC.resultToException(_context.SP_TBC_CAMPO_CRITERIO_EVAL_Insert(criterio_evaluacion.ID_CRITERIO_EVAL_TECNICO, criterio_evaluacion.CAMPO, criterio_evaluacion.PUNTAJE_MAX, idUsuario).FirstOrDefault());
                if (result.IDENTITY == null)
                    throw new Exception(result.ERROR_MESSAGE);
            }
            catch (Exception e)
            {
                H_LogErrorEXC.GuardarRegistroLogError(e);
            }
            return result;
        }

        public MV_Exception editarCriteriosEvaluacion(TBC_CAMPO_CRITERIO_EVALUACION criterio_evaluacion, int usuario_actualiza)
        {
            try
            {
                MV_Exception res = H_LogErrorEXC.resultToException(_context.SP_TBC_CAMPO_CRITERIO_EVAL_Update(criterio_evaluacion.ID_CAMPO_CRITERIO_EVAL, criterio_evaluacion.ID_CRITERIO_EVAL_TECNICO, criterio_evaluacion.CAMPO, criterio_evaluacion.PUNTAJE_MAX, usuario_actualiza).FirstOrDefault());

                if (res.IDENTITY == null)
                    throw new Exception(res.ERROR_MESSAGE);

                return res;
            }
            catch (Exception)
            {
                throw;
            }
        }

        public Modelos.TBC_CAMPO_CRITERIO_EVALUACION geCriteriosEvaluacionById(int id)
        {
            Modelos.TBC_CAMPO_CRITERIO_EVALUACION criterio_Evaluacion = null;

            var res = _context.SP_TBC_CAMPO_CRITERIO_EVAL_SelectRow(id).FirstOrDefault();   //Buscando a un usuario 

            //Si el usuario existe es convertido en un objeto Usuario y es devuelto
            if (res != null)
            {
                criterio_Evaluacion = new Modelos.TBC_CAMPO_CRITERIO_EVALUACION();

                criterio_Evaluacion.ID_CAMPO_CRITERIO_EVAL = res.ID_CAMPO_CRITERIO_EVAL;
                criterio_Evaluacion.ID_CRITERIO_EVAL_TECNICO = (int)res.ID_CRITERIO_EVAL_TECNICO;
                criterio_Evaluacion.CAMPO = res.CAMPO;
                criterio_Evaluacion.PUNTAJE_MAX = res.PUNTAJE_MAX;

            }

            return criterio_Evaluacion;
        }

        public MV_Exception softDeleteCriteriosEvaluacion(Modelos.TBC_CAMPO_CRITERIO_EVALUACION criterio_evaluacion, int usuario_borra)
        {
            try
            {
                var res = H_LogErrorEXC.resultToException(_context.SP_TBC_CAMPO_CRITERIO_EVAL_DeleteRow(criterio_evaluacion.ID_CAMPO_CRITERIO_EVAL, usuario_borra).FirstOrDefault());

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
