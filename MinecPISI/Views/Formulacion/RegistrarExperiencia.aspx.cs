using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL.Modelos;
using BLL.Modelos.ModelosVistas;
using BLL.Acciones;
using BLL.Helpers;

namespace MinecPISI.Views.Formulacion
{
    public partial class RegistrarExperiencia : System.Web.UI.Page
    {

        public List<TB_EXPERIENCIA> data;

        //VARIABLES DE MENSAJES
        public string errores;
        public string info;

        //BANDERA DE VISUALIZACION DE MENSAJE
        public bool showed;

        public TB_FORMULADOR formulador;
        public int idUsuario;

        protected void Page_Load(object sender, EventArgs e)
        {
            
       
            formulador = (TB_FORMULADOR)Session["formulador"];
            idUsuario = ((MV_DetalleUsuario)Session["usuario"]).ID_USUARIO;

            errores = "";
            info = "";

            switch (Request.Form["m"])
            {
                case "pos":
                    insertExperiencia();
                    break;

                case "put":
                    updateExperiencia();
                    break;

                case "del":
                    deleteExperiencia();
                    break;
            }
            int idpersona = ((MV_DetalleUsuario)Session["usuario"]).ID_PERSONA;
            var f = A_FORMULADOR.ObtenerFormuladorPorIdPersona(idpersona);
            data = new A_EXPERIENCIA().getByIdFormulador(f.ID_FORMULADOR);

            //Desactivando mensajes
            showed = false;

        }

        public void insertExperiencia()
        {
            try
            {
                A_EXPERIENCIA e = new A_EXPERIENCIA();
                TB_EXPERIENCIA experiencia = new TB_EXPERIENCIA();
                int idpersona = ((MV_DetalleUsuario)Session["usuario"]).ID_PERSONA;
                var f = A_FORMULADOR.ObtenerFormuladorPorIdPersona(idpersona);
                experiencia.ID_FORMULADOR = f.ID_FORMULADOR;
                experiencia.INSTITUCION = Request.Form["txt_institucion"];
                experiencia.CARGO = Request.Form["txt_cargo"];
                experiencia.TIEMPO = Request.Form["txt_tiempo"];
                experiencia.PROYECTO = Request.Form["txt_proyecto"];

                MV_Exception res = e.insertExperiencia(experiencia, ((MV_DetalleUsuario)Session["usuario"]).ID_USUARIO);

                if (res.IDENTITY == null)
                    throw new Exception(res.ERROR_MESSAGE);

                info = "Experiencia agregada correctamente";

            }
            catch (Exception e)
            {
                errores = e.Message;
                H_LogErrorEXC.GuardarRegistroLogError(e);
            }
        }

        public void updateExperiencia()
        {
            try
            {

                A_EXPERIENCIA e = new A_EXPERIENCIA();
                TB_EXPERIENCIA experiencia = new TB_EXPERIENCIA();
                int idpersona = ((MV_DetalleUsuario)Session["usuario"]).ID_PERSONA;
                var f = A_FORMULADOR.ObtenerFormuladorPorIdPersona(idpersona);
                experiencia.ID_FORMULADOR = f.ID_FORMULADOR;
                experiencia.ID_EXPERIENCIA = int.Parse(Request.Form["txt_id_experiencia"]);
                experiencia.INSTITUCION = Request.Form["txt_institucion"];
                experiencia.CARGO = Request.Form["txt_cargo"];
                experiencia.TIEMPO = Request.Form["txt_tiempo"];
                experiencia.PROYECTO = Request.Form["txt_proyecto"];

                e.updateExperiencia(experiencia, idUsuario);

                info = "Experiencia editada correctamente";
            }
            catch (Exception e)
            {
                errores = e.Message;
                H_LogErrorEXC.GuardarRegistroLogError(e);
            }
        }

        public void deleteExperiencia()
        {
            try
            {

                A_EXPERIENCIA e = new A_EXPERIENCIA();

                e.hardDeleteExperiencia(int.Parse(Request.Form["txt_borrar_id_experiencia"]));

                info = "Experiencia eliminada correctamente";
            }
            catch (Exception e)
            {
                errores = e.Message;
                H_LogErrorEXC.GuardarRegistroLogError(e);
            }
        }


    }
}