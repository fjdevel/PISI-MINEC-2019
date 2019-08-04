<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Layouts/Layout2.Master" AutoEventWireup="true" CodeBehind="FormularIniciativaAdopcionFormulador.aspx.cs" Inherits="MinecPISI.Views.Formulacion.FormularIniciativaAdopcionFormulador" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cssextra" runat="server">
    <style>
        table {
            border: 0.3px solid gray !important;
        }

        td {
            border: 0.3px solid gray !important;
        }

        th {
            width: 400px;
            border: 0.3px solid gray !important;
        }

        .celda {
            width: 30px;
            border: 0.3px solid gray !important;
        }

            .celda:hover {
                background: rgba(78,115,223,0.5);
            }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contenidoNavegacion" runat="server">
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="bodyContentBlank" runat="server">
    <form runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server" />

        <asp:UpdatePanel ID="UpdatePanel2" runat="server">
            <ContentTemplate>

                <div class="card shadow mb-4">
                    <div class="card-header py-3">
                        <h6 class="  font-weight-bold text-primary">Iniciativa de Adopción Tecnológica</h6>
                    </div>
                    <div class="card-body">
                        <nav>
                            <div class="nav nav-tabs" id="nav-tab" role="tablist">
                                <a class="nav-item nav-link active" id="nav-planteamiento-tab" data-toggle="tab" href="#nav-planteamiento" role="tab" aria-controls="nav-planteamiento" aria-selected="true">Planteamiento #1</a>
                                <a class="nav-item nav-link" id="nav-adopcion-tab" data-toggle="tab" href="#nav-adopcion" role="tab" aria-controls="nav-adopcion" aria-selected="false">Planteamiento #2</a>
                                <a class="nav-item nav-link" id="nav-adopcion-2-tab" data-toggle="tab" href="#nav-adopcion-2" role="tab" aria-controls="nav-adopcion-2" aria-selected="false">Planteamiento #3</a>
                                <a class="nav-item nav-link" id="nav-contrapartida-tab" data-toggle="tab" href="#nav-contrapartida" role="tab" aria-controls="nav-contrapartida" aria-selected="false">Contrapartida</a>
                                <a class="nav-item nav-link" id="nav-matriz-tab" data-toggle="tab" href="#nav-matriz" role="tab" aria-controls="nav-matriz" aria-selected="false">Adopción o Incorporación Tecnológica</a>
                            </div>
                        </nav>
                        <div class="tab-content" id="nav-tabContent">

                            <div class="tab-pane fade show active" id="nav-planteamiento" role="tabpanel" aria-labelledby="nav-planteamiento-tab">
                                <div class="form-group mt-2">
                                    <label>Planteamiento técnico del problema u oportunidad a ser aprovechada</label>
                                    <asp:TextBox runat="server" class="form-control" placeholder="Ingresa el planteamiento del problema u oportunidad" ID="planteamiento" TextMode="multiline" Rows="5" />
                                </div>
                                <div class="form-group">
                                    <label>Planteamiento descriptivo de la causa del Problema u oportunidad</label>
                                    <asp:TextBox runat="server" class="form-control" placeholder="Ingrese la descripción de la solución" TextMode="multiline" Rows="5" ID="descripcionSolucion" />
                                </div>
                                <div class="form-group">
                                    <label>Descripción de la Relevancia de la operación o producto a ser afectado con el Proyecto y su relevancia para la operación del Beneficiario</label>
                                    <asp:TextBox runat="server" class="form-control" placeholder="Ingresa la descripción de la revelancia de la operación" TextMode="multiline" Rows="5" ID="descripcionRelevancia" />
                                </div>
                                <div class="form-group">
                                    <label>Incrementos esperados en ventas o mejora de la productividad del Beneficiario</label>
                                    <asp:TextBox runat="server" class="form-control" placeholder="Describe los incrementos o mejoras productivas que esperan lograrse con el proyecto" TextMode="multiline" Rows="5" ID="incrementosEsperados" />
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
                                            Ejecuta por si solo
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
                                    <label>Adopción o Incorporación Tecnológica</label>
                                    <asp:TextBox runat="server" class="form-control" placeholder="Describe técnicamente el componente" name="adopcionTec" ID="adopcionTec" TextMode="multiline" Rows="5" />
                                </div>
                                <div class="form-group">
                                    <label>Efectos esperados sobre el problema</label>
                                    <asp:TextBox runat="server" class="form-control" placeholder="Como modifica o acciona sobre el problema" name="efectosEsperados" ID="efectosEsperados" TextMode="multiline" Rows="5" />
                                </div>
                                <div class="form-group">
                                    <label>Efectos esperados sobre  el negocio</label>
                                    <asp:TextBox runat="server" class="form-control" placeholder="Describe el efecto esperado sobre el negocio" name="efectosEsperadosNegocio" ID="efectosEsperadosNegocio" TextMode="multiline" Rows="5" />
                                </div>
                                <div class="form-group">
                                    <label>Justificación de la tecnología propuesta</label>
                                    <asp:TextBox runat="server" class="form-control" placeholder="Justifica la tecnología propuesta" name="justificacion" ID="justificacion" TextMode="multiline" Rows="5" />
                                </div>
                            </div>
                            <div class="tab-pane fade" id="nav-adopcion-2" role="tabpanel" aria-labelledby="nav-adopcion-2-tab">
                                <div class="form-group mt-2">
                                    <label>Incrementos esperados en el margen de utilidad</label>
                                    <asp:TextBox runat="server" class="form-control" placeholder="Describe y justifica los incrementos esperados en el margen de utilidad" name="margenUtilidad" ID="margenUtilidad" TextMode="multiline" Rows="5" />
                                </div>
                                <div class="form-group mt-2">
                                    <label>Incremento en la productividad actual</label>
                                    <asp:TextBox runat="server" class="form-control" placeholder="Describe y justifica los incrementos esperados en la productividad actual" name="incrementoProduccion" ID="incrementoProduccion" TextMode="multiline" Rows="5" />
                                </div>
                                <div class="form-group mt-2">
                                    <label>¿Cómo se colocará el nuevo volumen en el mercado?</label>
                                    <asp:TextBox runat="server" class="form-control" placeholder="Describe y justifica como se colocará el nuevo volumen en el mercado así como la logística que se utilizará para el almacenamiento del mismo" name="nuevoVolumen" ID="nuevoVolumen" TextMode="multiline" Rows="5" />
                                </div>
                                <div class="form-group mt-2">
                                    <label>¿Disminuirá el consumo de energía o combustible en la producción, recolección, procesos y entrega de los bienes actuales?</label>
                                    <asp:TextBox runat="server" class="form-control" placeholder="Describe y justifica si el proyecto disminuirá el consumo de energía o combustible en la producción" name="disminucionConsumo" ID="disminucionConsumo" TextMode="multiline" Rows="5" />
                                </div>
                                <div class="form-group mt-2">
                                    <label>
                                        ¿Reducirá el tiempo de los procesos productivos con
                                                            métodos y/o
                                                            tecnologías alternativas a las utilizadas en la
                                                            actualidad?</label>
                                    <asp:TextBox runat="server" class="form-control" placeholder="Describe y justifica si el proyecto logrará reducir el tiempo de los procesos productivos con métodos y/o tecnologías alternativas a las utilizadas en la actualidad" ID="reducirTiempo" TextMode="multiline" Rows="5" />
                                </div>
                                <div class="form-group mt-2">
                                    <label>
                                        ¿Reducirá el consumo de materia prima con
                                                            tecnología no
                                                            utilizada actualmente por el beneficiario?</label>
                                    <asp:TextBox runat="server" class="form-control" placeholder="Describe y justifica si el proyecto logrará disminuir el consumo de materia prima con tecnología no utilizada actualmente por el beneficiario" name="disminucionConsumoMateria" ID="disminucionConsumoMateria" TextMode="multiline" Rows="5" />
                                </div>
                                <div class="form-group mt-2">
                                    <label>Otros a ser considerados </label>
                                    <asp:TextBox runat="server" class="form-control" placeholder="Agregue informacion adicional" name="otrosInfo" ID="otrosInfo" TextMode="multiline" Rows="5" />
                                </div>
                                <div class="form-group mt-2">
                                    <label>
                                        Componentes o tecnología adicional necesaria
                                                            para el buen funcionamiento de la tecnología nueva</label>
                                    <asp:TextBox runat="server" class="form-control" placeholder="Describe y determina si el proyecto requerirá de componentes o tecnología adicional necesaria para la correcta instalación y funcionamiento de la tecnología que se adoptará" name="componentesAdicionales" ID="componentesAdicionales" TextMode="multiline" Rows="5" />
                                </div>
                            </div>
                            <div class="tab-pane fade" id="nav-contrapartida" role="tabpanel" aria-labelledby="nav-contrapartida-tab">
                                <h4 class="mt-2"><b>Descripción de fondos FONDEPRO</b></h4>
                                <div class="form-group mt-2">
                                    <label>FONDEPRO</label>
                                    <asp:TextBox runat="server" CssClass="form-control" placeholder="Descripción del monto cofinanciado por FONDEPRO" name="descripcionfondepro" ID="descripcionfondepro" TextMode="multiline" Rows="5" />
                                </div>
                                <div class="form-group mt-2">
                                    <div class="row">
                                        <label class="col-md-6">Monto de Adopción o Incorporación Tecnológica</label>
                                        <asp:TextBox runat="server" CssClass="form-control col-md-5 fondepro" type="number" step="any" name="montoAdopcion" ID="montoAdopcion" />
                                    </div>
                                </div>
                                <div class="form-group mt-2">
                                    <div class="row">
                                        <label class="col-md-6">Montos de componentes acciones y/o tecnología adicional  necesaria para la adquisición, interacción, instalación y/o funcionamiento de la tecnología</label>
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
                                        <label class="col-md-2">Monto Total de FONDEPRO</label>
                                        <input value="0.00" class="form-control col-md-2" type="number" step="any" disabled="disabled" id="montoFondepro">
                                    </div>
                                </div>
                                <hr class="divider" />
                                <h4><b>Descripción de la Contrapartida</b></h4>

                                <div class="form-group mt-2">
                                    <div class="row">
                                        <label class="col-md-2">Descripción del monto en especies</label>
                                        <asp:TextBox runat="server" TextMode="multiline" Rows="5" CssClass="form-control col-md-6" ID="descripMontoEspecies" name="descripMontoEspecies" placeholder="Justifique el monto en especies de la contrapartida" />
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
                                        <label class="col-md-2">Descripción del monto en efectivo</label>
                                        <asp:TextBox runat="server" TextMode="multiline" Rows="5" CssClass="form-control col-md-6 " ID="descripMontoEfectivo" name="descripMontoEfectivo" placeholder="Justifique el monto en efectivo de la contrapartida" />
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
                                        <asp:TextBox runat="server" ID="montoTotalContrapartida" CssClass="form-control col-md-2" type="number" step="any" />
                                    </div>
                                </div>
                                <hr class="divider" />
                                <h4><b>Total Proyecto</b></h4>
                                <div class="form-group">
                                    <div class="row">
                                        <label class="col-md-2">Monto Total del Proyecto</label>
                                        <input value="0,00" class="form-control col-md-2" type="number" step="any" id="montoproyecto" disabled="disabled">
                                    </div>
                                </div>

                            </div>
                            <div class="tab-pane fade" id="nav-matriz" role="tabpanel" aria-labelledby="nav-matriz-tab">
                                <div class="mt-2 row">
                                    <div class="form-group col-md-4">
                                        <label>Ingresa la fecha de inicio</label>
                                        <asp:TextBox runat="server" type="date" CssClass="form-control" ID="inputfecha" />
                                    </div>
                                </div>
                                <div class="row mt-3">
                                    <div class="col">
                                        <div class="row">
                                            <p class="col-md-6">¿Se encuentra la tecnología disponible localmente?</p>
                                            <asp:CheckBox runat="server" ID="checkCron" CssClass="col-md-1 form-control mr-2 text-white" Checked="true" />
                                        </div>

                                        <div class="row mb-5" style="overflow-x: auto">
                                            <table class="col" id="table-cron">
                                            </table>
                                        </div>
                                    </div>
                                </div>

                                <asp:TextBox runat="server" ID="semanasSelec" CssClass="d-none" />

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
                                    <asp:Button Text="Marcar como resuelta" runat="server" CssClass="btn btn-warning" ID="btn_resolverObservacion" />
                                </div>

                            </div>
                        </asp:Panel>
                    </div>
                </div>

            </ContentTemplate>
        </asp:UpdatePanel>
    </form>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="jsextra" runat="server">
    <script src="<%= ResolveClientUrl("~/Views/js/Cronograma.js") %>"></script>
    <% if (edit == 0)
        { %>
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
                'eventos': true,
                'toSend': 'bodyContentBlank_semanasSelec',
                'data': []
            });

            $('#bodyContentBlank_checkCron').click(function () {
                if (cronograma.settings.numMonth == 3) {
                    cronograma.settings.numMonth = 6;
                    cronograma.Reload(cronograma.settings.dateStart);
                    cronograma.clickEvent();
                } else {
                    cronograma.settings.numMonth = 3;
                    cronograma.Reload(cronograma.settings.dateStart);
                    cronograma.clickEvent();
                }
            });
            $('#bodyContentBlank_inputfecha').change(function () {
                cronograma.Reload($(this).val());
                cronograma.clickEvent();
            });
            //para obtener los eventos registrados
            //console.log(cronograma.getEvents());
        });
    </script>
    <%}
    else
    {%>
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
        var psum = 0;
        for (let i = 0; i < $('.fondepro').length; i++) {
            psum += parseFloat($('.fondepro')[i].value);
        }
        $('#montoFondepro').val(psum.toFixed(2));
        $('#bodyContentBlank_montoTotalContrapartida').val((psum / 9).toFixed(2));
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
    <%}%>
</asp:Content>
