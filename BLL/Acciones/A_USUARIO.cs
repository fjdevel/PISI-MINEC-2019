using System;
using DAL.DB;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using BLL.Helpers;
using BLL.Modelos.ModelosVistas;

namespace BLL.Acciones
{
    public class A_USUARIO
    {
        private static readonly PISIDataContext _context = new PISIDataContext();
        public static BLL.Modelos.TB_USUARIO ObtenerUsuarioPorIdBeneficiario(int id)
        {
            var res = _context.SP_TB_USUARIO_ObtenerUsuarioPorIdBeneficiario(id).FirstOrDefault();
            return new BLL.Modelos.TB_USUARIO
            {
                ID_USUARIO = res.ID_USUARIO,
                ID_PERSONA = res.ID_PERSONA
            };
        }
        public static BLL.Modelos.TB_USUARIO obtenerCoordinador()
        {
            var res = _context.SP_TB_USUARIO_ObtenerUsuarioCoordinador().FirstOrDefault();
            return new BLL.Modelos.TB_USUARIO
            {
                ID_USUARIO = res.ID_USUARIO
            };
        }
        public static readonly int MAX_CARACTERES_CONTRASEÑA = 4;

        /// <summary>
        /// Sesion existe, desde ID diferente al actual
        /// </summary>
        public const short SESION_EXISTENTE_NO_EQUIVALENTE = -1;

        /// <summary>
        /// Sesion existente, con ID identico al actual
        /// </summary>
        public const short SESION_EXISTENTE = 1;

        /// <summary>
        /// Sesion no existe porque está cerrada
        /// </summary>
        public const short SESION_NO_EXISTENTE = 0;

        /// <summary>
        /// Método encargado de obtener la lista de usuarios
        /// </summary>
        /// <returns>Retorna la lista de objetos Usuario</returns>
        public List<Modelos.TB_USUARIO> getAll()
        {
            var res = _context.SP_TB_USUARIO_GetAll();
            List<Modelos.TB_USUARIO> list = new List<Modelos.TB_USUARIO>();

            //Convirtiendo cada resultado en un objeto Usuario y añadiéndolos a la lista de resultados
            foreach (var temp in res)
            {
                Modelos.TB_USUARIO usuario = new Modelos.TB_USUARIO();

                usuario.ID_PERSONA = temp.ID_PERSONA;
                usuario.ID_ROL = temp.ID_ROL;
                usuario.ID_USUARIO = temp.ID_USUARIO;
                usuario.NOMBRE_USUARIO = temp.NOMBRE_USUARIO;
                //usuario.CONTRASENA = temp.CONTRASENA;
                usuario.CONTRASENA = "";

                list.Add(usuario);
            }

            return list;
        }

        public List<Modelos.TB_USUARIO> getAllByRol(string _rol)
        {
            var res = _context.SP_TB_USUARIO_GetAllByRol(_rol);
            List<Modelos.TB_USUARIO> list = new List<Modelos.TB_USUARIO>();

            //Convirtiendo cada resultado en un objeto Usuario y añadiéndolos a la lista de resultados
            foreach (var temp in res)
            {
                Modelos.TB_USUARIO usuario = new Modelos.TB_USUARIO();

                usuario.ID_PERSONA = temp.ID_PERSONA;
                usuario.ID_ROL = temp.ID_ROL;
                usuario.ID_USUARIO = temp.ID_USUARIO;
                usuario.NOMBRE_USUARIO = temp.NOMBRE_USUARIO;
                //usuario.CONTRASENA = temp.CONTRASENA;
                usuario.CONTRASENA = "";

                list.Add(usuario);
            }

            return list;
        }

        /// <summary>
        /// Método que realiza una búsqueda de un usuario por su ID
        /// </summary>
        /// <param name="id"></param>
        /// <returns>El objeto Usuario del ID proporcionado. Null si no es encontrado</returns>
        public Modelos.TB_USUARIO getUsuarioById(int id)
        {
            Modelos.TB_USUARIO usuario = null;

            var res = _context.SP_TB_USUARIO_GetByIdUsuario(id).FirstOrDefault();   //Buscando a un usuario 

            //Si el usuario existe es convertido en un objeto Usuario y es devuelto
            if (res != null)
            {
                usuario = new Modelos.TB_USUARIO();

                usuario.ID_PERSONA = res.ID_PERSONA;
                usuario.ID_ROL = res.ID_ROL;
                usuario.ID_USUARIO = res.ID_USUARIO;
                usuario.NOMBRE_USUARIO = res.NOMBRE_USUARIO;
                //usuario.CONTRASENA = res.CONTRASENA;
                usuario.CONTRASENA = "";
            }

            return usuario;
        }

