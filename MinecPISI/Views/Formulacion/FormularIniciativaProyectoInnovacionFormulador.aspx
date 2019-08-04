<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Layouts/Layout2.Master" AutoEventWireup="true" CodeBehind="FormularIniciativaProyectoInnovacionFormulador.aspx.cs" Inherits="MinecPISI.Views.Formulacion.FormularIniciativaProyectoInnovacionFormulador" %>
<asp:Content ID="Content1" ContentPlaceHolderID="cssextra" runat="server">
    <link href="<%= ResolveClientUrl("~/Views/css/leaflet.css") %>" rel="stylesheet">
    <link href="<%= ResolveClientUrl("~/Views/css/leafletSearch.css") %>" rel="stylesheet">
    <style>
        table{
            border: 0.3px solid gray !important;
        }
        td{
            border: 0.3px solid gray !important;
        }
        th{
            width:400px;
            border: 0.3px solid gray !important;
        }
        .celda{
            width:30px;
            border: 0.3px solid gray !important;
        }
        .celda:hover{
            background:rgba(78,115,223,0.5);
        }
        #map {
            height: 300px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contenidoNavegacion" runat="server">
   
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="bodyContentBlank" runat="server">
    <form  runat="server" onsubmit="topFunction(); return true">
                <asp:ScriptManager ID="ScriptManager1" runat="server" />

                <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                    <ContentTemplate>
    <div class="card shadow mb-4">
        <div class="card-header py-3">
            <h6 class="  font-weight-bold text-primary">Iniciativa de Proyecto de Innovación y o Desarrollo Tecnológico</h6>
        </div>
        <div class="card-body">
            <nav>
              <div class="nav nav-tabs" id="nav-tab" role="tablist">
                <a class="nav-item nav-link active" id="nav-planteamiento-tab" data-toggle="tab" href="#nav-planteamiento" role="tab" aria-controls="nav-planteamiento" aria-selected="true">Planteamiento #1</a>
                <a class="nav-item nav-link" id="nav-tab-1" data-toggle="tab" href="#nav-plant" role="tab" aria-controls="nav-plant" aria-selected="false">Planteamiento #2</a>
                <a class="nav-item nav-link" id="nav-contrapartida-tab" data-toggle="tab" href="#nav-contrapartida" role="tab" aria-controls="nav-contrapartida" aria-selected="false">Contrapartida</a>
                <a class="nav-item nav-link" id="nav-matriz-tab" data-toggle="tab" href="#nav-matriz" role="tab" aria-controls="nav-matriz" aria-selected="false">Iniciativa de Innovación descrita</a>
              </div>
            </nav>
            <div class="tab-content" id="nav-tabContent">
                
                <div class="tab-pane fade show active" id="nav-planteamiento" role="tabpanel" aria-labelledby="nav-planteamiento-tab">
                      <div class="form-group mt-2">
                          <label>Planteamiento del problema u oportunidad a ser aprovechada</label>
                          <asp:TextBox runat="server" class="form-control"  placeholder="Ingresa el planteamiento técnico del problema u oportunidad a ser aprovechada" ID="planteamiento" TextMode="multiline"  Rows="5"/>
                      </div>
                      <div class="form-group">
                          <label>Planteamiento descriptivo de la causa del Problema u Oportunidad</label>
                          <asp:TextBox runat="server" class="form-control"  placeholder="Ingresa la descripción de la causa del problema" TextMode="multiline"  Rows="5" ID="descripcionSolucion"/>
                      </div>
                       <div class="form-group">
                          <label>Descripción de la relevancia de la operación o producto a ser afectado con el Proyecto y su relevancia para la operación del Beneficiario</label>
                          <asp:TextBox runat="server" class="form-control"  placeholder="Ingresa la descripción de la revelancia de la operación" TextMode="multiline"  Rows="5" ID="descripcionRelevancia"/>
                      </div>
                      <div class="form-group">
                          <label>Incrementos esperados en ventas o mejora de la productividad del Beneficiario</label>
                          <asp:TextBox runat="server" class="form-control"  placeholder="Describe los incrementos o mejoras productivas que esperan lograrse con el proyecto" TextMode="multiline"  Rows="5" ID="incrementosEsperados"/>
                      </div>
                      <div class="form-group">
                          <label>Incrementos en ventas o mejora de la productividad del Beneficiario</label>
                          <asp:TextBox runat="server" class="form-control"  placeholder="Ingrese los incrementos en ventas" TextMode="multiline"  Rows="5" name="incrementosEnVentas" ID="incrementosEnVentas"/>
                      </div>
                      <div class="form-group">
                          <label>¿Tipo de ejecución?</label>
                         <div class="form-check form-check-inline">
                          <asp:RadioButton runat="server" cssClass="form-check-input" GroupName="ejecucion" ID="ejecucionSolo" value="Ejecución por si solo" Checked="true" ></asp:RadioButton>
                          <label class="form-check-label" >
                             Ejecuta por si solo
                          </label>
                        </div>
                        <div class="form-check form-check-inline">
                          <asp:RadioButton runat="server" cssClass="form-check-input" GroupName="ejecucion" ID="ejecucionAsistida" value="Ejecución Asistida" Checked="false"></asp:RadioButton>
                          <label class="form-check-label">
                            Ejecución Asistida
                          </label>
                        </div>
                      </div>
                  </div>

                  <div class="tab-pane fade" id="nav-plant" role="tabpanel" aria-labelledby="nav-tab-1">
                      
                      <div class="form-group mt-2">
                              <label>Describe si el proyecto es una innovación en producto y su finalidad o meta a alcanzar</label>
                              <asp:TextBox runat="server" cssClass="form-control" ID="producto" TextMode="multiline"  Rows="5"></asp:TextBox>
                          </div>
                      <div class="form-group mt-2">
                              <label>Describe si el proyecto es una innovación en proceso y su finalidad o meta a alcanzar</label>
                              <asp:TextBox runat="server" cssClass="form-control" ID="proceso" TextMode="multiline"  Rows="5"></asp:TextBox>
                          </div>
                      <div class="form-group mt-2">
                              <label>Describe si el proyecto es una innovación en su método de comercialización</label>
                              <asp:TextBox runat="server" cssClass="form-control" ID="modelo" TextMode="multiline"  Rows="5"></asp:TextBox>
                          </div>
                      

                      <div class="form-group mt-2">
                          <label>¿Los insumos para el desarrollo se encuentra disponible localmente?</label>
                          <div >
                            <asp:CheckBox runat="server" ID="insumoLocal" Checked="false"  cssClass="col-md-1 form-control mr-2 text-white"/>
                        </div>
                      </div>
                      <div class="form-group mt-2">
                              <label>Describe genéricamente los insumos necesarios para el desarrollo del proyecto y si cada uno es local o internacional</label>
                              <asp:TextBox runat="server" cssClass="form-control" ID="generic" TextMode="multiline"  Rows="5"></asp:TextBox>
                          </div>
                       <div class="form-group mt-2">
                          <label>¿El proyecto requerirá de insumos de parte del  beneficiario?</label>
                          <div >
                            <asp:CheckBox runat="server" ID="insumoBene" Checked="false"  cssClass="col-md-1 form-control mr-2 text-white"/>
                        </div>
                      </div>
                       <div class="form-group mt-2">
                              <label>Describe los insumos que serán requeridos por el proyecto y serán responsabilidad del Beneficiario</label>
                              <asp:TextBox runat="server" cssClass="form-control" ID="insumoDescrip" TextMode="multiline"  Rows="5"></asp:TextBox>
                          </div>
                      <div id="disponibilidad">
                          <div class="form-group mt-2">
                              <div>
                                <label>Debe venir alguien y atender el tema localmente </label>
                                   <asp:CheckBox runat="server" ID="atenderLocal" Checked="false" cssClass="col-md-1 form-control mr-2 text-white"/>
                              </div>
                              <div>
                                <label>Debe alguien de la iniciativa ir y recibir el entrenamiento o transferencia</label>
                                   <asp:CheckBox runat="server" ID="entrenamiento" Checked="false"  cssClass="col-md-1 form-control"/>
                              </div>
                              <div>
                                <label>Mixta</label>
                                  <asp:CheckBox runat="server" ID="mixta" Checked="false"  cssClass="col-md-1 form-control mr-2 text-white"/>
                              </div>
                          </div>
                          <div class="form-group mt-2 row">
                              <div class="col-md-4">
                                  <label>Duración en días</label>
                                  <asp:TextBox runat="server" cssClass="form-control " type="number" ID="duracionDias" />
                              </div>
                              <div class="col-md-8 ">
                                  <label>Locación</label>
                                  <asp:TextBox runat="server" disabled="disabled" ID="location" cssClass="d-none"/>
                                  <a id="showmap" class="btn btn-success text-white">Obtener locación</a>
                              </div>
                          </div>
                          <div class="form-group mt-2">
                              <label>¿Requiere de recursos técnicos adicionales?</label>
                              <asp:CheckBox runat="server" ID="recursosAdicionales" Checked="false"  cssClass="col-md-1 form-control"/>
                          </div>
                          <div class="form-group mt-2">
                              <label>¿Existe necesidad de conocimiento previo para que sea asimilada de forma correcta?</label>
                              <asp:CheckBox runat="server" ID="conocPrevio" Checked="false"  cssClass="col-md-1 form-control"/>
                          </div>
                          <div class="form-group mt-2">
                              <label>Describe los requerimientos previos necesarios</label>
                              <asp:TextBox runat="server" cssClass="form-control" ID="requerimientosPrevios" TextMode="multiline"  Rows="5"></asp:TextBox>
                          </div>
                          <div class="form-group mt-2">
                              <label>¿Tiene el beneficiario o cumple con los anteriores?</label>
                              <asp:CheckBox runat="server" ID="cumple" Checked="false"  cssClass="col-md-1 form-control"/>
                          </div>
                          <div class="form-group mt-2">
                              <label>Componentes o insumos necesarios para lograr el impacto de la innovación o desarrollo tecnológico </label>
                              <asp:TextBox runat="server" cssClass="form-control" ID="componentes" TextMode="multiline"  Rows="5"/>
                          </div>
                          <div class="form-group mt-2">
                              <label>Describe los efectos esperados sobre el problema</label>
                              <asp:TextBox runat="server" cssClass="form-control" ID="efectosProblema" TextMode="multiline"  Rows="5"/>
                          </div>
                          <div class="form-group mt-2">
                              <label>Describe los efectos esperados sobre  el negocio</label>
                             <asp:TextBox runat="server" cssClass="form-control" ID="efectosNegocio" TextMode="multiline"  Rows="5"/>
                          </div>
                          <div class="form-group mt-2">
                              <label>Describe y justifique los incrementos esperados en el margen de utilidad actual</label>
                             <asp:TextBox runat="server" cssClass="form-control" ID="incrementoUtilidad" TextMode="multiline"  Rows="5"/>
                          </div>
                          <div class="form-group mt-2">
                              <label>Describe y justifique si el proyecto logrará reducir el tiempo de los procesos productivos con métodos y/o tecnologías alternativas a las utilizadas en la actualidad</label>
                                <asp:TextBox runat="server" cssClass="form-control" ID="reduccionTiempo" TextMode="multiline"  Rows="5"/>
                          </div>
                          <div class="form-group mt-2">
                              <label>Describe y justifique si el proyecto logrará disminuir el consumo de energía o combustible en la producción, recolección, procesos y entrega de los bienes actuales</label>
                              <asp:TextBox runat="server" cssClass="form-control" ID="disminuirConsumo" TextMode="multiline"  Rows="5"/>
                          </div>
                          <div class="form-group mt-2">
                              <label>Describe y justifique si el proyecto logrará reducir el consumo de materia prima con tecnología no utilizada actualmente por el Beneficiario</label>
                              <asp:TextBox runat="server" cssClass="form-control" ID="reducirConsumo" TextMode="multiline"  Rows="5"/>
                          </div>
                          <div class="form-group mt-2">
                              <label>Otros a ser considerados</label>
                              <asp:TextBox runat="server" cssClass="form-control" ID="otros" TextMode="multiline"  Rows="5"/>
                          </div>
                     </div>


                    </div>
                  <div class="tab-pane fade" id="nav-contrapartida" role="tabpanel" aria-labelledby="nav-contrapartida-tab">
                     <h4 class="mt-2"><b> Descripción de los montos FONDEPRO</b></h4>
                     <div class="form-group mt-2">
                          <label>Descripción de la Contrapartida</label>
                          <asp:TextBox runat="server" cssClass="form-control" ID="descripcionContrapartida" TextMode="multiline"  Rows="5"/>
                      </div>
                      <div class="form-group mt-2">
                          <div class="row">
                              <label class="col-md-6">Monto de Proyecto de Innovación y o Desarrollo Tecnológico</label>
                              <asp:TextBox runat="server" cssClass="form-control col-md-5 fondepro" type="number" step="any" ID="montoAsistencia"/>
                          </div>
                      </div>
                      
                      <div class="form-group mt-2">
                          <div class="row">
                              <label class="col-md-6">Componentes, acciones y/o tecnología adicional necesaria</label>
                              <asp:TextBox runat="server" cssClass="form-control col-md-5 fondepro" type="number" step="any" ID="montoRecursos"/>
                          </div>
                      </div>
                      <div class="form-group mt-2">
                          <div class="row">
                              <label class="col-md-6">Otros a ser considerados</label>
                              <asp:TextBox runat="server" cssClass="form-control col-md-5 fondepro" type="number" step="any" ID="montoOtros"/>
                          </div>
                      </div>
                       <div class="form-group">
                          <div class="row">
                              <label class="col-md-2">Monto total de FONDEPRO</label>
                              <input value="0.00" class="form-control col-md-2" type="number" step="any" disabled="disabled" ID="montoFondepro">
                          </div>
                      </div>
                      <hr class="divider" />
                      <h4><b>Descripción de contrapartida (adecauda a los ultimos parametros aprobados) </b></h4>
                      
                      <div class="form-group mt-2">
                          <div class="row">
                              <label class="col-md-2">Descripción del monto en especies</label>
                              <asp:TextBox runat="server" TextMode="multiline"  Rows="5" cssClass="form-control col-md-6" ID="descripMontoEspecies"  placeholder="Justifique el monto en especies por el beneficiario" />
                          </div>
                      </div>
                      <div class="form-group">
                          <div class="row">
                              <label class="col-md-2">Monto en Especies</label>
                              <asp:TextBox runat="server" cssClass="form-control col-md-5 contrapartida" type="number" step="any" ID="montoEspecies"/>
                          </div>
                      </div>
                      <div class="form-group mt-2">
                          <div class="row">
                              <label class="col-md-2">Descripción del monto en Efectivo</label>
                               <asp:TextBox runat="server" TextMode="multiline"  Rows="5" cssClass="form-control col-md-6" ID="descripMontoEfectivo" placeholder="Justifique el monto en efectivo por el beneficiario" />
                          </div>
                      </div>
                      <div class="form-group">
                          <div class="row">
                              <label class="col-md-2">Monto en Efectivo</label>
                            <asp:TextBox runat="server" cssClass="form-control col-md-5 contrapartida" type="number" step="any" ID="montoEfectivo"/>
                          </div>
                      </div>
                      <div class="form-group">
                          <div class="row">
                              <label class="col-md-2">Monto Contrapartida del Beneficiario</label>
                              <asp:TextBox runat="server" value="0.00" cssClass="form-control col-md-2 contrapartida" type="number" step="any"   ID="montoTotalContrapartida"/>
                          </div>
                      </div>
                      <hr class="divider" />
                      <h4><b>Total del Proyecto</b></h4>
                      <div class="form-group">
                          <div class="row">
                              <label class="col-md-2">Monto total del proyecto</label>
                              <input value="0,00" class="form-control col-md-2" type="number" step="any"  ID="montoproyecto" disabled="disabled">
                          </div>
                      </div>
                  </div>
                  <div class="tab-pane fade" id="nav-matriz" role="tabpanel" aria-labelledby="nav-matriz-tab">
                      <div class="mt-2 row">
                          <div class="form-group col-md-4">
                              <label>Digite la fecha de inicio</label>
                               <asp:TextBox runat="server" type="date" cssClass="form-control" ID="inputfecha" required/>
                          </div>
                      </div>
                      <div class="row mt-3">
                        <div class="col">
                            
                            <div class="row mb-5" style="overflow-x:auto">
                                <table class="col" id="table-cron">
                                </table>
                            </div>
                        </div>
                    </div>

                      <asp:TextBox runat="server" ID="semanasSelec"  Cssclass="d-none" />
                     <%if (edit == 0)
                                    { %>
                                <asp:Button runat="server" ID="btnguardar" CssClass="btn btn-success" Text="Presentar Iniciativa" />
                                <asp:Button runat="server" ID="btnProg" CssClass="btn btn-info" Text="Guardar Progreso" />
                                <%}
                                    else
                                    {%>
                                <asp:Button runat="server" ID="btnEditarProgreso" CssClass="btn btn-info" Text="Guardar Progreso" />

                                <%}%>
                  </div>
                
            </div>
         </div>
        <div class="card-footer">
            
                <asp:Panel runat="server" ID="pnl_observaciones" Visible="false">
                    <div class="card shadow mb-4">

                        <div class="card-header py-3">
                            <h5>Observaciones</h5>
                        </div>

                        
                        <div class="card-body">
                            <% foreach (var o in observaciones)
                                { %>
                            <p>
                                <h6>Fecha y Hora: </h6>
                                <div class="small">
                                    <%=o.FECHA %>
                                </div>
                            </p>

                            <p>
                                <h6>Descripción:</h6>
                                <div class="small">
                                    <%= o.DESCRIPCION %>
                                </div>
                            </p>
                            <%}%>
                            <asp:Button Text="Marcar como resuelta" runat="server" CssClass="btn btn-warning" ID="btn_resolverObservacion"/>
                        </div>
                        
                    </div>
                </asp:Panel>
        </div>
    </div>



 <div class="modal fade" id="mapaModal" tabindex="-1" role="dialog">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Por favor haga click en el lugar donde se localizará la iniciativa</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
          <div class=" d-flex justify-content-center">
              <div id="spinner" class="spinner-border " role="status" >
            <span class="sr-only">Cargando...</span>
        </div>
          </div>
          
        <div id="map">

        </div>
      </div>
      <div class="modal-footer">
        <a id="guardarubicacion" class="btn btn-secondary text-white" data-dismiss="modal">Cerrar</a>
      </div>
    </div>
  </div>
