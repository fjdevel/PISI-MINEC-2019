<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Layouts/Layout2.Master" AutoEventWireup="true" CodeBehind="ConsultarIniciativasBeneficiario.aspx.cs" Inherits="MinecPISI.Views.Formulacion.ConsultarIniciativasBeneficiario" %>
<asp:Content ID="Content1" ContentPlaceHolderID="cssextra" runat="server">
    <link href="../../Views/vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contenidoNavegacion" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="bodyContentBlank" runat="server">
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
                                <td><a href="<% Response.Write(HttpContext.Current.Request.ApplicationPath); %>/Casos/ProblemaIngresado/<%= p.ID_PROBLEMA %>"><%= p.NOMBRE_PROBLEMA %></a></td>
                                <td><%= p.ESTADO_PROCESO %> </td>
                                <td class="text-center">

                                    <%if (p.AYUDA) {
                                        if (p.ID_ESTADO == 15){%>
                                            Pendiente de Formulación
                                     <% }if (p.ID_ESTADO == 16 || p.ID_ESTADO == 17){%>
                                            <a href="<% Response.Write(HttpContext.Current.Request.ApplicationPath); %>/Formulacion/Detalle/Iniciativa/<%= p.NOMBRE_INICIATIVA %>/<%= p.ID_PROYECTO %>">
                                            <i class="far fw fa-file-alt fa-2x"></i>
                                        </a>
                                        <%} if (p.ID_ESTADO == 25) {
                                    %>
                                    <a href="<% Response.Write(HttpContext.Current.Request.ApplicationPath); %>/Formulacion/Documentar/Avances/<%= p.ID_PROYECTO %>">
                                            <i class="fas fw fa-business-time fa-2x"></i>
                                        </a>
                                    <%
                                        }
                                    
                                    }else{ 
                                       if (p.ID_ESTADO == 15){%>
                                        <a href="<% Response.Write(HttpContext.Current.Request.ApplicationPath); %>/Formulacion/Iniciativa/<%= p.NOMBRE_INICIATIVA %>/<%= p.ID_PROYECTO %>">
                                            <i class="far fw fa-edit fa-2x"></i>
                                        </a>
                                    <% }if (p.ID_ESTADO == 17){%>
                                            <a href="<% Response.Write(HttpContext.Current.Request.ApplicationPath); %>/Formulacion/Detalle/Iniciativa/<%= p.NOMBRE_INICIATIVA %>/<%= p.ID_PROYECTO %>">
                                            <i class="far fw fa-file-alt fa-2x"></i>
                                        </a>
                                        <%} if (p.ID_ESTADO == 25) {
                                    %>
                                    <a href="<% Response.Write(HttpContext.Current.Request.ApplicationPath); %>/Formulacion/Documentar/Avances/<%= p.ID_PROYECTO %>">
                                            <i class="fas fw fa-business-time fa-2x"></i>
                                        </a>
                                    <%
                                        }if (p.ID_ESTADO == 18) {
                                    %>
                                    <a href="<% Response.Write(HttpContext.Current.Request.ApplicationPath); %>/Editar/Iniciativa/<%= p.NOMBRE_INICIATIVA %>/<%= p.ID_PROYECTO %>">
                                           <i class="far fw fa-edit fa-2x"></i>
                                        </a>
                                    <%
                                        }
                                    } %>
                                   
                                    
                                    
                                    <%--<% if (p.ID_ESTADO == 15 && !p.AYUDA)
                                        { %>
                                        <a href="<% Response.Write(HttpContext.Current.Request.ApplicationPath); %>/Formulacion/Iniciativa/<%= p.NOMBRE_INICIATIVA %>/<%= p.ID_PROYECTO %>">
                                            <i class="far fw fa-edit fa-2x"></i>
                                        </a>
                                    <%}
                                    if(p.ID_ESTADO == 13 || p.ID_ESTADO == 15)
                                    { %>
                                        Pendiente de Formulación
                                     <%}
                                    if (p.ID_ESTADO == 25) {
                                    %>
                                    <a href="<% Response.Write(HttpContext.Current.Request.ApplicationPath); %>/Formulacion/Documentar/Avances/<%= p.ID_PROYECTO %>">
                                            <i class="fas fw fa-business-time fa-2x"></i>
                                        </a>
                                    <%
                                        }
                                    if(p.AYUDA)
                                     { %>
                                        <a href="<% Response.Write(HttpContext.Current.Request.ApplicationPath); %>/Formulacion/Detalle/Iniciativa/<%= p.NOMBRE_INICIATIVA %>/<%= p.ID_PROYECTO %>">
                                            <i class="far fw fa-file-alt fa-2x"></i>
                                        </a>
                                    <% } %>--%>
                                    
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
<asp:Content ID="Content4" ContentPlaceHolderID="jsextra" runat="server">
     <script src="<%= ResolveClientUrl("~/Views/vendor/datatables/jquery.dataTables.min.js") %>"></script>
    <script src="<%= ResolveClientUrl("~/Views/vendor/datatables/dataTables.bootstrap4.js") %>"></script>
    <script>
        $(document).ready(function () {
            $('#iniciativas').DataTable({
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
