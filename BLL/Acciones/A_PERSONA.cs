using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using BLL.Helpers;
using DAL.DB;
using BLL.Modelos.ModelosVistas;
using BLL.Modelos;

namespace BLL.Acciones
{
    public class A_PERSONA
    {
        private static readonly PISIDataContext _context = new PISIDataContext();

        /// <summary>
        /// Método encargado de almacernar una persona por nombres y apellidos
        /// </summary>
        /// <param name="persona">objeto de tipo persona</param>
        /// <returns>Retorna el Id de la persona que se acaba de ingresar</returns>
        public MV_Exception AlmacenarPersona(Modelos.TB_PERSONA persona, int idUsuario)
        {
            var res = new MV_Exception();
            try
            {
                int? idMunicipio = null;

                if (persona.ID_MUNICIPIO != 0)
                {
                    idMunicipio = persona.ID_MUNICIPIO;
                }

                res = idUsuario == 0
                    ? H_LogErrorEXC.resultToException(_context.SP_TB_PERSONA_InsertPersona(persona.NOMBRES, persona.APELLIDOS, persona.CORREO_E,
                        persona.TEL_FIJO, persona.TEL_CEL, idMunicipio, persona.DIRECCION, null).FirstOrDefault())
                    : H_LogErrorEXC.resultToException(_context.SP_TB_PERSONA_InsertPersona(persona.NOMBRES, persona.APELLIDOS, persona.CORREO_E,
                        persona.TEL_FIJO, persona.TEL_CEL, idMunicipio, persona.DIRECCION, idUsuario).FirstOrDefault());

                if (res.IDENTITY == null)
                    throw new Exception(res.ERROR_MESSAGE);
            }
            catch (Exception e)
            {
                H_LogErrorEXC.GuardarRegistroLogError(e);
            }

            return res;
        }

        public List<Modelos.TB_PERSONA> getAll()
        {
            List<Modelos.TB_PERSONA> list = new List<Modelos.TB_PERSONA>();

            var res = _context.SP_TB_PERSONA_GetAll();

            foreach (var p in res)
            {
                Modelos.TB_PERSONA temp = new Modelos.TB_PERSONA();

                temp.NOMBRES = p.NOMBRES;
                temp.APELLIDOS = p.APELLIDOS;
                temp.CORREO_E = p.CORREO_E;
                temp.ID_MUNICIPIO = p.ID_MUNICIPIO.GetValueOrDefault();
                temp.ID_PERSONA = p.ID_PERSONA;
                temp.TEL_FIJO = p.TEL_FIJO;
                temp.TEL_CEL = p.TEL_CEL;

                list.Add(temp);
            }

            return list;
        }

        public List<Modelos.TB_PERSONA> getAllWithDeleted()
        {
            List<Modelos.TB_PERSONA> list = new List<Modelos.TB_PERSONA>();

            var res = _context.SP_TB_PERSONA_GetAllWithDeleted();

            foreach (var p in res)
            {
                Modelos.TB_PERSONA temp = new Modelos.TB_PERSONA();

                temp.NOMBRES = p.NOMBRES;
                temp.APELLIDOS = p.APELLIDOS;
                temp.CORREO_E = p.CORREO_E;
                temp.ID_MUNICIPIO = p.ID_MUNICIPIO.GetValueOrDefault();
                temp.ID_PERSONA = p.ID_PERSONA;
                temp.TEL_FIJO = p.TEL_FIJO;
                temp.TEL_CEL = p.TEL_CEL;

                list.Add(temp);
            }

            return list;
        }

        public static Modelos.TB_PERSONA getPersonaByIdFormulador(int id)
        {
            Modelos.TB_PERSONA persona = null;

            var res = _context.SP_TB_PERSONA_GetByIdPersonaFormulador(id).FirstOrDefault();   //Buscando a un usuario 

            if (res != null)
            {
                persona = new Modelos.TB_PERSONA
                {
                    ID_PERSONA = res.ID_PERSONA,
                    NOMBRES = res.NOMBRES + " "+ res.APELLIDOS,
                    APELLIDOS = res.APELLIDOS,
                    CORREO_E = res.CORREO_E,
                    TEL_FIJO = res.TEL_FIJO,
                    TEL_CEL = res.TEL_CEL
                };

            }

            return persona;
        }

        /// <summary>
        /// Método que realiza una búsqueda de una persona por su correo
        /// </summary>
        /// <param name="correo"></param>
        /// <returns></returns>
        public Modelos.TB_PERSONA getPersonaByCorreoE(string correo)
        {
            Modelos.TB_PERSONA persona = null;

            var res = _context.SP_TB_PERSONA_GetByCorreoE(correo).FirstOrDefault();   //Buscando a un usuario 

            if (res != null)
            {
                persona = new Modelos.TB_PERSONA
                {
                    ID_PERSONA = res.ID_PERSONA,
                    NOMBRES = res.NOMBRES,
                    APELLIDOS = res.APELLIDOS,
                    CORREO_E = res.CORREO_E,
                    TEL_FIJO = res.TEL_FIJO,
                    TEL_CEL = res.TEL_CEL
                };

            }

            return persona;
        }

