<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Layouts/Layout2.Master" AutoEventWireup="true" CodeBehind="DetalleIniciativaIntegral.aspx.cs" Inherits="MinecPISI.Views.Formulacion.DetalleIniciativaIntegral" %>
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
         #map2 {
            height: 300px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contenidoNavegacion" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="bodyContentBlank" runat="server">
    <form runat="server">
        <div class="col-xl-4 col-md-4 mb-4">
            <div class="card border-left-warning h-100 py-2">
                <div class="card-body">
                    <div class="row no-gutters align-items-center">
                        <div class="col mr-2">
                            <div class="text-xs font-weight-bold text-primary mb-1">Formulación</div>
                            <div class="h5 mb-0 font-weight-bold text-gray-800">
                                <asp:LinkButton Text="Descargar" runat="server" ID="lnk_factura" OnClick="lnk_factura_Click" />

                            </div>
                        </div>
                        <div class="col-auto">
                            <i class="fa fa-file-invoice fa-2x text-gray-300"></i>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <asp:ScriptManager ID="ScriptManager1" runat="server" />
        <asp:UpdatePanel ID="UpdatePanel2" runat="server">
            <ContentTemplate>
                <div class="card shadow mb-4">
                    <div class="card-header py-3">
                        <h6 class="  font-weight-bold text-primary">Iniciativa de Innovación Integral</h6>
                                                    <a href="#" id="genPDF" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm"><i class="fas fa-download fa-sm text-white-50"></i> Generar Reporte</a>

                    </div>
                    <div class="card-body">
                        <nav>
                          <div class="nav nav-tabs" id="nav-tab" role="tablist">
                            <a class="nav-item nav-link active" id="plant-tab"  data-toggle="tab" href="#nav-planteamiento" role="tab" aria-controls="nav-planteamiento" aria-selected="true">Planteamiento</a>
                            <a class="nav-item nav-link"  data-toggle="tab" href="#nav-adopcion" role="tab"  aria-selected="false">Adopcion de Técnologia</a>
                            <a class="nav-item nav-link"  data-toggle="tab" href="#nav-asistencia" role="tab"  aria-selected="false">Asistencia Técnica y/o Transferencia de conocimiento</a>
                            <a class="nav-item nav-link"  data-toggle="tab" href="#nav-innovacion" role="tab"  aria-selected="false">Innovación Técnologica</a>
                            <a class="nav-item nav-link"  data-toggle="tab" href="#nav-contrapartida" role="tab"  aria-selected="false">Contrapartida</a>
                            <a class="nav-item nav-link"  data-toggle="tab" href="#nav-cronograma" role="tab" aria-selected="false">Cronograma</a>
                          </div>
                        </nav>
                        <div class="tab-content" id="nav-tabContent">
                            <div class="tab-pane fade show active" id="nav-planteamiento" role="tabpanel" aria-labelledby="plant-tab">
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
                            <div class="tab-pane fade" id="nav-adopcion">
                                <div class="form-group mt-2">
                                  <label>Adopción o incorporación Tecnológica</label>
                                  <asp:TextBox runat="server" class="form-control"  placeholder="Descripción de la solución, del equipo sus componentes" name="adopcionTec" ID="adopcionTec" TextMode="multiline"  Rows="5"/>
                              </div>
                              <div class="form-group">
                                  <label>Efectos esperados sobre el problema</label>
                                  <asp:TextBox runat="server" class="form-control"  placeholder="Como modifica o acciona sobre el problema" name="efectosEsperados" ID="efectosEsperados" TextMode="multiline"  Rows="5"/>
                              </div>
                              <div class="form-group">
                                  <label>Efectos esperados sobre  el negocio</label>
                                  <asp:TextBox runat="server" class="form-control"  placeholder="Como modifica o acciona sobre el problema" name="efectosEsperadosNegocio" ID="efectosEsperadosNegocio" TextMode="multiline"  Rows="5"/>
                              </div>
                              <div class="form-group">
                                  <label>Justificación de la tecnología propuesta</label>
                                  <asp:TextBox runat="server" class="form-control"  placeholder="Justifique la tecnología propuesta" name="justificacion" ID="justificacion" TextMode="multiline"  Rows="5"/>
                              </div>
                                <div class="form-group mt-2">
                                  <label>Incrementos esperados en el margen de utilidad</label>
                                  <asp:TextBox runat="server" class="form-control"  placeholder="Ingrese los margenes esperados de utilidad" name="margenUtilidad" ID="margenUtilidad" TextMode="multiline"  Rows="5"/>
                              </div>
                              <div class="form-group mt-2">
                                  <label>Incremento en la producción actual</label>
                                  <asp:TextBox runat="server" class="form-control"  placeholder="Ingrese el incremento de la produccion actual" name="incrementoProduccion" ID="incrementoProduccion" TextMode="multiline"  Rows="5"/>
                              </div>
                              <div class="form-group mt-2">
                                  <label>¿Como se colocara el nuevo volumen en el mercado?</label>
                                  <asp:TextBox runat="server" class="form-control"  placeholder="Explique como se colocara el nuevo volumen en el mercado" name="nuevoVolumen" ID="nuevoVolumen" TextMode="multiline"  Rows="5"/>
                              </div>
                              <div class="form-group mt-2">
                                  <label>Disminuir el consumo de energía o combustible en la producción, recolección, procesos y entrega de los bienes actuales</label>
                                  <asp:TextBox runat="server" class="form-control"  placeholder="Explique como disminuir los consumos o procesos actuales" name="disminucionConsumo" ID="disminucionConsumo" TextMode="multiline"  Rows="5"/>
                              </div>
                              <div class="form-group mt-2">
                                  <label>Reducir el tiempo de procesos productivos con métodos y/o tecnologías alternativas a las utilizadas en la actualidad</label>
                                  <asp:TextBox runat="server" class="form-control"  placeholder="Explique como disminuir los consumos o procesos actuales"  ID="reducirTiempo" TextMode="multiline"  Rows="5"/>
                              </div>
                              <div class="form-group mt-2">
                                  <label>Reducir el consumo de materia prima con tecnología no utilizada actualmente por el beneficiario.</label>
                                  <asp:TextBox runat="server" class="form-control"  placeholder="Explique como disminuir los consumos de materia prima" name="disminucionConsumoMateria" ID="disminucionConsumoMateria" TextMode="multiline"  Rows="5"/>
                              </div>
                              <div class="form-group mt-2">
                                  <label>Otros a ser considerados </label>
                                  <asp:TextBox runat="server" class="form-control"  placeholder="Agregue informacion adicional" name="otrosInfo" ID="otrosInfo" TextMode="multiline"  Rows="5"/>
                              </div>
                              <div class="form-group mt-2">
                                  <label>Componentes o tecnología Adicional  necesaria para el funcionamiento de la tecnología</label>
                                  <asp:TextBox runat="server" class="form-control"  placeholder="Componentes o tecnología adicional" name="componentesAdicionales" ID="componentesAdicionales" TextMode="multiline"  Rows="5"/>
                              </div>
                            </div>
                            <div class="tab-pane fade" id="nav-asistencia">
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
                            <div class="tab-pane fade" id="nav-innovacion">
                                <div class="form-group mt-2">
                              <label>Producto</label>
                              <asp:TextBox runat="server" cssClass="form-control" ID="producto" TextMode="multiline"  Rows="5"></asp:TextBox>
                          </div>
                      <div class="form-group mt-2">
                              <label>Proceso</label>
                              <asp:TextBox runat="server" cssClass="form-control" ID="proceso" TextMode="multiline"  Rows="5"></asp:TextBox>
                          </div>
                      <div class="form-group mt-2">
                              <label>Modelo de comercialización</label>
                              <asp:TextBox runat="server" cssClass="form-control" ID="modelo" TextMode="multiline"  Rows="5"></asp:TextBox>
                          </div>
                      

                      <div class="form-group mt-2">
                          <label>¿Los insumos para el desarrollo se encuentra disponible localmente?</label>
                          <div >
                            <asp:CheckBox runat="server" ID="insumoLocal" Checked="false"  cssClass="col-md-1 form-control mr-2 text-white"/>
                        </div>
                      </div>
                      <div class="form-group mt-2">
                              <label>Describa genericamente los insumos necesarios</label>
                              <asp:TextBox runat="server" cssClass="form-control" ID="generic" TextMode="multiline"  Rows="5"></asp:TextBox>
                          </div>
                       <div class="form-group mt-2">
                          <label>¿el proyecto requerira de insumos de parte del  beneficiario?</label>
                          <div >
                            <asp:CheckBox runat="server" ID="insumoBene" Checked="false"  cssClass="col-md-1 form-control mr-2 text-white"/>
                        </div>
                      </div>
                       <div class="form-group mt-2">
                              <label>Describalos</label>
                              <asp:TextBox runat="server" cssClass="form-control" ID="insumoDescrip" TextMode="multiline"  Rows="5"></asp:TextBox>
                          </div>
                      <div id="disponibilidad2">
                          <div class="form-group mt-2">
                              <div>
                                <label>Debe venir alguien y atender el tema localmente </label>
                                   <asp:CheckBox runat="server" ID="atenderLocal2" Checked="false" cssClass="col-md-1 form-control mr-2 text-white"/>
                              </div>
                              <div>
                                <label>Debe alguien de la iniciativa ir y recibir el entrenamiento o transferencia</label>
                                   <asp:CheckBox runat="server" ID="entrenamiento2" Checked="false"  cssClass="col-md-1 form-control"/>
                              </div>
                              <div>
                                <label>Mixta</label>
                                  <asp:CheckBox runat="server" ID="mixta2" Checked="false"  cssClass="col-md-1 form-control mr-2 text-white"/>
                              </div>
                          </div>
                          <div class="form-group mt-2 row">
                              <div class="col-md-4">
                                  <label>Duración en días</label>
                                  <asp:TextBox runat="server" cssClass="form-control " type="number" ID="dias2" />
                              </div>
                              <div class="col-md-8 ">
                                  <label>Locación</label>
                                  <asp:TextBox runat="server" disabled="disabled" ID="location2" cssClass="d-none"/>
                                  <div id="map2"></div>
                              </div>
                          </div>
                          <div class="form-group mt-2">
                              <label>¿Requiere de recursos técnicos adicionales?</label>
                              <asp:CheckBox runat="server" ID="recursos2" Checked="false"  cssClass="col-md-1 form-control"/>
                          </div>
                          <div class="form-group mt-2">
                              <label>¿existe necesidad de conocimiento previo para que sea asimilada de forma correcta?</label>
                              <asp:CheckBox runat="server" ID="necesidadC2" Checked="false"  cssClass="col-md-1 form-control"/>
                          </div>
                          <div class="form-group mt-2">
                              <label>Describa los requerimientos previos</label>
                              <asp:TextBox runat="server" cssClass="form-control" ID="previos" TextMode="multiline"  Rows="5"></asp:TextBox>
                          </div>
                          <div class="form-group mt-2">
                              <label>Tiene el beneficiario o cumple con los anteriores?</label>
                              <asp:CheckBox runat="server" ID="cumple2" Checked="false"  cssClass="col-md-1 form-control"/>
                          </div>
                          <div class="form-group mt-2">
                              <label>Componentes o insumos necesarios para lograr el impacto de la innovacion o desarrollo tecnologico </label>
                              <asp:TextBox runat="server" cssClass="form-control" ID="compo2" TextMode="multiline"  Rows="5"/>
                          </div>
                          <div class="form-group mt-2">
                              <label>Efectos esperados sobre el problema</label>
                              <asp:TextBox runat="server" cssClass="form-control" ID="efectPro2" TextMode="multiline"  Rows="5"/>
                          </div>
                          <div class="form-group mt-2">
                              <label>Efectos esperados sobre  el negocio</label>
                             <asp:TextBox runat="server" cssClass="form-control" ID="efectNeg2" TextMode="multiline"  Rows="5"/>
                          </div>
                          <div class="form-group mt-2">
                              <label>Incrementos esperados en el margen de utilidad</label>
                             <asp:TextBox runat="server" cssClass="form-control" ID="margen2" TextMode="multiline"  Rows="5"/>
                          </div>
                          <div class="form-group mt-2">
                              <label>Reducir el tiempo de procesos productivos con métodos y/o tecnologías alternativas a las utilizadas en la actualidad</label>
                                <asp:TextBox runat="server" cssClass="form-control" ID="reduc2" TextMode="multiline"  Rows="5"/>
                          </div>
                          <div class="form-group mt-2">
                              <label>Disminuir el consumo de energía o combustible en la producción, recolección, procesos y entrega de los bienes actuales</label>
                              <asp:TextBox runat="server" cssClass="form-control" ID="dismConsu2" TextMode="multiline"  Rows="5"/>
                          </div>
                          <div class="form-group mt-2">
                              <label>Reducir el consumo de materia prima con tecnología no utilizada actualmente por el beneficiario</label>
                              <asp:TextBox runat="server" cssClass="form-control" ID="reduCon2" TextMode="multiline"  Rows="5"/>
                          </div>
                          <div class="form-group mt-2">
                              <label>Otros a ser considerados</label>
                              <asp:TextBox runat="server" cssClass="form-control" ID="otros2" TextMode="multiline"  Rows="5"/>
                          </div>
                     </div>
                            </div>
                            <div class="tab-pane fade" id="nav-contrapartida" role="tabpanel" aria-labelledby="nav-contrapartida">
                             <div class="form-group mt-2">
                                  <label>Descripción de la Contrapartida</label>
                                  <asp:TextBox runat="server" cssClass="form-control" ID="descripcionContrapartida" TextMode="multiline"  Rows="5"/>
                              </div>
                                <div class="form-group mt-2">
                                  <div class="row">
                                      <label class="col-md-6">Monto de Adopción o incorporación tecnológica</label>
                                      <asp:TextBox runat="server" cssClass="form-control col-md-5 fondepro" type="number" step="any"  name="montoAdopcion" ID="montoAdopcion"/>
                                  </div>
                              </div>
                              <div class="form-group mt-2">
                                  <div class="row">
                                      <label class="col-md-6">Montos de componentes acciones y/o tecnología Adicional  necesaria para la Adquisición, internación, instalación y/o el funcionamiento de la tecnología</label>
                                      <asp:TextBox runat="server" cssClass="form-control col-md-5 fondepro" type="number" step="any"  name="montoComponentes" ID="montoComponentes"/>
                                  </div>
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
                                      <asp:TextBox runat="server" cssClass="form-control col-md-5 fondepro" type="number" step="any" ID="recursosAsistencia"/>
                                  </div>
                              </div>
                              <div class="form-group mt-2">
                                  <div class="row">
                                      <label class="col-md-6">Innovacion de Técnologias</label>
                                      <asp:TextBox runat="server" cssClass="form-control col-md-5 fondepro" type="number" step="any" ID="montoInnovacion"/>
                                  </div>
                              </div>
                      
                              <div class="form-group mt-2">
                                  <div class="row">
                                      <label class="col-md-6">Recursos Adicionales  para el Proyecto de innovación técnologica</label>
                                      <asp:TextBox runat="server" cssClass="form-control col-md-5 fondepro" type="number" step="any" ID="recursosInnovacion"/>
                                  </div>
                              </div>

                              <div class="form-group mt-2">
                                  <div class="row">
                                      <label class="col-md-6">Otros a ser considerados</label>
                                      <asp:TextBox runat="server" cssClass="form-control col-md-5 fondepro" type="number" step="any" ID="montoOtros"/>
                                  </div>
                              </div>
                              <hr class="divider" />
                      <h4><b>Descripción de Contrapartida</b></h4>
                      
                      <div class="form-group mt-2">
                          <div class="row">
                              <label class="col-md-2">Descripcion del monto en especies</label>
                              <asp:TextBox runat="server" TextMode="multiline"  Rows="5" cssClass="form-control col-md-6" ID="descripMontoEspecies" name="descripMontoEspecies" placeholder="Justifique el monto en especies por el beneficiario"/>
                          </div>
                      </div>
                      <div class="form-group">
                          <div class="row">
                              <label class="col-md-2">Monto en Especies</label>
                              <asp:TextBox runat="server" cssClass="form-control col-md-5" value="0.00" class="form-control col-md-2 contrapartida" type="number" step="any"  name="montoEspecies" ID="montoEspecies"/>
                          </div>
                      </div>
                      <div class="form-group mt-2">
                          <div class="row">
                              <label class="col-md-2">Descripcion del monto en efectivo</label>
                              <asp:TextBox runat="server" TextMode="multiline"  Rows="5" cssClass="form-control col-md-6" ID="descripMontoEfectivo" name="descripMontoEfectivo" placeholder="Justifique el monto en efectivo por el beneficiario"/>
                          </div>
                      </div>
                      <div class="form-group">
                          <div class="row">
                              <label class="col-md-2">Monto en Efectivo</label>
                              <asp:TextBox runat="server" value="0.00" cssClass="form-control col-md-2 contrapartida" type="number" step="any"  name="montoEfectivo" ID="montoEfectivo"/>
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
                            <div class="tab-pane fade" id="nav-cronograma" role="tabpanel" aria-labelledby="nav-cronograma">
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
    <script src="<%= ResolveClientUrl("~/Views/js/Cronograma.js") %>"></script>
    <script src="<%= ResolveClientUrl("~/Views/js/leaflet.js") %>"></script>
    <script src="<%= ResolveClientUrl("~/Views/js/leafletSearch.js") %>"></script>
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
        $(function () {
             var psum = 0;
         for (let i = 0; i < $('.fondepro').length; i++) {
             psum += parseFloat($('.fondepro')[i].value);
         }
         $('#montoFondepro').val(psum.toFixed(2));
         $('#montoTotalContrapartida').val((psum / 9).toFixed(2));
         $('#montoproyecto').val((psum / 0.9).toFixed(2));
            var headers = [
                "Adopción o incorporación Tecnológica",
                "Recursos Adicionales  para la  Adopcion",
                "Asistenica Tecnica y/o Transferencia tecnologica",
                "Recursos Adicionales  para la  Asistencia tecnica o transferecia de conocimiento",
                "Proyecto de innovacion tecnologica",
                "Recursos Adicionales  para la  Innovacion",
                "otros a ser considerados",
                "Monto Contra partida Beneficiario"
            ];
            var cronograma = new $.Cronograma($('#table-cron'), {
                 'numMonth': 6,
                 'dateStart':new Date(),
                 'subHeaders': headers,
                 //habilita las funciones de manejar eventos
                 'eventos': false,
                 'data': $('#bodyContentBlank_semanasSelec').val()
             });
            
             cronograma.Reload($('#bodyContentBlank_inputfecha').val());

             $('#disponibilidad').hide();
            if ($('#bodyContentBlank_conocLocal').prop('checked')) {
                $('#disponibilidad').show();
            }
           

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

              $('#disponibilidad').hide();
            if ($('#bodyContentBlank_insumoLocal').prop('checked')) {
                $('#disponibilidad').show();
             }
              var mymap2 = L.map('map2').setView([$('#bodyContentBlank_location2').val().split(",")[0],$('#bodyContentBlank_location2').val().split(",")[1]], 15);
            
            L.tileLayer('https://api.tiles.mapbox.com/v4/{id}/{z}/{x}/{y}.png?access_token={accessToken}',
                {
                    attribution: 'Map data &copy; <a href="https://www.openstreetmap.org/">OpenStreetMap</a> contributors, <a href="https://creativecommons.org/licenses/by-sa/2.0/">CC-BY-SA</a>, Imagery © <a href="https://www.mapbox.com/">Mapbox</a>',
                    maxZoom: 18,
                    id: 'mapbox.streets',
                    accessToken: 'pk.eyJ1IjoiZmpkZXZlbCIsImEiOiJjanVlZ2liZ2QwMzlsNDlwazJvcHJ6a2JuIn0.twQkqaob2K4OxNQzygJzaA'
                }).addTo(mymap2);
            	mymap2.addControl( new L.Control.Search({
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
            popup.setLatLng(L.latLng($('#bodyContentBlank_location2').val().split(",")[0],$('#bodyContentBlank_location2').val().split(",")[1]))
                    .setContent("Iniciativa localizada!")
                    .openOn(mymap2);
        });
    </script>
</asp:Content>
