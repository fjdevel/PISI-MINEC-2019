using BLL.Acciones;
using BLL.Modelos;
using BLL.Modelos.ModelosVistas;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MinecPISI.Views.Calendario
{
    public partial class ConsultarCalendario : System.Web.UI.Page
    {
        protected List<TB_ACTIVIDAD> citas;
        protected MV_DetalleUsuario usuario;
        protected void Page_Load(object sender, EventArgs e)
        {
            usuario = (MV_DetalleUsuario)Session["usuario"];
            citas = new List<TB_ACTIVIDAD>();
            switch (usuario.ID_ROL)
            {
                case 2:
                    var bene = A_BENEFICIARIO.ObtenerBeneficiario(usuario.ID_USUARIO);
                    var miconsu = A_ASIGNACION.geConsultorByIdBeneficiario(bene.ID_BENEFICIARIO);
                    var userconsu = new A_USUARIO().getUsuarioByPersona(miconsu.ID_PERSONA);
                    citas = A_ACTIVIDAD.ConsultarCitas(userconsu.ID_USUARIO, usuario.ID_USUARIO);
                    break;
                case 3:

                    List<MV_ConsultarBeneficiarios> beneficiarios = A_BENEFICIARIO.ObtenerBeneficiariosPorConsultor(usuario.ID_PERSONA);
                    foreach(var be in beneficiarios)
                    {
                        var userBe = A_USUARIO.ObtenerUsuarioPorIdBeneficiario(be.IdBeneficiario);
                        List<TB_ACTIVIDAD> cita1 = A_ACTIVIDAD.ConsultarCitas(usuario.ID_USUARIO,userBe.ID_USUARIO);
                        foreach(var c in cita1)
                        {
                            citas.Add(c);
                        }
                    }
                    
                    break;
            }
        }
    }
}