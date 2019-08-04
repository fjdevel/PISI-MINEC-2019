using BLL.Acciones;
using BLL.Modelos.ModelosVistas;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MinecPISI.Views.Formulacion
{
    public partial class ConsultarEstadoIniciativa : System.Web.UI.Page
    {
        protected MV_DetalleUsuario usuario;
        protected List<Object> iniciativas;
  
        protected void Page_Load(object sender, EventArgs e)
        {
            usuario = (MV_DetalleUsuario)Session["usuario"];
            switch(usuario.NOMBRE_ROL.ToUpper()){
                case "FORMULADOR":
                    iniciativas = A_PROYECTO.ObtenerProyectosPorIdFormulador(usuario.ID_USUARIO);
                    break;
                case "CONSULTOR":
                    iniciativas = A_PROYECTO.ObtenerProyectosPorIdConsultorUsuario(usuario.ID_USUARIO);
                    break;
                case "COORDINADOR":
                    iniciativas = A_PROYECTO.ObtenerProyectos();
                    break;
                default:
                    iniciativas = A_PROYECTO.ObtenerProyectos();
                    break;
            }
        }
    }
}