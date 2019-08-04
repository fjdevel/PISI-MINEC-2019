using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL.DB;

namespace BLL.Acciones
{
    public class A_ROL
    {
        private readonly PISIDataContext _context = new PISIDataContext();

        /// <summary>
        /// Método que realiza una búsqueda de un rol por su Id
        /// </summary>
        /// <param name="id"></param>
        /// <returns>Un Rol, si es encontrado. Null en otro caso</returns>
        public Modelos.TB_ROL getRolById(int id)
        {
            Modelos.TB_ROL rol = null;

            var res = _context.SP_TB_ROL_GetByIdRol(id).FirstOrDefault();   //Buscando a un usuario 

            if (res != null)
            {
                rol = new Modelos.TB_ROL();

                rol.ID_ROL = res.ID_ROL;
                rol.NOMBRE = res.NOMBRE;
                rol.DESCRIPCION = res.DESCRIPCION;
            }

            return rol;
        }

        /// <summary>
        /// Método que realiza una búsqueda de un rol por su Nombre
        /// </summary>
        /// <param name="nombre">Nombre del rol a buscar</param>
        /// <returns>Un Rol, si es encontrado. Null en otro caso</returns>
        public Modelos.TB_ROL getRolByNombre(string nombre)
        {
            Modelos.TB_ROL rol = null;

            var res = _context.SP_TB_ROL_GetByNombre(nombre).FirstOrDefault();   //Buscando a un usuario 

            if (res != null)
            {
                rol = new Modelos.TB_ROL();

                rol.ID_ROL = res.ID_ROL;
                rol.NOMBRE = res.NOMBRE;
                rol.DESCRIPCION = res.DESCRIPCION;
            }

            return rol;
        }

        /// <summary>
        /// Método que devuelve todos los registros en la tabla Rol, incluyendo los desactivados
        /// </summary>
        /// <returns>Todos los registros en la BD</returns>
        public List<Modelos.TB_ROL> getAll()
        {
            List<Modelos.TB_ROL> list = new List<Modelos.TB_ROL>();

            var res = _context.SP_TB_ROL_GetAll();

            foreach (var t in res)
            {
                Modelos.TB_ROL r = new Modelos.TB_ROL();

                r.ID_ROL = t.ID_ROL;
                r.NOMBRE = t.NOMBRE;
                r.DESCRIPCION = t.DESCRIPCION;
                r.USUARIO_CREA = t.USUARIO_CREA.GetValueOrDefault();
                r.USUARIO_ACTUALIZA = t.USUARIO_ACTUALIZA.GetValueOrDefault();
                r.FECHA_CREA = t.FECHA_CREA.GetValueOrDefault();
                r.FECHA_ACTUALIZA = t.FECHA_ACTUALIZA.GetValueOrDefault();
                r.FECHA_BORRADO = t.FECHA_BORRADO.GetValueOrDefault();

                list.Add(r);
            }

            return list;
        }

        /// <summary>
        /// Método que devuelve todos los registros en la tabla Rol, incluyendo los desactivados
        /// </summary>
        /// <returns>Todos los registros en la BD</returns>
        public List<Modelos.TB_ROL> getAllWithDeleted()
        {
            List<Modelos.TB_ROL> list = new List<Modelos.TB_ROL>();

            var res = _context.SP_TB_ROL_GetAllWithDeleted();

            foreach (var t in res)
            {
                Modelos.TB_ROL r = new Modelos.TB_ROL();

                r.ID_ROL = t.ID_ROL;
                r.NOMBRE = t.NOMBRE;
                r.DESCRIPCION = t.DESCRIPCION;
                r.USUARIO_CREA = t.USUARIO_CREA.Value;
                r.USUARIO_ACTUALIZA = t.USUARIO_ACTUALIZA.Value;
                r.FECHA_CREA = t.FECHA_CREA.Value;
                r.FECHA_ACTUALIZA = t.FECHA_ACTUALIZA.Value;
                r.FECHA_BORRADO = t.FECHA_BORRADO.Value;

                list.Add(r);
            }

            return list;
        }

        /// <summary>
        /// Método que devuelve los registros desactivados en la tabla ROL
        /// </summary>
        /// <returns>La lista de roles desactivados</returns>
        public List<Modelos.TB_ROL> getDeleted()
        {
            List<Modelos.TB_ROL> list = new List<Modelos.TB_ROL>();

            var res = _context.SP_TB_ROL_GetDeleted();

            foreach (var t in res)
            {
                Modelos.TB_ROL r = new Modelos.TB_ROL();

                r.ID_ROL = t.ID_ROL;
                r.NOMBRE = t.NOMBRE;
                r.DESCRIPCION = t.DESCRIPCION;
                r.USUARIO_CREA = t.USUARIO_CREA.Value;
                r.USUARIO_ACTUALIZA = t.USUARIO_ACTUALIZA.Value;
                r.FECHA_CREA = t.FECHA_CREA.Value;
                r.FECHA_ACTUALIZA = t.FECHA_ACTUALIZA.Value;
                r.FECHA_BORRADO = t.FECHA_BORRADO.Value;

                list.Add(r);
            }

            return list;
        }

