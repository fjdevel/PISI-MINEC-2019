using BLL.Helpers;
using BLL.Modelos.ModelosVistas;
using DAL.DB;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TBC_CAMPOS_EVALUACION_TECNICA = BLL.Modelos.TBC_CAMPOS_EVALUACION_TECNICA;

namespace BLL.Acciones
{
    public class A_CAMPOS_EVALUACION_TECNICA
    {
        private readonly PISIDataContext _context = new PISIDataContext();

        /// <summary>
        /// Método encargado de obtener la lista de departamentos
        /// </summary>
        /// <returns>Retorna la lista de departamentos</returns>
        public List<TBC_CAMPOS_EVALUACION_TECNICA> ObtenerEvaluacionTecnica()
        {
            List<TBC_CAMPOS_EVALUACION_TECNICA> list = new List<TBC_CAMPOS_EVALUACION_TECNICA>();
            var result = _context.SP_TBC_CRITERIO_EVAL_TECNICA_SelectAll();


            foreach (var item in result)
            {
                TBC_CAMPOS_EVALUACION_TECNICA tmp = new TBC_CAMPOS_EVALUACION_TECNICA();
                tmp.ID_CRITERIO_EVAL_TECNICO = item.ID_CRITERIO_EVAL_TECNICO;
                tmp.ID_CRITERIO_EVAL_TECNICO_SUP = item.ID_CRITERIO_EVAL_TECNICO_SUP;
                tmp.TIPO_EVAL = item.TIPO_EVAL;
                tmp.CRITERIO = item.CRITERIO;
                list.Add(tmp);
            }

            return list;
        }

        public MV_Exception GuardarEvaluacionTecnica(TBC_CAMPOS_EVALUACION_TECNICA evaluacion_tecnica, int idUsuario)
        {
            var result = new MV_Exception();
            try
            {
                result = H_LogErrorEXC.resultToException(_context.SP_TBC_CRITERIO_EVAL_TECNICA_Insert(evaluacion_tecnica.ID_CRITERIO_EVAL_TECNICO_SUP, evaluacion_tecnica.CRITERIO, evaluacion_tecnica.TIPO_EVAL, idUsuario).FirstOrDefault());
                if (result.IDENTITY == null)
                    throw new Exception(result.ERROR_MESSAGE);
            }
            catch (Exception e)
            {
                H_LogErrorEXC.GuardarRegistroLogError(e);
            }
            return result;
        }

        public MV_Exception editarEvaluacionTecnica(TBC_CAMPOS_EVALUACION_TECNICA evaluacion_tecnica, int usuario_actualiza)
        {
            try
            {
                MV_Exception res = H_LogErrorEXC.resultToException(_context.SP_TBC_CRITERIO_EVAL_TECNICA_Update(evaluacion_tecnica.ID_CRITERIO_EVAL_TECNICO, evaluacion_tecnica.ID_CRITERIO_EVAL_TECNICO_SUP, evaluacion_tecnica.CRITERIO, evaluacion_tecnica.TIPO_EVAL, usuario_actualiza).FirstOrDefault());

                if (res.IDENTITY == null)
                    throw new Exception(res.ERROR_MESSAGE);

                return res;
            }
            catch (Exception)
            {
                throw;
            }
        }

        public Modelos.TBC_CAMPOS_EVALUACION_TECNICA geEvaluacionTecnicaById(int id)
        {
            Modelos.TBC_CAMPOS_EVALUACION_TECNICA evaluacion_tecnica = null;

            var res = _context.SP_TBC_CRITERIO_EVAL_TECNICA_SelectRow(id).FirstOrDefault();   //Buscando a un usuario 

            //Si el usuario existe es convertido en un objeto Usuario y es devuelto
            if (res != null)
            {
                evaluacion_tecnica = new Modelos.TBC_CAMPOS_EVALUACION_TECNICA();
                evaluacion_tecnica.ID_CRITERIO_EVAL_TECNICO = res.ID_CRITERIO_EVAL_TECNICO;
                evaluacion_tecnica.ID_CRITERIO_EVAL_TECNICO_SUP = res.ID_CRITERIO_EVAL_TECNICO_SUP;
                evaluacion_tecnica.TIPO_EVAL = res.TIPO_EVAL;
                evaluacion_tecnica.CRITERIO = res.CRITERIO;
            }

            return evaluacion_tecnica;
        }

        public MV_Exception softDeleteEvaluacionTecnica(Modelos.TBC_CAMPOS_EVALUACION_TECNICA evaluacion_tecnica, int usuario_borra)
        {
            try
            {
                var res = H_LogErrorEXC.resultToException(_context.SP_TBC_CRITERIO_EVAL_TECNICA_DeleteRow(evaluacion_tecnica.ID_CRITERIO_EVAL_TECNICO, usuario_borra).FirstOrDefault());

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