        internal object getUsuarioByIdFormulador(int iD_USUARIO_FORMULA)
        {
            throw new NotImplementedException();
        }

        /// <summary>
        /// Método para buscar un usuario a partir de la persona
        /// </summary>
        /// <param name="persona"></param>
        /// <returns>El objeto Usuario de la persona</returns>
        public Modelos.TB_USUARIO getUsuarioByPersona(int? id_persona)
        {
            Modelos.TB_USUARIO usuario = null;

            var res = _context.SP_TB_USUARIO_GetByIdPersona(id_persona).FirstOrDefault();

            //Si la persona existe, es convertida en un objeto Usuario y es devuelto
            if(res != null)
            {
                usuario = new Modelos.TB_USUARIO();

                usuario.ID_PERSONA = res.ID_PERSONA.Value;
                usuario.ID_ROL = res.ID_ROL;
                usuario.ID_USUARIO = res.ID_USUARIO;
                usuario.NOMBRE_USUARIO = res.NOMBRE_USUARIO;
                //usuario.CONTRASENA = res.CONTRASENA;
                usuario.CONTRASENA = "";
            }

            return usuario;
        }

        public List<Modelos.TB_USUARIO> getAllUsuariosByRol(int id_rol)
        {
            List<Modelos.TB_USUARIO> usuarios = new List<Modelos.TB_USUARIO>();

            var result = _context.SP_TB_USUARIO_GetByIdRol(id_rol);

            foreach (var usuario_res in result)
            {
                Modelos.TB_USUARIO usuario_temp = new Modelos.TB_USUARIO()
                {
                    ID_PERSONA = usuario_res.ID_PERSONA,
                    ID_ROL = usuario_res.ID_ROL,
                    ID_USUARIO = usuario_res.ID_USUARIO,
                    NOMBRE_USUARIO = usuario_res.NOMBRE_USUARIO
                };

                usuarios.Add(usuario_temp);
            }

            return usuarios;
        }

        public MV_DetalleUsuario getUsuarioDetallesById(int id_usuario)
        {
            MV_DetalleUsuario detalles = new MV_DetalleUsuario();

            var res = _context.SP_DETALLE_USUARIO(id_usuario).FirstOrDefault();

            if (res != null)
            {
                detalles.ID_PERSONA = res.ID_PERSONA.Value;
                detalles.ID_ROL = res.ID_ROL;
                detalles.ID_SESION = res.ID_SESION;
                detalles.ID_USUARIO = res.ID_USUARIO;
                detalles.NOMBRE_ROL = res.NOMBRE_ROL;
            }

            return detalles;
        }

        /// <summary>
        /// Método para crear un Usuario
        /// </summary>
        /// <param name="usuario">Objeto Usuario que deberá ser insertado en la BD</param>
        /// <returns>Null si el usuario se creó correctamente, sino, una lista de errores</returns>
        public MV_Exception createUsuario(Modelos.TB_USUARIO usuario, int usuario_crea)
        {
            //List<string> err = limpiarUsuario(usuario);     //Verificando validez de la información proporcionada

            //if (err != null)
            //    return err;

            var res = new MV_Exception();
            try
            {
                //Encriptando contraseña
                usuario.CONTRASENA = H_Objetos.Encriptar(usuario.CONTRASENA);

                //Invocando Proceso Almacenado para crear el usuario
                res = usuario_crea == 0
                    ? H_LogErrorEXC.resultToException(_context.SP_TB_USUARIO_INSERT(usuario.ID_ROL, usuario.ID_PERSONA, usuario.NOMBRE_USUARIO,
                        usuario.CONTRASENA, null).FirstOrDefault())
                    : H_LogErrorEXC.resultToException(_context.SP_TB_USUARIO_INSERT(usuario.ID_ROL, usuario.ID_PERSONA, usuario.NOMBRE_USUARIO,
                        usuario.CONTRASENA, usuario_crea).FirstOrDefault());

                if (res.IDENTITY == null)
                    throw new Exception(res.ERROR_MESSAGE);

                return res;
            }
            catch (Exception e)
            {
                H_LogErrorEXC.GuardarRegistroLogError(e);
            }

            return res;
        }

        public MV_Exception updateUsuario(Modelos.TB_USUARIO usuario, int usuario_actualiza)
        {
            //List<string> err = limpiarUsuario(usuario);

            //if (err != null)
            //    return err;

            try
            {

                if (usuario.CONTRASENA != null)
                {
                    //Encriptando contraseña
                    usuario.CONTRASENA = H_Objetos.Encriptar(usuario.CONTRASENA);
                }

                var res = H_LogErrorEXC.resultToException(_context.SP_TB_USUARIO_UPDATE(usuario.ID_USUARIO, usuario.ID_ROL, usuario.ID_PERSONA, usuario.NOMBRE_USUARIO, usuario.CONTRASENA, usuario_actualiza).FirstOrDefault());

                if (res.IDENTITY == null)
                    throw new System.Exception(res.ERROR_MESSAGE);

                return res;
            }
            catch (Exception e)
            {
                throw new Exception(e.Message);
            }
        }

