<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Layouts/Layout2.Master" AutoEventWireup="true" CodeBehind="ConsultarEstadoIniciativa.aspx.cs" Inherits="MinecPISI.Views.Formulacion.ConsultarEstadoIniciativa" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cssextra" runat="server">
    <link href="../../Views/vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet" />
</asp:Content>


<asp:Content ID="Content4" ContentPlaceHolderID="bodyContentBlank" runat="server">
    <form id="form1" runat="server">
        <div class="card shadow mb-4">
        <div class="card-header py-3">
            <h6 class="  font-weight-bold text-primary">Consulta de Iniciativas</h6>
        </div>
        <div class="card-body">
            <div class="table-responsive">
                <table id="iniciativas" class="table table-bordered">
                    <thead>
                        <tr>
                          <th scope="col">Proyecto</th>
                          <th scope="col">Última Actualización</th>
                           <th scope="col">Beneficiario</th>
                          <th scope="col">Problema</th>
                          <th scope="col">Estado</th>
                          <th scope="col">Iniciativa</th>
                        </tr>
                      </thead>
                    <tbody>
                        <% foreach (dynamic p in iniciativas)
                                      { %>
                            <tr>
                                <td><%= p.COD_PROYECTO %></td>
                                <td><%= p.FECHA_ACTUALIZACION %></td>
                                <td><%= p.NOMBRE_BENEFICIARIO %></td>
                                <td><a href="<% Response.Write(HttpContext.Current.Request.ApplicationPath); %>/Casos/ProblemaIngresado/<%= p.ID_PROBLEMA %>"><%= p.NOMBRE_PROBLEMA %></a></td>
                                <td><%= p.ESTADO_PROCESO %> </td>
                                <td class="text-center"><% if (p.ID_ESTADO == 15 && usuario.NOMBRE_ROL.ToUpper() =="FORMULADOR")
                                        { %>
                                        <a href="<% Response.Write(HttpContext.Current.Request.ApplicationPath); %>/Formulacion/Iniciativa/<%= p.NOMBRE_INICIATIVA %>/<%= p.ID_PROYECTO %>">
                                            <i class="far fw fa-edit fa-2x"></i>
                                        </a>
                                    <%}if (p.ID_ESTADO == 18 || p.ID_ESTADO ==33 && usuario.NOMBRE_ROL.ToUpper() =="FORMULADOR")
                                        { %>
                                        <a href="<% Response.Write(HttpContext.Current.Request.ApplicationPath); %>/Editar/Iniciativa/<%= p.NOMBRE_INICIATIVA %>/<%= p.ID_PROYECTO %>">
                                            <i class="fas fw fa-exclamation-triangle fa-2x"></i>
                                        </a>
                                    <%}
                                     if (p.ID_ESTADO == 17 || p.ID_ESTADO == 16)
                                        { %>
                                    <a href="<% Response.Write(HttpContext.Current.Request.ApplicationPath); %>/Formulacion/Detalle/Iniciativa/<%= p.NOMBRE_INICIATIVA %>/<%= p.ID_PROYECTO %>">
                                            <i class="far fw fa-file-alt fa-2x"></i>
                                        </a>
                                    <%}
                                        if (p.ID_ESTADO == 19  && usuario.NOMBRE_ROL.ToUpper() == "COORDINADOR")
                                        { %>
                                        <a href="<% Response.Write(HttpContext.Current.Request.ApplicationPath); %>/Formulacion/FiltroTecnico/<%= p.ID_PROYECTO %>">
                                            <i class="fas fw fa-list-ol fa-2x"></i>
                                        </a>
                                    <%}if (p.ID_ESTADO == 20  && usuario.NOMBRE_ROL.ToUpper() == "COMITÉ EVALUADOR")
                                        { %>
                                        <a href="<% Response.Write(HttpContext.Current.Request.ApplicationPath); %>/Formulacion/Evaluar/Iniciativa/<%= p.ID_PROYECTO %>">
                                            <i class="fas fw fa-list-ol fa-2x"></i>
                                        </a>
                                    <%}if (p.ID_ESTADO == 20  && usuario.NOMBRE_ROL.ToUpper() == "PRESIDENTE")
                                        { %>
                                        <a href="<% Response.Write(HttpContext.Current.Request.ApplicationPath); %>/Formulacion/Monitorear/Iniciativa/<%= p.ID_PROYECTO %>">
                                            <i class="fas fw fa-list-ol fa-2x"></i>
                                        </a>
                                    <%}if (p.ID_ESTADO == 22 && usuario.NOMBRE_ROL.ToUpper() == "COORDINADOR")
                                        { %>
                                        <a href="<% Response.Write(HttpContext.Current.Request.ApplicationPath); %>/Formulacion/Detalle/Iniciativa/<%= p.NOMBRE_INICIATIVA %>/<%= p.ID_PROYECTO %>">
                                            <i class="fas fw fa-business-time fa-2x"></i>
                                        </a>
                                    <%}if (p.ID_ESTADO == 24 && usuario.NOMBRE_ROL.ToUpper() == "COORDINADOR")
                                        { %>
                                        <a href="<% Response.Write(HttpContext.Current.Request.ApplicationPath); %>/Formulacion/Facturar/Iniciativa/<%= p.ID_PROYECTO %>">
                                            <i class="fas fw fa-file-invoice-dollar fa-2x"></i>
                                        </a>
                                    <%}%>
                                </td>
                            </tr>
                        <% } %>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
        </form>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="jsextra" runat="server">
     <script src="<%= ResolveClientUrl("~/Views/vendor/datatables/jquery.dataTables.min.js") %>"></script>
    <script src="<%= ResolveClientUrl("~/Views/vendor/datatables/dataTables.bootstrap4.js") %>"></script>
    <script>
        $(document).ready(function () {
            $('#dataTableIniciativa').DataTable({
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
