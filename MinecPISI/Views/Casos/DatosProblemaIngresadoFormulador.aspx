<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Layouts/Layout2.Master" AutoEventWireup="true" CodeBehind="DatosProblemaIngresadoFormulador.aspx.cs" Inherits="MinecPISI.Views.Casos.DatosProblemaIngresado"%>
<asp:Content ID="Content1" ContentPlaceHolderID="cssextra" runat="server">
    <link href="<%= ResolveClientUrl("~/Views/css/leaflet.css") %>" rel="stylesheet">
    <style>
        #map {
            height: 300px;
        }
    </style>
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
                <p><%=problema.NOMBRE_PROBLEMA %></p>
            </div>
            <div class="col">
                <h4 class="small font-weight-bold">Dias Restantes:</h4>
                <% int? dias_restantes = 5 - problema.DIAS_CREA; %>
                <p><%= dias_restantes > 0 ? dias_restantes.ToString() : "0" %></p>
            </div>
            <div class="col">
                <h4 class="small font-weight-bold">Estado</h4>
                <p><%=BLL.Acciones.A_ESTADO_PROCESO.ObtenerPorId((int)problema.ID_ESTADO_PROCESO).DESCRIPCION_ESTADO_PROCESO %></p>
            </div>
        </div>
        <!-- datos del beneficiario -->
        <div class="row mt-3">
            <div class="col-md-8">
              <div class="row">
                   <h5 class="font-weight-bold col">Nombre del Beneficiario</h5>
                  <p class="col"><%=beneficiario.NOMBRES %></p>
              </div>
              <div class="row">
                   <h5 class="font-weight-bold col">Teléfono</h5>
                  <p class="col"><%=beneficiario.TEL_FIJO %> / <%=beneficiario.TEL_CEL %></p>
              </div>
                <div class="row">
                   <h5 class="font-weight-bold col">Correo</h5>
                  <p class="col"><%=beneficiario.Correo %></p>
              </div>
              <div class="row">
                   <h5 class="font-weight-bold col">Sector Económico</h5>
                  <p class="col"><%=beneficiario.NOMBRE_SECTOR %></p>
              </div>
               <!--<div class="row">
                   <h5 class="font-weight-bold col">Imagen del producto</h5>
                  <a class="col" href="#">Descargar</a>
              </div>-->
                <div class="row">
                   <h5 class="font-weight-bold col">Municipio</h5>
                  <p class="col"><%=beneficiario.MUNICIPIO %></p>
              </div>
              <div class="row">
                   <h5 class="font-weight-bold col">¿Tiene más de un año en el Lugar?</h5>
                  <p class="col"><%=beneficiario.MAS_ANIOS_EN_LUGAR.GetValueOrDefault(false) ? "Si" : "No" %></p>
              </div>
              <div class="row">
                   <h5 class="font-weight-bold col">Consultor de Vinculación</h5>
                  <p class="col"><%= consultor.NOMBRES + " " +consultor.APELLIDOS %></p>
              </div>
            </div>
            <div class="col-md-4" id="map">
                
            </div>
        </div>
        <!-- Fin de datos del beneficiario -->
    </div>
