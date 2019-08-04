using BLL.Acciones;
using BLL.Helpers;
using BLL.Modelos;
using BLL.Modelos.ModelosVistas;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MinecPISI.Views.Catalogos
{
    public partial class SectorEconomico : System.Web.UI.Page
    {

        public List<TBC_SECTOR_ECONOMICO> data;
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
                    agregarSectorEconomico();
                    break;

                case "put":
                    editarSectorEconomico();
                    break;

                case "del":
                    eliminarSectorEconomico();
                    break;
            }

            data = new A_SECTOR_ECONOMICO().ObtenerSectoresEconomicos();
        }

        public void agregarSectorEconomico()
        {
            try
            {
                //Creamos la accion del departamento
                A_SECTOR_ECONOMICO a_sector_economico = new A_SECTOR_ECONOMICO();

                var codigo_sector_economico = Request.Form["txt_codigo_sector_economico"];
                var nombre_sector_economico = Request.Form["txt_nombre_sector_economico"];

                if (string.IsNullOrWhiteSpace(codigo_sector_economico) || string.IsNullOrWhiteSpace(nombre_sector_economico))
                {
                    errores = "Sector economico no guardado. Los campos no puede estar vacíos ni contener solo espacios";
                    return;
                }

                //Construyendo Departamento
                TBC_SECTOR_ECONOMICO sector_economico = new TBC_SECTOR_ECONOMICO();

         
                sector_economico.COD_SECTOR_ECONOMICO = Request.Form["txt_codigo_sector_economico"];
                sector_economico.NOMBRE = Request.Form["txt_nombre_sector_economico"];

                MV_Exception res = a_sector_economico.GuardarSectoresEconomicos(sector_economico, ((MV_DetalleUsuario)Session["usuario"]).ID_USUARIO);

                if (res.IDENTITY == null)
                    throw new Exception(res.ERROR_MESSAGE);

                sector_economico.ID_SECTOR_ECONOMICO = int.Parse(res.IDENTITY.ToString());

                info = "Sector economico agregado correctamente";
            }
            catch (Exception e)
            {
                errores = e.Message;
                H_LogErrorEXC.GuardarRegistroLogError(e);
            }
        }

        public void editarSectorEconomico()
        {
            try
            {
                //Construyendo al departamento
                TBC_SECTOR_ECONOMICO sector_economico = new TBC_SECTOR_ECONOMICO();

                sector_economico.ID_SECTOR_ECONOMICO = int.Parse(Request.Form["txt_id_sector_economico"]);
                sector_economico.COD_SECTOR_ECONOMICO = Request.Form["txt_codigo_sector_economico"];
                sector_economico.NOMBRE = Request.Form["txt_nombre_sector_economico"];

                new A_SECTOR_ECONOMICO().editarSectoresEconomicos(sector_economico, ((MV_DetalleUsuario)Session["usuario"]).ID_USUARIO);

                info = "Sector economico editado correctamente";
            }
            catch (Exception e)
            {
                errores = e.Message;
                H_LogErrorEXC.GuardarRegistroLogError(e);
            }
        }

        public void eliminarSectorEconomico()
        {
            try
            {
                //Borrando al sector_economico
                TBC_SECTOR_ECONOMICO sector_economico = new A_SECTOR_ECONOMICO().geSectorEconomicoById(int.Parse(Request.Form["txt_borrar_id_sector_economico"]));

                MV_Exception res = new A_SECTOR_ECONOMICO().softDeleteSectoresEconomicos(sector_economico, ((BLL.Modelos.ModelosVistas.MV_DetalleUsuario)Session["usuario"]).ID_USUARIO);
                info = "Sector economico eliminado correctamente";
            }
            catch (Exception e)
            {
                errores = e.Message;
                H_LogErrorEXC.GuardarRegistroLogError(e);
            }
        }
    }
    
}