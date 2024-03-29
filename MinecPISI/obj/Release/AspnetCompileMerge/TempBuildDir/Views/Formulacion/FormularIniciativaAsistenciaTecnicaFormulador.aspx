﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Layouts/Layout2.Master" AutoEventWireup="true" CodeBehind="FormularIniciativaAsistenciaTecnicaFormulador.aspx.cs" Inherits="MinecPISI.Views.Formulacion.FormularIniciativaAsistenciaTecnicaFormulador" %>
<asp:Content ID="Content1" ContentPlaceHolderID="cssextra" runat="server">
    <link href="<%= ResolveClientUrl("~/Views/css/leaflet.css") %>" rel="stylesheet">
    <link href="<%= ResolveClientUrl("~/Views/css/leafletSearch.css") %>" rel="stylesheet">
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
        .celda:hover{
            background:rgba(78,115,223,0.5);
        }
        #spinner{
            display:inline-flex;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contenidoNavegacion" runat="server">
    
    <hr class="sidebar-divider">
    <!--#include file="~/Views/Navegacion/Formulador.html"-->
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="bodyContentBlank" runat="server">
    <div class="card shadow mb-4">
        <div class="card-header py-3">
            <h6 class="  font-weight-bold text-primary">Iniciativa de Asistencia Técnica y/o transferencia de conocimiento descrita</h6>
        </div>
        <div class="card-body">
            <nav>
              <div class="nav nav-tabs" id="nav-tab" role="tablist">
                <a class="nav-item nav-link active" id="nav-planteamiento-tab" data-toggle="tab" href="#nav-planteamiento" role="tab" aria-controls="nav-planteamiento" aria-selected="true">Planteamiento #1</a>
                <a class="nav-item nav-link" id="nav-tab-1" data-toggle="tab" href="#nav-plant" role="tab" aria-controls="nav-plant" aria-selected="false">Planteamiento #2</a>
                <a class="nav-item nav-link" id="nav-contrapartida-tab" data-toggle="tab" href="#nav-contrapartida" role="tab" aria-controls="nav-contrapartida" aria-selected="false">Contrapartida</a>
                <a class="nav-item nav-link" id="nav-matriz-tab" data-toggle="tab" href="#nav-matriz" role="tab" aria-controls="nav-matriz" aria-selected="false">Asistencia Técnica y/o transferencia de conocimiento descrita</a>
              </div>
            </nav>
            <form class="tab-content" id="nav-tabContent" method="post">
                
                  <div class="tab-pane fade show active" id="nav-planteamiento" role="tabpanel" aria-labelledby="nav-planteamiento-tab">
                      <div class="form-group mt-2">
                          <label>Planteamiento del problema u oportunidad a ser aprovechada</label>
                          <textarea class="form-control" required="required" placeholder="Ingrese el planteamiento u oportunidad" name="planteamiento" id="planteamiento" rows="4"></textarea>
                      </div>
                      <div class="form-group">
                          <label>Planteamiento descriptivo de la solución o Problema u oportunidad</label>
                          <textarea class="form-control" required="required" placeholder="Ingrese la descripción de la solución" rows="4" name="descripcionSolucion"></textarea>
                      </div>
                       <div class="form-group">
                          <label>Descripción de la Relevancia para el beneficiario del Beneficiario de la Operación y o Producto a ser afectado con el proyecto o solución</label>
                          <textarea class="form-control" required="required" placeholder="Ingrese la descripción de la revelancia de la operacion" rows="4" name="descripcionRelevancia" id="descripcionRelevancia"></textarea>
                      </div>
                      <div class="form-group">
                          <label>Incrementos esperados en ventas o mejora de la productividad del Beneficiario</label>
                          <textarea class="form-control" required="required" placeholder="Ingrese los incrementos esperados" rows="4" name="incrementosEsperados" id="incrementosEsperados"></textarea>
                      </div>
                      <div class="form-group">
                          <label>Incrementos en ventas o mejora de la productividad del Beneficiario</label>
                          <textarea class="form-control" required="required" placeholder="Ingrese los incrementos en ventas" rows="4" name="incrementosEnVentas" id="incrementosEnVentas"></textarea>
                      </div>
                      <div class="form-group">
                          <label>¿Tipo de ejecución?</label>
                         <div class="form-check form-check-inline">
                          <input class="form-check-input" type="radio" name="ejecucion" id="ejecucionSolo" value="Ejecución Solo" checked>
                          <label class="form-check-label" >
                            Ejecución Solo
                          </label>
                        </div>
                        <div class="form-check form-check-inline">
                          <input class="form-check-input" type="radio" name="ejecucion" id="ejecucionAsistida" value="Ejecución Asistida">
                          <label class="form-check-label">
                            Ejecución Asistida
                          </label>
                        </div>
                      </div>

                  </div>
                  <div class="tab-pane fade" id="nav-plant" role="tabpanel" aria-labelledby="nav-tab-1">
                      <div class="form-group mt-2">
                          <label>Metodología Sugerida</label>
                          <textarea class="form-control" required="required" placeholder="Descripción de la solución, del equipo sus componentes" name="metodologia" id="metodologia" rows="4"></textarea>
                      </div>
                      <div class="form-group mt-2">
                          <label>¿El conocimiento se encuentra disponible localmente?</label>
                          <div class="radio">
                            <label><input type="radio" name="optradio" id="optsi" checked class="radio-opt">Si</label>
                        </div>
                          <div class="radio">
                            <label><input type="radio" name="optradio" id="optno" class="radio-opt">No</label>
                        </div>
                      </div>
                      <div id="disponibilidad">
                          <div class="form-group mt-2">
                              <div class="radio">
                                <label><input type="radio" name="opt" >Debe venir alguien y atender el tema localmente </label>
                              </div>
                              <div class="radio">
                                <label><input type="radio" name="opt">Debe alguien de la iniciativa ir y recibir el entrenamiento o transferencia</label>
                              </div>
                              <div class="radio">
                                <label><input type="radio" name="opt">Mixta</label>
                              </div>
                          </div>
                          <div class="form-group mt-2 row">
                              <div class="col-md-4">
                                  <label>Duración en días</label>
                                  <input type="number" name ="duracionDias" id="duracionDias"/>
                              </div>
                              <div class="col-md-8 ">
                                  <label>Locación</label>
                                  <input disabled="disabled" required="required" type="text" id="location" name="location" />
                                  <a id="showmap" class="btn btn-success text-white">Obtener locación</a>
                              </div>
                          </div>
                          <div class="form-group mt-2">
                              <label>¿Requiere de recursos técnicos adicionales?</label>
                              <div class="radio">
                                <label><input type="radio" name="recursosAdicionales" value="true">Si </label>
                              </div>
                              <div class="radio">
                                <label><input type="radio" name="recursosAdicionales" value="false">No</label>
                              </div>
                          </div>
                          <div class="form-group mt-2">
                              <label>¿existe necesidad de conocimiento previo para que sea asimilada de forma correcta?</label>
                              <div class="radio">
                                <label><input type="radio" name="necesidadConocimiento" value="true">Si </label>
                              </div>
                              <div class="radio">
                                <label><input type="radio" name="necesidadConocimiento" value="false">No</label>
                              </div>
                          </div>
                          <div class="form-group mt-2">
                              <label>Describa los requerimientos previos</label>
                              <textarea class="form-control" required="required" name="requerimientosPrevios" id="requerimientosPrevios" rows="4"></textarea>
                          </div>
                          <div class="form-group mt-2">
                              <label>Tiene el beneficiario o cumple con los anteriores?</label>
                              <div class="radio">
                                <label><input type="radio" name="cumplimiento" value="true">Si </label>
                              </div>
                              <div class="radio">
                                <label><input type="radio" name="cumplimiento" value="false">No</label>
                              </div>
                          </div>
                          <div class="form-group mt-2">
                              <label>Componentes o insumos necesarios para lograr el impacto de la asistencia técnica y/o la transferencia de conocimiento</label>
                              <textarea class="form-control" required="required" name="componentes" id="componentes" rows="4"></textarea>
                          </div>
                          <div class="form-group mt-2">
                              <label>Efectos esperados sobre el problema</label>
                              <textarea class="form-control" required="required" name="efectosProblema" id="efectosProblema" rows="4"></textarea>
                          </div>
                          <div class="form-group mt-2">
                              <label>Efectos esperados sobre  el negocio</label>
                              <textarea class="form-control" required="required" name="efectosNegocio" id="efectosNegocio" rows="4"></textarea>
                          </div>
                          <div class="form-group mt-2">
                              <label>Incrementos esperados en el margen de utilidad</label>
                              <textarea class="form-control" required="required" name="incrementoUtilidad" id="incrementoUtilidad" rows="4"></textarea>
                          </div>
                          <div class="form-group mt-2">
                              <label>Reducir el tiempo de procesos productivos con métodos y/o tecnologías alternativas a las utilizadas en la actualidad</label>
                              <textarea class="form-control" required="required" name="reduccionTiempo" id="reduccionTiempo" rows="4"></textarea>
                          </div>
                          <div class="form-group mt-2">
                              <label>Disminuir el consumo de energía o combustible en la producción, recolección, procesos y entrega de los bienes actuales</label>
                              <textarea class="form-control" required="required" name="disminuirConsumo" id="disminuirConsumo" rows="4"></textarea>
                          </div>
                          <div class="form-group mt-2">
                              <label>Reducir el consumo de materia prima con tecnología no utilizada actualmente por el beneficiario</label>
                              <textarea class="form-control" required="required" name="reducirConsumo" id="reducirConsumo" rows="4"></textarea>
                          </div>
                          <div class="form-group mt-2">
                              <label>Otros a ser considerados</label>
                              <textarea class="form-control" required="required" name="otros" id="otros" rows="4"></textarea>
                          </div>
                     </div>
                    </div>
                  <div class="tab-pane fade" id="nav-contrapartida" role="tabpanel" aria-labelledby="nav-contrapartida-tab">
                     <div class="form-group mt-2">
                          <label>Descripción de la Contrapartida</label>
                          <textarea class="form-control" required="required" name="descripcionContrapartida" id="descripcionContrapartida"></textarea>
                      </div>
                      <div class="form-group mt-2">
                          <div class="row">
                              <label class="col-md-6">Montos de Asistencia tecnica o transferecia de conocimiento</label>
                              <input class="form-control col-md-5" type="number" step="any" required="required" name="montoAsistencia" id="montoAsistencia">
                          </div>
                      </div>
                      
                      <div class="form-group mt-2">
                          <div class="row">
                              <label class="col-md-6">Recursos Adicionales  para la  Asistencia tecnica o transferecia de conocimiento</label>
                              <input class="form-control col-md-5" type="number" step="any" required="required" name="montoRecursos" id="montoRecursos">
                          </div>
                      </div>
                      <div class="form-group mt-2">
                          <div class="row">
                              <label class="col-md-6">Otros a ser considerados</label>
                              <input class="form-control col-md-5" type="number" step="any" required="required" name="montoOtros" id="montoOtros">
                          </div>
                      </div>
                      <hr class="divider" />
                      <h4><b>Descripción de contrapartida (adecauda a los ultimos parametros aprobados) </b></h4>
                      
                      <div class="form-group mt-2">
                          <div class="row">
                              <label class="col-md-2">Descripcion del monto en especies</label>
                              <textarea class="form-control col-md-6" id="descripMontoEspecies" name="descripMontoEspecies" placeholder="Justifique el monto en especies por el beneficiario"></textarea>
                          </div>
                      </div>
                      <div class="form-group">
                          <div class="row">
                              <label class="col-md-2">Monto en Especies</label>
                              <input value="0.00" class="form-control col-md-2 monto" type="number" step="any" required="required" name="montoEspecies" id="montoEspecies">
                          </div>
                      </div>
                      <div class="form-group mt-2">
                          <div class="row">
                              <label class="col-md-2">Descripcion del monto en especies</label>
                              <textarea class="form-control col-md-6" id="descripMontoEfectivo" name="descripMontoEfectivo" placeholder="Justifique el monto en efectivo por el beneficiario"></textarea>
                          </div>
                      </div>
                      <div class="form-group">
                          <div class="row">
                              <label class="col-md-2">Monto en Efectivo</label>
                              <input value="0.00" class="form-control col-md-2 monto" type="number" step="any" required="required" name="montoEfectivo" id="montoEfectivo">
                          </div>
                      </div>
                      <div class="form-group">
                          <div class="row">
                              <label class="col-md-2">Monto Contrapartida del Beneficiario</label>
                              <input value="0.00" id="montoTotalContrapartida" class="form-control col-md-2" disabled="disabled" type="number" step="any">
                          </div>
                      </div>
                      <hr class="divider" />
                      <div class="form-group">
                          <div class="row">
                              <label class="col-md-2">Valor del Proyecto</label>
                              <input value="0.00" class="form-control col-md-2" type="number" step="any" required="required" name="montoProyecto" id="montoProyecto">
                          </div>
                      </div>
                      <div class="form-group">
                          <div class="row">
                              <label class="col-md-2">Monto a ser Cofinanciado</label>
                              <input value="0.00" class="form-control col-md-2" type="number" step="any" required="required" name="montoCofinanciado" id="montoCofinanciado">
                          </div>
                      </div>
                  </div>
                  <div class="tab-pane fade" id="nav-matriz" role="tabpanel" aria-labelledby="nav-matriz-tab">
                      <div class="mt-2 row">
                          <div class="form-group col-md-4">
                              <label>Digite la fecha de inicio</label>
                              <input type="date" class="form-control" id="inputfecha" />
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

                      <input id="semanasSelec" type="text"  class="d-none" />
                      <button class="btn btn-success" type="submit">Guardar Iniciativa</button>
                  </div>
                
              
            </form>
                
        </div>
    </div>



 <div class="modal fade" id="mapaModal" tabindex="-1" role="dialog">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Ubicación de la iniciativa</h5>
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
        <a  class="btn btn-secondary text-white" data-dismiss="modal">Cerrar</a>
      </div>
    </div>
  </div>