        public MV_Exception updateUsuarioAsAutenticado(int id_usuario, string id_sesion, bool estado)
        {
            try
            {
                var res = H_LogErrorEXC.resultToException(_context.SP_TB_USUARIO_UPDATE_AUTENTICADO(id_usuario, id_sesion, estado ? short.Parse("1") : short.Parse("0")).FirstOrDefault());

                if (res.IDENTITY == null)
                    throw new System.Exception(res.ERROR_MESSAGE);

                return res;
            }
            catch (Exception e)
            {
                throw new Exception(e.Message); 
            }
        }

        public MV_Exception softDeleteUsuario(Modelos.TB_USUARIO usuario, int usuario_borra)
        {
            try
            {
                var res = H_LogErrorEXC.resultToException(_context.SP_TB_USUARIO_DELETE_SOFT(usuario.ID_USUARIO, usuario_borra).FirstOrDefault());

                if (res.IDENTITY == null)
                    throw new System.Exception(res.ERROR_MESSAGE);

                return res;
            }
            catch (Exception e)
            {
                throw new Exception(e.Message);
            }
        }

        public MV_Exception hardDeleteUsuario(Modelos.TB_USUARIO usuario)
        {
            return H_LogErrorEXC.resultToException(_context.SP_TB_USUARIO_DELETE_HARD(usuario.ID_USUARIO).FirstOrDefault());
        }
        
        /// <summary>
        /// Método encargado de comprobar las credenciales
        /// </summary>
        /// <param name="CORREO">Correo en formato direccion@servidor.com</param>
        /// <param name="CONTRASENA">La contraseña en texto plano</param>
        /// <param name="id_sesion_current">El ID de la sesion asignada por ASP.NET</param>
        /// <returns>-1: Sesion no iniciada.</returns>
        public bool Autenticar(string CORREO, string CONTRASENA)
        {
            A_PERSONA p = new A_PERSONA();
            A_USUARIO u = new A_USUARIO();
            A_BENEFICIARIO a_BENEFICIARIO = new A_BENEFICIARIO();
            Modelos.TB_PERSONA persona = p.getPersonaByCorreoE(CORREO);
            Modelos.TB_USUARIO usuario = u.getUsuarioByPersona(persona.ID_PERSONA);
           
            string hash = Helpers.H_Objetos.Encriptar(CONTRASENA);
            
            var result = _context.FN_AUTENTICAR(CORREO, hash);      //COMPROBANDO CREDENCIALES
            Modelos.TB_BENEFICIARIO beneficiario = null;
            if (usuario.ID_ROL == 2)
            {
                beneficiario = a_BENEFICIARIO.BuscarBeneficiarioXIdPersona(persona.ID_PERSONA);
               // beneficiario =A_BENEFICIARIO.ObtenerBeneficiario(usuario.ID_USUARIO) ?? null;
            }
            Modelos.TB_FORMULADOR formulador = A_FORMULADOR.ObtenerFormuladorPorIdPersona(persona.ID_PERSONA) ?? null;
            if (beneficiario != null)
            {
                if (beneficiario.ID_ESTADO_PROCESO != A_ESTADO_PROCESO.ObtenerPorCodigo("B06").ID_ESTADO_PROCESO)
                    return false;
            }
            //if(formulador != null)
            //{
            //    if (formulador.ACTIVO == false)
            //        return false;
            //}
            return (result == 1);
        }


        /// <summary>
        /// Devuelve el estado de la sesion de un usuario: Si existe una sesion abierta, si no existe o si existe pero no le pertenece al ID de la sesion determinado
        /// </summary>
        /// <param name="id_usuario"></param>
        /// <param name="id_sesion_current"></param>
        /// <returns> 0:Sesion no existe porque está cerrada. 1:Sesion ya existente con el ID de sesion actual. 2:Sesion existente pero no equivalente con el ID actual</returns>
        public int getEstadoSesion(int id_usuario, string id_sesion_current)
        {
            A_USUARIO u = new A_USUARIO();
            Modelos.TB_USUARIO usuario = u.getUsuarioById(id_usuario);

            string id_sesion_old = _context.FN_TB_USUARIO_GetIdSesion(usuario.ID_USUARIO);      //Obteniendo id de la sesion activa

            if (!string.IsNullOrEmpty(id_sesion_old))       //Si el usuario ya posee un id de sesion anterior
            {
                //Si no esta vacio, entonces se procede a comprobar si la sesion le pertenece al usuario actual o no
                if (id_sesion_old.Equals(id_sesion_current))
                {
                    //Si el ID de la sesion actual y la almacenada es la misma, se notifica
                    return SESION_EXISTENTE;
                }
                else
                {
                    //Si los ID de la sesion no coinciden, se notifica
                    return SESION_EXISTENTE_NO_EQUIVALENTE;
                }
            }
            //Sesion no existente
            return SESION_NO_EXISTENTE;
            
        }

