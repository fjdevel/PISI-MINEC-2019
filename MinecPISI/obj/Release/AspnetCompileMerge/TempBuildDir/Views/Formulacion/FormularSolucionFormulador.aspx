<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Layouts/Layout2.Master" AutoEventWireup="true" CodeBehind="FormularSolucionFormulador.aspx.cs" Inherits="MinecPISI.Views.Formulacion.FormularSolucionFormulador" %>
<asp:Content ID="Content1" ContentPlaceHolderID="cssextra" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contenidoNavegacion" runat="server">
    <hr class="sidebar-divider">
    <li class="nav-item">
            <a class="nav-link" href="/Casos/ProblemaIngresado/<% Response.Write((string)Page.RouteData.Values["idProblema"]); %>">
                <i class="fas fa-fw fa-arrow-circle-left"></i>
                <span>Regresar</span>
            </a>
        </li>
    <hr class="sidebar-divider">
    <!--#include file="~/Views/Navegacion/Formulador.html"-->
    <hr class="sidebar-divider d-none d-md-block">
     <div class="text-center d-none d-md-inline">
            <a class="btn rounded-circle border-0" id="sidebarToggle"></a>
     </div>
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
                <p>JSADS15</p>
            </div>
            <div class="col">
                <h4 class="small font-weight-bold">Dias Restantes:</h4>
                <p>2</p>
            </div>
            <div class="col">
                <h4 class="small font-weight-bold">Estado</h4>
                <p>Activo</p>
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
        <p>Los camarones no engordan y están consumiendo mucha comida</p>
    </div>
</div>
<div class="card shadow mb-4">
    <!-- Titulo del problema -->
    <div class="card-header py-3">
        <h6 class="  font-weight-bold text-primary">Formulacion</h6>
    </div>
    <div class="card-body">
        <% var tipoSolucion = (string)Page.RouteData.Values["tipoSolucion"];%>
        <form>
            <% if (tipoSolucion.Equals("adopcion") || tipoSolucion.Equals("integral")){ %> 
            <h4>Adopcion o incorporacion tecnologica</h4>
            <div class="form-group">
                <label>Formule su propuesta de solucion</label>
                <textarea id="solucionAdocion" class="form-control"
                        rows="5" placeholder="Propuesta de solucion de adopcion o incorporacion tecnologica"></textarea>
            </div>
            
            <%}%> 
            <% if (tipoSolucion.Equals("asistencia") || tipoSolucion.Equals("integral")){ %>
            <h4>Asistencia tecnica y/o transferencia de conocimiento</h4>
            <div class="form-group">
                <label>Formule su propuesta de solucion</label>
                <textarea id="solucionAsistencia" class="form-control"
                    
                    rows="5" placeholder="Propuesta de solucion de asistencia tecnica y/o transferencia de conocimiento"></textarea>
                
            </div>
            <%}%>
            <% if (tipoSolucion.Equals("innovacion") || tipoSolucion.Equals("integral")){ %>
            <h4>Proyecto de innovacion</h4>
            <div class="form-group">
                <label>Formule su propuesta de solucion</label>
                <textarea id="solucioninnovacion" class="form-control"
                    rows="5" placeholder="Propuesta de solucion de proyecto de innovacion"></textarea>
            </div>
            <%}%>
            <h4>Componentes Basicos del Proyecto</h4>
            <div class="form-group">
                <label>Formule su propuesta de solucion</label>
                <textarea id="componentesProyecto" class="form-control" rows="5" placeholder="Digite los componentes basicos del proyecto"></textarea>
                
            </div>
            <h4>Informacion Adicional de Sustento</h4>
            <div class="form-group">
                <label>Ingrese informacion adicional de sustento</label>
                <textarea id="infoSustento" class="form-control" rows="5" placeholder="Digite los componentes basicos del proyecto"></textarea>
                
            </div>
            <h4>Presupuesto/Contrapartida aproximado para su ejecución</h4>
            <div class="form-group">
                <label>Ingrese informacion sobre el presupuesto/Contrapartida</label>
                <textarea  id="presupuesto" class="form-control" rows="5" placeholder="Especifique el presupuesto de su iniciativa"></textarea>
                
            </div>
            <button type="submit" class="btn btn-info">Presentar propuesta de solucion</button>
        </form>
        
    </div>
</div>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="jsextra" runat="server">
</asp:Content>
