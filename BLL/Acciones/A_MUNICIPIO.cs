using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL.DB;
using BLL.Modelos;
using BLL.Modelos.ModelosVistas;
using BLL.Helpers;

namespace BLL.Acciones
{
    public class A_MUNICIPIO
    {
        private readonly PISIDataContext _context = new PISIDataContext();

        /// <summary>
        /// Método encargado de obtener todos los municipios segun Id del departamento
        /// </summary>
        /// <param name="idDepto">Id del departamento</param>
        /// <returns>Retorna la lista de municipios segun el Id del departamento recibido</returns>
        public List<TBC_MUNICIPIO> ObtenerMunicipiosXDepartamento(int idDepto)
        {
            var result = _context.SP_TBC_MUNICIPIO_GetMunicipiosXDepartamento(idDepto);

            return result.Select(x => new TBC_MUNICIPIO
            {
                ID_MUNICIPIO = x.ID_MUNICIPIO,
                ID_DEPARTAMENTO = x.ID_DEPARTAMENTO,
                COD_MUNICIPIO = x.COD_MUNICIPIO,
                NOMBRE = x.NOMBRE_MUNIC
            }).OrderBy(x => x.NOMBRE).ToList();
        }

        /// <summary>
        /// Método encargado de obtener el departamento al que un municipio pertenece
        /// </summary>
        /// <param name="municipio">Municipio</param>
        /// <returns>Retorna el departamento al que pertenece el municipio</returns>
        public TBC_DEPARTAMENTO obtenerDepartamentoByIdMunicipio(int? municipio)
        {
            var res = _context.SP_TBC_MUNICIPIO_GetDepartamentoByIdMunicipio(municipio).FirstOrDefault();

            TBC_DEPARTAMENTO depto = new TBC_DEPARTAMENTO();

            if (res != null)
            {
                depto.ID_DEPARTAMENTO = res.ID_DEPARTAMENTO;
                depto.NOMBRE_DEPTO = res.NOMBRE_DEPTO;
                depto.COD_DEPARTAMENTO = res.COD_DEPARTAMENTO;
            }

            return depto;
        }

        public List<TBC_MUNICIPIO> ObtenerMunicipios()
        {
            List<TBC_MUNICIPIO> list = new List<TBC_MUNICIPIO>();
            var result = _context.SP_TBC_MUNICIPIO_SelectAll();


            foreach (var item in result)
            {
                TBC_MUNICIPIO tmp = new TBC_MUNICIPIO();
                tmp.ID_MUNICIPIO = item.ID_MUNICIPIO;
                tmp.ID_DEPARTAMENTO = item.ID_DEPARTAMENTO;
                tmp.COD_MUNICIPIO = item.COD_MUNICIPIO;
                tmp.NOMBRE = item.NOMBRE_MUNIC;
                list.Add(tmp);
            }

            return list;
        }

        public Modelos.TBC_MUNICIPIO geMunicpioById(int id)
        {
            Modelos.TBC_MUNICIPIO municipio = null;

            var res = _context.SP_TBC_MUNICIPIO_SelectRow(id).FirstOrDefault();   //Buscando a un usuario 

            //Si el usuario existe es convertido en un objeto Usuario y es devuelto
            if (res != null)
            {
                municipio = new Modelos.TBC_MUNICIPIO();

                municipio.ID_MUNICIPIO = res.ID_MUNICIPIO;
                municipio.ID_DEPARTAMENTO = res.ID_DEPARTAMENTO;
                municipio.COD_MUNICIPIO = res.COD_MUNICIPIO;
                municipio.NOMBRE = res.NOMBRE_MUNIC;

            }

            return municipio;
        }

        public MV_Exception GuardarMunicipios(TBC_MUNICIPIO municipio, int idUsuario)
        {
            var result = new MV_Exception();
            try
            {
                result = H_LogErrorEXC.resultToException(_context.SP_TBC_MUNICIPIO_Insert(municipio.ID_DEPARTAMENTO,
                                                                                               municipio.COD_MUNICIPIO,
                                                                                               municipio.NOMBRE,
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

        public MV_Exception editarMunicipios(TBC_MUNICIPIO municipio, int usuario_actualiza)
        {
            try
            {
                MV_Exception res = H_LogErrorEXC.resultToException(_context.SP_TBC_MUNICIPIO_Update(municipio.ID_MUNICIPIO,
                                                                                                    municipio.ID_DEPARTAMENTO,
                                                                                                    municipio.COD_MUNICIPIO,
                                                                                                    municipio.NOMBRE,
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

        public MV_Exception softDeleteMunicipios(Modelos.TBC_MUNICIPIO municipio, int usuario_borra)
        {
            try
            {
                var res = H_LogErrorEXC.resultToException(_context.SP_TBC_MUNICIPIO_DeleteRow(municipio.ID_MUNICIPIO, usuario_borra).FirstOrDefault());

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