        /// <summary>
        /// Método que permite la creación de un rol
        /// </summary>
        /// <param name="rol">Objeto Rol que contiene toda la información para crear un rol</param>
        /// <param name="id_usuario">Objeto usuario que inserta el registro</param>
        /// <returns>Null si el registro es correcto. Si ocurre un error, devuelve una lista con las descripciones de cada error</returns>
        public List<string> insertRol(Modelos.TB_ROL rol, int id_usuario)
        {
            List<string> err = limpiarRol(rol);     //Verificando el rol

            if (err == null)      //Si no hay errores
            {
                try
                {
                    var res = _context.SP_TB_ROL_INSERT(rol.NOMBRE, rol.DESCRIPCION, id_usuario);   //Guardando rol

                    return null;
                }
                catch(Exception e)
                {
                    err.Add(e.Message);

                    return err;
                }
            }
            else
            {
                return err;
            }
        }

        /// <summary>
        ///  Método que actualiza un registro de Rol en la BD
        /// </summary>
        /// <param name="rol">Objeto rol que será actualizado</param>
        /// <param name="id_usuario">Objeto usuario que inserta el registro</param>
        /// <returns>Una lista de errores cuando existen. Null, si la operación es correcta</returns>
        public List<string> updateRol(Modelos.TB_ROL rol, int id_usuario)
        {
            List<string> err = limpiarRol(rol);     //Verificando el rol

            if (err == null)      //Si no hay errores
            {
                try
                {
                    var res = _context.SP_TB_ROL_UPDATE(rol.ID_ROL, rol.NOMBRE, rol.DESCRIPCION, id_usuario);   //Actualizando rol

                    return null;
                }
                catch (Exception e)
                {
                    err.Add(e.Message);

                    return err;
                }
            }
            else
            {
                return err;
            }
        }

        /// <summary>
        /// Método que desactiva un rol
        /// </summary>
        /// <param name="rol">Objeto rol que será desactivado</param>
        /// <param name="id_usuario">Objeto usuario que inserta el registro</param>
        /// <returns>Un string que contiene la descripción del error; Null, si la operación es correcta</returns>
        public string softDeleteRol(Modelos.TB_ROL rol, int id_usuario)
        {
            if (rol != null)      //Si no hay errores
            {
                try
                {
                    _context.SP_TB_ROL_DELETE_SOFT(rol.ID_ROL, id_usuario);   //Desactivando rol

                    return null;
                }
                catch (Exception e)
                {
                    return e.Message;
                }
            }
            else
            {
                return "El rol no puede ser nulo";
            }
        }

        /// <summary>
        /// Método que borra definitivamente un rol de la BD
        /// </summary>
        /// <param name="rol"></param>
        /// <returns>Un String con la descripción del error, si existe; Null, cuando la operación es correcta.</returns>
        public string hardDeleteRol(Modelos.TB_ROL rol)
        {
            if (rol != null)      //Si no hay errores
            {
                try
                {
                    _context.SP_TB_ROL_DELETE_HARD(rol.ID_ROL);   //Borrando rol

                    return null;
                }
                catch (Exception e)
                {
                    return e.Message;
                }
            }
            else
            {
                return "El rol no puede ser nulo";
            }
        }

        /// <summary>
        /// Método para restaurar un Rol
        /// </summary>
        /// <param name="rol"></param>
        /// <param name="id_usuario">Objeto usuario que inserta el registro</param>
        /// <returns>Una cadena que describe el error. Null si la operación finaliza exitosamente</returns>
        public string restoreRol(Modelos.TB_ROL rol, int id_usuario)
        {
            if (rol != null)
            {
                try
                {
                    _context.SP_TB_ROL_RestoreById(rol.ID_ROL, id_usuario);
                    return null;
                }
                catch (Exception e)
                {
                    return e.Message;
                }
            }

            return "El rol no puede ser nulo";
        }

        /// <summary>
        /// Método que permite limpiar los datos de un rol y poner a prueba su información
        /// </summary>
        /// <param name="rol">Objeto Rol que contiene toda la información para crear un rol</param>
        /// <returns>Null si el registro es correcto. Si ocurre un error, devuelve una lista con las descripciones de cada error</returns>
        public List<string> limpiarRol(Modelos.TB_ROL rol)
        {
            List<string> err = new List<string>();

            //
            if (rol == null)
            {
                err.Add("El rol no ha sido definido.");
                return err;
            }

            //Probado que el nombre no esté vacío ni lleno solo de espacios
            if (rol.NOMBRE == null || rol.NOMBRE == "" || rol.NOMBRE.Replace(" ", "") == "")
                err.Add("El nombre no puede estar vacío.");

            //Probando que la descripción no esté vacía ni llena solo de espacios
            if (rol.DESCRIPCION == null || rol.DESCRIPCION == "" || rol.DESCRIPCION.Replace(" ", "") == "")
                err.Add("La descripción no puede estar vacío.");

            if (err.Count > 0)
                return err;
            else
                return null;
        }
    }
}
