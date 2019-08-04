using System.Collections;
using System.Collections.Generic;
using System.Linq;
using DAL.DB;
using MinecPISI.ViewModels;
using BLL.Modelos;
using BLL.Modelos.ModelosVistas;
using System.Data.Common;
using BLL.Helpers;
using System;

namespace BLL.Acciones
{
    public class A_CRITERIO_EVAL_TEC
    {
        private static readonly PISIDataContext _context = new PISIDataContext();   

        public List<MV_FiltroTecnicoCriterioCampo> ObtenerCriteriosByAspecto(int idAspecto, int idProyecto, int idPersona)
        {
            List<MV_FiltroTecnicoCriterioCampo> mV_FiltroTecnicoCriterioCampos = new List<MV_FiltroTecnicoCriterioCampo>();

            var resultados = _context.SP_TB_RESULTADO_EVAL_TECNICA_GetByAspecto(idAspecto, idProyecto, idPersona);

                foreach (SP_TB_RESULTADO_EVAL_TECNICA_GetByAspectoResult resultado in resultados)
                {
                    MV_FiltroTecnicoCriterioCampo mV_FiltroTecnicoCriterioCampo = new MV_FiltroTecnicoCriterioCampo
                    {
                        Criterio = resultado.CRITERIO,
                        IdCriterio = resultado.ID_CRITERIO_EVAL_TECNICO,
                        Campo = resultado.CAMPO,
                        PuntajeMaximo = resultado.PUNTAJE_MAX,
                        IdCampo = resultado.ID_CAMPO_CRITERIO_EVAL,
                        Puntaje = resultado.PUNTAJE
                    };

                    mV_FiltroTecnicoCriterioCampos.Add(mV_FiltroTecnicoCriterioCampo);
                }

            return mV_FiltroTecnicoCriterioCampos;
        }

        public List<MV_FiltroTecnicoCriterioCampo> ObtenerCriteriosById(int idCriterio, int idProyecto, int idPersona)
        {
            List<MV_FiltroTecnicoCriterioCampo> mV_FiltroTecnicoCriterioCampos = new List<MV_FiltroTecnicoCriterioCampo>();

            var resultados = _context.SP_TB_RESULTADO_EVAL_TECNICA_GetById(idCriterio, idProyecto, idPersona);

            foreach (SP_TB_RESULTADO_EVAL_TECNICA_GetByIdResult resultado in resultados)
            {
                MV_FiltroTecnicoCriterioCampo mV_FiltroTecnicoCriterioCampo = new MV_FiltroTecnicoCriterioCampo
                {
                    Criterio = resultado.CRITERIO,
                    IdCriterio = resultado.ID_CRITERIO_EVAL_TECNICO,
                    Campo = resultado.CAMPO,
                    PuntajeMaximo = resultado.PUNTAJE_MAX,
                    IdCampo = resultado.ID_CAMPO_CRITERIO_EVAL,
                    Puntaje = resultado.PUNTAJE
                };

                mV_FiltroTecnicoCriterioCampos.Add(mV_FiltroTecnicoCriterioCampo);
            }

            return mV_FiltroTecnicoCriterioCampos;
        }

        public List<MV_Evaluadores> ObtenerEvaluadores(int idCriterio, int idProyecto)
        {
            List<MV_Evaluadores> mV_Evaluadores = new List<MV_Evaluadores>();

            var resultados = _context.SP_TB_RESULTADO_EVAL_COM_GetEvaluadores(idCriterio, idProyecto);

            foreach (SP_TB_RESULTADO_EVAL_COM_GetEvaluadoresResult resultado in resultados)
            {
                MV_Evaluadores mV_Evaluador = new MV_Evaluadores
                {
                    IdPersona = resultado.ID_PERSONA,
                    Nombre = resultado.NOMBRE,
                    IdProyecto = resultado.ID_PROYECTO
                   
                };

                mV_Evaluadores.Add(mV_Evaluador);
            }

            return mV_Evaluadores;
        }

