<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Layouts/Layout2.Master" AutoEventWireup="true" CodeBehind="ProgramarCitasVinculacion.aspx.cs" Inherits="MinecPISI.Views.Calendario.ProgramarCitasVinculacion" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cssextra" runat="server">
    <link href="<%= ResolveClientUrl("~/Views/js/fullcalendar/core/main.css") %>" rel='stylesheet' />
    <link href="<%= ResolveClientUrl("~/Views/js/fullcalendar/daygrid/main.css") %>" rel='stylesheet' />
    <link href="<%= ResolveClientUrl("~/Views/css/tempusdominus-bootstrap-4.min.css") %>" rel='stylesheet' />

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contenidoNavegacion" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="bodyContentBlank" runat="server">
    <form id="form1" runat="server" onsubmit="topFunction(); return true">
        <asp:ScriptManager ID="ScriptManager1" runat="server" />

        <div class="card shadow mb-4">
            <div class="card-header py-3">

                <h6 class="  font-weight-bold text-primary">Registrar Cita con Beneficiario</h6>

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
                    <div class="col">
                        <h4 class="small font-weight-bold">Municipio</h4>
                        <asp:Label ID="lbl_muni" runat="server" />
                    </div>
                </div>
                <div class=" mt-5">
                    <div class="row justify-content-center">
                        <div id='calendar' class="col-md-10"></div>
                        <asp:HiddenField runat="server" ID="hf_fechaCompleta" />
                    </div>
                </div>
            </div>
        </div>

        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <div class="modal" tabindex="-1" role="dialog" id="modalCita">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title">Agendar Cita</h5>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body">
                                <form>
                                    <div class="form-group">
                                        <label>Direccion</label>
                                        <input type="text" class="form-control" runat="server" required placeholder="Ingrese la direccion de la cita" id="direccionCita" />
                                    </div>
                                    <div class="col-sm-6">
                                        <div class="form-group">
                                            <label>Ingrese la hora:</label>
                                            <div class="input-group date" id="hora" data-target-input="nearest">

                                                <input type="text" class="form-control datetimepicker-input" data-target="#hora" id="txt_hora" runat="server" required />
                                                <div class="input-group-append" data-target="#hora" data-toggle="datetimepicker">
                                                    <div class="input-group-text"><i class="fa fa-clock"></i></div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </form>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
                                <asp:Button Text="Guardar Cita" runat="server" CssClass="btn btn-primary" ID="btn_guardarCita" OnClick="btn_guardarCita_OnClick" />
                            </div>
                        </div>
                    </div>
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
    </form>

</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="jsextra" runat="server">
    <script src="<%= ResolveClientUrl("~/Views/js/fullcalendar/core/main.js") %>"></script>
    <script src="<%= ResolveClientUrl("~/Views/js/fullcalendar/daygrid/main.js") %>"></script>
    <script src="<%= ResolveClientUrl("~/Views/js/fullcalendar/interaction/main.min.js") %>"></script>
    <script type="text/javascript" src="<%= ResolveClientUrl("~/Views/js/moment.min.js") %>"></script>
    <script type="text/javascript" src="<%= ResolveClientUrl("~/Views/js/es.js") %>"></script>
    <script type="text/javascript" src="<%= ResolveClientUrl("~/Views/js/tempusdominus-bootstrap-4.min.js") %>"></script>
    <script>
        function mostrarModalCita(day) {
            debugger;
            $('#modalCita').modal('toggle');
            $('#<%= hf_fechaCompleta.ClientID %>').val(day.dateStr);
        }

        document.addEventListener('DOMContentLoaded', function () {
            var calendarEl = document.getElementById('calendar');

            var calendar = new FullCalendar.Calendar(calendarEl, {
                plugins: ['dayGrid', 'interaction',],
                defaultView: 'dayGridMonth',
                dateClick: function (day) {
                    mostrarModalCita(day);
                },
                events: [
                    <%foreach (var c in citas)
                    { %>{
                        start: '<%= Convert.ToDateTime(c.FECHA).Year %>-<%= Convert.ToDateTime(c.FECHA).Month %>-<%= Convert.ToDateTime(c.FECHA).Day %>',
                        title: 'Cita con beneficiario',
                        description: 'Dirección:<%=c.DIRECCION %>  Hora:<%= c.HORA %>'
                    },
                    <%} %>
                ],
                eventRender: function (info) {
                    info.el.addEventListener("click", () => {alert(info.event.extendedProps.description) }, false);
                },
                eventColor: 'rgb(0,33,87)',
                eventTextColor: '#FFF'
            });
            calendar.setOption('locale', 'es');
            calendar.render();

        });
        $(function () {
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
        });

        function topFunction() {
            document.body.scrollTop = 0;
            document.documentElement.scrollTop = 0;
        }
    </script>
</asp:Content>
