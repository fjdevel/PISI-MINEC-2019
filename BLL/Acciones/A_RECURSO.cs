using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL.DB;

namespace BLL.Acciones
{
    public class A_RECURSO
    {
        protected readonly PISIDataContext _context = new PISIDataContext();


        public List<Modelos.TB_RECURSO> getAll()
        {
            List<Modelos.TB_RECURSO> list = new List<Modelos.TB_RECURSO>(); //Preparando lista de resultados

            var res = _context.SP_TB_RECURSO_GetAll();      //Obteniendo lista de Recursos

            foreach (var r in res)      //Convirtiendo y añadiendo a la lista de resultados
            {
                Modelos.TB_RECURSO t = new Modelos.TB_RECURSO();

                t.ID_RECURSO = r.ID_RECURSO;
                t.NOMBRE = r.NOMBRE;
                t.URL_RECURSO = r.URL_RECURSO;

                list.Add(t);
            }

            return list;
        }
               
        public Modelos.TB_RECURSO getRecursoById(int id)
        {
            Modelos.TB_RECURSO r = new Modelos.TB_RECURSO();

            if (id > 0)
            {
                var res = _context.SP_TB_RECURSO_GetById(id).FirstOrDefault();

                if (res != null)
                {
                    r.ID_RECURSO = res.ID_RECURSO;
                    r.NOMBRE = res.NOMBRE;
                    r.URL_RECURSO = res.URL_RECURSO;
                }
                else
                    r = null;
            }
            else
                r = null;

            return r;
        }

        public Modelos.TB_RECURSO getRecursoByUrl(string url)
        {
            Modelos.TB_RECURSO r = new Modelos.TB_RECURSO();

            if (!string.IsNullOrEmpty(url))
            {
                var res = _context.SP_TB_RECURSO_GetByUrlRecurso(url).FirstOrDefault();

                if (res != null)
                {
                    r.ID_RECURSO = res.ID_RECURSO;
                    r.NOMBRE = res.NOMBRE;
                    r.URL_RECURSO = res.URL_RECURSO;
                }
                else
                    r = null;
            }
            else
                r = null;

            return r;
        }

        public List<Modelos.TB_RECURSO> getDeleted()
        {
            List<Modelos.TB_RECURSO> list = new List<Modelos.TB_RECURSO>();

            var res = _context.SP_TB_RECURSO_GetDeleted();

            if (res.Count() <= 0)
                return null;

            foreach (var i in res)
            {
                Modelos.TB_RECURSO temp = new Modelos.TB_RECURSO();

                temp.ID_RECURSO = i.ID_RECURSO;
                temp.NOMBRE = i.NOMBRE;
                temp.URL_RECURSO = i.URL_RECURSO;

                list.Add(temp);
            }

            return list;
        }

        /// <summary>
        /// Método que permite crear un recurso
        /// </summary>
        /// <param name="rol">Objeto Rol a ser guardado</param>
        /// <returns></returns>
        public List<string> createRecurso(Modelos.TB_RECURSO recurso, int id_usuario)
        {
            List<string> err = limpiarRecurso(recurso);

            if (err != null)
                return err;

            try
            {
                _context.SP_TB_RECURSO_INSERT(recurso.URL_RECURSO, recurso.NOMBRE, id_usuario);
            }
            catch (Exception e)
            {
                err.Add(e.Message);
                return err;
            }

            return null;
        }

        public List<string> updateRecurso(Modelos.TB_RECURSO recurso, int id_usuario)
        {
            List<string> err = limpiarRecurso(recurso);

            if (err != null)
                return err;

            try
            {
                _context.SP_TB_RECURSO_UPDATE(recurso.ID_RECURSO, recurso.URL_RECURSO, recurso.NOMBRE, id_usuario);
            }
            catch (Exception e)
            {
                err.Add(e.Message);
                return err;
            }

            return null;
        }

        public void softDeleteRecurso(Modelos.TB_RECURSO recurso, int id_usuario)
        {
            _context.SP_TB_RECURSO_DELETE_SOFT(recurso.ID_RECURSO, id_usuario);
        }

        public void restoreRecurso(Modelos.TB_RECURSO recurso, int id_usuario)
        {
            _context.SP_TB_RECURSO_RestoreById(recurso.ID_RECURSO, id_usuario);
        }

        public void hardDeleteRecurso(Modelos.TB_RECURSO recurso)
        {
            _context.SP_TB_RECURSO_DELETE_HARD(recurso.ID_RECURSO);
        }

        private List<string> limpiarRecurso(Modelos.TB_RECURSO recurso)
        {
            List<string> err = new List<string>();

            if (recurso == null)
                err.Add("El Recurso no puede ser nulo.");

            if (recurso.NOMBRE == null || recurso.NOMBRE == "" || recurso.NOMBRE.Replace(" ", "") == "")
                err.Add("El nombre del recurso no puede ser nulo, vacío o contener solo espacios.");

            if (recurso.URL_RECURSO == null || recurso.URL_RECURSO == "" || recurso.URL_RECURSO.Replace(" ", "") == "")
                err.Add("La URL del recurso no puede ser nulo, vacío o contener solo espacios.");

            if (err.Count > 0)
                return err;
            else
                return null;

        }
    }
}
