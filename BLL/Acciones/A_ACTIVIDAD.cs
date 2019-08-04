using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL.DB;
using BLL.Helpers;
using TB_ACTIVIDAD = BLL.Modelos.TB_ACTIVIDAD;

namespace BLL.Acciones
{
    public class A_ACTIVIDAD
    {
        private static readonly PISIDataContext _context = new PISIDataContext();   

        public Modelos.ModelosVistas.MV_Exception GuardarCita(TB_ACTIVIDAD actividad, int id_usuario)
        {
            return H_LogErrorEXC.resultToException(_context.SP_TB_ACTIVIDAD_InsertCita(actividad.ID_USUARIO_BENEFICIARIO,actividad.ID_USUARIO_CONSULTOR, actividad.FECHA, actividad.HORA,
            actividad.DIRECCION, actividad.DESCRIPCION, id_usuario).FirstOrDefault());
        }
        public static List<TB_ACTIVIDAD> ConsultarCitas(int consultor,int beneficiario)
        {
            List<TB_ACTIVIDAD> citas = new List<TB_ACTIVIDAD>();
            var resultado = _context.SP_TB_ACTIVIDAD_ConsultarCitaConsultorBeneficiario(beneficiario, consultor);
            foreach(var a in resultado)
            {
                var User = new A_USUARIO().getUsuarioById((int)a.ID_USUARIO_BENEFICIARIO);
                var perso = new A_PERSONA().getPersonaById(User.ID_PERSONA);
                var actividad = new TB_ACTIVIDAD();
                actividad.ID_ACTIVIDAD = a.ID_ACTIVIDAD;
                actividad.HORA = a.HORA;
                actividad.ID_USUARIO_BENEFICIARIO = (int)a.ID_USUARIO_BENEFICIARIO;
                actividad.ID_USUARIO_CONSULTOR = (int)a.ID_USUARIO_CONSULTOR;
                actividad.FECHA = a.FECHA;
                actividad.DIRECCION = a.DIRECCION;
                actividad.NOMBRE_BENEFICIARIO = perso.NOMBRES + ' ' + perso.APELLIDOS;
                citas.Add(actividad);
            }
            return citas;
        }
    }
}
