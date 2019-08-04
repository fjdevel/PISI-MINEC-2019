using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL.Modelos.ModelosVistas;
using BLL.Acciones;

namespace MinecPISI.Views.Formulacion
{
    public partial class DetalleFormulador : System.Web.UI.Page
    {

        public List<MV_DetalleFormulador> detallesFormulador = new List<MV_DetalleFormulador>();
        public MV_DetalleFormulador infoFormulador = new MV_DetalleFormulador();

        protected void Page_Load(object sender, EventArgs e)
        {

            int idPersona = Convert.ToInt32(Page.RouteData.Values["idPersona"]);

            var aFormulador = new A_FORMULADOR();

            //Recuperar la experiencia del formulador
            detallesFormulador = aFormulador.getDetalleFormulador(idPersona);
            
            if (detallesFormulador != null)
            {
                //Recuperamos los datos del formulador
                infoFormulador = detallesFormulador.First();
            }


        }
    }
}