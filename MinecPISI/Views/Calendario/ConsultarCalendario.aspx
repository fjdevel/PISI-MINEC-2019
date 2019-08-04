<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Layouts/Layout2.Master" AutoEventWireup="true" CodeBehind="ConsultarCalendario.aspx.cs" Inherits="MinecPISI.Views.Calendario.ConsultarCalendario" %>
<asp:Content ID="Content1" ContentPlaceHolderID="cssextra" runat="server">
    <link href="<%= ResolveClientUrl("~/Views/js/fullcalendar/core/main.css") %>" rel='stylesheet' />
    <link href="<%= ResolveClientUrl("~/Views/js/fullcalendar/daygrid/main.css") %>" rel='stylesheet' />
    <link href="<%= ResolveClientUrl("~/Views/css/tempusdominus-bootstrap-4.min.css") %>" rel='stylesheet' />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contenidoNavegacion" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="bodyContentBlank" runat="server">
    <form id="form1" runat="server" onsubmit="topFunction(); return true">
        <asp:ScriptManager ID="ScriptManager1" runat="server" />

        <div class="card shadow mb-4">
            <div class="card-header py-3">

                <h6 class="  font-weight-bold text-primary">Calendario de Citas</h6>

            </div>
            <div class="card-body">
                
                <div class=" mt-5">
                    <div class="row justify-content-center">
                        <div id='calendar' class="col-md-10"></div>
                        <asp:HiddenField runat="server" ID="hf_fechaCompleta" />
                    </div>
                </div>
            </div>
        </div>

    </form>

</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="jsextra" runat="server">
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
                        title: '<%= c.NOMBRE_BENEFICIARIO %>',
                        description: 'Dirección:<%=c.DIRECCION %>  Hora:<%= c.HORA %> Beneficiario: <%= c.NOMBRE_BENEFICIARIO %>'
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
