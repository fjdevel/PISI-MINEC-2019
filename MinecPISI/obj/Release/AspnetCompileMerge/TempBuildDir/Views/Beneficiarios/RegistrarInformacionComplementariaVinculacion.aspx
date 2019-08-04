<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Layouts/Layout2.Master" AutoEventWireup="true" CodeBehind="RegistrarInformacionComplementariaVinculacion.aspx.cs" Inherits="MinecPISI.Views.Beneficiarios.RegistrarInformacionComplementariaVinculacion" %>
<asp:Content ID="Content1" ContentPlaceHolderID="cssextra" runat="server">
    <link href="<%= ResolveClientUrl("~/Views/css/leaflet.css") %>" rel="stylesheet">
    <link href="<%= ResolveClientUrl("~/Views/css/leafletSearch.css") %>" rel="stylesheet">
    <style>
        #map { height: 300px; }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contenidoNavegacion" runat="server">
    <hr class="sidebar-divider">
    <!--#include file="~/Views/Navegacion/ConsultorDeVinculacion.html"-->
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="bodyContentBlank" runat="server">
    <div class="card shadow mb-4">
    <div class="card-header py-3">
        <h6 class="  font-weight-bold text-primary">Registrar Cita con Beneficiario</h6>
    </div>
    <div class="card-body">
        <div class="row">
            <div class="col">
                <h4 class="small font-weight-bold">Nombre:</h4>
                <p>Juan Jose Lopez</p>
            </div>
            <div class="col">
                <h4 class="small font-weight-bold">NIT:</h4>
                <p>018-345344-1075</p>
            </div>
            <div class="col">
                <h4 class="small font-weight-bold">Telefono</h4>
                <p>2516 2516</p>
            </div>
            <div class="col">
                <h4 class="small font-weight-bold">Estado</h4>
                <p>SPA</p>
            </div>
            <div class="col">
                <h4 class="small font-weight-bold">Municipio</h4>
                <p>Sonsonate</p>
            </div>
        </div>
        <form class="mt-2">
            <div class="form-row">
                <div class="form-group col-md-6">
                    <label>Ingrese informacion complementaria</label>
                    <textarea class="form-control" id="infoComplementaria" placeholder="Ingrese informacion adicional"></textarea>
                </div>
                <div class="form-group col-md-6">
                    <label>Medio mas efectivo de contacto:</label>
                    <input class="form-control" id="medioEfectivo" type="text" placeholder="Correro/telefono" />
                </div>
                <h3 class="col-12">Documentacion Complementaria</h3>
                <div class="form-group col-md-6">
                    <label>DUI</label>
                    <input class="form-control" type="text" placeholder="Ingrese el dui del beneficiario" id="dui" />
                </div>
                <div class="form-group col-md-6">
                    <label>Imagen del DUI</label>
                    <input type="file" class="form-control-file" id="duiImg" />
                </div>
                <div class="form-group col-md-6">
                    <label>NIT</label>
                    <input class="form-control" type="text" placeholder="Ingrese el NIT del beneficiario" id="nit" />
                </div>
                <div class="form-group col-md-6">
                    <label>Imagen del NIT</label>
                    <input type="file" class="form-control-file" id="nitImg" />
                </div>
                <div class="form-group col-md-6">
                    <label>Sector actividad economica</label>
                    <select id="inputSector" class="custom-select">
                        <option class="text-center" selected>--Seleccionar--</option>
                        <option value="1">Pesca Artesanal</option>
                        <option value="2">Acuicultura</option>
                        <option value="3">Turismo</option>
                    </select>
                </div>
                <div class="form-group col-md-6">
                    <label>Imagen de los productos</label>
                    <input type="file" class="form-control-file" id="productosImg" multiple="multiple"/>
                </div>
                <div class="form-group col-md-6">
                    <label>Municipio</label>
                     <select class="custom-select" id="inputMuni">
                        <option class="text-center" selected>--Seleccionar--</option>
                        <option value="1">Ayutuxtepeque</option>
                        <option value="2">San Salvador</option>
                     </select>
                </div>
                <div class="form-group col-md-6">
                    <div class="form-check form-check-inline">
                        <label class="form-check-label">Mas de un año en el lugar?</label>
                        <input class="form-check-input" type="checkbox" id="tiempo"  />
                    </div>
                    <input type="file" class="form-control-file" id="imagenLugar" multiple="multiple"/>
                    
                </div>
                <div class="form-group col-md-6">
                    <div class="form-check form-check-inline">
                        <label  class="form-check-label">Puede comprobar ventas?</label>
                        <input class="form-check-input" type="checkbox" id="ventas"  />
                    </div>
                    <input type="file" class="form-control-file" id="ventasImg" />
                </div>
                <div class="form-group col-md-6">
                    <div class="form-check form-check-inline">
                        <label  class="form-check-label">Existen activos empresariales?</label>
                        <input class="form-check-input" type="checkbox" id="activos"  />
                    </div>
                    <input type="file" class="form-control-file" id="activosImg" />
                </div>
                <div class="form-group col-md-12">
                    <label>Ubicación del Beneficiario</label>
                    <a class="btn btn-info text-white" id="ubicacionBtn">Obtener Ubicación</a>
                    <div class="d-none mt-2" id="map"></div>
                    <input class="d-none" type="text" id="ubicacion" />
                </div>
            </div>
            <input type="submit" class="btn btn-success offset-md-5" value="Registrar" />
        </form>
    </div>
</div>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="jsextra" runat="server">
    <script src="<%= ResolveClientUrl("~/Views/js/leaflet.js") %>"></script>
    <script src="<%= ResolveClientUrl("~/Views/js/leafletSearch.js") %>"></script>
    <script>
        function showPosition(position) {
             var mymap = L.map('map').setView([position.coords.latitude, position.coords.longitude], 15);
            
            L.tileLayer('https://api.tiles.mapbox.com/v4/{id}/{z}/{x}/{y}.png?access_token={accessToken}',
                {
                    attribution: 'Map data &copy; <a href="https://www.openstreetmap.org/">OpenStreetMap</a> contributors, <a href="https://creativecommons.org/licenses/by-sa/2.0/">CC-BY-SA</a>, Imagery © <a href="https://www.mapbox.com/">Mapbox</a>',
                    maxZoom: 18,
                    id: 'mapbox.streets',
                    accessToken: 'pk.eyJ1IjoiZmpkZXZlbCIsImEiOiJjanVlZ2liZ2QwMzlsNDlwazJvcHJ6a2JuIn0.twQkqaob2K4OxNQzygJzaA'
                }).addTo(mymap);
            	mymap.addControl( new L.Control.Search({
		            url: 'https://nominatim.openstreetmap.org/search?format=json&q={s}',
		            jsonpParam: 'json_callback',
		            propertyName: 'display_name',
		            propertyLoc: ['lat','lon'],
		            marker: L.circleMarker([0,0],{radius:30}),
		            autoCollapse: true,
		            autoType: false,
		            minLength: 2
	            }) );
            var popup = L.popup();

            function onMapClick(e) {
                popup
                    .setLatLng(e.latlng)
                    .setContent("Ubicacion, coordenadas:" + e.latlng)
                    .openOn(mymap);
                 $('#ubicacion').val(mymap.getCenter().toString().split("LatLng")[1].replace("(", "").replace(")",""));
            }

            mymap.on('click', onMapClick);
               
            
          
        }
        $('#ubicacionBtn').click(function () {

            navigator.geolocation.getCurrentPosition(showPosition);
            $('#map').removeClass("d-none");
           
        
        });
    </script>
</asp:Content>
