<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Layouts/Layout2.Master" AutoEventWireup="true" CodeBehind="DetalleIniciativaAsistencia.aspx.cs" Inherits="MinecPISI.Views.Formulacion.DetalleIniciativaAsistencia" %>
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
<asp:Content ID="Content3" ContentPlaceHolderID="bodyContentBlank" runat="server">
    <form  runat="server" >
                <asp:ScriptManager ID="ScriptManager1" runat="server" />

                <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                    <ContentTemplate>
    <div class="card shadow mb-4">
        <div class="card-header py-3">
            <h6 class="  font-weight-bold text-primary">Iniciativa de Asistencia Técnica y/o transferencia de conocimiento descrita</h6>
                                        <a href="#" id="genPDF" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm"><i class="fas fa-download fa-sm text-white-50"></i> Generar Reporte</a>

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
            <div class="tab-content" id="nav-tabContent">
                
                  <div class="tab-pane fade show active" id="nav-planteamiento" role="tabpanel" aria-labelledby="nav-planteamiento-tab">
                      <div class="form-group mt-2">
                          <label>Planteamiento del problema u oportunidad a ser aprovechada</label>
                          <asp:TextBox runat="server" class="form-control"  placeholder="Ingrese el planteamiento u oportunidad" ID="planteamiento" TextMode="multiline"  Rows="5"/>
                      </div>
                      <div class="form-group">
                          <label>Planteamiento descriptivo de la solución o Problema u oportunidad</label>
                          <asp:TextBox runat="server" class="form-control"  placeholder="Ingrese la descripción de la solución" TextMode="multiline"  Rows="5" ID="descripcionSolucion"/>
                      </div>
                       <div class="form-group">
                          <label>Descripción de la Relevancia para el beneficiario del Beneficiario de la Operación y o Producto a ser afectado con el proyecto o solución</label>
                          <asp:TextBox runat="server" class="form-control"  placeholder="Ingrese la descripción de la revelancia de la operacion" TextMode="multiline"  Rows="5" ID="descripcionRelevancia"/>
                      </div>
                      <div class="form-group">
                          <label>Incrementos esperados en ventas o mejora de la productividad del Beneficiario</label>
                          <asp:TextBox runat="server" class="form-control"  placeholder="Ingrese los incrementos esperados" TextMode="multiline"  Rows="5" ID="incrementosEsperados"/>
                      </div>
                      <div class="form-group">
                          <label>Incrementos en ventas o mejora de la productividad del Beneficiario</label>
                          <asp:TextBox runat="server" class="form-control"  placeholder="Ingrese los incrementos en ventas" TextMode="multiline"  Rows="5" name="incrementosEnVentas" ID="incrementosEnVentas"/>
                      </div>
                      <div class="form-group">
                          <label>¿Tipo de ejecución?</label>
                         <div class="form-check form-check-inline">
                          <asp:RadioButton runat="server" cssClass="form-check-input" GroupName="ejecucion" ID="ejecucionSolo" value="Ejecución Solo" Checked="true" ></asp:RadioButton>
                          <label class="form-check-label" >
                            Ejecución Solo
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
                          <label>Metodología Sugerida</label>
                          <asp:TextBox runat="server" cssClass="form-control"  placeholder="Descripción de la solución, del equipo sus componentes" name="metodologia" ID="metodologia" TextMode="multiline"  Rows="5"/>
                      </div>
                      <div class="form-group mt-2">
                          <label>¿El conocimiento se encuentra disponible localmente?</label>
                          <div >
                            <asp:CheckBox runat="server" ID="conocLocal" Checked="false"  cssClass="col-md-1 form-control mr-2 text-white"/>
                        </div>
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
                                  <div id="map"> </div>
                                  <asp:TextBox runat="server" disabled="disabled" ID="location" cssClass="d-none"/>
                              </div>
                          </div>
                          <div class="form-group mt-2">
                              <label>¿Requiere de recursos técnicos adicionales?</label>
                              <asp:CheckBox runat="server" ID="recursosAdicionales" Checked="false"  cssClass="col-md-1 form-control"/>
                          </div>
                          <div class="form-group mt-2">
                              <label>¿existe necesidad de conocimiento previo para que sea asimilada de forma correcta?</label>
                              <asp:CheckBox runat="server" ID="conocPrevio" Checked="false"  cssClass="col-md-1 form-control"/>
                          </div>
                          <div class="form-group mt-2">
                              <label>Describa los requerimientos previos</label>
                              <asp:TextBox runat="server" cssClass="form-control" ID="requerimientosPrevios" TextMode="multiline"  Rows="5"></asp:TextBox>
                          </div>
                          <div class="form-group mt-2">
                              <label>Tiene el beneficiario o cumple con los anteriores?</label>
                              <asp:CheckBox runat="server" ID="cumple" Checked="false"  cssClass="col-md-1 form-control"/>
                          </div>
                          <div class="form-group mt-2">
                              <label>Componentes o insumos necesarios para lograr el impacto de la asistencia técnica y/o la transferencia de conocimiento</label>
                              <asp:TextBox runat="server" cssClass="form-control" ID="componentes" TextMode="multiline"  Rows="5"/>
                          </div>
                          <div class="form-group mt-2">
                              <label>Efectos esperados sobre el problema</label>
                              <asp:TextBox runat="server" cssClass="form-control" ID="efectosProblema" TextMode="multiline"  Rows="5"/>
                          </div>
                          <div class="form-group mt-2">
                              <label>Efectos esperados sobre  el negocio</label>
                             <asp:TextBox runat="server" cssClass="form-control" ID="efectosNegocio" TextMode="multiline"  Rows="5"/>
                          </div>
                          <div class="form-group mt-2">
                              <label>Incrementos esperados en el margen de utilidad</label>
                             <asp:TextBox runat="server" cssClass="form-control" ID="incrementoUtilidad" TextMode="multiline"  Rows="5"/>
                          </div>
                          <div class="form-group mt-2">
                              <label>Reducir el tiempo de procesos productivos con métodos y/o tecnologías alternativas a las utilizadas en la actualidad</label>
                                <asp:TextBox runat="server" cssClass="form-control" ID="reduccionTiempo" TextMode="multiline"  Rows="5"/>
                          </div>
                          <div class="form-group mt-2">
                              <label>Disminuir el consumo de energía o combustible en la producción, recolección, procesos y entrega de los bienes actuales</label>
                              <asp:TextBox runat="server" cssClass="form-control" ID="disminuirConsumo" TextMode="multiline"  Rows="5"/>
                          </div>
                          <div class="form-group mt-2">
                              <label>Reducir el consumo de materia prima con tecnología no utilizada actualmente por el beneficiario</label>
                              <asp:TextBox runat="server" cssClass="form-control" ID="reducirConsumo" TextMode="multiline"  Rows="5"/>
                          </div>
                          <div class="form-group mt-2">
                              <label>Otros a ser considerados</label>
                              <asp:TextBox runat="server" cssClass="form-control" ID="otros" TextMode="multiline"  Rows="5"/>
                          </div>
                     </div>
                    </div>
                   <div class="tab-pane fade" id="nav-contrapartida" role="tabpanel" aria-labelledby="nav-contrapartida-tab">
                     <h4 class="mt-2"><b>FONDEPRO</b></h4>
                     <div class="form-group mt-2">
                          <label>Descripción de la Contrapartida</label>
                          <asp:TextBox runat="server" cssClass="form-control" ID="descripcionContrapartida" TextMode="multiline"  Rows="5"/>
                      </div>
                      <div class="form-group mt-2">
                          <div class="row">
                              <label class="col-md-6">Montos de Asistencia tecnica o transferecia de conocimiento</label>
                              <asp:TextBox runat="server" cssClass="form-control col-md-5 fondepro" type="number" step="any" ID="montoAsistencia"/>
                          </div>
                      </div>
                      
                      <div class="form-group mt-2">
                          <div class="row">
                              <label class="col-md-6">Recursos Adicionales  para la  Asistencia tecnica o transferecia de conocimiento</label>
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
                              <label class="col-md-2">Descripcion del monto en especies</label>
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
                              <label class="col-md-2">Descripcion del monto en efectivo</label>
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
                              <input value="0,00" ID="montoTotalContrapartida" class="form-control col-md-2" disabled="disabled" type="number" step="any">
                          </div>
                      </div>
                      <hr class="divider" />
                      <h4><b>Total Proyecto</b></h4>
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
                               <asp:TextBox runat="server" type="date" cssClass="form-control" ID="inputfecha" />
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
<asp:TextBox runat="server" ID="semanasSelec" CssClass="d-none" />
                                <% if (usuario.NOMBRE_ROL.ToUpper() == "BENEFICIARIO" && BLL.Acciones.A_PROYECTO.ObtenerProyectoPorId(idProyecto).ID_ESTADO_PROCESO == BLL.Acciones.A_ESTADO_PROCESO.ObtenerPorCodigo("PY02").ID_ESTADO_PROCESO)
                                    { %>
                                <asp:Button runat="server" ID="btnguardar" CssClass="btn btn-success" OnClick="Btn_aprobar_Click" Text="Aceptar Iniciativa" />

                                <%} %>
                                <% if (usuario.NOMBRE_ROL.ToUpper() == "CONSULTOR" && BLL.Acciones.A_PROYECTO.ObtenerProyectoPorId(idProyecto).ID_ESTADO_PROCESO == BLL.Acciones.A_ESTADO_PROCESO.ObtenerPorCodigo("PY03").ID_ESTADO_PROCESO)
                                    { %>
                                <asp:Button runat="server" ID="Button1" CssClass="btn btn-success" OnClick="contrapartidaSi_Click" Text="Verificar Contrapartida" />
                                <%}
                                    if (usuario.NOMBRE_ROL.ToUpper() == "COORDINADOR" && BLL.Acciones.A_PROYECTO.ObtenerProyectoPorId(idProyecto).ID_ESTADO_PROCESO == BLL.Acciones.A_ESTADO_PROCESO.ObtenerPorCodigo("PY08").ID_ESTADO_PROCESO)
                                    { %>
                                <asp:Button runat="server" ID="ratificarBtn" CssClass="btn btn-success" OnClick="ratificarBtn_Click" Text="Ratificar Proyecto" />
                                <%} %>
                                <button type="button" class="btn btn-warning" data-toggle="modal" data-target="#exampleModal">Observar Iniciativa</button>

                            </div>

                        </div>
                    </div>
                </div>
                <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                  <div class="modal-dialog" role="document">
                    <div class="modal-content">
                      <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Añadir Observación</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                          <span aria-hidden="true">&times;</span>
                        </button>
                      </div>
                      <div class="modal-body">
                          <div class="form-group">
                              <label>Descripción de la iniciativa</label>
                            <asp:TextBox runat="server" ID="detalleIniciativa" CssClass="form-control" ></asp:TextBox>

                          </div>

                      </div>
                      <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        <asp:Button runat="server" ID="ObservarIniciativa" Text="Observar Iniciativa" CssClass="btn btn-warning" OnClick="ObservarIniciativa_Click" />

                      </div>
                    </div>
                  </div>
                </div>


 <div  id="toPdf" class="d-none">
        <%= BLL.Acciones.A_GENERADOR_DOCUMENTOS.generarDetalleIniciativa(idProyecto,detalle) %>
    </div>
    <div id="elementH"></div>
    </ContentTemplate>
        </asp:UpdatePanel>
    </form>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="jsextra" runat="server">
    <script src="<%= ResolveClientUrl("~/Views/js/leaflet.js") %>"></script>
    <script src="<%= ResolveClientUrl("~/Views/js/leafletSearch.js") %>"></script>
    <script src="<%= ResolveClientUrl("~/Views/js/Cronograma.js") %>"></script>
    <script src="<%= ResolveClientUrl("~/Views/js/jspdf.js") %>"></script>
    <script src="<%= ResolveClientUrl("~/Views/js/html2canvas.min.js") %>"></script>
    <script>
        $('#genPDF').click(() => {
            var doc = new jsPDF();
           var elementHTML = $('#toPdf').html();
            var specialElementHandlers = {
                '#elementH': function (element, renderer) {
                    return true;
                }
            };
            margins = {
                top: 10,
                bottom: 10,
                left: 25,
                width: 522
            };
            doc.fromHTML(elementHTML,margins.left, // x coord
            margins.top, { // y coord
                'width': margins.width, // max width of content on PDF
                'elementHandlers': specialElementHandlers
            });

            // Save the PDF
            doc.save('DetalleIniciativa<%=idProyecto%>-<%= DateTime.Now.Day %><%= DateTime.Now.Month %><%= DateTime.Now.Year %>.pdf');
        });
    </script>
    <script>
       
        $(() => {
            $('#disponibilidad').hide();
            if ($('#bodyContentBlank_conocLocal').prop('checked')) {
                $('#disponibilidad').show();
            }
           var psum = 0;
         for (let i = 0; i < $('.fondepro').length; i++) {
             psum += parseFloat($('.fondepro')[i].value);
         }
         $('#montoFondepro').val(psum.toFixed(2));
         $('#montoTotalContrapartida').val((psum / 9).toFixed(2));
         $('#montoproyecto').val((psum / 0.9).toFixed(2));
          var headers = [
                        "Asistenica Tecnica y/o Transferencia tecnologica",
                        "Recursos Adicionales  para la  Asistencia tecnica o transferecia de conocimiento",
                        "Otros a ser considerados",
                        "Monto Contra partida Beneficiario"
                    ];
         var cronograma = new $.Cronograma($('#table-cron'), {
             'numMonth': 3,
             'dateStart':new Date(),
             'subHeaders': headers,
             //habilita las funciones de manejar eventos
             'eventos': false,
             'data': $('#bodyContentBlank_semanasSelec').val()
        });
            cronograma.Reload($('#bodyContentBlank_inputfecha').val());
            var mymap = L.map('map').setView([$('#bodyContentBlank_location').val().split(",")[0],$('#bodyContentBlank_location').val().split(",")[1]], 15);
            
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
            popup.setLatLng(L.latLng($('#bodyContentBlank_location').val().split(",")[0],$('#bodyContentBlank_location').val().split(",")[1]))
                    .setContent("Iniciativa localizada")
                    .openOn(mymap);
        });
    </script>
</asp:Content>
