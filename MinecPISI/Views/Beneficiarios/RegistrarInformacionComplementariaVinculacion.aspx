<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Layouts/Layout2.Master" AutoEventWireup="true" CodeBehind="RegistrarInformacionComplementariaVinculacion.aspx.cs" Inherits="MinecPISI.Views.Beneficiarios.RegistrarInformacionComplementariaVinculacion" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cssextra" runat="server">
    <link href="<%= ResolveClientUrl("~/Views/css/leaflet.css") %>" rel="stylesheet">
    <link href="<%= ResolveClientUrl("~/Views/css/leafletSearch.css") %>" rel="stylesheet">
    <style>
        #map {
            height: 300px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="bodyContentBlank" runat="server">
    <form id="form1" class="mt-2" runat="server">
    <div class="card shadow mb-4">
        <div class="card-header py-3">
            <h6 class="  font-weight-bold text-primary">Información Complementaria del Beneficiario</h6>
        </div>
        <div class="card-body">
            <div class="row">
                <div class="col">
                    <h4 class="small font-weight-bold">Nombre:</h4>
                    <asp:Label ID="lbl_nombre" runat="server" />
                </div>
                <div class="col">
                    <h4 class="small font-weight-bold">NIT:</h4>
                    <asp:Label ID="lbl_nit" runat="server" />
                </div>
                <div class="col">
                    <h4 class="small font-weight-bold">Telefono</h4>
                    <asp:Label ID="lbl_telefono" runat="server" />
                </div>
                <%--<div class="col">
                                <h4 class="small font-weight-bold">Estado</h4>
                                <asp:Label ID="lbl_estado" runat="server" />
                            </div>--%>
                <div class="col">
                    <h4 class="small font-weight-bold">Municipio</h4>
                    <asp:Label ID="lbl_muni" runat="server" />
                </div>
            </div>

                <div class="form-row">

                    <div class="form-group">
                        <label>Ingrese informacion complementaria</label>
                        <textarea class="form-control" id="txt_infoComplementaria" placeholder="Ingrese informacion adicional" runat="server" required maxlength="200"></textarea>
                    </div>

                    <div class="form-group">
                        <label>Medio mas efectivo de contacto:</label>
                        <input class="form-control" id="txt_medio" type="text" placeholder="Correro/telefono" runat="server" maxlength="25"/>
                    </div>

                    <h3 class="col-12">Documentacion Complementaria</h3>
                    <div class="form-group">
                        <label>DUI</label>
                        <asp:TextBox ID="txt_dui" type="text" placeholder="DUI" runat="server" CssClass="form-control" required="true" MaxLength="10"/>
                        <asp:RegularExpressionValidator ErrorMessage="Ingresa un dui válido y sin guiones" ControlToValidate="txt_dui" runat="server" ValidationExpression="^\d{9}" SetFocusOnError="true" ForeColor="red" Display="Dynamic" />
                    </div>

                    <div class="form-group">
                        <label>NIT</label>
                        <asp:TextBox ID="txt_nit" type="text" placeholder="NIT" runat="server" CssClass="form-control" required="true" MaxLength="14"/>
                        <asp:RegularExpressionValidator ErrorMessage="Ingresa un NIT válido y sin guiones" ControlToValidate="txt_nit" runat="server" ValidationExpression="\d{14}" SetFocusOnError="true" ForeColor="red" Display="Dynamic" />
                    </div>

                    <div class="form-group">
                        <label>Sector actividad economica</label>
                        <asp:DropDownList ID="ddl_sector" CssClass="custom-select" runat="server" AppendDataBoundItems="True">
                            <asp:ListItem Value="0">--Seleccionar--</asp:ListItem>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="rfv1" runat="server" ControlToValidate="ddl_sector" InitialValue="0" ErrorMessage="Debes seleccionar un sector económico" ForeColor="red" Display="Dynamic"/>
                    </div>
                    
                    <div class="form-group">
                        <label>Municipio</label>
                        <asp:DropDownList ID="ddl_municipio" CssClass="custom-select" runat="server" AppendDataBoundItems="True">
                            <asp:ListItem Value="0">--Seleccionar--</asp:ListItem>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="rfv2" runat="server" ControlToValidate="ddl_municipio" InitialValue="0" ErrorMessage="Debes seleccionar un municipio" ForeColor="red" Display="Dynamic"/>
                    </div>

                    <div class="form-group col-md-2">
                        <div class="form-check form-check-inline">
                            <label class="form-check-label">Mas de un año en el lugar?</label>
                            <input class="form-check-input" type="checkbox" id="chk_tiempo" runat="server" />
                        </div>
                    </div>

                    <div class="form-group col-md-2">
                        <div class="form-check form-check-inline">
                            <label class="form-check-label">Puede comprobar ventas?</label>
                            <input class="form-check-input" type="checkbox" id="chk_ventas" runat="server" />
                        </div>
                    </div>
                    
                    <div class="form-group col-md-2">
                        <div class="form-check form-check-inline">
                            <label class="form-check-label">Existen activos empresariales?</label>
                            <input class="form-check-input" type="checkbox" id="activos" runat="server" />
                        </div>
                    </div>
                    
                    
                    <div class="form-group col-md-12">
                        <label>Ubicación del Beneficiario</label>
                        <a class="btn btn-info text-white" id="ubicacionBtn">Obtener Ubicación</a>
                        <div class="d-none mt-2" id="map"></div>
                        <input class="d-none" type="text" id="ubicacion" runat="server"/>
                        <asp:Label runat="server" ID="lbl_ubicacion" ForeColor="red"></asp:Label>
                    </div>
                    <asp:HiddenField runat="server" ID="hd_ubicacion"/>
                    <div class="form-group col-md-12">                    
                        <asp:Button Text="Siguiente" ID="btn_siguiente" UseSubmitBehavior="False" CssClass="btn btn-success offset-md-5" runat="server" OnClick="OnSiguienteClick" />
                    </div>

                </div>
        </div>
    </div>
    </form>
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
            mymap.addControl(new L.Control.Search({
                url: 'https://nominatim.openstreetmap.org/search?format=json&q={s}',
                jsonpParam: 'json_callback',
                propertyName: 'display_name',
                propertyLoc: ['lat', 'lon'],
                marker: L.circleMarker([0, 0], { radius: 30 }),
                autoCollapse: true,
                autoType: false,
                minLength: 2
            }));
            var popup = L.popup();

            function onMapClick(e) {
                popup
                    .setLatLng(e.latlng)
                    .setContent("Ubicacion, coordenadas:" + e.latlng)
                    .openOn(mymap);
                $('#ubicacion').val(mymap.getCenter().toString().split("LatLng")[1].replace("(", "").replace(")", ""));
                debugger;
                $('#<%= hd_ubicacion.ClientID %>').val(mymap.getCenter().toString().split("LatLng")[1].replace("(", "").replace(")", ""));
            }

            mymap.on('click', onMapClick);



        }
        $('#ubicacionBtn').click(function () {

            navigator.geolocation.getCurrentPosition(showPosition);
            $('#map').removeClass("d-none");


        });
    </script>
</asp:Content>
