<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Layouts/Layout2.Master" AutoEventWireup="true" CodeBehind="ConsultarCasosDelFormulador.aspx.cs" Inherits="MinecPISI.Views.Casos.ConsultarCasosDelFormulador" %>
<asp:Content ID="Content1" ContentPlaceHolderID="cssextra" runat="server">
    <link href="../../Views/vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contenidoNavegacion" runat="server">
    <hr class="sidebar-divider">
   
    <!--#include file="~/Views/Navegacion/Formulador.html"-->
    
    %>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="bodyContentBlank" runat="server">
    <div class="card shadow mb-4">
        <div class="card-header py-3">
            <h6 class="  font-weight-bold text-primary">Consulta de casos</h6>
        </div>
        <div class="card-body">
            <div class="table-responsive">
                <table class="table table-bordered" id="dataTableCasos" width="100%" cellspacing="0">
                    <thead>
                        <tr>
                            <th class="d-none">Id</th>
                            <th>Nombre del proyecto</th>
                            <th>Estado</th>
                            <th>Nombre del beneficiario</th>
                            <th>Dias Restantes</th>
                            <th>Observaciones</th>
                            <th>Revisar Caso</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td class="d-none">1</td>
                            <td>Crianza de camarones</td>
                            <td>Registrar cita</td>
                            <td>Juan Perez</td>
                            <td>-</td>
                            <td>Formulacion de iniciativa</td>
                            <td class="text-center">
                                <a href="/Formulacion/Iniciativa/Adopcion/1" class="btn btn-success btn-circle">
                                    <i class="fas fa-info-circle"></i>
                                </a>
                            </td>
                        </tr>
                        <tr>
                            <td class="d-none">1</td>
                            <td>Cultivo X</td>
                            <td>Formulacion de iniciativa</td>
                            <td>Juan Lopez</td>
                            <td>-</td>
                            <td>Formulacion de iniciativa</td>
                            <td class="text-center">
                                <a href="/Formulacion/Iniciativa/Asistencia/1" class="btn btn-success btn-circle">
                                    <i class="fas fa-info-circle"></i>
                                </a>
                            </td>
                        </tr>
                        <tr>
                            <td class="d-none">1</td>
                            <td>Pesca Artesanal</td>
                            <td>Formulacion</td>
                            <td>Beatriz Martinez</td>
                           
                            <td>-</td>
                            <td>Formulacion de iniciativa</td>
                            <td class="text-center">
                                <a href="/Formulacion/Iniciativa/Innovacion/1" class="btn btn-success btn-circle">
                                    <i class="fas fa-info-circle"></i>
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
            $('#dataTableCasos').DataTable({
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
            $('#dataTableCasosConsultor').DataTable({
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