</div>
    
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="jsextra" runat="server">
    <script src="<%= ResolveClientUrl("~/Views/js/leaflet.js") %>"></script>
    <script src="<%= ResolveClientUrl("~/Views/js/leafletSearch.js") %>"></script>
    <script src="<%= ResolveClientUrl("~/Views/js/Cronograma.js") %>"></script>
    <script>
        $(function () {
            var headers = [
        "Asistenica Tecnica y/o Transferencia tecnologica",
        "Local",
        "Extranjero",
        "Monto Contra partida Beneficiario"
    ]
         var cronograma = new $.Cronograma($('#table-cron'), {
             'numMonth': 3,
             'dateStart':new Date(),
             'subHeaders': headers,
             //habilita las funciones de manejar eventos
             'eventos': true
         });
            
         $('#inputfecha').change(function () {
             cronograma.Reload($(this).val());
         });
         //para obtener los eventos registrados
         console.log(cronograma.getEvents());



            $('#montoEspecies').change(function () {
             $('#montoTotalContrapartida').val(parseFloat($('#montoEspecies').val()) + parseFloat($('#montoEfectivo').val()));
             });
             $('#montoEfectivo').change(function () {
                 $('#montoTotalContrapartida').val(parseFloat($('#montoEspecies').val()) + parseFloat($('#montoEfectivo').val()));
             });



            $('#disponibilidad').hide();
            $('input:radio[name="optradio"]').change(function () {
                $('#optno').is(':checked') ? $('#disponibilidad').show() : $('#disponibilidad').hide();

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
            }

            mymap.on('click', onMapClick);
            $('#guardarubicacion').click(function () {
                $('#location').val(mymap.getCenter().toString().split("LatLng")[1].replace("(", "").replace(")",""));
            })
            $('#spinner').hide();
            
             
        }

        
            
    </script>
</asp:Content>