</div>
    </ContentTemplate>
        </asp:UpdatePanel>
    </form>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="jsextra" runat="server">
    <script src="<%= ResolveClientUrl("~/Views/js/leaflet.js") %>"></script>
    <script src="<%= ResolveClientUrl("~/Views/js/leafletSearch.js") %>"></script>
    <script src="<%= ResolveClientUrl("~/Views/js/Cronograma.js") %>"></script>
    <% if(edit==0){ %>
    <script>
         $('.fondepro').change(() => {
         var psum = 0;
         for (let i = 0; i < $('.fondepro').length; i++) {
             psum += parseFloat($('.fondepro')[i].value);
         }
         $('#montoFondepro').val(psum.toFixed(2));
         $('#bodyContentBlank_montoTotalContrapartida').val((psum / 9).toFixed(2));
         $('#montoproyecto').val((psum / 0.9).toFixed(2));
     });

     $('.contrapartida').change(() => {
         var psum = 0;
         for (let i = 0; i < $('.contrapartida').length; i++) {
             psum += parseFloat($('.contrapartida')[i].value);
         }
         var monto = parseFloat($('#bodyContentBlank_montoTotalContrapartida').val()).toFixed(2);
         if (psum < monto || psum > monto) {
             alert("la suma de la contrapartida debe estar exactamente: " + monto);
         }
         
     });

     $(document).ready(function () {
         for (let i = 0; i < $('.fondepro').length; i++) {
             $('.fondepro')[i].value = 0;
         }
         for (let i = 0; i < $('.contrapartida').length; i++) {
             $('.contrapartida')[i].value = 0;
         }
            var headers = [
                "Iniciativa de Proyecto de Innovación y o desarrollo Tecnológico",
                "Local",
                "Extranjero",
                "Monto Contra partida Beneficiario"
            ];
        var cronograma = new $.Cronograma($('#table-cron'), {
             'numMonth': 3,
             'dateStart':new Date(),
             'subHeaders': headers,
             //habilita las funciones de manejar eventos
             'eventos': true,
             'toSend' : 'bodyContentBlank_semanasSelec',
             'data':[]
         });
            
         $('#bodyContentBlank_inputfecha').change(function () {
             cronograma.Reload($(this).val());
             cronograma.clickEvent();
         });



            $('#disponibilidad').hide();
            $('#bodyContentBlank_insumoLocal').change(function () {
                $('#disponibilidad').toggle();

            });
        });
        $('#showmap').click(function () {
            $('#mapaModal').modal('toggle');
            navigator.geolocation.getCurrentPosition(showPosition);
           
        });
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
                    .setContent("Iniciativa localizada, coordenadas:" + e.latlng)
                    .openOn(mymap);
                 $('#bodyContentBlank_location').val(mymap.getCenter().toString().split("LatLng")[1].replace("(", "").replace(")",""));
            
            }

            mymap.on('click', onMapClick);
          
            $('#spinner').hide();
            
             
        }
    </script>
    <%}else{%>
    <script>
          $('#showmap').click(function () {
            $('#mapaModal').modal('toggle');
            navigator.geolocation.getCurrentPosition(showPosition);
           
        });
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
                    .setContent("Iniciativa localizada, coordenadas:" + e.latlng)
                    .openOn(mymap);
                 $('#bodyContentBlank_location').val(mymap.getCenter().toString().split("LatLng")[1].replace("(", "").replace(")",""));
            
            }

            mymap.on('click', onMapClick);
          
            $('#spinner').hide();
            
             
        }
         $('.fondepro').change(() => {
         var psum = 0;
         for (let i = 0; i < $('.fondepro').length; i++) {
             psum += parseFloat($('.fondepro')[i].value);
         }
         $('#montoFondepro').val(psum.toFixed(2));
         $('#bodyContentBlank_montoTotalContrapartida').val((psum / 9).toFixed(2));
         $('#montoproyecto').val((psum / 0.9).toFixed(2));
     });

     $('.contrapartida').change(() => {
         var psum = 0;
         for (let i = 0; i < $('.contrapartida').length; i++) {
             psum += parseFloat($('.contrapartida')[i].value);
         }
         var monto = parseFloat($('#montoTotalContrapartida').val()).toFixed(2);
         if (psum < monto || psum > monto) {
             alert("la suma de la contrapartida debe estar exactamente: " + monto);
         }
         
     });
        var psum = 0;
        for (let i = 0; i < $('.fondepro').length; i++) {
            psum += parseFloat($('.fondepro')[i].value);
        }
        $('#montoFondepro').val(psum.toFixed(2));
        $('#bodyContentBlank_montoTotalContrapartida').val((psum / 9).toFixed(2));
        $('#montoproyecto').val((psum / 0.9).toFixed(2));
        var headers = [
                "Iniciativa de Proyecto de Innovación y o desarrollo Tecnológico",
                "Local",
                "Extranjero",
                "Monto Contra partida Beneficiario"
            ];
        var cronograma = new $.Cronograma($('#table-cron'), {
            'numMonth': 3,
            'dateStart': new Date(),
            'subHeaders': headers,
            //habilita las funciones de manejar eventos
            'eventos': false,
            'data': $('#bodyContentBlank_semanasSelec').val()
        });
        cronograma.Reload($('#bodyContentBlank_inputfecha').val());
        $(() => {
            $('#disponibilidad').hide();
            $('#optno').is(':checked') ? $('#disponibilidad').show() : $('#disponibilidad').hide();
            //console.log(cronograma.getEvents());


              $('#bodyContentBlank_inputfecha').change(function () {
             cronograma.Reload($(this).val());
             cronograma.clickEvent();
         });



            $('#disponibilidad').hide();
            $('#bodyContentBlank_insumoLocal').change(function () {
                $('#disponibilidad').toggle();

            });
        });
    </script>
    <%}%>
</asp:Content>
