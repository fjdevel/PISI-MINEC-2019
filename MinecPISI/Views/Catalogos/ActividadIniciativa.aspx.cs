using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MinecPISI.Views.Catalogos
{
    public partial class ActividadIniciativa : System.Web.UI.Page
    {public List<BLL.Modelos.TBC_ACTIVIDAD_INICIATIVA> data;
        //VARIABLES DE MENSAJES
        public string errores;
        public string info;

        //BANDERA DE VISUALIZACION DE MENSAJE
        public bool showed;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["usuario"] == null)
                Response.RedirectToRoute("Login");

            errores = "";
            info = "";

            switch (Request.Form["m"])
            {
                case "pos":
                    agregarActividadIniciativa();
                    break;

                case "put":
                    editarActividadIniciativa();
                    break;

                case "del":
                    eliminarActividadIniciativa();
                    break;
            }

            data = new BLL.Acciones.A_ACTIVIDAD_INICIATIVA().ObtenerActividadesIniciativa();
        }

        public void agregarActividadIniciativa()
        {
            try
            {
                //Creamos la accion de la actividad iniciativa
                BLL.Acciones.A_ACTIVIDAD_INICIATIVA a_actividad_iniciativa = new BLL.Acciones.A_ACTIVIDAD_INICIATIVA();
                var txt_id_tipo_iniciativa = Request.Form["select_id_tipo_iniciativa"];
                var txt_codigo_actividad_iniciativa = Request.Form["txt_codigo_actividad_iniciativa"];
                var txt_descripcion_actividad_iniciativa = Request.Form["txt_descripcion_actividad_iniciativa"];

                if (string.IsNullOrWhiteSpace(txt_id_tipo_iniciativa) || string.IsNullOrWhiteSpace(txt_codigo_actividad_iniciativa)|| string.IsNullOrWhiteSpace(txt_descripcion_actividad_iniciativa))
                {
                    errores = "Actividad Iniciativa no guardada. Los campos no puede estar vacíos ni contener solo espacios";
                    return;
                }

                //Construyendo Departamento
                BLL.Modelos.TBC_ACTIVIDAD_INICIATIVA actividad_iniciativa = new BLL.Modelos.TBC_ACTIVIDAD_INICIATIVA();
                actividad_iniciativa.ID_TIPO_INICIATIVA = int.Parse(Request.Form["select_id_tipo_iniciativa"]);
                actividad_iniciativa.COD_ACTIVIDAD_PROY = Request.Form["txt_codigo_actividad_iniciativa"];
                actividad_iniciativa.DESCRIPCION = Request.Form["txt_descripcion_actividad_iniciativa"];
                BLL.Modelos.ModelosVistas.MV_Exception res = a_actividad_iniciativa.GuardarActividadesIniciativa(actividad_iniciativa, ((BLL.Modelos.ModelosVistas.MV_DetalleUsuario)Session["usuario"]).ID_USUARIO);

                if (res.IDENTITY == null)
                    throw new Exception(res.ERROR_MESSAGE);

                actividad_iniciativa.ID_ACTIVIDAD_INICIATIVA = int.Parse(res.IDENTITY.ToString());

                info = "Actividad Iniciativa agregada correctamente";
            }
            catch (Exception e)
            {
                errores = e.Message;
                BLL.Helpers.H_LogErrorEXC.GuardarRegistroLogError(e);
            }
        }

        public void editarActividadIniciativa()
        {
            try
            {
                //Construyendo al departamento
                BLL.Modelos.TBC_ACTIVIDAD_INICIATIVA actividad_iniciativa = new BLL.Modelos.TBC_ACTIVIDAD_INICIATIVA();

                actividad_iniciativa.ID_ACTIVIDAD_INICIATIVA = int.Parse(Request.Form["txt_id_actividad_iniciativa"]);
                actividad_iniciativa.ID_TIPO_INICIATIVA = int.Parse(Request.Form["select_id_tipo_iniciativa"]);
                actividad_iniciativa.COD_ACTIVIDAD_PROY = Request.Form["txt_codigo_actividad_iniciativa"];
                actividad_iniciativa.DESCRIPCION = Request.Form["txt_descripcion_actividad_iniciativa"];

                new BLL.Acciones.A_ACTIVIDAD_INICIATIVA().editarActividadesIniciativa(actividad_iniciativa, ((BLL.Modelos.ModelosVistas.MV_DetalleUsuario)Session["usuario"]).ID_USUARIO);

                info = "Actividad Iniciativa editada correctamente";
            }
            catch (Exception e)
            {
                errores = e.Message;
                BLL.Helpers.H_LogErrorEXC.GuardarRegistroLogError(e);
            }
        }

        public void eliminarActividadIniciativa()
        {
            try
            {
                //Borrando al usuario
                BLL.Modelos.TBC_ACTIVIDAD_INICIATIVA actividad_inicitiva = new BLL.Acciones.A_ACTIVIDAD_INICIATIVA().geActividadesIniciativaById(int.Parse(Request.Form["txt_borrar_id_actividad_iniciativa"]));

                BLL.Modelos.ModelosVistas.MV_Exception res = new BLL.Acciones.A_ACTIVIDAD_INICIATIVA().softDeleteActividadesIniciativa(actividad_inicitiva, ((BLL.Modelos.ModelosVistas.MV_DetalleUsuario)Session["usuario"]).ID_USUARIO);
                info = "Actividad Iniciativa eliminada correctamente";
            }
            catch (Exception e)
            {
                errores = e.Message;
                BLL.Helpers.H_LogErrorEXC.GuardarRegistroLogError(e);
            }
        }
    }
}