        public List<MV_ComiteEvaluacionCriterioCampo> ObtenerCriteriosByEvaluaciones(int idCriterio, int idProyecto)
        {
            List<MV_ComiteEvaluacionCriterioCampo> mV_FiltroTecnicoCriterioCampos = new List<MV_ComiteEvaluacionCriterioCampo>();

            var resultados = _context.SP_TB_RESULTADO_EVAL_COM_GetEvaluaciones(idCriterio, idProyecto);

            foreach (SP_TB_RESULTADO_EVAL_COM_GetEvaluacionesResult resultado in resultados)
            {
                MV_ComiteEvaluacionCriterioCampo mV_FiltroTecnicoCriterioCampo = new MV_ComiteEvaluacionCriterioCampo
                {
                    Criterio = resultado.CRITERIO,
                    IdCriterio = resultado.ID_CRITERIO_EVAL_TECNICO,
                    Campo = resultado.CAMPO,
                    PuntajeMaximo = resultado.PUNTAJE_MAX,
                    IdCampo = resultado.ID_CAMPO_CRITERIO_EVAL,
                    Puntaje = resultado.PUNTAJE
                };

                mV_FiltroTecnicoCriterioCampos.Add(mV_FiltroTecnicoCriterioCampo);
            }

            return mV_FiltroTecnicoCriterioCampos;
        }

        public bool AlmacenarFiltroTecnico(List<MV_FiltroTecnicoCriterioCampo> resultadoEvalTecnicaList, int IdProyecto, int IdPersona)
        {
            var res = false;

            try
            {
                foreach (MV_FiltroTecnicoCriterioCampo resultadoEvalTecnica in resultadoEvalTecnicaList)
                {
                    _context.SP_TB_RESULTADO_EVAL_TECNICA_INSERT(IdProyecto, resultadoEvalTecnica.IdCampo,
                       (Int16)resultadoEvalTecnica.Puntaje, IdPersona);

                    res = true;
                }
            }
            catch (Exception e)
            {
                res = false;
                throw e;
            }        
            return res;
        }

        public bool EliminarEvaluacion(int IdProyecto, string tipoEvaluacion, int idPersona)
        {
            var res = false;

            try
            {
                _context.SP_TB_RESULTADO_EVAL_DELETE(IdProyecto, tipoEvaluacion, idPersona);
                res = true;
            }
            catch (Exception e)
            {
                res = false;
                throw e;
            }
            return res;
        }

        public bool AprovarProyecto(int IdProyecto, string codEstado, Int32 usuarioActualiza)
        {
            var res = false;

            try
            {
                _context.SP_TB_RESULTADO_EVAL_APROBAR_PROYECTO(IdProyecto, codEstado, usuarioActualiza);
                res = true;
            }
            catch (Exception e)
            {
                res = false;
                throw e;
            }
            return res;
        }

        public string GetCodigoProyecto(int IdProyecto)
        {
            var res = "";

            try
            {
                res = _context.SP_TB_PROYECTO_GetEstado(IdProyecto).FirstOrDefault().CODIGO_ESTADO_PROCESO;             
            }
            catch (Exception e)
            {
                H_LogErrorEXC.GuardarRegistroLogError(e);
                res = null;
                
            }
            return res;
        }

        public bool CanApproveProject(int IdAspecto, int IdProyecto)
        {
            short? res= 0;
            try
            {
                res = _context.FN_RESULTADO_EVAL_CAN_APPROVE_PROJECT(IdAspecto,IdProyecto);
            }
            catch (Exception e)
            {
                H_LogErrorEXC.GuardarRegistroLogError(e);

            }
            return (res==1);
        }

        public bool IsEvalCompleted(int IdAspecto, int IdProyecto)
        {
            short? res = 0;
            try
            {
                res = _context.FN_RESULTADO_EVAL_IS_COMPLETED(IdAspecto, IdProyecto);
            }
            catch (Exception e)
            {
                H_LogErrorEXC.GuardarRegistroLogError(e);

            }
            return (res == 1);
        }

        
    }
}