        /// <summary>
        /// Método para comprobar 
        /// </summary>
        /// <param name="usuario"></param>
        /// <returns></returns>
        public List<string> limpiarUsuario(Modelos.TB_USUARIO usuario)
        {
            List<string> msg = new List<string>();

            if (usuario.ID_ROL <= 0)
                msg.Add("Rol no definido o incorrecto.");

            //if (usuario.ID_USUARIO <= 0)
            //    msg.Add("Usuario no definido o incorrecto");

            if (string.IsNullOrEmpty(usuario.NOMBRE_USUARIO) || usuario.NOMBRE_USUARIO.Replace(" ", "") == "")
                msg.Add("Nombre de Usuario no definido o incorrecto.");

            //Limpiando caracteres de riesgo (escapando)


            //if (usuario.CONTRASENA == null || usuario.CONTRASENA == "")
            //    msg.Add("Contraseña no definida o incorrecta.");

            //if (usuario.CONTRASENA.Length < MAX_CARACTERES_CONTRASEÑA)
            //    msg.Add("La contraseña debe ser de " + MAX_CARACTERES_CONTRASEÑA + " caracteres o más.");

            if (msg.Count > 0)
                return msg;
            else
                return null;
        }

        public bool testContraseñas(string p1, string p2)
        {
            return p1.Equals(p2);
        }

        public List<MV_Beneficiarios> getObtenerRolBeneficiarios()
        {
            PISIDataContext _context = new PISIDataContext();
            var result = _context.SP_VIEW_TB_USUARIO_GetByIdBeneficiario();

            if (result != null)
                return result.Select(b => (MV_Beneficiarios)b).ToList();
            else
                return null;


        }
        public List<MV_Beneficiarios> getObtenerRolConsultor()
        {
            PISIDataContext _context = new PISIDataContext();
            var result = _context.SP_VIEW_TB_USUARIO_GetByIdConsultor();

            if (result != null)
                return result.Select(b => (MV_Beneficiarios)b).ToList();
            else
                return null;


        }
        public List<MV_Beneficiarios> getObtenerRolFormulador()
        {
            PISIDataContext _context = new PISIDataContext();
            var result = _context.SP_VIEW_TB_USUARIO_GetByIdFormulador();

            if (result != null)
                return result.Select(b => (MV_Beneficiarios)b).ToList();
            else
                return null;


        }

        public List<MV_ConsultaReporteInciativa> getObtenerIniciativas(int beneficiario, int  consultor, int formulador, int sector, int iniciativa, int estado, decimal  montoMenor,decimal  montoMayor, DateTime fechaInicial, DateTime fechaFinal)
        {
            PISIDataContext _context = new PISIDataContext();

            var result = _context.SP_VIEW_TB_USUARIO_GetByIniciativas();

            
            result.Where(b => b.fecha_aprobacion >= fechaInicial);
            result.Where(b => b.fecha_aprobacion <= fechaFinal); 
            result.Where(b => b.monto >= montoMenor);
            result.Where(b => b.monto <= montoMayor);

            if (beneficiario!=0)
                result.Where(b => b.id_personab == beneficiario);
            if(consultor!=0)
                result.Where(b => b.id_personac == consultor);
            if(formulador!=0)
                result.Where(b => b.id_formulador == formulador);
            if(sector!=0)
                result.Where(b => b.id_sector == sector);
            if(iniciativa!=0)
                result.Where(b => b.id_iniciativa == iniciativa);
            if(estado!=0)
                result.Where(b => b.id_estado == estado);

            if (result != null)
                return result.Select(b => (MV_ConsultaReporteInciativa)b ).ToList();
            else
                return null;
            
        }

        public List<MV_EstadoProceso> obtenerEstados()
        {
            PISIDataContext _context = new PISIDataContext();
            var result = _context.SP_TBC_ESTADO_PROCESO_GetAllByIniciativas();
            if (result != null)
                return result.Select(b => (MV_EstadoProceso)b).ToList();
            else
                return null;
        }
    }
}
