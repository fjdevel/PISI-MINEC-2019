<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Layouts/Layout2.Master" AutoEventWireup="true" CodeBehind="MonitorearIniciativa.aspx.cs" Inherits="MinecPISI.Views.Formulacion.MonitorearIniciativa" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cssextra" runat="server">
    <style>
        .disabled {
        pointer-events: none;
        cursor: default;
    }
</style>
    <link href="<%= ResolveClientUrl(" ~/Views/css/leaflet.css") %>" rel="stylesheet">
    <style>
        .tablec{
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
          #map3 {
            height: 300px;
        }
           #map4 {
            height: 300px;
        }
            #map5 {
            height: 300px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contenidoNavegacion" runat="server">

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="bodyContentBlank" runat="server">
    <div class="text-white p-2 text-right mr-5 fixed-top mt-5 row pr-5">
        <div class="col" data-toggle="tooltip" data-placement="top" title="Detalle de la iniciativa" ><i class="btn btn-info far fa-3x fw fa-file-alt shadow" data-toggle="modal" data-target="#DetalleModal"></i></div>
    </div>
    <div class="card shadow mb-4">
        <div class="card-header py-3">
            <h5 class="font-weight-bold text-primary">Aprobación de la Iniciativa</h5>
        </div>
        <form runat="server" method="post">
            <div class="card-body">
                <h6 class="  font-weight-bold text-secondary  mb-4">Comité evaluador de FONDEPRO</h6>

                <div class="table-responsive">
                    <asp:GridView ID="GVMonitorearComite" runat="server" AutoGenerateColumns="False" DataKeyNames="IdCampo"
                        CssClass="table table-bordered" OnRowDataBound="GVMonitorearComite_RowDataBound" ShowFooter="true">
                        <Columns>
                            <asp:BoundField HeaderText="Criterio" DataField="Campo" />
                            <asp:BoundField HeaderText="Puntaje Máximo" DataField="PuntajeMaximo" />

                            <asp:TemplateField HeaderText="Puntaje">
                                <ItemTemplate>
                                    <asp:TextBox ID="TxtPuntaje" ReadOnly="true" data-campo='<%#Eval("IdCampo") %>'
                                        required="true" CssClass="textboxper" runat="server" max='<%# Eval("PuntajeMaximo") %>'
                                        min="0" Text='<%# Bind("Puntaje") %>' old='<%# Eval("Puntaje") %>'></asp:TextBox>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </div>

            </div>
            <div class="text-center mt-4 mb-4">

                <asp:LinkButton id="BtnAprobar" runat="server" cssClass="btn btn-success btn-icon-split mb-1" type="submit"
                    disabled="disabled" UseSubmitBehavior="True" OnClick="AprobarClick">
                    <span class="icon text-white-50">
                        <i class="fas fa-check"></i>
                    </span>
                    <span class="text">Aprobar Iniciativa</span>
                </asp:LinkButton>
                <a class="btn btn-warning btn-icon-split text-white mb-1" data-toggle="modal" data-target="#RecomendacionesModal">
                    <span class="icon text-white-50">
                        <i class="fas fa-info-circle"></i>
                    </span>
                    <span class="text">Hacer Observaciones</span>
                </a>
            </div>
            <div class="card-body">
                <h6 class="  font-weight-bold text-secondary  mb-4">Evaluaciones realizadas</h6>
                <div class="table-responsive">
                    <asp:GridView ID="GVEvaluadores" runat="server" AutoGenerateColumns="False" CssClass="table table-bordered"
                        OnRowDataBound="GVEvaluadores_OnRowDataBound">
                        <Columns>

                            <asp:BoundField HeaderText="Evaluador" DataField="NOMBRE" />

                            <asp:TemplateField HeaderText="Revisar evaluación" ItemStyle-HorizontalAlign="Center">
                                <ItemStyle CssClass="text-center" />
                                <ItemTemplate>
                                    <a href="<% Response.Write(HttpContext.Current.Request.ApplicationPath);%>/Formulacion/Evaluar/Iniciativa/<%# Eval("IdProyecto")%>/Persona/<%# Eval("IdPersona")%>" class="btn btn-info btn-circle">
                                        <i class="fa fa-info-circle"></i>
                                    </a>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </div>
            </div>

            <!--Modal hacer observaciones -->
            <div class="modal fade" id="RecomendacionesModal" tabindex="-1" role="dialog" aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">Hacer Observaciones</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <div class="form-group">
                                <label>Observaciones</label>
                                <asp:TextBox ID="txt_observa" TextMode="MultiLine" CssClass="form-control" placeholder="Ingresa las Observaciones"
                                    runat="server" MaxLength="200" />
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
                            <asp:Button Text="Guardar" runat="server" CssClass="btn btn-success" ID="btn_hacerObservaciones"
                                OnClick="btn_hacerObservaciones_OnClick" CausesValidation="False" />
                        </div>
                    </div>
                </div>
            </div>



            <div class="modal fade bd-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true" id="DetalleModal">
      <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <%-- panel para adopcion --%>
            <asp:Panel runat="server" ID="panelAdopcion" Visible="false">
                <div class="card shadow mb-4">
                    <div class="card-header py-3">
                        <h6 class="  font-weight-bold text-primary">Formulacion de iniciativa</h6>
                    </div>
                    <div class="card-body">
                        <nav>
                            <div class="nav nav-tabs" id="nav-tab" role="tablist">
                                <a class="nav-item nav-link active" id="nav-planteamiento-tab" data-toggle="tab" href="#nav-planteamiento" role="tab" aria-controls="nav-planteamiento" aria-selected="true">Planteamiento #1</a>
                                <a class="nav-item nav-link" id="nav-adopcion-tab" data-toggle="tab" href="#nav-adopcion" role="tab" aria-controls="nav-adopcion" aria-selected="false">Planteamiento #2</a>
                                <a class="nav-item nav-link" id="nav-adopcion-2-tab" data-toggle="tab" href="#nav-adopcion-2" role="tab" aria-controls="nav-adopcion-2" aria-selected="false">Planteamiento #3</a>
                                <a class="nav-item nav-link" id="nav-contrapartida-tab" data-toggle="tab" href="#nav-contrapartida" role="tab" aria-controls="nav-contrapartida" aria-selected="false">Contrapartida</a>
                                <a class="nav-item nav-link" id="nav-matriz-tab" data-toggle="tab" href="#nav-matriz" role="tab" aria-controls="nav-matriz" aria-selected="false">Adopción o incorporación Tecnológica</a>
                            </div>
                        </nav>
                        <div class="tab-content" id="nav-tabContent">

                            <div class="tab-pane fade show active" id="nav-planteamiento" role="tabpanel" aria-labelledby="nav-planteamiento-tab">
                                <div class="form-group mt-2">
                                    <label>Planteamiento del problema u oportunidad a ser aprovechada</label>
                                    <asp:TextBox runat="server" class="form-control" placeholder="Ingrese el planteamiento u oportunidad" ID="planteamiento" TextMode="multiline" Rows="5" />
                                </div>
                                <div class="form-group">
                                    <label>Planteamiento descriptivo de la solución o Problema u oportunidad</label>
                                    <asp:TextBox runat="server" class="form-control" placeholder="Ingrese la descripción de la solución" TextMode="multiline" Rows="5" ID="descripcionSolucion" />
                                </div>
                                <div class="form-group">
                                    <label>Descripción de la Relevancia para el beneficiario del Beneficiario de la Operación y o Producto a ser afectado con el proyecto o solución</label>
                                    <asp:TextBox runat="server" class="form-control" placeholder="Ingrese la descripción de la revelancia de la operacion" TextMode="multiline" Rows="5" ID="descripcionRelevancia" />
                                </div>
                                <div class="form-group">
                                    <label>Incrementos esperados en ventas o mejora de la productividad del Beneficiario</label>
                                    <asp:TextBox runat="server" class="form-control" placeholder="Ingrese los incrementos esperados" TextMode="multiline" Rows="5" ID="incrementosEsperados" />
                                </div>
                                <div class="form-group">
                                    <label>Incrementos en ventas o mejora de la productividad del Beneficiario</label>
                                    <asp:TextBox runat="server" class="form-control" placeholder="Ingrese los incrementos en ventas" TextMode="multiline" Rows="5" name="incrementosEnVentas" ID="incrementosEnVentas" />
                                </div>
                                <div class="form-group">
                                    <label>¿Tipo de ejecución?</label>
                                    <div class="form-check form-check-inline">
                                        <asp:RadioButton runat="server" CssClass="form-check-input" GroupName="ejecucion" ID="ejecucionSolo" value="Ejecución Solo" Checked="true"></asp:RadioButton>
                                        <label class="form-check-label">
                                            Ejecución Solo
                                        </label>
                                    </div>
                                    <div class="form-check form-check-inline">
                                        <asp:RadioButton runat="server" CssClass="form-check-input" GroupName="ejecucion" ID="ejecucionAsistida" value="Ejecución Asistida" Checked="false"></asp:RadioButton>
                                        <label class="form-check-label">
                                            Ejecución Asistida
                                        </label>
                                    </div>
                                </div>

                            </div>
                            <div class="tab-pane fade" id="nav-adopcion" role="tabpanel" aria-labelledby="nav-adopcion-tab">
                                <div class="form-group mt-2">
                                    <label>Adopción o incorporación Tecnológica</label>
                                    <asp:TextBox runat="server" class="form-control" placeholder="Descripción de la solución, del equipo sus componentes" name="adopcionTec" ID="adopcionTec" TextMode="multiline" Rows="5" />
                                </div>
                                <div class="form-group">
                                    <label>Efectos esperados sobre el problema</label>
                                    <asp:TextBox runat="server" class="form-control" placeholder="Como modifica o acciona sobre el problema" name="efectosEsperados" ID="efectosEsperados" TextMode="multiline" Rows="5" />
                                </div>
                                <div class="form-group">
                                    <label>Efectos esperados sobre  el negocio</label>
                                    <asp:TextBox runat="server" class="form-control" placeholder="Como modifica o acciona sobre el problema" name="efectosEsperadosNegocio" ID="efectosEsperadosNegocio" TextMode="multiline" Rows="5" />
                                </div>
                                <div class="form-group">
                                    <label>Justificación de la tecnología propuesta</label>
                                    <asp:TextBox runat="server" class="form-control" placeholder="Justifique la tecnología propuesta" name="justificacion" ID="justificacion" TextMode="multiline" Rows="5" />
                                </div>
                            </div>
                            <div class="tab-pane fade" id="nav-adopcion-2" role="tabpanel" aria-labelledby="nav-adopcion-2-tab">
                                <div class="form-group mt-2">
                                    <label>Incrementos esperados en el margen de utilidad</label>
                                    <asp:TextBox runat="server" class="form-control" placeholder="Ingrese los margenes esperados de utilidad" name="margenUtilidad" ID="margenUtilidad" TextMode="multiline" Rows="5" />
                                </div>
                                <div class="form-group mt-2">
                                    <label>Incremento en la producción actual</label>
                                    <asp:TextBox runat="server" class="form-control" placeholder="Ingrese el incremento de la produccion actual" name="incrementoProduccion" ID="incrementoProduccion" TextMode="multiline" Rows="5" />
                                </div>
                                <div class="form-group mt-2">
                                    <label>¿Como se colocara el nuevo volumen en el mercado?</label>
                                    <asp:TextBox runat="server" class="form-control" placeholder="Explique como se colocara el nuevo volumen en el mercado" name="nuevoVolumen" ID="nuevoVolumen" TextMode="multiline" Rows="5" />
                                </div>
                                <div class="form-group mt-2">
                                    <label>Disminuir el consumo de energía o combustible en la producción, recolección, procesos y entrega de los bienes actuales</label>
                                    <asp:TextBox runat="server" class="form-control" placeholder="Explique como disminuir los consumos o procesos actuales" name="disminucionConsumo" ID="disminucionConsumo" TextMode="multiline" Rows="5" />
                                </div>
                                <div class="form-group mt-2">
                                    <label>Reducir el tiempo de procesos productivos con métodos y/o tecnologías alternativas a las utilizadas en la actualidad</label>
                                    <asp:TextBox runat="server" class="form-control" placeholder="Explique como disminuir los consumos o procesos actuales" ID="reducirTiempo" TextMode="multiline" Rows="5" />
                                </div>
                                <div class="form-group mt-2">
                                    <label>Reducir el consumo de materia prima con tecnología no utilizada actualmente por el beneficiario.</label>
                                    <asp:TextBox runat="server" class="form-control" placeholder="Explique como disminuir los consumos de materia prima" name="disminucionConsumoMateria" ID="disminucionConsumoMateria" TextMode="multiline" Rows="5" />
                                </div>
                                <div class="form-group mt-2">
                                    <label>Otros a ser considerados </label>
                                    <asp:TextBox runat="server" class="form-control" placeholder="Agregue informacion adicional" name="otrosInfo" ID="otrosInfo" TextMode="multiline" Rows="5" />
                                </div>
                                <div class="form-group mt-2">
                                    <label>Componentes o tecnología Adicional  necesaria para el funcionamiento de la tecnología</label>
                                    <asp:TextBox runat="server" class="form-control" placeholder="Componentes o tecnología adicional" name="componentesAdicionales" ID="componentesAdicionales" TextMode="multiline" Rows="5" />
                                </div>
                            </div>
                            <div class="tab-pane fade" id="nav-contrapartida" role="tabpanel" aria-labelledby="nav-contrapartida-tab">
                                <h4 class="mt-2"><b>FONDEPRO</b></h4>
                                <div class="form-group mt-2">
                                    <label>Descripción de fondos FONDEPRO</label>
                                    <asp:TextBox runat="server" CssClass="form-control" placeholder="Descripción de montos cofinanciados por FONDEPRO" name="descripcionfondepro" ID="descripcionfondepro" TextMode="multiline" Rows="5" />
                                </div>
                                <div class="form-group mt-2">
                                    <div class="row">
                                        <label class="col-md-6">Monto de Adopción o incorporación tecnológica</label>
                                        <asp:TextBox runat="server" CssClass="form-control col-md-5 fondepro" type="number" step="any" name="montoAdopcion" ID="montoAdopcion" />
                                    </div>
                                </div>
                                <div class="form-group mt-2">
                                    <div class="row">
                                        <label class="col-md-6">Montos de componentes acciones y/o tecnología Adicional  necesaria para la Adquisición, internación, instalación y/o el funcionamiento de la tecnología</label>
                                        <asp:TextBox runat="server" CssClass="form-control col-md-5 fondepro" type="number" step="any" name="montoComponentes" ID="montoComponentes" />
                                    </div>
                                </div>
                                <div class="form-group mt-2">
                                    <div class="row">
                                        <label class="col-md-6">Otros a ser considerados</label>
                                        <asp:TextBox runat="server" type="number" step="any" CssClass="form-control col-md-5 fondepro" name="montoOtros" ID="montoOtros" />
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="row">
                                        <label class="col-md-2">Monto total de FONDEPRO</label>
                                        <input value="0.00" class="form-control col-md-2" type="number" step="any" disabled="disabled" id="montoFondepro">
                                    </div>
                                </div>
                                <hr class="divider" />
                                <h4><b>Descripción de Contrapartida</b></h4>

                                <div class="form-group mt-2">
                                    <div class="row">
                                        <label class="col-md-2">Descripcion del monto en especies</label>
                                        <asp:TextBox runat="server" TextMode="multiline" Rows="5" CssClass="form-control col-md-6" ID="descripMontoEspecies" name="descripMontoEspecies" placeholder="Justifique el monto en especies por el beneficiario" />
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="row">
                                        <label class="col-md-2">Monto en Especies</label>
                                        <asp:TextBox runat="server" CssClass="form-control col-md-5" value="0.00" class="form-control col-md-2 contrapartida" type="number" step="any" name="montoEspecies" ID="montoEspecies" />
                                    </div>
                                </div>
                                <div class="form-group mt-2">
                                    <div class="row">
                                        <label class="col-md-2">Descripcion del monto en efectivo</label>
                                        <asp:TextBox runat="server" TextMode="multiline" Rows="5" CssClass="form-control col-md-6 " ID="descripMontoEfectivo" name="descripMontoEfectivo" placeholder="Justifique el monto en efectivo por el beneficiario" />
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="row">
                                        <label class="col-md-2">Monto en Efectivo</label>
                                        <asp:TextBox runat="server" value="0.00" CssClass="form-control col-md-2 contrapartida" type="number" step="any" name="montoEfectivo" ID="montoEfectivo" />
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="row">
                                        <label class="col-md-2">Monto Contrapartida del Beneficiario</label>
                                        <input value="0,00" id="montoTotalContrapartida" class="form-control col-md-2" disabled="disabled" type="number" step="any">
                                    </div>
                                </div>
                                <hr class="divider" />
                                <h4><b>Total Proyecto</b></h4>
                                <div class="form-group">
                                    <div class="row">
                                        <label class="col-md-2">Monto total del proyecto</label>
                                        <input value="0,00" class="form-control col-md-2" type="number" step="any" id="montoproyecto" disabled="disabled">
                                    </div>
                                </div>

                            </div>
                            <div class="tab-pane fade" id="nav-matriz" role="tabpanel" aria-labelledby="nav-matriz-tab">
                                <div class="mt-2 row">
                                    <div class="form-group col-md-4">
                                        <label>Digite la fecha de inicio</label>
                                        <asp:TextBox runat="server" type="date" CssClass="form-control" ID="inputfecha" />
                                    </div>
                                </div>
                                <div class="row mt-3">
                                    <div class="col">
                                        <div class="row">
                                            <p class="col-md-6">La tecnología se encuentra disponible localmente</p>
                                            <asp:CheckBox runat="server" ID="checkCron" CssClass="col-md-1 form-control mr-2 text-white" Checked="true" />
                                        </div>

                                        <div class="row mb-5" style="overflow-x: auto">
                                            <table class="col tablec" id="table-cron">
                                            </table>
                                        </div>
                                    </div>
                                </div>

                                <asp:TextBox runat="server" ID="semanasSelec" CssClass="d-none" />

                            </div>

                        </div>
                    </div>
                </div>
            </asp:Panel>

            <%-- panel para asistencia --%>
            <asp:Panel runat="server" ID="panelAsistenica" Visible="false">
                <div class="card shadow mb-4">
        <div class="card-header py-3">
            <h6 class="  font-weight-bold text-primary">Iniciativa de Asistencia Técnica y/o transferencia de conocimiento descrita</h6>
        </div>
        <div class="card-body">
            <nav>
              <div class="nav nav-tabs" id="nav-tab2" role="tablist">
                <a class="nav-item nav-link active" id="nav-planteamiento-tab2" data-toggle="tab" href="#nav-planteamiento2" role="tab" aria-controls="nav-planteamiento" aria-selected="true">Planteamiento #1</a>
                <a class="nav-item nav-link" id="nav-tab-1" data-toggle="tab" href="#nav-plant" role="tab" aria-controls="nav-plant" aria-selected="false">Planteamiento #2</a>
                <a class="nav-item nav-link" id="nav-contrapartida-tab2" data-toggle="tab" href="#nav-contrapartida2" role="tab" aria-controls="nav-contrapartida" aria-selected="false">Contrapartida</a>
                <a class="nav-item nav-link" id="nav-matriz-tab2" data-toggle="tab" href="#nav-matriz2" role="tab" aria-controls="nav-matriz" aria-selected="false">Asistencia Técnica y/o transferencia de conocimiento descrita</a>
              </div>
            </nav>
            <div class="tab-content" id="nav-tabContent2">
                
                  <div class="tab-pane fade show active" id="nav-planteamiento2" role="tabpanel" aria-labelledby="nav-planteamiento-tab">
                      <div class="form-group mt-2">
                          <label>Planteamiento del problema u oportunidad a ser aprovechada</label>
                          <asp:TextBox runat="server" class="form-control"  placeholder="Ingrese el planteamiento u oportunidad" ID="planteamiento2" TextMode="multiline"  Rows="5"/>
                      </div>
                      <div class="form-group">
                          <label>Planteamiento descriptivo de la solución o Problema u oportunidad</label>
                          <asp:TextBox runat="server" class="form-control"  placeholder="Ingrese la descripción de la solución" TextMode="multiline"  Rows="5" ID="descripcionSolucion2"/>
                      </div>
                       <div class="form-group">
                          <label>Descripción de la Relevancia para el beneficiario del Beneficiario de la Operación y o Producto a ser afectado con el proyecto o solución</label>
                          <asp:TextBox runat="server" class="form-control"  placeholder="Ingrese la descripción de la revelancia de la operacion" TextMode="multiline"  Rows="5" ID="descripcionRelevancia2"/>
                      </div>
                      <div class="form-group">
                          <label>Incrementos esperados en ventas o mejora de la productividad del Beneficiario</label>
                          <asp:TextBox runat="server" class="form-control"  placeholder="Ingrese los incrementos esperados" TextMode="multiline"  Rows="5" ID="incrementosEsperados2"/>
                      </div>
                      <div class="form-group">
                          <label>Incrementos en ventas o mejora de la productividad del Beneficiario</label>
                          <asp:TextBox runat="server" class="form-control"  placeholder="Ingrese los incrementos en ventas" TextMode="multiline"  Rows="5" name="incrementosEnVentas" ID="incrementosEnVentas2"/>
                      </div>
                      <div class="form-group">
                          <label>¿Tipo de ejecución?</label>
                         <div class="form-check form-check-inline">
                          <asp:RadioButton runat="server" cssClass="form-check-input" GroupName="ejecucion" ID="ejecucionSolo2" value="Ejecución Solo" Checked="true" ></asp:RadioButton>
                          <label class="form-check-label" >
                            Ejecución Solo
                          </label>
                        </div>
                        <div class="form-check form-check-inline">
                          <asp:RadioButton runat="server" cssClass="form-check-input" GroupName="ejecucion" ID="ejecucionAsistida2" value="Ejecución Asistida" Checked="false"></asp:RadioButton>
                          <label class="form-check-label">
                            Ejecución Asistida
                          </label>
                        </div>
                      </div>
                  </div>


                  <div class="tab-pane fade" id="nav-plant" role="tabpanel" aria-labelledby="nav-tab-1">
                      <div class="form-group mt-2">
                          <label>Metodología Sugerida</label>
                          <asp:TextBox runat="server" cssClass="form-control"  placeholder="Descripción de la solución, del equipo sus componentes" name="metodologia" ID="metodologia2" TextMode="multiline"  Rows="5"/>
                      </div>
                      <div class="form-group mt-2">
                          <label>¿El conocimiento se encuentra disponible localmente?</label>
                          <div >
                            <asp:CheckBox runat="server" ID="conocLocal2" Checked="false"  cssClass="col-md-1 form-control mr-2 text-white"/>
                        </div>
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
                                  <asp:TextBox runat="server" cssClass="form-control " type="number" ID="duracionDias2" />
                              </div>
                              <div class="col-md-8 ">
                                  <label>Locación</label>
                                  <div id="map2"> </div>
                                  <asp:TextBox runat="server" disabled="disabled" ID="location2" cssClass="d-none"/>
                              </div>
                          </div>
                          <div class="form-group mt-2">
                              <label>¿Requiere de recursos técnicos adicionales?</label>
                              <asp:CheckBox runat="server" ID="recursosAdicionales2" Checked="false"  cssClass="col-md-1 form-control"/>
                          </div>
                          <div class="form-group mt-2">
                              <label>¿existe necesidad de conocimiento previo para que sea asimilada de forma correcta?</label>
                              <asp:CheckBox runat="server" ID="conocPrevio2" Checked="false"  cssClass="col-md-1 form-control"/>
                          </div>
                          <div class="form-group mt-2">
                              <label>Describa los requerimientos previos</label>
                              <asp:TextBox runat="server" cssClass="form-control" ID="requerimientosPrevios2" TextMode="multiline"  Rows="5"></asp:TextBox>
                          </div>
                          <div class="form-group mt-2">
                              <label>Tiene el beneficiario o cumple con los anteriores?</label>
                              <asp:CheckBox runat="server" ID="cumple2" Checked="false"  cssClass="col-md-1 form-control"/>
                          </div>
                          <div class="form-group mt-2">
                              <label>Componentes o insumos necesarios para lograr el impacto de la asistencia técnica y/o la transferencia de conocimiento</label>
                              <asp:TextBox runat="server" cssClass="form-control" ID="componentes2" TextMode="multiline"  Rows="5"/>
                          </div>
                          <div class="form-group mt-2">
                              <label>Efectos esperados sobre el problema</label>
                              <asp:TextBox runat="server" cssClass="form-control" ID="efectosProblema2" TextMode="multiline"  Rows="5"/>
                          </div>
                          <div class="form-group mt-2">
                              <label>Efectos esperados sobre  el negocio</label>
                             <asp:TextBox runat="server" cssClass="form-control" ID="efectosNegocio2" TextMode="multiline"  Rows="5"/>
                          </div>
                          <div class="form-group mt-2">
                              <label>Incrementos esperados en el margen de utilidad</label>
                             <asp:TextBox runat="server" cssClass="form-control" ID="incrementoUtilidad2" TextMode="multiline"  Rows="5"/>
                          </div>
                          <div class="form-group mt-2">
                              <label>Reducir el tiempo de procesos productivos con métodos y/o tecnologías alternativas a las utilizadas en la actualidad</label>
                                <asp:TextBox runat="server" cssClass="form-control" ID="reduccionTiempo2" TextMode="multiline"  Rows="5"/>
                          </div>
                          <div class="form-group mt-2">
                              <label>Disminuir el consumo de energía o combustible en la producción, recolección, procesos y entrega de los bienes actuales</label>
                              <asp:TextBox runat="server" cssClass="form-control" ID="disminuirConsumo2" TextMode="multiline"  Rows="5"/>
                          </div>
                          <div class="form-group mt-2">
                              <label>Reducir el consumo de materia prima con tecnología no utilizada actualmente por el beneficiario</label>
                              <asp:TextBox runat="server" cssClass="form-control" ID="reducirConsumo2" TextMode="multiline"  Rows="5"/>
                          </div>
                          <div class="form-group mt-2">
                              <label>Otros a ser considerados</label>
                              <asp:TextBox runat="server" cssClass="form-control" ID="otros2" TextMode="multiline"  Rows="5"/>
                          </div>
                     </div>
                    </div>
                   <div class="tab-pane fade" id="nav-contrapartida2" role="tabpanel" aria-labelledby="nav-contrapartida-tab">
                     <h4 class="mt-2"><b>FONDEPRO</b></h4>
                     <div class="form-group mt-2">
                          <label>Descripción de la Contrapartida</label>
                          <asp:TextBox runat="server" cssClass="form-control" ID="descripcionContrapartida2" TextMode="multiline"  Rows="5"/>
                      </div>
                      <div class="form-group mt-2">
                          <div class="row">
                              <label class="col-md-6">Montos de Asistencia tecnica o transferecia de conocimiento</label>
                              <asp:TextBox runat="server" cssClass="form-control col-md-5 fondepro" type="number" step="any" ID="montoAsistencia2"/>
                          </div>
                      </div>
                      
                      <div class="form-group mt-2">
                          <div class="row">
                              <label class="col-md-6">Recursos Adicionales  para la  Asistencia tecnica o transferecia de conocimiento</label>
                              <asp:TextBox runat="server" cssClass="form-control col-md-5 fondepro" type="number" step="any" ID="montoRecursos2"/>
                          </div>
                      </div>
                      <div class="form-group mt-2">
                          <div class="row">
                              <label class="col-md-6">Otros a ser considerados</label>
                              <asp:TextBox runat="server" cssClass="form-control col-md-5 fondepro" type="number" step="any" ID="montoOtros2"/>
                          </div>
                      </div>
                       <div class="form-group">
                          <div class="row">
                              <label class="col-md-2">Monto total de FONDEPRO</label>
                              <input value="0.00" class="form-control col-md-2" type="number" step="any" disabled="disabled" ID="montoFondepro2">
                          </div>
                      </div>
                      <hr class="divider" />
                      <h4><b>Descripción de contrapartida (adecauda a los ultimos parametros aprobados) </b></h4>
                      
                      <div class="form-group mt-2">
                          <div class="row">
                              <label class="col-md-2">Descripcion del monto en especies</label>
                              <asp:TextBox runat="server" TextMode="multiline"  Rows="5" cssClass="form-control col-md-6" ID="descripMontoEspecies2"  placeholder="Justifique el monto en especies por el beneficiario" />
                          </div>
                      </div>
                      <div class="form-group">
                          <div class="row">
                              <label class="col-md-2">Monto en Especies</label>
                              <asp:TextBox runat="server" cssClass="form-control col-md-5 contrapartida" type="number" step="any" ID="montoEspecies2"/>
                          </div>
                      </div>
                      <div class="form-group mt-2">
                          <div class="row">
                              <label class="col-md-2">Descripcion del monto en efectivo</label>
                               <asp:TextBox runat="server" TextMode="multiline"  Rows="5" cssClass="form-control col-md-6" ID="descripMontoEfectivo2" placeholder="Justifique el monto en efectivo por el beneficiario" />
                          </div>
                      </div>
                      <div class="form-group">
                          <div class="row">
                              <label class="col-md-2">Monto en Efectivo</label>
                            <asp:TextBox runat="server" cssClass="form-control col-md-5 contrapartida" type="number" step="any" ID="montoEfectivo2"/>
                          </div>
                      </div>
                      <div class="form-group">
                          <div class="row">
                              <label class="col-md-2">Monto Contrapartida del Beneficiario</label>
                              <input value="0,00" ID="montoTotalContrapartida2" class="form-control col-md-2" disabled="disabled" type="number" step="any">
                          </div>
                      </div>
                      <hr class="divider" />
                      <h4><b>Total Proyecto</b></h4>
                      <div class="form-group">
                          <div class="row">
                              <label class="col-md-2">Monto total del proyecto</label>
                              <input value="0,00" class="form-control col-md-2" type="number" step="any"  ID="montoproyecto2" disabled="disabled">
                          </div>
                      </div>
                  </div>
                  <div class="tab-pane fade" id="nav-matriz2" role="tabpanel" aria-labelledby="nav-matriz-tab">
                      <div class="mt-2 row">
                          <div class="form-group col-md-4">
                              <label>Digite la fecha de inicio</label>
                               <asp:TextBox runat="server" type="date" cssClass="form-control" ID="inputfecha2" />
                          </div>
                      </div>
                      <div class="row mt-3">
                        <div class="col">
                            
                            <div class="row mb-5" style="overflow-x:auto">
                                <table class="col" id="table-cron2">
                                </table>
                            </div>
                        </div>
                    </div>
                    <asp:TextBox runat="server" ID="semanasSelec2" CssClass="d-none" />
                            </div>

                        </div>
                    </div>
                </div>
            </asp:Panel>

            <%-- panel para innovacion --%>
            <asp:Panel runat="server" ID="Innovacion" Visible="false">
                <div class="card shadow mb-4">
        <div class="card-header py-3">
            <h6 class="  font-weight-bold text-primary">Iniciativa de Proyecto de Innovación y o desarrollo Tecnológico</h6>
        </div>
        <div class="card-body">
            <nav>
              <div class="nav nav-tabs" id="nav-tab3" role="tablist">
                <a class="nav-item nav-link active" id="nav-planteamiento-tab3" data-toggle="tab" href="#nav-planteamiento3" role="tab" aria-controls="nav-planteamiento" aria-selected="true">Planteamiento #1</a>
                <a class="nav-item nav-link" id="nav-tab-3" data-toggle="tab" href="#nav-plant3" role="tab" aria-controls="nav-plant" aria-selected="false">Planteamiento #2</a>
                <a class="nav-item nav-link" id="nav-contrapartida-tab3" data-toggle="tab" href="#nav-contrapartida3" role="tab" aria-controls="nav-contrapartida" aria-selected="false">Contrapartida</a>
                <a class="nav-item nav-link" id="nav-matriz-tab3" data-toggle="tab" href="#nav-matriz3" role="tab" aria-controls="nav-matriz" aria-selected="false">Iniciativa de Proyecto de Innovación y o desarrollo Tecnológico</a>
              </div>
            </nav>
            <div class="tab-content" id="nav-tabContent3">
                
                  <div class="tab-pane fade show active" id="nav-planteamiento3" role="tabpanel" aria-labelledby="nav-planteamiento-tab">
                      <div class="form-group mt-2">
                          <label>Planteamiento del problema u oportunidad a ser aprovechada</label>
                          <asp:TextBox runat="server" class="form-control"  placeholder="Ingrese el planteamiento u oportunidad" ID="planteamiento3" TextMode="multiline"  Rows="5"/>
                      </div>
                      <div class="form-group">
                          <label>Planteamiento descriptivo de la solución o Problema u oportunidad</label>
                          <asp:TextBox runat="server" class="form-control"  placeholder="Ingrese la descripción de la solución" TextMode="multiline"  Rows="5" ID="descripcionSolucion3"/>
                      </div>
                       <div class="form-group">
                          <label>Descripción de la Relevancia para el beneficiario del Beneficiario de la Operación y o Producto a ser afectado con el proyecto o solución</label>
                          <asp:TextBox runat="server" class="form-control"  placeholder="Ingrese la descripción de la revelancia de la operacion" TextMode="multiline"  Rows="5" ID="descripcionRelevancia3"/>
                      </div>
                      <div class="form-group">
                          <label>Incrementos esperados en ventas o mejora de la productividad del Beneficiario</label>
                          <asp:TextBox runat="server" class="form-control"  placeholder="Ingrese los incrementos esperados" TextMode="multiline"  Rows="5" ID="incrementosEsperados3"/>
                      </div>
                      <div class="form-group">
                          <label>Incrementos en ventas o mejora de la productividad del Beneficiario</label>
                          <asp:TextBox runat="server" class="form-control"  placeholder="Ingrese los incrementos en ventas" TextMode="multiline"  Rows="5" name="incrementosEnVentas" ID="incrementosEnVentas3"/>
                      </div>
                      <div class="form-group">
                          <label>¿Tipo de ejecución?</label>
                         <div class="form-check form-check-inline">
                          <asp:RadioButton runat="server" cssClass="form-check-input" GroupName="ejecucion" ID="ejecucionSolo3" value="Ejecución Solo" Checked="true" ></asp:RadioButton>
                          <label class="form-check-label" >
                            Ejecución Solo
                          </label>
                        </div>
                        <div class="form-check form-check-inline">
                          <asp:RadioButton runat="server" cssClass="form-check-input" GroupName="ejecucion" ID="ejecucionAsistida3" value="Ejecución Asistida" Checked="false"></asp:RadioButton>
                          <label class="form-check-label">
                            Ejecución Asistida
                          </label>
                        </div>
                      </div>
                  </div>


                  <div class="tab-pane fade" id="nav-plant3" role="tabpanel" aria-labelledby="nav-tab-1">
                      <div class="form-group mt-2">
                              <label>Producto</label>
                              <asp:TextBox runat="server" cssClass="form-control" ID="producto3" TextMode="multiline"  Rows="5"></asp:TextBox>
                          </div>
                      <div class="form-group mt-2">
                              <label>Proceso</label>
                              <asp:TextBox runat="server" cssClass="form-control" ID="proceso3" TextMode="multiline"  Rows="5"></asp:TextBox>
                          </div>
                      <div class="form-group mt-2">
                              <label>Modelo de comercialización</label>
                              <asp:TextBox runat="server" cssClass="form-control" ID="modelo3" TextMode="multiline"  Rows="5"></asp:TextBox>
                          </div>
                      

                      <div class="form-group mt-2">
                          <label>¿Los insumos para el desarrollo se encuentra disponible localmente?</label>
                          <div >
                            <asp:CheckBox runat="server" ID="insumoLocal3" Checked="false"  cssClass="col-md-1 form-control mr-2 text-white"/>
                        </div>
                      </div>
                      <div class="form-group mt-2">
                              <label>Describa genericamente los insumos necesarios</label>
                              <asp:TextBox runat="server" cssClass="form-control" ID="generic3" TextMode="multiline"  Rows="5"></asp:TextBox>
                          </div>
                       <div class="form-group mt-2">
                          <label>¿el proyecto requerira de insumos de parte del  beneficiario?</label>
                          <div >
                            <asp:CheckBox runat="server" ID="insumoBene3" Checked="false"  cssClass="col-md-1 form-control mr-2 text-white"/>
                        </div>
                      </div>
                       <div class="form-group mt-2">
                              <label>Describalos</label>
                              <asp:TextBox runat="server" cssClass="form-control" ID="insumoDescrip3" TextMode="multiline"  Rows="5"></asp:TextBox>
                          </div>
                      <div id="disponibilidad3">
                          <div class="form-group mt-2">
                              <div>
                                <label>Debe venir alguien y atender el tema localmente </label>
                                   <asp:CheckBox runat="server" ID="atenderLocal3" Checked="false" cssClass="col-md-1 form-control mr-2 text-white"/>
                              </div>
                              <div>
                                <label>Debe alguien de la iniciativa ir y recibir el entrenamiento o transferencia</label>
                                   <asp:CheckBox runat="server" ID="entrenamiento3" Checked="false"  cssClass="col-md-1 form-control"/>
                              </div>
                              <div>
                                <label>Mixta</label>
                                  <asp:CheckBox runat="server" ID="mixta3" Checked="false"  cssClass="col-md-1 form-control mr-2 text-white"/>
                              </div>
                          </div>
                          <div class="form-group mt-2 row">
                              <div class="col-md-4">
                                  <label>Duración en días</label>
                                  <asp:TextBox runat="server" cssClass="form-control " type="number" ID="duracionDias3" />
                              </div>
                              <div class="col-md-8 ">
                                  <label>Locación</label>
                                  <div id="map3"> </div>
                                  <asp:TextBox runat="server" disabled="disabled" ID="location3" cssClass="d-none"/>
                              </div>
                          </div>
                          <div class="form-group mt-2">
                              <label>¿Requiere de recursos técnicos adicionales?</label>
                              <asp:CheckBox runat="server" ID="recursosAdicionales3" Checked="false"  cssClass="col-md-1 form-control"/>
                          </div>
                          <div class="form-group mt-2">
                              <label>¿existe necesidad de conocimiento previo para que sea asimilada de forma correcta?</label>
                              <asp:CheckBox runat="server" ID="conocPrevio3" Checked="false"  cssClass="col-md-1 form-control"/>
                          </div>
                          <div class="form-group mt-2">
                              <label>Describa los requerimientos previos</label>
                              <asp:TextBox runat="server" cssClass="form-control" ID="requerimientosPrevios3" TextMode="multiline"  Rows="5"></asp:TextBox>
                          </div>
                          <div class="form-group mt-2">
                              <label>Tiene el beneficiario o cumple con los anteriores?</label>
                              <asp:CheckBox runat="server" ID="cumple3" Checked="false"  cssClass="col-md-1 form-control"/>
                          </div>
                          <div class="form-group mt-2">
                              <label>Componentes o insumos necesarios para lograr el impacto de la asistencia técnica y/o la transferencia de conocimiento</label>
                              <asp:TextBox runat="server" cssClass="form-control" ID="componentes3" TextMode="multiline"  Rows="5"/>
                          </div>
                          <div class="form-group mt-2">
                              <label>Efectos esperados sobre el problema</label>
                              <asp:TextBox runat="server" cssClass="form-control" ID="efectosProblema3" TextMode="multiline"  Rows="5"/>
                          </div>
                          <div class="form-group mt-2">
                              <label>Efectos esperados sobre  el negocio</label>
                             <asp:TextBox runat="server" cssClass="form-control" ID="efectosNegocio3" TextMode="multiline"  Rows="5"/>
                          </div>
                          <div class="form-group mt-2">
                              <label>Incrementos esperados en el margen de utilidad</label>
                             <asp:TextBox runat="server" cssClass="form-control" ID="incrementoUtilidad3" TextMode="multiline"  Rows="5"/>
                          </div>
                          <div class="form-group mt-2">
                              <label>Reducir el tiempo de procesos productivos con métodos y/o tecnologías alternativas a las utilizadas en la actualidad</label>
                                <asp:TextBox runat="server" cssClass="form-control" ID="reduccionTiempo3" TextMode="multiline"  Rows="5"/>
                          </div>
                          <div class="form-group mt-2">
                              <label>Disminuir el consumo de energía o combustible en la producción, recolección, procesos y entrega de los bienes actuales</label>
                              <asp:TextBox runat="server" cssClass="form-control" ID="disminuirConsumo3" TextMode="multiline"  Rows="5"/>
                          </div>
                          <div class="form-group mt-2">
                              <label>Reducir el consumo de materia prima con tecnología no utilizada actualmente por el beneficiario</label>
                              <asp:TextBox runat="server" cssClass="form-control" ID="reducirConsumo3" TextMode="multiline"  Rows="5"/>
                          </div>
                          <div class="form-group mt-2">
                              <label>Otros a ser considerados</label>
                              <asp:TextBox runat="server" cssClass="form-control" ID="otros3" TextMode="multiline"  Rows="5"/>
                          </div>
                     </div>
                    </div>
                  <div class="tab-pane fade" id="nav-contrapartida3" role="tabpanel" aria-labelledby="nav-contrapartida-tab">
                     <h4 class="mt-2"><b>FONDEPRO</b></h4>
                     <div class="form-group mt-2">
                          <label>Descripción de la Contrapartida</label>
                          <asp:TextBox runat="server" cssClass="form-control" ID="descripcionContrapartida3" TextMode="multiline"  Rows="5"/>
                      </div>
                      <div class="form-group mt-2">
                          <div class="row">
                              <label class="col-md-6">Monto de Proyecto de Innovación y o desarrollo Tecnológico</label>
                              <asp:TextBox runat="server" cssClass="form-control col-md-5 fondepro" type="number" step="any" ID="montoAsistencia3"/>
                          </div>
                      </div>
                      
                      <div class="form-group mt-2">
                          <div class="row">
                              <label class="col-md-6">Recursos Adicionales  para la  Asistencia tecnica o transferecia de conocimiento</label>
                              <asp:TextBox runat="server" cssClass="form-control col-md-5 fondepro" type="number" step="any" ID="montoRecursos3"/>
                          </div>
                      </div>
                      <div class="form-group mt-2">
                          <div class="row">
                              <label class="col-md-6">Otros a ser considerados</label>
                              <asp:TextBox runat="server" cssClass="form-control col-md-5 fondepro" type="number" step="any" ID="montoOtros3"/>
                          </div>
                      </div>
                       <div class="form-group">
                          <div class="row">
                              <label class="col-md-2">Monto total de FONDEPRO</label>
                              <input value="0.00" class="form-control col-md-2" type="number" step="any" disabled="disabled" ID="montoFondepro3">
                          </div>
                      </div>
                      <hr class="divider" />
                      <h4><b>Descripción de contrapartida (adecauda a los ultimos parametros aprobados) </b></h4>
                      
                      <div class="form-group mt-2">
                          <div class="row">
                              <label class="col-md-2">Descripcion del monto en especies</label>
                              <asp:TextBox runat="server" TextMode="multiline"  Rows="5" cssClass="form-control col-md-6" ID="descripMontoEspecies3"  placeholder="Justifique el monto en especies por el beneficiario" />
                          </div>
                      </div>
                      <div class="form-group">
                          <div class="row">
                              <label class="col-md-2">Monto en Especies</label>
                              <asp:TextBox runat="server" cssClass="form-control col-md-5 contrapartida" type="number" step="any" ID="montoEspecies3"/>
                          </div>
                      </div>
                      <div class="form-group mt-2">
                          <div class="row">
                              <label class="col-md-2">Descripcion del monto en efectivo</label>
                               <asp:TextBox runat="server" TextMode="multiline"  Rows="5" cssClass="form-control col-md-6" ID="descripMontoEfectivo3" placeholder="Justifique el monto en efectivo por el beneficiario" />
                          </div>
                      </div>
                      <div class="form-group">
                          <div class="row">
                              <label class="col-md-2">Monto en Efectivo</label>
                            <asp:TextBox runat="server" cssClass="form-control col-md-5 contrapartida" type="number" step="any" ID="montoEfectivo3"/>
                          </div>
                      </div>
                      <div class="form-group">
                          <div class="row">
                              <label class="col-md-2">Monto Contrapartida del Beneficiario</label>
                              <input value="0,00" ID="montoTotalContrapartida3" class="form-control col-md-2" disabled="disabled" type="number" step="any">
                          </div>
                      </div>
                      <hr class="divider" />
                      <h4><b>Total Proyecto</b></h4>
                      <div class="form-group">
                          <div class="row">
                              <label class="col-md-2">Monto total del proyecto</label>
                              <input value="0,00" class="form-control col-md-2" type="number" step="any"  ID="montoproyecto3" disabled="disabled">
                          </div>
                      </div>
                  </div>
                  <div class="tab-pane fade" id="nav-matriz3" role="tabpanel" aria-labelledby="nav-matriz-tab">
                      <div class="mt-2 row">
                          <div class="form-group col-md-4">
                              <label>Digite la fecha de inicio</label>
                               <asp:TextBox runat="server" type="date" cssClass="form-control" ID="inputfecha3" />
                          </div>
                      </div>
                      <div class="row mt-3">
                        <div class="col">
                            
                            <div class="row mb-5" style="overflow-x:auto">
                                <table class="col" id="table-cron3">
                                </table>
                            </div>
                        </div>
                    </div>

                     <asp:TextBox runat="server" ID="semanasSelec3" CssClass="d-none" />

                            </div>

                        </div>
                    </div>
                </div>
            </asp:Panel>

            <%-- panel para integral --%>
            <asp:Panel runat="server" ID="panelIntegral" Visible="false">
                <div class="card shadow mb-4">
                    <div class="card-header py-3">
                        <h6 class="  font-weight-bold text-primary">Iniciativa de Innovación Integral</h6>
                    </div>
                    <div class="card-body">
                        <nav>
                          <div class="nav nav-tabs" id="nav-tab4" role="tablist">
                            <a class="nav-item nav-link active" id="plant-tab"  data-toggle="tab" href="#nav-planteamiento4" role="tab" aria-controls="nav-planteamiento" aria-selected="true">Planteamiento</a>
                            <a class="nav-item nav-link"  data-toggle="tab" href="#nav-adopcion4" role="tab"  aria-selected="false">Adopcion de Técnologia</a>
                            <a class="nav-item nav-link"  data-toggle="tab" href="#nav-asistencia4" role="tab"  aria-selected="false">Asistencia Técnica y/o Transferencia de conocimiento</a>
                            <a class="nav-item nav-link"  data-toggle="tab" href="#nav-innovacion4" role="tab"  aria-selected="false">Innovación Técnologica</a>
                            <a class="nav-item nav-link"  data-toggle="tab" href="#nav-contrapartida4" role="tab"  aria-selected="false">Contrapartida</a>
                            <a class="nav-item nav-link"  data-toggle="tab" href="#nav-cronograma4" role="tab" aria-selected="false">Cronograma</a>
                          </div>
                        </nav>
                        <div class="tab-content" id="nav-tabContent4">
                            <div class="tab-pane fade show active" id="nav-planteamiento4" role="tabpanel" aria-labelledby="plant-tab">
                                <div class="form-group mt-2">
                              <label>Planteamiento del problema u oportunidad a ser aprovechada</label>
                              <asp:TextBox runat="server" class="form-control"  placeholder="Ingrese el planteamiento u oportunidad" ID="planteamiento4" TextMode="multiline"  Rows="5"/>
                              </div>
                              <div class="form-group">
                                  <label>Planteamiento descriptivo de la solución o Problema u oportunidad</label>
                                  <asp:TextBox runat="server" class="form-control"  placeholder="Ingrese la descripción de la solución" TextMode="multiline"  Rows="5" ID="descripcionSolucion4"/>
                              </div>
                               <div class="form-group">
                                  <label>Descripción de la Relevancia para el beneficiario del Beneficiario de la Operación y o Producto a ser afectado con el proyecto o solución</label>
                                  <asp:TextBox runat="server" class="form-control"  placeholder="Ingrese la descripción de la revelancia de la operacion" TextMode="multiline"  Rows="5" ID="descripcionRelevancia4"/>
                              </div>
                              <div class="form-group">
                                  <label>Incrementos esperados en ventas o mejora de la productividad del Beneficiario</label>
                                  <asp:TextBox runat="server" class="form-control"  placeholder="Ingrese los incrementos esperados" TextMode="multiline"  Rows="5" ID="incrementosEsperados4"/>
                              </div>
                              <div class="form-group">
                                  <label>Incrementos en ventas o mejora de la productividad del Beneficiario</label>
                                  <asp:TextBox runat="server" class="form-control"  placeholder="Ingrese los incrementos en ventas" TextMode="multiline"  Rows="5" name="incrementosEnVentas" ID="incrementosEnVentas4"/>
                              </div>
                              <div class="form-group">
                                  <label>¿Tipo de ejecución?</label>
                                 <div class="form-check form-check-inline">
                                  <asp:RadioButton runat="server" cssClass="form-check-input" GroupName="ejecucion" ID="ejecucionSolo4" value="Ejecución Solo" Checked="true" ></asp:RadioButton>
                                  <label class="form-check-label" >
                                    Ejecución Solo
                                  </label>
                                </div>
                                <div class="form-check form-check-inline">
                                  <asp:RadioButton runat="server" cssClass="form-check-input" GroupName="ejecucion" ID="ejecucionAsistida4" value="Ejecución Asistida" Checked="false"></asp:RadioButton>
                                  <label class="form-check-label">
                                    Ejecución Asistida
                                  </label>
                                </div>
                              </div>
                            </div>
                            <div class="tab-pane fade" id="nav-adopcion4">
                                <div class="form-group mt-2">
                                  <label>Adopción o incorporación Tecnológica</label>
                                  <asp:TextBox runat="server" class="form-control"  placeholder="Descripción de la solución, del equipo sus componentes" name="adopcionTec" ID="adopcionTec4" TextMode="multiline"  Rows="5"/>
                              </div>
                              <div class="form-group">
                                  <label>Efectos esperados sobre el problema</label>
                                  <asp:TextBox runat="server" class="form-control"  placeholder="Como modifica o acciona sobre el problema" name="efectosEsperados" ID="efectosEsperados4" TextMode="multiline"  Rows="5"/>
                              </div>
                              <div class="form-group">
                                  <label>Efectos esperados sobre  el negocio</label>
                                  <asp:TextBox runat="server" class="form-control"  placeholder="Como modifica o acciona sobre el problema" name="efectosEsperadosNegocio" ID="efectosEsperadosNegocio4" TextMode="multiline"  Rows="5"/>
                              </div>
                              <div class="form-group">
                                  <label>Justificación de la tecnología propuesta</label>
                                  <asp:TextBox runat="server" class="form-control"  placeholder="Justifique la tecnología propuesta" name="justificacion" ID="justificacion4" TextMode="multiline"  Rows="5"/>
                              </div>
                                <div class="form-group mt-2">
                                  <label>Incrementos esperados en el margen de utilidad</label>
                                  <asp:TextBox runat="server" class="form-control"  placeholder="Ingrese los margenes esperados de utilidad" name="margenUtilidad" ID="margenUtilidad4" TextMode="multiline"  Rows="5"/>
                              </div>
                              <div class="form-group mt-2">
                                  <label>Incremento en la producción actual</label>
                                  <asp:TextBox runat="server" class="form-control"  placeholder="Ingrese el incremento de la produccion actual" name="incrementoProduccion" ID="incrementoProduccion4" TextMode="multiline"  Rows="5"/>
                              </div>
                              <div class="form-group mt-2">
                                  <label>¿Como se colocara el nuevo volumen en el mercado?</label>
                                  <asp:TextBox runat="server" class="form-control"  placeholder="Explique como se colocara el nuevo volumen en el mercado" name="nuevoVolumen" ID="nuevoVolumen4" TextMode="multiline"  Rows="5"/>
                              </div>
                              <div class="form-group mt-2">
                                  <label>Disminuir el consumo de energía o combustible en la producción, recolección, procesos y entrega de los bienes actuales</label>
                                  <asp:TextBox runat="server" class="form-control"  placeholder="Explique como disminuir los consumos o procesos actuales" name="disminucionConsumo" ID="reducirTiempo4" TextMode="multiline"  Rows="5"/>
                              </div>
                              <div class="form-group mt-2">
                                  <label>Reducir el tiempo de procesos productivos con métodos y/o tecnologías alternativas a las utilizadas en la actualidad</label>
                                  <asp:TextBox runat="server" class="form-control"  placeholder="Explique como disminuir los consumos o procesos actuales"  ID="disminucionConsumo4" TextMode="multiline"  Rows="5"/>
                              </div>
                              <div class="form-group mt-2">
                                  <label>Reducir el consumo de materia prima con tecnología no utilizada actualmente por el beneficiario.</label>
                                  <asp:TextBox runat="server" class="form-control"  placeholder="Explique como disminuir los consumos de materia prima" name="disminucionConsumoMateria" ID="disminucionConsumoMateria4" TextMode="multiline"  Rows="5"/>
                              </div>
                              <div class="form-group mt-2">
                                  <label>Otros a ser considerados </label>
                                  <asp:TextBox runat="server" class="form-control"  placeholder="Agregue informacion adicional" name="otrosInfo" ID="otrosInfo4" TextMode="multiline"  Rows="5"/>
                              </div>
                              <div class="form-group mt-2">
                                  <label>Componentes o tecnología Adicional  necesaria para el funcionamiento de la tecnología</label>
                                  <asp:TextBox runat="server" class="form-control"  placeholder="Componentes o tecnología adicional" name="componentesAdicionales" ID="componentesAdicionales4" TextMode="multiline"  Rows="5"/>
                              </div>
                            </div>
                            <div class="tab-pane fade" id="nav-asistencia4">
                                <div class="form-group mt-2">
                          <label>Metodología Sugerida</label>
                          <asp:TextBox runat="server" cssClass="form-control"  placeholder="Descripción de la solución, del equipo sus componentes" name="metodologia" ID="metodologia4" TextMode="multiline"  Rows="5"/>
                      </div>
                      <div class="form-group mt-2">
                          <label>¿El conocimiento se encuentra disponible localmente?</label>
                          <div >
                            <asp:CheckBox runat="server" ID="conocLocal4" Checked="false"  cssClass="col-md-1 form-control mr-2 text-white"/>
                        </div>
                      </div>
                      <div id="disponibilidad4">
                          <div class="form-group mt-2">
                              <div>
                                <label>Debe venir alguien y atender el tema localmente </label>
                                   <asp:CheckBox runat="server" ID="atenderLocal4" Checked="false" cssClass="col-md-1 form-control mr-2 text-white"/>
                              </div>
                              <div>
                                <label>Debe alguien de la iniciativa ir y recibir el entrenamiento o transferencia</label>
                                   <asp:CheckBox runat="server" ID="entrenamiento4" Checked="false"  cssClass="col-md-1 form-control"/>
                              </div>
                              <div>
                                <label>Mixta</label>
                                  <asp:CheckBox runat="server" ID="mixta4" Checked="false"  cssClass="col-md-1 form-control mr-2 text-white"/>
                              </div>
                          </div>
                          <div class="form-group mt-2 row">
                              <div class="col-md-4">
                                  <label>Duración en días</label>
                                  <asp:TextBox runat="server" cssClass="form-control " type="number" ID="duracionDias4" />
                              </div>
                              <div class="col-md-8 ">
                                  <label>Locación</label>
                                  <div id="map4"> </div>
                                  <asp:TextBox runat="server" disabled="disabled" ID="location4" cssClass="d-none"/>
                              </div>
                          </div>
                          <div class="form-group mt-2">
                              <label>¿Requiere de recursos técnicos adicionales?</label>
                              <asp:CheckBox runat="server" ID="recursosAdicionales4" Checked="false"  cssClass="col-md-1 form-control"/>
                          </div>
                          <div class="form-group mt-2">
                              <label>¿existe necesidad de conocimiento previo para que sea asimilada de forma correcta?</label>
                              <asp:CheckBox runat="server" ID="conocPrevio4" Checked="false"  cssClass="col-md-1 form-control"/>
                          </div>
                          <div class="form-group mt-2">
                              <label>Describa los requerimientos previos</label>
                              <asp:TextBox runat="server" cssClass="form-control" ID="requerimientosPrevios4" TextMode="multiline"  Rows="5"></asp:TextBox>
                          </div>
                          <div class="form-group mt-2">
                              <label>Tiene el beneficiario o cumple con los anteriores?</label>
                              <asp:CheckBox runat="server" ID="cumple4" Checked="false"  cssClass="col-md-1 form-control"/>
                          </div>
                          <div class="form-group mt-2">
                              <label>Componentes o insumos necesarios para lograr el impacto de la asistencia técnica y/o la transferencia de conocimiento</label>
                              <asp:TextBox runat="server" cssClass="form-control" ID="componentes4" TextMode="multiline"  Rows="5"/>
                          </div>
                          <div class="form-group mt-2">
                              <label>Efectos esperados sobre el problema</label>
                              <asp:TextBox runat="server" cssClass="form-control" ID="efectosProblema4" TextMode="multiline"  Rows="5"/>
                          </div>
                          <div class="form-group mt-2">
                              <label>Efectos esperados sobre  el negocio</label>
                             <asp:TextBox runat="server" cssClass="form-control" ID="efectosNegocio4" TextMode="multiline"  Rows="5"/>
                          </div>
                          <div class="form-group mt-2">
                              <label>Incrementos esperados en el margen de utilidad</label>
                             <asp:TextBox runat="server" cssClass="form-control" ID="incrementoUtilidad4" TextMode="multiline"  Rows="5"/>
                          </div>
                          <div class="form-group mt-2">
                              <label>Reducir el tiempo de procesos productivos con métodos y/o tecnologías alternativas a las utilizadas en la actualidad</label>
                                <asp:TextBox runat="server" cssClass="form-control" ID="reduccionTiempo4" TextMode="multiline"  Rows="5"/>
                          </div>
                          <div class="form-group mt-2">
                              <label>Disminuir el consumo de energía o combustible en la producción, recolección, procesos y entrega de los bienes actuales</label>
                              <asp:TextBox runat="server" cssClass="form-control" ID="disminuirConsumo4" TextMode="multiline"  Rows="5"/>
                          </div>
                          <div class="form-group mt-2">
                              <label>Reducir el consumo de materia prima con tecnología no utilizada actualmente por el beneficiario</label>
                              <asp:TextBox runat="server" cssClass="form-control" ID="reducirConsumo4" TextMode="multiline"  Rows="5"/>
                          </div>
                          <div class="form-group mt-2">
                              <label>Otros a ser considerados</label>
                              <asp:TextBox runat="server" cssClass="form-control" ID="otros4" TextMode="multiline"  Rows="5"/>
                          </div>
                     </div>
                            </div>
                            <div class="tab-pane fade" id="nav-innovacion4">
                                <div class="form-group mt-2">
                              <label>Producto</label>
                              <asp:TextBox runat="server" cssClass="form-control" ID="producto4" TextMode="multiline"  Rows="5"></asp:TextBox>
                          </div>
                      <div class="form-group mt-2">
                              <label>Proceso</label>
                              <asp:TextBox runat="server" cssClass="form-control" ID="proceso4" TextMode="multiline"  Rows="5"></asp:TextBox>
                          </div>
                      <div class="form-group mt-2">
                              <label>Modelo de comercialización</label>
                              <asp:TextBox runat="server" cssClass="form-control" ID="modelo4" TextMode="multiline"  Rows="5"></asp:TextBox>
                          </div>
                      

                      <div class="form-group mt-2">
                          <label>¿Los insumos para el desarrollo se encuentra disponible localmente?</label>
                          <div >
                            <asp:CheckBox runat="server" ID="insumoLocal4" Checked="false"  cssClass="col-md-1 form-control mr-2 text-white"/>
                        </div>
                      </div>
                      <div class="form-group mt-2">
                              <label>Describa genericamente los insumos necesarios</label>
                              <asp:TextBox runat="server" cssClass="form-control" ID="generic4" TextMode="multiline"  Rows="5"></asp:TextBox>
                          </div>
                       <div class="form-group mt-2">
                          <label>¿el proyecto requerira de insumos de parte del  beneficiario?</label>
                          <div >
                            <asp:CheckBox runat="server" ID="insumoBene4" Checked="false"  cssClass="col-md-1 form-control mr-2 text-white"/>
                        </div>
                      </div>
                       <div class="form-group mt-2">
                              <label>Describalos</label>
                              <asp:TextBox runat="server" cssClass="form-control" ID="insumoDescrip4" TextMode="multiline"  Rows="5"></asp:TextBox>
                          </div>
                      <div id="disponibilidad44">
                          <div class="form-group mt-2">
                              <div>
                                <label>Debe venir alguien y atender el tema localmente </label>
                                   <asp:CheckBox runat="server" ID="atenderLocal44" Checked="false" cssClass="col-md-1 form-control mr-2 text-white"/>
                              </div>
                              <div>
                                <label>Debe alguien de la iniciativa ir y recibir el entrenamiento o transferencia</label>
                                   <asp:CheckBox runat="server" ID="entrenamiento44" Checked="false"  cssClass="col-md-1 form-control"/>
                              </div>
                              <div>
                                <label>Mixta</label>
                                  <asp:CheckBox runat="server" ID="mixta44" Checked="false"  cssClass="col-md-1 form-control mr-2 text-white"/>
                              </div>
                          </div>
                          <div class="form-group mt-2 row">
                              <div class="col-md-4">
                                  <label>Duración en días</label>
                                  <asp:TextBox runat="server" cssClass="form-control " type="number" ID="dias4" />
                              </div>
                              <div class="col-md-8 ">
                                  <label>Locación</label>
                                  <asp:TextBox runat="server" disabled="disabled" ID="location44" cssClass="d-none"/>
                                  <div id="map5"></div>
                              </div>
                          </div>
                          <div class="form-group mt-2">
                              <label>¿Requiere de recursos técnicos adicionales?</label>
                              <asp:CheckBox runat="server" ID="recursos4" Checked="false"  cssClass="col-md-1 form-control"/>
                          </div>
                          <div class="form-group mt-2">
                              <label>¿existe necesidad de conocimiento previo para que sea asimilada de forma correcta?</label>
                              <asp:CheckBox runat="server" ID="necesidadC4" Checked="false"  cssClass="col-md-1 form-control"/>
                          </div>
                          <div class="form-group mt-2">
                              <label>Describa los requerimientos previos</label>
                              <asp:TextBox runat="server" cssClass="form-control" ID="previos4" TextMode="multiline"  Rows="5"></asp:TextBox>
                          </div>
                          <div class="form-group mt-2">
                              <label>Tiene el beneficiario o cumple con los anteriores?</label>
                              <asp:CheckBox runat="server" ID="cumple44" Checked="false"  cssClass="col-md-1 form-control"/>
                          </div>
                          <div class="form-group mt-2">
                              <label>Componentes o insumos necesarios para lograr el impacto de la innovacion o desarrollo tecnologico </label>
                              <asp:TextBox runat="server" cssClass="form-control" ID="compo4" TextMode="multiline"  Rows="5"/>
                          </div>
                          <div class="form-group mt-2">
                              <label>Efectos esperados sobre el problema</label>
                              <asp:TextBox runat="server" cssClass="form-control" ID="efectPro4" TextMode="multiline"  Rows="5"/>
                          </div>
                          <div class="form-group mt-2">
                              <label>Efectos esperados sobre  el negocio</label>
                             <asp:TextBox runat="server" cssClass="form-control" ID="efectNeg4" TextMode="multiline"  Rows="5"/>
                          </div>
                          <div class="form-group mt-2">
                              <label>Incrementos esperados en el margen de utilidad</label>
                             <asp:TextBox runat="server" cssClass="form-control" ID="margen4" TextMode="multiline"  Rows="5"/>
                          </div>
                          <div class="form-group mt-2">
                              <label>Reducir el tiempo de procesos productivos con métodos y/o tecnologías alternativas a las utilizadas en la actualidad</label>
                                <asp:TextBox runat="server" cssClass="form-control" ID="reduc4" TextMode="multiline"  Rows="5"/>
                          </div>
                          <div class="form-group mt-2">
                              <label>Disminuir el consumo de energía o combustible en la producción, recolección, procesos y entrega de los bienes actuales</label>
                              <asp:TextBox runat="server" cssClass="form-control" ID="dismConsu4" TextMode="multiline"  Rows="5"/>
                          </div>
                          <div class="form-group mt-2">
                              <label>Reducir el consumo de materia prima con tecnología no utilizada actualmente por el beneficiario</label>
                              <asp:TextBox runat="server" cssClass="form-control" ID="reduCon4" TextMode="multiline"  Rows="5"/>
                          </div>
                          <div class="form-group mt-2">
                              <label>Otros a ser considerados</label>
                              <asp:TextBox runat="server" cssClass="form-control" ID="otros44" TextMode="multiline"  Rows="5"/>
                          </div>
                     </div>
                            </div>
                            <div class="tab-pane fade" id="nav-contrapartida4" role="tabpanel" aria-labelledby="nav-contrapartida">
                             <div class="form-group mt-2">
                                  <label>Descripción de la Contrapartida</label>
                                  <asp:TextBox runat="server" cssClass="form-control" ID="descripcionContrapartida4" TextMode="multiline"  Rows="5"/>
                              </div>
                                <div class="form-group mt-2">
                                  <div class="row">
                                      <label class="col-md-6">Monto de Adopción o incorporación tecnológica</label>
                                      <asp:TextBox runat="server" cssClass="form-control col-md-5 fondepro" type="number" step="any"  name="montoAdopcion4" ID="montoAdopcion4"/>
                                  </div>
                              </div>
                              <div class="form-group mt-2">
                                  <div class="row">
                                      <label class="col-md-6">Montos de componentes acciones y/o tecnología Adicional  necesaria para la Adquisición, internación, instalación y/o el funcionamiento de la tecnología</label>
                                      <asp:TextBox runat="server" cssClass="form-control col-md-5 fondepro" type="number" step="any"  name="montoComponentes4" ID="montoComponentes4"/>
                                  </div>
                              </div>
                                <div class="form-group mt-2">
                                  <div class="row">
                                      <label class="col-md-6">Montos de Asistencia tecnica o transferecia de conocimiento</label>
                                      <asp:TextBox runat="server" cssClass="form-control col-md-5 fondepro" type="number" step="any" ID="montoAsistencia4"/>
                                  </div>
                              </div>
                      
                              <div class="form-group mt-2">
                                  <div class="row">
                                      <label class="col-md-6">Recursos Adicionales  para la  Asistencia tecnica o transferecia de conocimiento</label>
                                      <asp:TextBox runat="server" cssClass="form-control col-md-5 fondepro" type="number" step="any" ID="recursosAsistencia4"/>
                                  </div>
                              </div>
                              <div class="form-group mt-2">
                                  <div class="row">
                                      <label class="col-md-6">Innovacion de Técnologias</label>
                                      <asp:TextBox runat="server" cssClass="form-control col-md-5 fondepro" type="number" step="any" ID="montoInnovacion4"/>
                                  </div>
                              </div>
                      
                              <div class="form-group mt-2">
                                  <div class="row">
                                      <label class="col-md-6">Recursos Adicionales  para el Proyecto de innovación técnologica</label>
                                      <asp:TextBox runat="server" cssClass="form-control col-md-5 fondepro" type="number" step="any" ID="recursosInnovacion4"/>
                                  </div>
                              </div>

                              <div class="form-group mt-2">
                                  <div class="row">
                                      <label class="col-md-6">Otros a ser considerados</label>
                                      <asp:TextBox runat="server" cssClass="form-control col-md-5 fondepro" type="number" step="any" ID="montoOtros4"/>
                                  </div>
                              </div>
                              <hr class="divider" />
                      <h4><b>Descripción de Contrapartida</b></h4>
                      
                      <div class="form-group mt-2">
                          <div class="row">
                              <label class="col-md-2">Descripcion del monto en especies</label>
                              <asp:TextBox runat="server" TextMode="multiline"  Rows="5" cssClass="form-control col-md-6" ID="descripMontoEspecies4" name="descripMontoEspecies" placeholder="Justifique el monto en especies por el beneficiario"/>
                          </div>
                      </div>
                      <div class="form-group">
                          <div class="row">
                              <label class="col-md-2">Monto en Especies</label>
                              <asp:TextBox runat="server" cssClass="form-control col-md-5" value="0.00" class="form-control col-md-2 contrapartida" type="number" step="any"  name="montoEspecies" ID="montoEspecies4"/>
                          </div>
                      </div>
                      <div class="form-group mt-2">
                          <div class="row">
                              <label class="col-md-2">Descripcion del monto en efectivo</label>
                              <asp:TextBox runat="server" TextMode="multiline"  Rows="5" cssClass="form-control col-md-6" ID="descripMontoEfectivo4" name="descripMontoEfectivo" placeholder="Justifique el monto en efectivo por el beneficiario"/>
                          </div>
                      </div>
                      <div class="form-group">
                          <div class="row">
                              <label class="col-md-2">Monto en Efectivo</label>
                              <asp:TextBox runat="server" value="0.00" cssClass="form-control col-md-2 contrapartida" type="number" step="any"  name="montoEfectivo" ID="montoEfectivo4"/>
                          </div>
                      </div>
                      <div class="form-group">
                          <div class="row">
                              <label class="col-md-2">Monto Contrapartida del Beneficiario</label>
                              <input value="0,00" ID="montoTotalContrapartida4" class="form-control col-md-2" disabled="disabled" type="number" step="any">
                          </div>
                      </div>
                      <hr class="divider" />
                      <h4><b>Total Proyecto</b></h4>
                      <div class="form-group">
                          <div class="row">
                              <label class="col-md-2">Monto total del proyecto</label>
                              <input value="0,00" class="form-control col-md-2" type="number" step="any"  ID="montoproyecto4" disabled="disabled">
                          </div>
                      </div>
                          </div>
                            <div class="tab-pane fade" id="nav-cronograma4" role="tabpanel" aria-labelledby="nav-cronograma">
                              <div class="mt-2 row">
                                  <div class="form-group col-md-4">
                                      <label>Digite la fecha de inicio</label>
                                       <asp:TextBox runat="server" type="date" cssClass="form-control" ID="inputfecha4" />
                                  </div>
                              </div>
                              <div class="row mt-3">
                                <div class="col">
                            
                                    <div class="row mb-5" style="overflow-x:auto">
                                        <table class="col" id="table-cron4">
                                        </table>
                                    </div>
                                </div>
                            </div>
                            <asp:TextBox runat="server" ID="semanasSelec4" CssClass="d-none" />
                              

                            </div>

                        </div>
                    </div>
                </div>
            </asp:Panel>
        </div>
      </div>
    </div>



            
        </form>
    </div>


