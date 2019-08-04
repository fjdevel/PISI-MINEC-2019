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
    public class A_CONFIGURACION
    {
        private static readonly PISIDataContext _context = new PISIDataContext();   

        public MV_CantEvaluadores ObtenerCantEvaluadores()
        {
            MV_CantEvaluadores mV_CantEvaluadores;

            var resultado = _context.SP_TB_CONFIGURACION_GetCantEvaluadores().FirstOrDefault();


                     mV_CantEvaluadores = new MV_CantEvaluadores
                     {
                        CantUserEval = resultado.CANT_USER_EVAL ,
                        NumeroEvaluadores = resultado.NUMERO_EVALUADORES
                     };          

            return mV_CantEvaluadores;
        }

        public bool ActualizarCantEvaluadores(string cantEvaluadores)
        {
            var res = false;

            try
            {
                    _context.SP_TB_CONFIGURACION_UpdateCantEvaluadores(cantEvaluadores);
                    res = true;
            }
            catch (Exception e)
            {
                res = false;
                throw e;
            }        
            return res;
        }

    }
}
