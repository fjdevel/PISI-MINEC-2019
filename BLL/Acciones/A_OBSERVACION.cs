using BLL.Helpers;
using BLL.Modelos.ModelosVistas;
using System;
using System.Linq;
using DAL.DB;
using BLL.Modelos;
using System.Collections.Generic;

namespace BLL.Acciones
{
    public class A_OBSERVACION
    {
        private static readonly PISIDataContext _context = new PISIDataContext();

        public static MV_Exception CrearObservacion(int idEstadoProceso, string descripcion, string entidad, int idEntidad, short resuelto)
        {
            var res = new MV_Exception();
            try
            {
                res = H_LogErrorEXC.resultToException(_context.SP_TB_OBSERVACION_CrearObservacion(idEstadoProceso, descripcion, entidad, idEntidad,
                    resuelto).FirstOrDefault());

                if (res.IDENTITY == null)
                    throw new Exception(res.ERROR_MESSAGE);
            }
            catch (Exception e)
            {
                H_LogErrorEXC.GuardarRegistroLogError(e);
            }

            return res;
        }

        public static MV_Exception updateObservacion(int id_observacion, string codigo_estado_proceso, string descripcion, string entidad, int idEntidad, short resuelto)
        {
            var res = new MV_Exception();
            try
            {
                res = H_LogErrorEXC.resultToException(_context.SP_TB_OBSERVACION_UPDATE(id_observacion, codigo_estado_proceso, descripcion, entidad, idEntidad,
                    resuelto).FirstOrDefault());

                if (res.IDENTITY == null)
                    throw new Exception(res.ERROR_MESSAGE);
            }
            catch (Exception e)
            {
                H_LogErrorEXC.GuardarRegistroLogError(e);
            }

            return res;
        }

        public static Modelos.TB_OBSERVACION getByIdObservacion(int id_observacion)
        {
            return (Modelos.TB_OBSERVACION)_context.SP_TB_OBSERVACION_GetByIdObservacion(id_observacion).FirstOrDefault();
        }

        public static List<Modelos.TB_OBSERVACION> ObtenerXIdBeneficiario(int idBeneficiario)
        {
           return _context.SP_TB_OBSERVACION_GetByIdAndEntidad(idBeneficiario, "TB_BENEFICIARIO").Select(r => new Modelos.TB_OBSERVACION
           {
               DESCRIPCION = r.DESCRIPCION,
               FECHA = r.FECHA,
               ID_ESTADO_PROCESO = r.ID_ESTADO_PROCESO,
               ENTIDAD = r.ENTIDAD,
               RESUELTO = r.RESUELTO == 1
           }).ToList();
           
        }
        public static List<Modelos.TB_OBSERVACION> ObtenerPorProyecto(int proyecto)
        {
            return _context.SP_TB_OBSERVACION_GetByIdAndEntidad(proyecto, "TB_PROYECTO")
                 .Select(r => new Modelos.TB_OBSERVACION
                {
                    DESCRIPCION = r.DESCRIPCION,
                    FECHA = r.FECHA,
                    ID_ESTADO_PROCESO = r.ID_ESTADO_PROCESO,
                    ENTIDAD = r.ENTIDAD,
                    RESUELTO = r.RESUELTO == 1
                }).ToList();
        }

        public static void CambiarAResuelto(string entidad, int id)
        {
            _context.SP_TB_OBSERVACION_Resolver(id, entidad);
        }
    }
}