</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="jsextra" runat="server">
    <script src="<%= ResolveClientUrl("~/Views/vendor/datatables/jquery.dataTables.min.js") %>"></script>
    <script src="<%= ResolveClientUrl("~/Views/vendor/datatables/dataTables.bootstrap4.js") %>"></script>
    <script src="<%= ResolveClientUrl("~/Views/js/leaflet.js") %>"></script>
    <script src="<%= ResolveClientUrl("~/Views/js/Cronograma.js") %>"></script>
    <script>
        $(() => {
            for (let i = 0; i < $(".textboxper").length; i++) {
                if ($(".textboxper")[i].value === "")
                    $(".textboxper")[i].value = 0;
            }
            sumar();

        });
        function ComprobarLimites(input) {
            if (input.value > input.max || input.value < 0) {
                alert('El valor no debe ser mayor a ' + input.max + ' y menor de 0');
                input.value = 0;
            }
        }
        function sumar() {
            let suma = 0;
            for (let i = 0; i < $(".textboxper").length; i++) {
                suma += parseFloat($(".textboxper")[i].value);
            }
            $(".lbltotal")[0].value = suma;
        }

        $(document).ready(function () {
            $('#<%= GVEvaluadores.ClientID %>').DataTable({
                "language": {
                    "decimal": "",
                    "emptyTable": "No hay datos registrados",
                    "info": "Mostrando _START_ de _END_ of _TOTAL_ Registros",
                    "infoEmpty": "Mostrando 0 de 0 registros",
                    "infoFiltered": "(Filtrado desde _MAX_ registros totales)",
                    "infoPostFix": "",
                    "thousands": ",",
                    "lengthMenu": "Mostrar _MENU_ entradas",
                    "loadingRecords": "Cargando...",
                    "processing": "Procesando...",
                    "search": "Buscar:",
                    "zeroRecords": "No se encontraron registros",
                    "paginate": {
                        "first": "Primero",
                        "last": "Ultimo",
                        "next": "Siguiente",
                        "previous": "Anterior"
                    },
                    "aria": {
                        "sortAscending": ": activar para ordenar Ascendentemente",
                        "sortDescending": ": activar para ordenar Descendentemente"
                    }
                }
            });
        });
    </script>


     <%switch (proyecto.ID_TIPO_INICIATIVA) {%>
        <%case 1: %>
            <script>
                var psum = 0;
                for (let i = 0; i < $('.fondepro').length; i++) {
                    psum += parseFloat($('.fondepro')[i].value);
                }
                $('#montoFondepro').val(psum.toFixed(2));
                $('#montoTotalContrapartida').val((psum / 9).toFixed(2));
                $('#montoproyecto').val((psum / 0.9).toFixed(2));
                var headers = [
                    "Adopción o incorporación Tecnológica",
                    "Componentes, tecnología Adicional",
                    "Otros a ser considerados ",
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
                });
            </script>
        <%break; %>
        <%case 2: %>
    <script>
       
        $(() => {
            $('#disponibilidad2').hide();
            if ($('#bodyContentBlank_conocLocal2').prop('checked')) {
                $('#disponibilidad2').show();
            }
           var psum = 0;
         for (let i = 0; i < $('.fondepro').length; i++) {
             psum += parseFloat($('.fondepro')[i].value);
         }
         $('#montoFondepro2').val(psum.toFixed(2));
         $('#montoTotalContrapartida2').val((psum / 9).toFixed(2));
         $('#montoproyecto2').val((psum / 0.9).toFixed(2));
             var headers = [
                "Asistenica Tecnica y/o Transferencia tecnologica",
                "Local",
                "Extranjero",
                "Monto Contra partida Beneficiario"
            ];
         var cronograma = new $.Cronograma($('#table-cron2'), {
             'numMonth': 3,
             'dateStart':new Date(),
             'subHeaders': headers,
             //habilita las funciones de manejar eventos
             'eventos': false,
             'data': $('#bodyContentBlank_semanasSelec2').val()
        });
            cronograma.Reload($('#bodyContentBlank_inputfecha2').val());
            var mymap = L.map('map').setView([$('#bodyContentBlank_location').val().split(",")[0],$('#bodyContentBlank_location2').val().split(",")[1]], 15);
            
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
            popup.setLatLng(L.latLng($('#bodyContentBlank_location2').val().split(",")[0],$('#bodyContentBlank_location2').val().split(",")[1]))
                    .setContent("Iniciativa localizada")
                    .openOn(mymap);
        });
    </script>
        <%break; %>
        <%case 3: %>
            <script>
       
        $(() => {
            $('#disponibilidad3').hide();
            if ($('#bodyContentBlank_insumoLocal3').prop('checked')) {
                $('#disponibilidad3').show();
            }
           var psum = 0;
         for (let i = 0; i < $('.fondepro').length; i++) {
             psum += parseFloat($('.fondepro')[i].value);
         }
         $('#montoFondepro3').val(psum.toFixed(2));
         $('#montoTotalContrapartida3').val((psum / 9).toFixed(2));
         $('#montoproyecto3').val((psum / 0.9).toFixed(2));
         $('#montoTotalContrapartida3').val(psum * 0.10);
          $('#montoCofinanciado3').val(psum *.90);
          $('#montoProyecto3').val(psum);
             var headers = [
                "Iniciativa de Proyecto de Innovación y o desarrollo Tecnológico",
                "Local",
                "Extranjero",
                "Monto Contra partida Beneficiario"
            ];
         var cronograma = new $.Cronograma($('#table-cron3'), {
             'numMonth': 3,
             'dateStart':new Date(),
             'subHeaders': headers,
             //habilita las funciones de manejar eventos
             'eventos': false,
             'data': $('#bodyContentBlank_semanasSelec3').val()
        });
            cronograma.Reload($('#bodyContentBlank_inputfecha3').val());
            var mymap = L.map('map').setView([$('#bodyContentBlank_location3').val().split(",")[0],$('#bodyContentBlank_location3').val().split(",")[1]], 15);
            
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
            popup.setLatLng(L.latLng($('#bodyContentBlank_location3').val().split(",")[0],$('#bodyContentBlank_location3').val().split(",")[1]))
                    .setContent("Iniciativa localizada")
                    .openOn(mymap);
        });
    </script>
        <%break; %>
        <%case 4: %>
    <script>
        $(function () {
             var psum = 0;
         for (let i = 0; i < $('.fondepro').length; i++) {
             psum += parseFloat($('.fondepro')[i].value);
         }
         $('#montoFondepro4').val(psum.toFixed(2));
         $('#montoTotalContrapartida4').val((psum / 9).toFixed(2));
         $('#montoproyecto4').val((psum / 0.9).toFixed(2));
            var headers = [
                "Adopción o incorporación Tecnológica",
                "Componentes, tecnología Adicional",
                "Otros a ser considerados ",
                "Asistenica Tecnica y/o Transferencia tecnologica",
                "Local",
                "Extranjero",
                "Proyecto de innovacion tecnologica",
                "Monto Contra partida Beneficiario"
            ];
            var cronograma = new $.Cronograma($('#table-cron4'), {
                 'numMonth': 6,
                 'dateStart':new Date(),
                 'subHeaders': headers,
                 //habilita las funciones de manejar eventos
                 'eventos': false,
                 'data': $('#bodyContentBlank_semanasSelec4').val()
             });
            
             cronograma.Reload($('#bodyContentBlank_inputfecha4').val());

             $('#disponibilidad4').hide();
            if ($('#bodyContentBlank_conocLocal4').prop('checked')) {
                $('#disponibilidad4').show();
            }
           

             var mymap = L.map('map4').setView([$('#bodyContentBlank_location4').val().split(",")[0],$('#bodyContentBlank_location4').val().split(",")[1]], 15);
            
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
            popup.setLatLng(L.latLng($('#bodyContentBlank_location4').val().split(",")[0],$('#bodyContentBlank_location4').val().split(",")[1]))
                    .setContent("Iniciativa localizada")
                 .openOn(mymap);

              $('#disponibilidad44').hide();
            if ($('#bodyContentBlank_insumoLocal4').prop('checked')) {
                $('#disponibilidad44').show();
             }
              var mymap2 = L.map('map5').setView([$('#bodyContentBlank_location44').val().split(",")[0],$('#bodyContentBlank_location44').val().split(",")[1]], 15);
            
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
            popup.setLatLng(L.latLng($('#bodyContentBlank_location44').val().split(",")[0],$('#bodyContentBlank_location44').val().split(",")[1]))
                    .setContent("Iniciativa localizada!")
                    .openOn(mymap2);
        });
    </script>
        <%break; %>
    <%} %>
</asp:Content>