</div>
<div class="card shadow mb-4">
    <!-- Titulo del problema -->
    <div class="card-header py-3">
        <h6 class="  font-weight-bold text-primary"><%=problema.NOMBRE_PROBLEMA %></h6>
    </div>
    <div class="card-body">
        <p><span class="font-weight-bold">El negocio </span><%=problema.DESCRIPCION_NEGOCIO %></p>
        <p><span class="font-weight-bold">Clientes </span><%=problema.MERCADO %></p>
        <p><span class="font-weight-bold">Se vende </span><%=problema.VENTA_DIA %></p>
        <p><span class="font-weight-bold">Número de empleados </span><%=problema.CANT_EMPLEADOS %></p>
        <p><span class="font-weight-bold">Durante el mes se vende </span>$<%=problema.VENTA_MES %></p>
        <p><span class="font-weight-bold">Problema u oportunidad </span><%=problema.DESCRIPCION_PROBLEMA %></p>
        <p><span class="font-weight-bold">Otro problema </span><%=string.IsNullOrEmpty(problema.DESCRIPCION_OTRO_PROBLEMA) ? "N/A" : problema.DESCRIPCION_OTRO_PROBLEMA %></p>
    </div>
    <div class="card-footer">
        <% switch (rol)
    {
        case "FORMULADOR":
            if (new BLL.Acciones.A_PROPUESTA().ObtenerPropuestaDeFormuladorPorProblema(((BLL.Modelos.ModelosVistas.MV_DetalleUsuario)Session["usuario"]).ID_USUARIO, (int)problema.ID_PROBLEMA) == null)
            {
                    %>
                    <h5 class="card-title">Generar Propuesta de Solución</h5>
                    <div class="row">
                        <% var idProblema = (string)Page.RouteData.Values["idProblema"];%>
                        <a class="btn btn-info col m-2" href="<%Response.Write(HttpContext.Current.Request.ApplicationPath); %>/Formulacion/Solucion/1/<% Response.Write(idProblema); %>">Adopción de Tecnología</a>
                        <a class="btn btn-info col m-2" href="<%Response.Write(HttpContext.Current.Request.ApplicationPath); %>/Formulacion/Solucion/2/<% Response.Write(idProblema); %>">Asistencia Técnica</a>
                        <a class="btn btn-info col m-2" href="<%Response.Write(HttpContext.Current.Request.ApplicationPath); %>/Formulacion/Solucion/3/<% Response.Write(idProblema); %>">Iniciativa de innovación</a>
                        <a class="btn btn-info col m-2" href="<%Response.Write(HttpContext.Current.Request.ApplicationPath); %>/Formulacion/Solucion/4/<% Response.Write(idProblema); %>">Iniciativa Integral</a>
                    </div>
                <%}
        break; %>
                
                <%case "COORDINADOR": %>
                    <a class="btn btn-info btn-icon-split mb-1" data-toggle="modal" href="#">
                        <span class="icon text-white-50">
                            <i class="fa fa-plus"></i>
                        </span>
                        <span class="text">Asignar Formulador</span>
                    </a>
                    </div>
                    </div>

                <%break; %>

                <%case "CONSULTOR":
        if ((BLL.Acciones.A_ESTADO_PROCESO.ObtenerPorCodigo("P02").ID_ESTADO_PROCESO) != problema.ID_ESTADO_PROCESO)
        {
                        %>
                    <form action="" method="post">
                        <input type="hidden" name="act" value="app" />

                        <button type="submit" class="btn btn-success btn-icon-split mb-1" name="lnk_aprobar">
                            <span class="icon text-white-50">
                                <i class="fa fa-check"></i>
                            </span>
                            <span class="text">Aprobar</span>
                        </button>

                    </form>

                    <button type="button" class="btn btn-warning btn-icon-split mb-1" data-toggle="modal" data-target="#observacionModal">
                      <span class="icon text-white-50">
                                <i class="fa fa-check"></i>
                            </span>
                            <span class="text">Añadir Observación</span>
                    </button>
                    </div>
                    
                <%}
        break; %>

                <% case "BENEFICIARIO":
                  if ((BLL.Acciones.A_ESTADO_PROCESO.ObtenerPorCodigo("P02").ID_ESTADO_PROCESO) != problema.ID_ESTADO_PROCESO)
                     {
                        %>
                <div class="card shadow mb-4">
                    
                    <div class="card-header py-3">
                        <h5>OBSERVACIONES</h5>
                    </div>
        
                    <div class="card-body">


                    <% if (!string.IsNullOrEmpty(problema.OBSERVACION_DESCRIPCION))
                        { %>
        
                    <p>
                        <h6>Fecha: </h6>
                        <div class="small">
                            <%=problema.OBSERVACION_FECHA %> 
                        </div>
                    </p>

                    <p>
                        <h6>Descripción:</h6>
                        <%=problema.OBSERVACION_DESCRIPCION %>
                    </p>
                    <a href="<%Response.Write(HttpContext.Current.Request.ApplicationPath);%>/Beneficiario/Editar/Problema/<%Response.Write((string)Page.RouteData.Values["idProblema"]);%>" class="btn btn-warning">Solucionar Observacion</a>
                        <%}
                    else
                    {%>
                        NO HAY OBSERVACIONES SIN RESOLVER PARA ESTE PROBLEMA
                        <%} %>

                        </div>
    </div>


                <%}break; %>
        <%} %>

