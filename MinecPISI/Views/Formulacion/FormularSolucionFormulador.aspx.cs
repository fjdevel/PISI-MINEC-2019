using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL.Acciones;
using BLL.Modelos;
namespace MinecPISI.Views.Formulacion
{
    public partial class FormularSolucionFormulador : System.Web.UI.Page
    {   
        // 1. adopcion 2. asistencia 3.innovacion 4.integral
        public string TipoSolucion { get; private set; }
        public string IdProblema{ get; private set; }
        public TB_PROBLEMA problema;
        protected void Page_Load(object sender, EventArgs e)
        {
            TipoSolucion = Page.RouteData.Values["tipoSolucion"].ToString();
            IdProblema = Page.RouteData.Values["idProblema"].ToString();
            A_PROBLEMA accionesProblema = new A_PROBLEMA();
            problema = accionesProblema.ObtenerProblemaPorId(int.Parse(IdProblema));

        }
        public void enviar_solucion(Object sender,EventArgs e)
        {
            TB_PROPUESTA propuesta = new TB_PROPUESTA();
            A_PROPUESTA AccionesPropuesta = new A_PROPUESTA();
            
            
            propuesta.ID_PROBLEMA = int.Parse(IdProblema);
            propuesta.COMPONENTES_BASICOS = componentesProyecto.Text;
            propuesta.INFORMACION_ADICIONAL = infoSustento.Text;
            propuesta.PRESUPUESTO_CONTRAPARTIDA = presupuesto.Text;
            propuesta.ID_USUARIO_FORMULA = (((BLL.Modelos.ModelosVistas.MV_DetalleUsuario)Session["usuario"]).ID_USUARIO);
            propuesta.ID_TIPO_INICIATIVA = int.Parse(TipoSolucion);
            propuesta.USUARIO_CREA = (((BLL.Modelos.ModelosVistas.MV_DetalleUsuario)Session["usuario"]).ID_USUARIO);
            propuesta.ID_ESTADO_PROCESO = 12;
            propuesta.FECHA_CREA = DateTime.Today;
            switch (TipoSolucion)
            {
                case "1":
                    propuesta.SOLUCION_ADOPCION = solucionAdopcion.Text;
                break;
                case "2":
                    propuesta.SOLUCION_ASISTENCIA = solucionAsistencia.Text;
                break;
                case "3":
                    propuesta.SOLUCION_INNOVACION = solucioninnovacion.Text;
                    break;
                case "4":
                    propuesta.SOLUCION_ADOPCION = solucionAdopcion.Text;
                    propuesta.SOLUCION_ASISTENCIA = solucionAsistencia.Text;
                    propuesta.SOLUCION_INNOVACION = solucioninnovacion.Text;
                    break;
            }
            
            if (AccionesPropuesta.ObtenerPropuestaDeFormuladorPorProblema(propuesta.ID_USUARIO_FORMULA, propuesta.ID_PROBLEMA) == null){
                AccionesPropuesta.guardarRegistro(propuesta);
                A_NOTIFICACION.GuardarNotificacion(A_ASIGNACION.gUsuarioBeneficiarioByIdBeneficiario(problema.ID_BENEFICIARIO).ID_USUARIO, ((BLL.Modelos.ModelosVistas.MV_DetalleUsuario)Session["usuario"]).ID_USUARIO, "S01");
                ScriptManager.RegisterStartupScript(this, GetType(),
                    "alert", "alert('¡Registro completado exitosamente, se ha notificado al beneficiario!');",
                    true);
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, GetType(),
                   "alert", "alert('¡Error usted ya ha presentado una solucion a este problema!');",
                   true);
            }



        }
    }
}