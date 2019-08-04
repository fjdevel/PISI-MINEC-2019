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
    public class A_FORMULADOR
    {
        private static readonly PISIDataContext _context = new PISIDataContext();

        public static MV_Exception ValidarRegistro(int id)
        {
            try
            {
                MV_Exception res = H_LogErrorEXC.resultToException(_context.SP_TB_FORMULADOR_VALIDAR(id).FirstOrDefault());

                if (res.IDENTITY == null)
                    throw new Exception(res.ERROR_MESSAGE);

                return res;
            }
            catch (Exception)
            {
                throw;
            }
        }

        public static List<Object> ObtenerFormuladores()
        {
            List<Object> formuladores = new List<Object>();
            var res = _context.SP_TB_FORMULADOR_ObtenerFormuladores();
            foreach (var r in res)
            {
                dynamic f = new System.Dynamic.ExpandoObject();
                f.ID_FORMULADOR = r.ID_FORMULADOR;
                f.ID_PERSONA = r.ID_PERSONA;
                f.ACTIVO = r.ACTIVO;
                f.NOMBRES = r.NOMBRES;
                f.CORREO = r.CORREO_E;
                f.CELULAR = r.TEL_CEL;
                f.FIJO = r.TEL_FIJO;
                f.FECHA_CREA = r.FECHA_CREA;
                formuladores.Add(f);
            }
            return formuladores;
        }

        /// <summary>
        /// Método encargado de almacernar un formulador
        /// </summary>
        /// <param name="formulador">objeto de tipo formulador</param>
        /// <returns>Retorna el Id del formulador que se acaba de ingresar</returns>
        public MV_Exception insertFormulador(Modelos.TB_FORMULADOR formulador, int idUsuario)
        {
            var res = new MV_Exception();

            try
            {

                res = idUsuario == 0
                    ? H_LogErrorEXC.resultToException(_context.SP_TB_FORMULADOR_InsertFormulador(formulador.ID_PERSONA, formulador.GRADO_ACADEMICO, formulador.ANIOS_EXPERIENCIA,
                        Convert.ToInt16(formulador.ACTIVO), null).FirstOrDefault())
                    : H_LogErrorEXC.resultToException(_context.SP_TB_FORMULADOR_InsertFormulador(formulador.ID_PERSONA, formulador.GRADO_ACADEMICO, formulador.ANIOS_EXPERIENCIA,
                        Convert.ToInt16(formulador.ACTIVO), idUsuario).FirstOrDefault());

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
        /// Método encargado de recuperar el detalle de experiencia de un formulador
        /// </summary>
        /// <param name="idPersona">Identificador de la persona asociada al formulador</param>
        /// <returns>Retorna el listado de experiencia del formulador</returns>
        public List<MV_DetalleFormulador> getDetalleFormulador(int idPersona)
        {
            PISIDataContext _context = new PISIDataContext();
            var result = _context.SP_VIEW_DETALLE_FORMULADOR_GetByIdPersona(idPersona);

            if (result != null)
                return result.Select(b => (MV_DetalleFormulador)b).ToList();
            else
                return null;
        }
        public static BLL.Modelos.TB_FORMULADOR ObtenerFormuladorPorIdPersona(int id)
        {
            BLL.Modelos.TB_FORMULADOR F = null;
            var res = _context.SP_TB_FORMULADOR_ObtenerFormuladorPorIdPersona(id).FirstOrDefault();
            if (res != null)
            {
                F = new BLL.Modelos.TB_FORMULADOR
                {
                    ID_FORMULADOR = res.ID_FORMULADOR,
                    ACTIVO = res.ACTIVO ==1?true:false
                };
            }
            return F;
        }
        public static BLL.Modelos.TB_PERSONA ObtenerFormuladorPorIdProyecto(int id)
        {
            BLL.Modelos.TB_PERSONA P = null;
            var res = _context.SP_TB_FORMULADOR_ObtenerFormuladorPorProyecto(id).FirstOrDefault();
            P = new BLL.Modelos.TB_PERSONA
            {
                NOMBRES = res.NOMBRES
            };
            return P;
        }

    }

}