<!-- Modal -->
<div class="modal fade" id="observacionModal" tabindex="-1" role="dialog" aria-labelledby="ModalTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="ModalTitle">Observación</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
        <form action="" method="post">
      <div class="modal-body">
        <div class="form-group">
            <input type="hidden" name="id_observacion" value="<%=problema.ID_OBSERVACION %>" />
            <label for="txt_observacion">Descripción</label>
            <input type="text" class="form-control" name="txt_observacion" value="<%=problema.OBSERVACION_DESCRIPCION %>"/>
        </div>

          <div class="form-group">
            <label for="txt_observacion">Marcar como resuelta</label>
            <input type="checkbox" name="chk_descartar" value="DESC" />
          </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
            <input type="hidden" name="act" value="obs" />
          

            <button type="submit" class="btn btn-success btn-icon-split mb-1" name="lnk_observar">
                <span class="icon text-white-50">
                    <i class="fa fa-check"></i>
                </span>
                <span class="text">Guardar</span>
            </button>

      </div>
        </form>
    </div>
  </div>
</div>

<!-- Modal -->
<div class="modal fade" id="asignarFormuladorModal" tabindex="-1" role="dialog" aria-labelledby="ModalTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="asignarFormuladorModalTitle">Asignar Formulador</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
        <form action="" method="post">
      <div class="modal-body">
        <div class="form-group">
            <input type="hidden" name="id_observacion" value="<%=problema.ID_OBSERVACION %>" />
            <label for="txt_observacion">Descripción</label>
            <input type="text" class="form-control" name="txt_observacion" value="<%=problema.OBSERVACION_DESCRIPCION %>"/>
        </div>

          <div class="form-group">
            <label for="txt_observacion">Marcar como Resuelta</label>
            <input type="checkbox" name="chk_descartar" value="DESC" />
          </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
            <input type="hidden" name="act" value="obs" />
          

            <button type="submit" class="btn btn-success btn-icon-split mb-1" name="lnk_observar">
                <span class="icon text-white-50">
                    <i class="fa fa-check"></i>
                </span>
                <span class="text">Guardar</span>
            </button>

      </div>
        </form>
    </div>
  </div>
</div>

</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="jsextra" runat="server">
    <script src="<%= ResolveClientUrl("~/Views/js/leaflet.js") %>"></script>
    <script src="<%= ResolveClientUrl("~/Views/js/leafletSearch.js") %>"></script>
    <script>
        
        $(() => {
            var map = L.map('map').setView([<% Response.Write(beneficiario.LAT); %>, <% Response.Write(beneficiario.LONG); %>], 13);

            L.tileLayer('https://api.tiles.mapbox.com/v4/{id}/{z}/{x}/{y}.png?access_token={accessToken}',
                {
                    attribution: 'Map data &copy; <a href="https://www.openstreetmap.org/">OpenStreetMap</a> contributors, <a href="https://creativecommons.org/licenses/by-sa/2.0/">CC-BY-SA</a>, Imagery © <a href="https://www.mapbox.com/">Mapbox</a>',
                    maxZoom: 18,
                    id: 'mapbox.streets',
                    accessToken: 'pk.eyJ1IjoiZmpkZXZlbCIsImEiOiJjanVlZ2liZ2QwMzlsNDlwazJvcHJ6a2JuIn0.twQkqaob2K4OxNQzygJzaA'
                }).addTo(map);
            L.marker([<% Response.Write(beneficiario.LAT); %>, <% Response.Write(beneficiario.LONG); %>]).addTo(map)
            .bindPopup('Ubicación del Beneficiario')
            .openPopup();
        });
    </script>
    
    </asp:Content>