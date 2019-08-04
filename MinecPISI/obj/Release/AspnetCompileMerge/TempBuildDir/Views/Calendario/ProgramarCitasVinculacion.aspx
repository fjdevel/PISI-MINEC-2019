<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Layouts/Layout2.Master" AutoEventWireup="true" CodeBehind="ProgramarCitasVinculacion.aspx.cs" Inherits="MinecPISI.Views.Calendario.ProgramarCitasVinculacion" %>
<asp:Content ID="Content1" ContentPlaceHolderID="cssextra" runat="server">
    <link href='fullcalendar/core/main.css' rel='stylesheet' />
    <link href="<%= ResolveClientUrl("~/Views/js/fullcalendar/core/main.css") %>" rel='stylesheet' />
    <link href="<%= ResolveClientUrl("~/Views/js/fullcalendar/daygrid/main.css") %>" rel='stylesheet' />
    <link href="<%= ResolveClientUrl("~/Views/css/tempusdominus-bootstrap-4.min.css") %>" rel='stylesheet' />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contenidoNavegacion" runat="server">
    <hr class="sidebar-divider">
    <!--#include file="~/Views/Navegacion/ConsultorDeVinculacion.html"-->
    
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="bodyContentBlank" runat="server">
    <div class="card shadow mb-4">
    <div class="card-header py-3">
        <h6 class="  font-weight-bold text-primary">Registrar Cita con Beneficiario</h6>
    </div>
    <div class="card-body">
        <div class="row">
            <div class="col">
                <h4 class="small font-weight-bold">Nombre:</h4>
                <p>Juan Jose Lopez</p>
            </div>
            <div class="col">
                <h4 class="small font-weight-bold">NIT:</h4>
                <p>018-345344-1075</p>
            </div>
            <div class="col">
                <h4 class="small font-weight-bold">Telefono</h4>
                <p>2516 2516</p>
            </div>
            <div class="col">
                <h4 class="small font-weight-bold">Estado</h4>
                <p>SPA</p>
            </div>
            <div class="col">
                <h4 class="small font-weight-bold">Municipio</h4>
                <p>Sonsonate</p>
            </div>
        </div>
        <div class=" mt-5">
            <div class="row justify-content-center">
                    <div id='calendar' class="col-md-10"></div>
            </div>
        </div>
    </div>
</div>

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
                <textarea class="form-control" id="direccionCita" placeholder="Ingrese la direccion de la cita" rows="4"></textarea>
              </div>
              <div class="col-sm-6">
                    <div class="form-group">
                        <label>Ingrese la hora:</label>
                        <div class="input-group date" id="hora" data-target-input="nearest">
                            
                            <input type="text" class="form-control datetimepicker-input" data-target="#hora"/>
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
        <button type="button" class="btn btn-primary">Guardar Cita</button>
      </div>
    </div>
  </div>
</div>
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
            $('#modalCita').modal('toggle');
        }

      document.addEventListener('DOMContentLoaded', function() {
        var calendarEl = document.getElementById('calendar');

        var calendar = new FullCalendar.Calendar(calendarEl, {
            plugins: ['dayGrid', 'interaction'],
            dateClick: function (day) {
                mostrarModalCita(day);
            }
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

    </script>
</asp:Content>
