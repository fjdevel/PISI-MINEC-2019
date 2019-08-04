<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Layouts/Layout2.Master" AutoEventWireup="true" CodeBehind="ConsultarEstadoIniciativa.aspx.cs" Inherits="MinecPISI.Views.Formulacion.ConsultarEstadoIniciativa" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cssextra" runat="server">
    <link href="../../Views/vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contenidoNavegacion" runat="server">
    <hr class="sidebar-divider">
    <% 
        //Aqui de debe hacer la validacion de que navegacion mostrar si el del coordinador o consultor
        switch (usuario)
        {
            case "Beneficiario":
    %>
    <!--#include file="~/Views/Navegacion/Beneficiario.html"-->
    <%
            break;
        case "Formulador":
    %>
    <!--#include file="~/Views/Navegacion/Formulador.html"-->
    <%
            break;
        case "Coordinador":
    %>
    <!--#include file="~/Views/Navegacion/Coordinador.html"-->
    <%
            break;
        }
    %>
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="bodyContentBlank" runat="server">
    <div class="card shadow mb-4">
        <div class="card-header py-3">
            <h6 class="  font-weight-bold text-primary">Consulta de Iniciativas</h6>
        </div>
        <div class="card-body">
            <div class="table-responsive">
                <table class="table table-bordered" id="dataTableIniciativa" width="100%" cellspacing="0">
                    <thead>
                        <tr>
                            <th class="d-none">Id</th>
                            <th>Nombre</th>
                            <th>Formulador</th>
                            <th>Última Actualizacion</th>
                            <th>Estado</th>
                            <th>Detalle Iniciativa</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td class="d-none">1</td>
                            <td>JJL8305</td>
                            <td>Andres Menjivar</td>
                            <td>2  Días</td>
                            <td>En Evaluacion</td>
                            <td class="text-center">
                                <a href="/Formulacion/DetalleIniciativa/1/1" class="btn btn-info btn-circle">
                                    <i class="fa fa-info-circle"></i>
                                </a>
                            </td>
                        </tr>
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