        /// <summary>
        /// Método que verifica si el correo ingresado ya existe en la base de datos
        /// </summary>
        /// <param name="correo"></param>
        /// <returns name="valor">entero que define si hay registros o no con ese valor</returns>
        public int EsCorreoUnico(string correo)
        {
            var res = _context.SP_TB_PERSONA_EsCorreoUnico(correo).FirstOrDefault();  //Buscando a un usuario 
            return Convert.ToInt32(res.Column1);
        }

        /// <summary>
        /// Método que realiza una búsqueda de una persona por su correo
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public Modelos.TB_PERSONA getPersonaById(int? id)
        {
            Modelos.TB_PERSONA persona = null;

            var res = _context.SP_TB_PERSONA_GetByIdPersona(id).FirstOrDefault();   //Buscando a un usuario 

            if (res != null)
            {
                persona = new Modelos.TB_PERSONA
                {
                    ID_PERSONA = res.ID_PERSONA,
                    NOMBRES = res.NOMBRES,
                    APELLIDOS = res.APELLIDOS,
                    CORREO_E = res.CORREO_E,
                    TEL_FIJO = res.TEL_FIJO,
                    TEL_CEL = res.TEL_CEL,
                    ID_MUNICIPIO = res.ID_MUNICIPIO,
                    ID_DEPARTAMENTO = res.ID_DEPARTAMENTO
                };

            }

            return persona;
        }

        public MV_Exception editarPersona(Modelos.TB_PERSONA persona, int usuario_actualiza)
        {
            try
            {
                MV_Exception res = H_LogErrorEXC.resultToException(_context.SP_TB_PERSONA_UPDATE(persona.ID_PERSONA, persona.ID_MUNICIPIO, persona.NOMBRES, persona.TEL_FIJO, persona.TEL_CEL, persona.APELLIDOS, persona.CORREO_E, usuario_actualiza).FirstOrDefault());

                if (res.IDENTITY == null)
                    throw new Exception(res.ERROR_MESSAGE);

                return res;
            }
            catch (Exception)
            {
                throw;
            }
        }

        public MV_Exception softDeletePersona(Modelos.TB_PERSONA persona, int id_usuario_actualiza)
        {
            try
            {
                MV_Exception res = H_LogErrorEXC.resultToException(_context.SP_TB_PERSONA_DELETE_SOFT(persona.ID_PERSONA, id_usuario_actualiza).FirstOrDefault());

                if (res.IDENTITY == null)
                    throw new Exception(res.ERROR_MESSAGE);

                return res;
            }
            catch (Exception)
            {
                throw;
            }
        }

        public MV_Exception hardDeletePersona(Modelos.TB_PERSONA persona)
        {
            try
            {
                MV_Exception res = H_LogErrorEXC.resultToException(_context.SP_TB_PERSONA_DELETE_HARD(persona.ID_PERSONA).FirstOrDefault());

                if (res.IDENTITY == null)
                    throw new Exception(res.ERROR_MESSAGE);

                return res;
            }
            catch (Exception)
            {
                throw;
            }
        }

        public MV_Exception restorePersona(Modelos.TB_PERSONA persona, int id_usuario)
        {
            try
            {
                MV_Exception res = H_LogErrorEXC.resultToException(_context.SP_TB_PERSONA_RestoreById(persona.ID_PERSONA, id_usuario).FirstOrDefault());

                if (res.IDENTITY == null)
                    throw new Exception(res.ERROR_MESSAGE);

                return res;
            }
            catch (Exception)
            {
                throw;
            }
        }

        public bool limpiarPersona(Modelos.TB_PERSONA persona)
        {
            if (H_Objetos.TienePropiedadesNulas<Modelos.TB_PERSONA>(persona))
                return false;

            return true;
        }

        public static string getNombresFromPersona(Modelos.TB_PERSONA persona)
        {
            if (persona != null)
                return persona.NOMBRES + " " + persona.APELLIDOS;
            else
                return "";
        }

