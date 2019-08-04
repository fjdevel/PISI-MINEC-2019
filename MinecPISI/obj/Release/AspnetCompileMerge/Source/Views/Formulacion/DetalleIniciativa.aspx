<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Layouts/Layout2.Master" AutoEventWireup="true" CodeBehind="DetalleIniciativa.aspx.cs" Inherits="MinecPISI.Views.Formulacion.DetalleIniciativa" %>
<asp:Content ID="Content1" ContentPlaceHolderID="cssextra" runat="server">
    <link href="<%= ResolveClientUrl("~/Views/css/leaflet.css") %>" rel="stylesheet">
    <style>
        #map{
            height:400px;
        }
        th{
            width:400px;
        }
        .celda{
            width:30px;
        }
        #spinner{
            display:inline-flex;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contenidoNavegacion" runat="server">
    <hr class="sidebar-divider">
    <% 
        //Aqui de debe hacer la validacion de que navegacion mostrar si el del coordinador o consultor
        switch (usuario)
        {
            case "Coordinador":
    %>
    <!--#include file="~/Views/Navegacion/Coordinador.html"-->
    <%
            break;
    case "Beneficiario":
    %>
    <!--#include file="~/Views/Navegacion/Beneficiario.html"-->
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
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="bodyContentBlank" runat="server">
    <div class="card shadow mb-4">
        <div class="card-header py-3">
            <h6 class="  font-weight-bold text-primary">Iniciativa: UCA124S</h6>
        </div>
        <div class="card-body">
            <%

               
                switch (Page.RouteData.Values["tipoIniciativa"].ToString())
                {
                    case "1":
                        %>
                        <!--#include file="~/Views/Formulacion/tmp/detalleIniciativaAdopcion.html"-->
                        <%
                    break;
                    case "2":
                        %>
                        <!--#include file="~/Views/Formulacion/tmp/detalleIniciativaAsistencia.html"-->
                        <%
                    break;
                    case "3":
                        %>
                        <!--#include file="~/Views/Formulacion/tmp/detalleIniciativaInnovacion.html"-->
                        <%
                    break;
                }
            %>
        </div>
    </div>
  
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="jsextra" runat="server">
    <script src="<%= ResolveClientUrl("~/Views/js/leaflet.js") %>"></script>
    <script src="<%= ResolveClientUrl("~/Views/js/Cronograma.js") %>"></script>
    <script>
        function mostrarMapa() {
            $('#mapaModal').modal('toggle');
            navigator.geolocation.getCurrentPosition(showPosition);
        }
        function showPosition(position) {
            console.log(position);
            var mymap = L.map('map').setView([position.coords.latitude, position.coords.longitude], 15);
            
          
          L.tileLayer('https://api.tiles.mapbox.com/v4/{id}/{z}/{x}/{y}.png?access_token={accessToken}',
                {
                    attribution: 'Map data &copy; <a href="https://www.openstreetmap.org/">OpenStreetMap</a> contributors, <a href="https://creativecommons.org/licenses/by-sa/2.0/">CC-BY-SA</a>, Imagery © <a href="https://www.mapbox.com/">Mapbox</a>',
                    maxZoom: 18,
                    id: 'mapbox.streets',
                    accessToken: 'pk.eyJ1IjoiZmpkZXZlbCIsImEiOiJjanVlZ2liZ2QwMzlsNDlwazJvcHJ6a2JuIn0.twQkqaob2K4OxNQzygJzaA'
                }).addTo(mymap);
            var popup = L.popup()
                .setLatLng(mymap.getCenter())
                .setContent('<p>Ubicacion de la iniciativa.</p>')
                .openOn(mymap);
             
        }
        var headers = [
        "Adopción o incorporación Tecnológica",
        "Componentes, tecnología Adicional",
        "Otros a ser considerados ",
        "Monto Contra partida Beneficiario"
    ]
         var cronograma = new $.Cronograma($('#table-cron'), {
             'numMonth': 3,
             'dateStart':new Date(),
             'subHeaders': headers,
             //habilita las funciones de manejar eventos
             'eventos': true
         });
        $(() => {
            $('#disponibilidad').hide();
            $('#optno').is(':checked') ? $('#disponibilidad').show() : $('#disponibilidad').hide();
        });
    </script>
</asp:Content>
