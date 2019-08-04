using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL.DB;

namespace BLL.Acciones
{
    public class A_PERMISO
    {
        protected readonly PISIDataContext _context = new PISIDataContext();

        public List<Modelos.TB_PERMISO> getAll()
        {
            List<Modelos.TB_PERMISO> list = new List<Modelos.TB_PERMISO>();

            var res = _context.SP_TB_PERMISO_GetAll();

            foreach (var p in res)
            {
                Modelos.TB_PERMISO temp = new Modelos.TB_PERMISO();

                temp.ID_PERMISO = p.ID_RECURSO;
                temp.ID_ROL = p.ID_ROL;

                list.Add(temp);
            }

            return list;
        }

        public List<Modelos.TB_RECURSO> getRecursosByRol(int id_rol)
        {
            List<Modelos.TB_RECURSO> list = new List<Modelos.TB_RECURSO>();

            var res = _context.SP_TB_PERMISO_GetByRol(id_rol);      //Los resultados son Recursos, no permisos

            foreach (var p in res)
            {
                Modelos.TB_RECURSO temp = new Modelos.TB_RECURSO();

                temp.ID_RECURSO = p.ID_RECURSO;
                temp.NOMBRE = p.NOMBRE;
                temp.URL_RECURSO = p.URL_RECURSO;

                list.Add(temp);
            }

            return list;
        }

        public string getRecursosByRolAsPKString(Modelos.TB_ROL rol)
        {
            StringBuilder str = new StringBuilder();

            List<Modelos.TB_RECURSO> list = getRecursosByRol(rol.ID_ROL);

            for (int i=0; i < list.Count; i++)
            {
                str.Append(list[i].ID_RECURSO.ToString());
                str.Append(",");     //Si es el ultimo elemento de la lista, no se añade la coma
            }

            return str.ToString();
        }

        public List<Modelos.TB_ROL> getRolesByRecurso(Modelos.TB_RECURSO recurso)
        {
            List<Modelos.TB_ROL> list = new List<Modelos.TB_ROL>();

            var res = _context.SP_TB_PERMISO_GetByRecurso(recurso.ID_RECURSO);      //Los resultados son Roles, no permisos

            foreach (var p in res)
            {
                Modelos.TB_ROL temp = new Modelos.TB_ROL();

                temp.ID_ROL = p.ID_ROL;
                temp.NOMBRE = p.NOMBRE;
                temp.DESCRIPCION = p.DESCRIPCION;

                list.Add(temp);
            }

            return list;
        }

        public List<Modelos.TB_PERMISO> getDeleted()
        {
            List<Modelos.TB_PERMISO> list = new List<Modelos.TB_PERMISO>();

            var res = _context.SP_TB_PERMISO_GetDeleted();

            foreach (var t in res)
            {
                Modelos.TB_PERMISO p = new Modelos.TB_PERMISO();

                p.ID_ROL = t.ID_ROL;
                p.ID_PERMISO = t.ID_RECURSO;

                list.Add(p);
            }

            return list;
        }

        public List<string> createPermiso(Modelos.TB_ROL rol, Modelos.TB_RECURSO recurso, int id_usuario)
        {
            List<string> err = limpiarPermiso(rol, recurso);

            if (err != null)
                return err;

            try
            {
                var res = _context.SP_TB_PERMISO_INSERT(rol.ID_ROL, recurso.ID_RECURSO, id_usuario).FirstOrDefault();

                if (res.ERROR_MESSAGE != null)
                {
                    throw new Exception(res.ERROR_MESSAGE);
                }
            }
            catch (Exception e)
            {
                throw new Exception(e.Message);
            }

            return null;
        }

        public string softDeletePermiso(Modelos.TB_PERMISO permiso, int id_usuario)
        {
            try
            {
                _context.SP_TB_PERMISO_DELETE_SOFT(permiso.ID_ROL, permiso.ID_PERMISO, id_usuario);
                return null;
            }
            catch (Exception e)
            {
                return e.Message;
            }
        }

        public string restorePermiso(Modelos.TB_PERMISO permiso, int id_usuario)
        {
            try
            {
                _context.SP_TB_PERMISO_RestoreById(permiso.ID_ROL, permiso.ID_PERMISO, id_usuario);
                return null;
            }
            catch (Exception e)
            {
                return e.Message;
            }
        }

        public string hardDeletePermiso(Modelos.TB_PERMISO permiso)
        {
            try
            {
                _context.SP_TB_PERMISO_DELETE_HARD(permiso.ID_ROL, permiso.ID_PERMISO);
                return null;
            }
            catch (Exception e)
            {
                return e.Message;
            }
        }

        public List<string> limpiarPermiso(Modelos.TB_ROL rol, Modelos.TB_RECURSO recurso)
        {
            List<string> err = new List<string>();

            if (rol == null || recurso == null)
            {
                err.Add("El rol y el recurso deben ser especificados.");
                return err;
            }

            if (rol.ID_ROL <= 0)
                err.Add("El rol no existe o no está especificado.");

            if (recurso.ID_RECURSO <= 0)
                err.Add("El recurso no existe o no está especificado.");

            if (err.Count <= 0)
                return null;

            return err;
        }
    }
}
