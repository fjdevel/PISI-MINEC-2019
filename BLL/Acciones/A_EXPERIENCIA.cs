using DAL.DB;
using BLL.Modelos.ModelosVistas;
using BLL.Helpers;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL.Acciones
{
    public class A_EXPERIENCIA
    {
        private readonly PISIDataContext _context = new PISIDataContext();

        /// <summary>
        /// Método encargado de insertar la Experiencia de un Formulador
        /// </summary>
        /// <param name="experiencia">objeto de tipo experiencia que se insertará</param>
        /// <param name="idUsuario">Usuario que inserta el registro</param>
        /// <returns>Retorna el Id de la experiencia que se acaba de ingresar</returns>
        public MV_Exception insertExperiencia(Modelos.TB_EXPERIENCIA experiencia, int idUsuario)
        {

            var res = new MV_Exception();

            try
            {

                res = idUsuario == 0
                    ? H_LogErrorEXC.resultToException(_context.SP_TB_EXPERIENCIA_InsertExperiencia(experiencia.ID_FORMULADOR, experiencia.INSTITUCION, experiencia.CARGO,
                    experiencia.TIEMPO, experiencia.PROYECTO, null).FirstOrDefault())
                    : H_LogErrorEXC.resultToException(_context.SP_TB_EXPERIENCIA_InsertExperiencia(experiencia.ID_FORMULADOR, experiencia.INSTITUCION, experiencia.CARGO,
                    experiencia.TIEMPO, experiencia.PROYECTO, idUsuario).FirstOrDefault());

                if (res.IDENTITY == null)
                    throw new Exception(res.ERROR_MESSAGE);
            }
            catch (Exception e)
            {
                H_LogErrorEXC.GuardarRegistroLogError(e);
            }
            return res;

        }


        /// <summary>
        /// Método que realiza una búsqueda de Experiencias por el id del Formulador
        /// </summary>
        /// <param name="idFormulador">Identificador del formulador</param>
        /// <returns>Listado de experiencias, si son encontradas. Null en otro caso</returns>
        public List<Modelos.TB_EXPERIENCIA> getByIdFormulador(int idFormulador)
        {

            List<Modelos.TB_EXPERIENCIA> list = new List<Modelos.TB_EXPERIENCIA>();

            var res = _context.SP_TB_EXPERIENCIA_GetByIdFormulador(idFormulador);

            foreach (var e in res)
            {
                Modelos.TB_EXPERIENCIA temp = new Modelos.TB_EXPERIENCIA();

                temp.ID_EXPERIENCIA = e.ID_EXPERIENCIA;
                temp.ID_FORMULADOR = e.ID_FORMULADOR;
                temp.INSTITUCION = e.INSTITUCION;
                temp.CARGO = e.CARGO;
                temp.TIEMPO = e.TIEMPO;
                temp.PROYECTO = e.PROYECTO;

                list.Add(temp);
            }

            return list;
        }


        /// <summary>
        ///  Método que actualiza la de Experiencia de un Formulador
        /// </summary>
        /// <param name="experiencia">Experiencia que será actualizada</param>
        /// <param name="idUsuario">Usuario que actualiza el registro</param>
        /// <returns>Una lista de errores cuando existen. Null, si la operación es correcta</returns>
        public MV_Exception updateExperiencia(Modelos.TB_EXPERIENCIA experiencia, int idUsuario)
        {
            try
            {
                MV_Exception res = H_LogErrorEXC.resultToException(_context.SP_TB_EXPERIENCIA_UPDATE(experiencia.ID_EXPERIENCIA, experiencia.INSTITUCION, experiencia.CARGO, experiencia.TIEMPO, experiencia.PROYECTO, idUsuario).FirstOrDefault());

                if (res.IDENTITY == null)
                    throw new Exception(res.ERROR_MESSAGE);

                return res;
            }
            catch (Exception)
            {
                throw;
            }
        }

        /// <summary>
        /// Método que borra definitivamente una Experiencia de Formulador
        /// </summary>
        /// <param name="idExperiencia">Id de la Experiencia que será eliminada</param>
        /// <returns>Un String con la descripción del error, si existe; Null, cuando la operación es correcta.</returns>
        public string hardDeleteExperiencia(int idExperiencia)
        {
            try
            {
                _context.SP_TB_EXPERIENCIA_DELETE_HARD(idExperiencia);   //Borrando experiencia

                return null;
            }
            catch (Exception e)
            {
                return e.Message;
            }
        }


    }
}