        public List<MV_DetallePersonasConsultor> ObtenerPersonasXConsultorAsignado(int? validados, int? idConsultor)
        {
            var res = _context.SP_TB_PERSONA_ObtenerPersonasXConsultorAsignado(validados, idConsultor);

            return res.Select(r => new MV_DetallePersonasConsultor
            {
                NombrePersona = r.NOMBRE_PERSONA,
                IdPersona = r.ID_PERSONA,
                NombreConsultor = r.NOMBRE_CONSULTOR_ASIGNADO,
                IdConsultor = r.ID_CONSULTOR,
                Municipio = r.MUNICIPIO,
                Departamento = r.DEPARTAMENTO,
                FechaAsignacion = r.FECHA_ASIGNACION,
                NumerosContacto = r.CELULAR + " / " + r.FIJO,
                Correo = r.CORREO
            })
                .ToList();
        }

        public MV_Exception ActualizarPersona(Modelos.TB_PERSONA persona, int idUsuario)
        {
            var res = new MV_Exception();
            try
            {
                res = H_LogErrorEXC.resultToException(_context.SP_TB_PERSONA_UpdatePersona(persona.NOMBRES, persona.APELLIDOS, persona.CORREO_E,
                        persona.TEL_FIJO, persona.TEL_CEL, persona.ID_MUNICIPIO, persona.DIRECCION, idUsuario, persona.ID_PERSONA).FirstOrDefault());

                if (res.IDENTITY == null)
                    throw new Exception(res.ERROR_MESSAGE);
            }
            catch (Exception e)
            {
                H_LogErrorEXC.GuardarRegistroLogError(e);
            }

            return res;
        }

        public void CambiarDireccionPersona(int idPersona, string direccion)
        {
            var per = _context.SP_TB_PERSONA_GetByIdPersona(idPersona).FirstOrDefault();
            per.DIRECCION = direccion;
            _context.SP_TB_PERSONA_UpdatePersona(per.NOMBRES, per.APELLIDOS, per.CORREO_E, per.TEL_FIJO, per.TEL_CEL, per.ID_MUNICIPIO, per.DIRECCION, per.USUARIO_ACTUALIZA, per.ID_PERSONA);
        }

        public int EsNombreUsuarioUnico(string correo)
        {
            var res = _context.SP_TB_USUARIO_EsNombreUsuarioUnico(correo).FirstOrDefault();  //Buscando a un usuario 
            return Convert.ToInt32(res.Column1);
        }

        public void CambiarFechaAsignacion(int idPersona, int consultorId)
        {
            _context.SP_TB_ASIGNACION_CambiarFechaAsignacion(idPersona, consultorId);
            
        }

        public List<MV_DetallePersonasConsultor> ObtenerConsultores()
        {
            var res = _context.SP_TB_PERSONA_ObtenerConsultores();

            return res.Select(r => new MV_DetallePersonasConsultor
            {
                IdConsultor = r.ID_CONSULTOR,
                NombreConsultor = r.NOMBRE_CONSULTOR,
                Municipio = r.NOMBRE_DEPTO,
                Departamento = r.NOMBRE_MUNIC
            }).ToList();
        }

        public string ObtenerSectoresMuniXConsultores(int? idPersona, int opcion)
        {
            var sb = new StringBuilder();

            var res = _context.SP_TB_PERSONA_ObtenerSectoresMuniXConsultores(idPersona, opcion).ToList();

            for (int i = 0; i < res.Count; i++)
            {
                sb.Append(res[i].ID_RESULT.ToString());
                sb.Append(",");     //Si es el ultimo elemento de la lista, no se añade la coma
            }

            return sb.ToString();
        }

        public Dictionary<int, string> ObtenerMunicipios()
        {
            var res = _context.SP_TBC_MUNICIPIO_SelectAll();

            return res.ToDictionary(o => o.ID_MUNICIPIO, o => o.NOMBRE_MUNIC);
        }

        public Dictionary<int, string> ObtenerSectores()
        {
            var res = _context.SP_TBC_SECTOR_ECONOMICO_ObtenerTodos();

            return res.ToDictionary(o => o.ID_SECTOR_ECONOMICO, o => o.NOMBRE_SECTOR);
        }

        public static void CambiarDatos(int? idPersona, string texto, string tipo)
        {
            var per = _context.SP_TB_PERSONA_GetByIdPersona(idPersona).FirstOrDefault();

            if (per == null)
                return;

            switch (tipo)
            {
                case "nombre":
                    per.NOMBRES = texto;
                    break;
                case "apellido":
                    per.APELLIDOS = texto;
                    break;
                case "cel":
                    per.TEL_CEL = texto;
                    break;
                case "fijo":
                    per.TEL_FIJO = texto;
                    break;
            }

            _context.SP_TB_PERSONA_UpdatePersona(per.NOMBRES, per.APELLIDOS, per.CORREO_E, per.TEL_FIJO, per.TEL_CEL, per.ID_MUNICIPIO, per.DIRECCION, per.USUARIO_ACTUALIZA, per.ID_PERSONA);

        }
    }
}
