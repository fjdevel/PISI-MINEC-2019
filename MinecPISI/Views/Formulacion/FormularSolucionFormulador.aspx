<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Layouts/Layout2.Master" AutoEventWireup="true" CodeBehind="FormularSolucionFormulador.aspx.cs" Inherits="MinecPISI.Views.Formulacion.FormularSolucionFormulador" %>
<asp:Content ID="Content1" ContentPlaceHolderID="cssextra" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contenidoNavegacion" runat="server">
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="bodyContentBlank" runat="server">
    
    <div class="card shadow mb-4">
    <div class="card-header py-3">
        <h6 class="  font-weight-bold text-primary">Problema Registrado</h6>
    </div>
    <div class="card-body">
        <div class="row">
            <div class="col">
                <h4 class="small font-weight-bold">Nombre:</h4>
                <p><% Response.Write(problema.NOMBRE_PROBLEMA); %></p>
            </div>
            <div class="col">
                <h4 class="small font-weight-bold">Días Restantes:</h4>
                <p><% Response.Write((problema.FECHA_CREA.DayOfYear+5)-DateTime.Today.DayOfYear); %></p>
            </div>
            <div class="col">
                <h4 class="small font-weight-bold">Estado:</h4>
                <p><% Response.Write(BLL.Acciones.A_ESTADO_PROCESO.ObtenerPorId((int)problema.ID_ESTADO_PROCESO).DESCRIPCION_ESTADO_PROCESO); %></p>
            </div>
        </div>

    </div>
</div>
<div class="card shadow mb-4">
    <!-- Titulo del problema -->
    <div class="card-header py-3">
        <h6 class="  font-weight-bold text-primary">Problema</h6>
    </div>
    <div class="card-body">
        <p class="font-weight-bold"><%Response.Write(problema.DESCRIPCION_PROBLEMA); %></p>
    </div>
</div>
<div class="card shadow mb-4">
    <!-- Titulo del problema -->
    <div class="card-header py-3">
        <h4 class="font-weight-bold text-primary">Formulación de la Propuesta Solución</h4>
    </div>
    <div class="card-body">
        <form runat="server">
            <% if (TipoSolucion.Equals("1") || TipoSolucion.Equals("4")){ %> 
            <h4>Adopción o Incorporación Tecnológica</h4>
            <div class="form-group">
                <label>Formula tu propuesta solución</label>
                <asp:TextBox id="solucionAdopcion" TextMode="multiline" class="form-control"
                        rows="5" placeholder="Propuesta de solución de tipo Adopción o Incorporación Tecnológica" runat="server"/>
            </div>
            
            <%}
             if (TipoSolucion.Equals("2") || TipoSolucion.Equals("4")){ %>
            <h4>Asistencia Técnica / Transferencia de Conocimiento</h4>
            <div class="form-group">
                <label>Formule su propuesta de solución</label>
                <asp:TextBox id="solucionAsistencia" class="form-control" TextMode="multiline"
                    rows="5" placeholder="Propuesta de solución de tipo Asistencia Técnica / Transferencia de Conocimiento" runat="server"/>
                
            </div>
            <%}%>
            <% if (TipoSolucion.Equals("3") || TipoSolucion.Equals("4")){ %>
            <h4>Innovación</h4>
            <div class="form-group">
                <label>Formule su propuesta de solución</label>
                <asp:TextBox id="solucioninnovacion" class="form-control"
                    rows="5" placeholder="Propuesta de solución de tipo Innovación"  TextMode="multiline" runat="server"/>
            </div>
            <%}%>
            <h4>Componentes Básicos del Proyecto</h4>
            <div class="form-group">
                <asp:TextBox id="componentesProyecto" class="form-control" rows="5" placeholder="Describe los componentes básicos del proyecto" TextMode="multiline" runat="server"/>
                
            </div>
            <h4>Información Adicional de Sustento</h4>
            <div class="form-group">
                <asp:TextBox id="infoSustento" class="form-control" rows="5" placeholder="Ingresa la información adicional de sustento" TextMode="multiline" runat="server"/>
                
            </div>
            <h4>Presupuesto/Contrapartida aproximado para la ejecución</h4>
            <div class="form-group">
                <label>Ingresa información sobre el presupuesto/Contrapartida</label>
                <asp:TextBox  id="presupuesto" class="form-control" rows="5" placeholder="Especifica el presupuesto de la iniciativa lo más detallado posible  " TextMode="multiline" runat="server"/>
                
            </div>

            <asp:Button class="btn btn-info" Text="Presentar Propuesta de Solución" OnClick="enviar_solucion" runat="server" />

        </form>
        
    </div>
</div>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="jsextra" runat="server">
    <script>
    </script>
</asp:Content>
