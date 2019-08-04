<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Layouts/Layout2.Master" AutoEventWireup="true" CodeBehind="DocumentarAvancesDeEjecucion.aspx.cs" Inherits="MinecPISI.Views.Formulacion.DocumentarAvancesDeEjecucuin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cssextra" runat="server">
    <link href="<%= ResolveClientUrl("~/Views/css/tempusdominus-bootstrap-4.min.css") %>" rel='stylesheet' />
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
            height: 45px;
        }

        .celda {
            width: 30px;
            border: 0.3px solid gray !important;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contenidoNavegacion" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="bodyContentBlank" runat="server">
    <form runat="server">
        <div class="card shadow mb-4">
            <div class="card-header py-3">
                <h6 class="  font-weight-bold text-primary">Seguimiento del proyecto</h6>
            </div>
            <div class="card-body">
                <!-- inicio del cronograma -->
                <div class="container">

                    <div class="form-group col-md-4">
                        <label>Fecha de inicio del proyecto</label>
                        <asp:TextBox runat="server" type="date" CssClass="form-control" ID="inputfecha" disabled />
                    </div>
                    <div class="row mt-3">

                        <div class="col">
                            <div class="row mb-5" style="overflow-x: auto">
                                <table class="col" id="table-cron"></table>
                            </div>
                        </div>
                    </div>
                </div>
                <asp:TextBox runat="server" ID="semanasSelec" CssClass="d-none" />
                <!-- Fin del cronograma -->
                <div>
                </div>
                <div class="container accordion" id="actividades">
                    <div class="col-xl-4 col-md-4 mb-4">
                            <div class="card border-left-warning h-100 py-2">
                                <div class="card-body">
                                    <div class="row no-gutters align-items-center">
                                        <div class="col mr-2">
                                            <div class="text-xs font-weight-bold text-primary mb-1">Factura</div>
                                            <div class="h5 mb-0 font-weight-bold text-gray-800" >
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
                    <%if (proyecto.ID_ESTADO_PROCESO != 26)
                        { %>
                    <%if (terminado)
                        { %>
                    <asp:Button runat="server" CssClass="btn btn-danger" Text="Finalizar Proyecto" ID="FinProy" OnClick="FinProy_Click" />
                    <%} %>

                    <%} %>
                    <% foreach (dynamic ac in detalleActividad)
                        {  %>
                    <div class="card">
                        <div class="card-header" data-toggle="collapse" data-target="#collapse<%= ac.ID_PROYECTO_ACTIVIDAD %>" aria-expanded="true" aria-controls="collapse<%= ac.ID_PROYECTO_ACTIVIDAD %>">
                            <h5 class="mb-0">
                                <%= ac.DESCRIPCION %>
                            </h5>
                        </div>
                        <div id="collapse<%= ac.ID_PROYECTO_ACTIVIDAD %>" class="collapse" data-parent="#actividades">
                            <div class="card-body">

                                <div class="progress mb-5">
                                    <div class="progress-bar progress-bar-striped progress-bar-animated" role="progressbar" aria-valuenow="<%= ac.PORCENTAJE_AVACE %>" aria-valuemin="0" aria-valuemax="100" style="width: <%= ac.PORCENTAJE_AVACE %>%"><%= ac.PORCENTAJE_AVACE %>%</div>
                                </div>
                                <table class="table table-borderless">
                                    <thead>
                                        <tr>
                                            <th scope="col">Descripcion </th>
                                            <th scope="col">Semana Inicio </th>
                                            <th scope="col">Semana Fin </th>
                                            <th scope="col">Monto Ejecutado</th>
                                            <th scope="col">Fecha de registro</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <% foreach (dynamic e in detalleEjecucion)
                                            {
                                                if (e.ID_PROYECTO_ACTIVIDAD == ac.ID_PROYECTO_ACTIVIDAD)
                                                {
                                        %>
                                        <tr>
                                            <th><%= e.DESCRIPCION %></th>
                                            <th><%= e.SEMANA_INICIO %></th>
                                            <th><%= e.SEMANA_FIN %></th>
                                            <th><%= Convert.ToDecimal(e.MONTO) %></th>
                                            <td><%= e.FECHA %></td>
                                        </tr>
                                        <%
                                            }
                                        %>

                                        <%} %>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                    <%} %>
                    <div class="card">
                        <div class="card-header" data-toggle="collapse" data-target="#collapsese" aria-expanded="true">
                            <h5 class="mb-0">Solicitud de seguimiento
                            </h5>
                        </div>
                        <div id="collapsese" class="collapse" data-parent="#actividades">
                            <div class="card-body">
                            <div class="form-group">
                                <label>Descripción</label>
                                <input type="text" class="form-control" runat="server" placeholder="Ingrese la descripción de la solicitud" id="direccionCita" />
                            </div>
                            <asp:Button Text="Guardar Solicitud" runat="server" CssClass="btn btn-primary" ID="btn_guardarSolicitud" />
                                <table class="table table-borderless">
                                    <thead>
                                        <tr>
                                            <th scope="col">Fecha</th>
                                            <th scope="col">Descripción</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <% foreach (dynamic e in detalleSolicitudes)
                                            {
                                        %>
                                        <tr>
                                            <th><%= e.FECHA %></th>
                                            <th><%= e.DESCRIPCION %></th>
                                        </tr>

                                        <%} %>
                                    </tbody>
                                </table>
                                </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>

        <div class="modal fade" id="modalSeguimiento" tabindex="-1" role="dialog" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered modal-lg" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalCenterTitle">Ingrese Avance de Ejecución</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <div class="form-group">
                            <label>Actividad Seleccionada</label>
                            <asp:TextBox runat="server" ID="nombreActividadSelec" CssClass="form-control"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label>Presupuesto General:</label>
                            <table class="table">
                                <% switch (proyecto.ID_TIPO_INICIATIVA)
                                    { %>
                                <%case 1: %>
                                <tr>
                                    <td><%= campos.Find(x => x.ID_CAMPO==21).NOMBRE_CAMPO %> : <span style="color: #1cc88a">$ <%= detalles.Find(x=> x.ID_CAMPO == campos.Find(y => y.ID_CAMPO==21).ID_CAMPO).VALOR %></span></td>
                                </tr>
                                <tr>
                                    <td><%= campos.Find(x => x.ID_CAMPO==22).NOMBRE_CAMPO %> : <span style="color: #1cc88a">$ <%= detalles.Find(x=> x.ID_CAMPO == 22).VALOR %></span></td>
                                </tr>
                                <tr>
                                    <td><%= campos.Find(x => x.ID_CAMPO==23).NOMBRE_CAMPO %> : <span style="color: #1cc88a">$ <%= detalles.Find(x=> x.ID_CAMPO == 23).VALOR %></span></td>
                                </tr>
                                <tr>
                                    <td><%= campos.Find(x => x.ID_CAMPO==184).NOMBRE_CAMPO %> : <span style="color: #1cc88a">$ <%= detalles.Find(x=> x.ID_CAMPO == 184).VALOR %></span></td>
                                </tr>
                                <% break; %>
                                <%case 2: %>
                                <tr>
                                    <td><%= campos.Find(x => x.ID_CAMPO==58).NOMBRE_CAMPO %> : <span style="color: #1cc88a">$ <%= detalles.Find(x=> x.ID_CAMPO == campos.Find(y => y.ID_CAMPO==58).ID_CAMPO).VALOR %></span></td>
                                </tr>
                                <tr>
                                    <td><%= campos.Find(x => x.ID_CAMPO==59).NOMBRE_CAMPO %> : <span style="color: #1cc88a">$ <%= detalles.Find(x=> x.ID_CAMPO == 59).VALOR %></span></td>
                                </tr>
                                <tr>
                                    <td><%= campos.Find(x => x.ID_CAMPO==60).NOMBRE_CAMPO %> : <span style="color: #1cc88a">$ <%= detalles.Find(x=> x.ID_CAMPO == 60).VALOR %></span></td>
                                </tr>
                                <tr>
                                    <td><%= campos.Find(x => x.ID_CAMPO==185).NOMBRE_CAMPO %> : <span style="color: #1cc88a">$ <%= detalles.Find(x=> x.ID_CAMPO == 185).VALOR %></span></td>
                                </tr>
                                <% break; %>
                                <%case 3: %>
                                <tr>
                                    <td><%= campos.Find(x => x.ID_CAMPO==99).NOMBRE_CAMPO %> : <span style="color: #1cc88a">$ <%= detalles.Find(x=> x.ID_CAMPO == campos.Find(y => y.ID_CAMPO==99).ID_CAMPO).VALOR %></span></td>
                                </tr>
                                <tr>
                                    <td><%= campos.Find(x => x.ID_CAMPO==100).NOMBRE_CAMPO %> : <span style="color: #1cc88a">$ <%= detalles.Find(x=> x.ID_CAMPO == 100).VALOR %></span></td>
                                </tr>
                                <tr>
                                    <td><%= campos.Find(x => x.ID_CAMPO==101).NOMBRE_CAMPO %> : <span style="color: #1cc88a">$ <%= detalles.Find(x=> x.ID_CAMPO == 101).VALOR %></span></td>
                                </tr>
                                <tr>
                                    <td><%= campos.Find(x => x.ID_CAMPO==186).NOMBRE_CAMPO %> : <span style="color: #1cc88a">$ <%= detalles.Find(x=> x.ID_CAMPO == 186).VALOR %></span></td>
                                </tr>
                                <% break; %>
                                <%case 4: %>
                                <tr>
                                    <td><%= campos.Find(x => x.ID_CAMPO==171).NOMBRE_CAMPO %> : <span style="color: #1cc88a">$ <%= detalles.Find(x=> x.ID_CAMPO == campos.Find(y => y.ID_CAMPO==171).ID_CAMPO).VALOR %></span></td>
                                </tr>
                                <tr>
                                    <td><%= campos.Find(x => x.ID_CAMPO==172).NOMBRE_CAMPO %> : <span style="color: #1cc88a">$ <%= detalles.Find(x=> x.ID_CAMPO == 172).VALOR %></span></td>
                                </tr>
                                <tr>
                                    <td><%= campos.Find(x => x.ID_CAMPO==173).NOMBRE_CAMPO %> : <span style="color: #1cc88a">$ <%= detalles.Find(x=> x.ID_CAMPO == 173).VALOR %></span></td>
                                </tr>
                                <tr>
                                    <td><%= campos.Find(x => x.ID_CAMPO==174).NOMBRE_CAMPO %> : <span style="color: #1cc88a">$ <%= detalles.Find(x=> x.ID_CAMPO == 174).VALOR %></span></td>
                                </tr>
                                <tr>
                                    <td><%= campos.Find(x => x.ID_CAMPO==175).NOMBRE_CAMPO %> : <span style="color: #1cc88a">$ <%= detalles.Find(x=> x.ID_CAMPO == 175).VALOR %></span></td>
                                </tr>
                                <tr>
                                    <td><%= campos.Find(x => x.ID_CAMPO==176).NOMBRE_CAMPO %> : <span style="color: #1cc88a">$ <%= detalles.Find(x=> x.ID_CAMPO == 176).VALOR %></span></td>
                                </tr>
                                <tr>
                                    <td><%= campos.Find(x => x.ID_CAMPO==177).NOMBRE_CAMPO %> : <span style="color: #1cc88a">$ <%= detalles.Find(x=> x.ID_CAMPO == 177).VALOR %></span></td>
                                </tr>
                                <tr>
                                    <td><%= campos.Find(x => x.ID_CAMPO==187).NOMBRE_CAMPO %> : <span style="color: #1cc88a">$ <%= detalles.Find(x=> x.ID_CAMPO == 187).VALOR %></span></td>
                                </tr>
                                <% break; %>
                                <%} %>
                            </table>
                        </div>
                        <div class="form-group row">
                            <div class="col">
                                <label>Fecha Inicial</label>
                                <asp:TextBox runat="server" type="text" ID="datestart" class="form-control" />
                            </div>
                            <div class="col">
                                <label>Fecha Final</label>
                                <asp:TextBox runat="server" type="text" ID="dateend" class="form-control" />
                            </div>
                        </div>
                        <div class="form-group ">
                            <label>Digite la Descripcion</label>
                            <asp:TextBox runat="server" type="text" CssClass="form-control" ID="descripcion" placeholder="Describa las actividades/inversiones/gastos del proyecto" Rows="3" TextMode="MultiLine" />
                        </div>
                        <div class="form-group">
                            <label>Ingrese el monto ejecutado</label>
                            <asp:TextBox runat="server" min="0,00" type="number" step="any" CssClass="form-control" ID="monto" placeholder="$ 0,00" />
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
                        <asp:Button runat="server" CssClass="btn btn-primary" Text="Guardar Avance" ID="Btn_GuardarEjecucion" />
                    </div>
                </div>
            </div>
        </div>

    </form>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="jsextra" runat="server">
    <script src="<%= ResolveClientUrl("~/Views/js/Cronograma.js") %>"></script>
    <script type="text/javascript" src="<%= ResolveClientUrl("~/Views/js/moment.min.js") %>"></script>
    <script type="text/javascript" src="<%= ResolveClientUrl("~/Views/js/es.js") %>"></script>
    <script type="text/javascript" src="<%= ResolveClientUrl("~/Views/js/tempusdominus-bootstrap-4.min.js") %>"></script>
    <script>

        $(() => {
            $('.fc-today-button').text("Hoy");
            $('#hora').datetimepicker({
                icons: {
                    time: "fa fa-clock",
                    up: "fa fa-arrow-up",
                    down: "fa fa-arrow-down",
                },
                format: 'LT',
                locale: 'es'
            });
            var tipo = <%= proyecto.ID_TIPO_INICIATIVA %>;
            var headers;
            switch (tipo) {
                case 1:
                    var headers = [
                        "Adopción o incorporación Tecnológica",
                        "Componentes acciones y/o tecnología Adicional necesaria para la Adquisición, internación, instalación y/o el funcionamiento de la tecnología",
                        "Otros a ser considerados",
                        "Monto Contra partida Beneficiario"
                    ];
                    var cronograma = new $.Cronograma($('#table-cron'), {
                        'numMonth': 3,
                        'dateStart': new Date(),
                        'subHeaders': headers,
                        //habilita las funciones de manejar eventos
                        'eventos': true,
                        'data': $('#bodyContentBlank_semanasSelec').val(),
                        'seguimiento': true,
                    });
                    break;
                case 2:
                    var headers = [
                        "Asistenica Tecnica y/o Transferencia tecnologica",
                        "Recursos Adicionales para la Asistencia tecnica o transferecia de conocimiento",
                        "Otros a ser considerados",
                        "Monto Contra partida Beneficiario"
                    ];
                    var cronograma = new $.Cronograma($('#table-cron'), {
                        'numMonth': 3,
                        'dateStart': new Date(),
                        'subHeaders': headers,
                        //habilita las funciones de manejar eventos
                        'eventos': true,
                        'data': $('#bodyContentBlank_semanasSelec').val(),
                        'seguimiento': true
                    });
                    break;
                case 3:
                    var headers = [
                        "Iniciativa de Proyecto de Innovación y o desarrollo Tecnológico",
                        "Recursos Adicionales para el Proyecto de Innovación y o desarrollo Tecnológico",
                        "Otros a ser considerados",
                        "Monto Contra partida Beneficiario"
                    ];
                    var cronograma = new $.Cronograma($('#table-cron'), {
                        'numMonth': 3,
                        'dateStart': new Date(),
                        'subHeaders': headers,
                        //habilita las funciones de manejar eventos
                        'eventos': true,
                        'data': $('#bodyContentBlank_semanasSelec').val(),
                        'seguimiento': true
                    });
                    break;
                case 4:
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
                        'dateStart': new Date(),
                        'subHeaders': headers,
                        //habilita las funciones de manejar eventos
                        'eventos': true,
                        'data': $('#bodyContentBlank_semanasSelec').val(),
                        'seguimiento': true
                    });
                    break;
            }
            cronograma.Reload($('#bodyContentBlank_inputfecha').val());
            cronograma.clickEvent();


            $('.celda').click((celda) => {
                $('#modalSeguimiento').modal('toggle');
                $('#bodyContentBlank_nombreActividadSelec').val(celda.currentTarget.getAttribute("data-head"));
                $('#bodyContentBlank_datestart').val(celda.currentTarget.getAttribute("data-start"));
                $('#bodyContentBlank_dateend').val(celda.currentTarget.getAttribute("data-end"));
            });
        });
    </script>
</asp:Content>
