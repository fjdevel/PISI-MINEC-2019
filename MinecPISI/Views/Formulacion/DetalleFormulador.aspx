<%@ Page Language="C#" MasterPageFile="~/Views/Layouts/Layout2.Master" AutoEventWireup="true" CodeBehind="DetalleFormulador.aspx.cs" Inherits="MinecPISI.Views.Formulacion.DetalleFormulador" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cssextra" runat="server">
    <link href="<%= ResolveUrl("~/Views/vendor/datatables/dataTables.bootstrap4.min.css") %>" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contenidoNavegacion" runat="server">
                </asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="bodyContentBlank" runat="server">

  <div class="card shadow mb-4">
    <div class="card-header py-3">
        <h6 class="  font-weight-bold text-primary">Datos Personales</h6>

    </div>

    <div class="card-body">

        <form method="" runat="server">
           <div class="form-group">
                <div class="form-row">
                    <div class="form-group col-lg-6">
                        <label>Nombres</label>
                        <input type="text" class="form-control" value="<%=infoFormulador.NOMBRES%>" readonly="readonly" >
                    </div>
                    <div class="form-group col-lg-6">
                        <label>Apellidos</label>
                        <input type="text" class="form-control" value="<%=infoFormulador.APELLIDOS%>" readonly="readonly">
                    </div>
                </div>
               <div class="form-row">
                    <div class="form-group col-lg-6">
                        <label>Correo</label>
                        <input type="text" class="form-control" value="<%=infoFormulador.CORREO_E%>" readonly="readonly" >
                    </div>
                    <div class="form-group col-lg-6">
                        <label>Direcci&oacute;n</label>
                        <input type="text" class="form-control" value="<%=infoFormulador.DIRECCION%>" readonly="readonly">
                    </div>
                </div>
                <div class="form-row">
                    <div class="form-group col-lg-6">
                        <label>Tel&eacute;fono Fijo</label>
                        <input type="text" class="form-control" value="<%=infoFormulador.TEL_FIJO%>" readonly="readonly" >
                    </div>
                    <div class="form-group col-lg-6">
                        <label>Tel&eacute;fono Celular</label>
                        <input type="text" class="form-control" value="<%=infoFormulador.TEL_CEL%>" readonly="readonly">
                    </div>
                </div>
                <div class="form-row">
                    <div class="form-group col-lg-6">
                        <label>Grado Acad&eacute;mico</label>
                        <input type="text" class="form-control" value="<%=infoFormulador.GRADO_ACADEMICO%>" readonly="readonly" >
                    </div>
                    <div class="form-group col-lg-6">
                        <label>A&ntilde;os de Experiencia</label>
                        <input type="text" class="form-control" value="<%=infoFormulador.ANIOS_EXPERIENCIA%>" readonly="readonly">
                    </div>
                </div>
           </div>
        </form>
    </div> 
  </div>

  <div class="card shadow mb-4">
    <div class="card-header py-3">
        <h6 class="  font-weight-bold text-primary">Experiencia</h6>


    </div>
    <div class="card-body">
        <div class="table-responsive">
            <table class="table table-bordered" id="dataTableFormulador" width="100%" cellspacing="0">
                <thead>
                    <tr>
                        <th>Institucion</th>
                        <th>Cargo</th>
                        <th>Tiempo</th>
                        <th>Proyecto</th>
                    </tr>
                </thead>
                <tbody>
                    <% foreach (var d in detallesFormulador) { %>
                        <tr>
                            
                            <td><%=d.INSTITUCION %></td>
                            <td><%=d.CARGO %></td>
                            <td><%=d.TIEMPO %></td>
                            <td><%=d.PROYECTO %></td>

                        </tr>
                    <%} %>

                </tbody>
            </table>
        </div>
    </div>
</div>
</asp:Content>

<asp:Content ID="Content5" ContentPlaceHolderID="jsextra" runat="server">
     <script src="<%= ResolveClientUrl("~/Views/vendor/datatables/jquery.dataTables.min.js") %>"></script>
    <script src="<%= ResolveClientUrl("~/Views/vendor/datatables/dataTables.bootstrap4.js") %>"></script>
    <script>
        $(document).ready(function () {
            $('#dataTableFormulador').DataTable({
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
</asp:Content>
