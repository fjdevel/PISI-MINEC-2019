<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Layouts/Layout2.Master" AutoEventWireup="true" CodeBehind="DatosProblemaIngresadoFormulador.aspx.cs" Inherits="MinecPISI.Views.Casos.DatosProblemaIngresado" %>
<asp:Content ID="Content1" ContentPlaceHolderID="cssextra" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contenidoNavegacion" runat="server">
   
      <% 
        //Aqui de debe hacer la validacion de que navegacion mostrar si el del coordinador o consultor
        switch (usuario)
        {
            case "Coordinador":
    %>
    <!--#include file="~/Views/Navegacion/Coordinador.html"-->
    <%
            break;
        case "Consultor":
    %>
    <!--#include file="~/Views/Navegacion/ConsultorDeVinculacion.html"-->
    <%
            break;
        case "Formulador":
    %>
    <!--#include file="~/Views/Navegacion/Formulador.html"-->
    <%
            break;
        }
    %>
    <hr class="sidebar-divider">
        <li class="nav-item">
            <a class="nav-link" href="/Casos/Consulta">
                <i class="fas fa-fw fa-arrow-circle-left"></i>
                <span>Regresar</span>
            </a>
        </li>  
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
        <!-- datos del beneficiario -->
        <div class="row mt-3">
            <div class="col-md-8">
              <div class="row">
                   <h5 class="font-weight-bold col">Nombre del beneficiario</h5>
                  <p class="col">Juan Jose Lopez</p>
              </div>
              <div class="row">
                   <h5 class="font-weight-bold col">Telefono</h5>
                  <p class="col">2516 8905</p>
              </div>
              <div class="row">
                   <h5 class="font-weight-bold col">Sector</h5>
                  <p class="col">Acuicultura</p>
              </div>
               <div class="row">
                   <h5 class="font-weight-bold col">Imagen del producto</h5>
                  <a class="col" href="#">Descargar</a>
              </div>
                <div class="row">
                   <h5 class="font-weight-bold col">Municipio</h5>
                  <p class="col">23</p>
              </div>
              <div class="row">
                   <h5 class="font-weight-bold col">Mas de un año en el Lugar?</h5>
                  <p class="col">Si</p>
              </div>
              <div class="row">
                   <h5 class="font-weight-bold col">Consultor de Vinculacion</h5>
                  <p class="col">Luisa Alejandra Martell</p>
              </div>
            </div>
            <div class="col-md-4">
                <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d2304.73456670359!2d-89.2131711777266!3d13.71323670283318!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x8f63306480e44079%3A0xf0ac4b5ff18a16ba!2sParroquia+La+Sagrada+Familia!5e0!3m2!1ses-419!2ssv!4v1554419827993!5m2!1ses-419!2ssv" width="300" height="300" frameborder="0" style="border:0" allowfullscreen></iframe>
            </div>
        </div>
        <!-- Fin de datos del beneficiario -->
    </div>
</div>
<div class="card shadow mb-4">
    <!-- Titulo del problema -->
    <div class="card-header py-3">
        <h6 class="  font-weight-bold text-primary">Crianza de Camarones</h6>
    </div>
    <div class="card-body">
        <p><span class="font-weight-bold">El negocio </span>Se dedica a cultivar Camarones</p>
        <p><span class="font-weight-bold">Clientes </span>Local, personas del municipio,tiendas y mercados</p>
        <p><span class="font-weight-bold">Se vende </span>20Lb por día aproximadamente</p>
        <p><span class="font-weight-bold">Número de empleados </span>4</p>
        <p><span class="font-weight-bold">Durante el mes se vende </span>$1500.00</p>
        <p><span class="font-weight-bold">Problema u oportunidad </span>La oxigenación del agua no es adecuada, he medido durante 3 meses la concentración de oxigeno y no se han incrementado el numero de larvas por estanque, es necesario incorporar oxigenado res al caudal.  Esto lo revisamos con un técnico de la FAO hace ya algunos años y el problema se mantiene.</p>
        <p><span class="font-weight-bold">Otro problema </span>N/A</p>
    </div>
    <div class="card-footer">
        <h5 class="card-title">Generar Propuesta de Solucion</h5>
        <div class="row">
            <% var idProblema = (string)Page.RouteData.Values["idProblema"];%>
            <a class="btn btn-info col m-2" href="/Formulacion/Solucion/adopcion/<% Response.Write(idProblema); %>">Adopcion de Tecnologia</a>
            <a class="btn btn-info col m-2" href="/Formulacion/Solucion/asistencia/<% Response.Write(idProblema); %>">Asistencia Tecnica</a>
            <a class="btn btn-info col m-2" href="/Formulacion/Solucion/innovacion/<% Response.Write(idProblema); %>">Iniciativa de innovacion</a>
            <a class="btn btn-info col m-2" href="/Formulacion/Solucion/integral/<% Response.Write(idProblema); %>">Iniciativa de innovacion integral</a>
        </div>
    </div>
</div>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="jsextra" runat="server">
   
</asp:Content>
