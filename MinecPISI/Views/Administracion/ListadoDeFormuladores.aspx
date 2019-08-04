<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Layouts/Layout2.Master" AutoEventWireup="true" CodeBehind="ListadoDeFormuladores.aspx.cs" Inherits="MinecPISI.Views.Administracion.ListadoDeFormuladores" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cssextra" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contenidoNavegacion" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="bodyContentBlank" runat="server">
    <form runat="server">
        <div class="card shadow mb-4">
            <div class="card-header py-3">
                <h6 class="  font-weight-bold text-primary">Listado de formuladores</h6>
            </div>
            <div class="card-body">
                <div class="table-responsive">
                    <table class="table table-bordered table-hover" id="formuladores">
                        <thead>
                            <tr>
                                <th scope="col">#</th>
                                <th scope="col">Nombre</th>
                                <th scope="col">Correo</th>
                                <th scope="col">telefono</th>
                                <th scope="col">Experiencia</th>
                                <th scope="col">Validar</th>
                            </tr>
                        </thead>
                        <tbody>
                            <% foreach (dynamic f in formuladores)
                                { %>
                            <tr>
                                <th scope="row"><%= f.ID_FORMULADOR %></th>
                                <td><%= f.NOMBRES %></td>
                                <td><%= f.CORREO %></td>
                                <td><%= f.CELULAR %></td>
                                <td><a href="<%Response.Write(HttpContext.Current.Request.ApplicationPath);%>/Formulacion/Experiencia/<%= f.ID_PERSONA %>">Ver Experiencia</a></td>
                                <td>
                                    <%if (f.ACTIVO == 0)
                                        { %>
                                    <a href="#" class="btn btn-info btn-circle" data-toggle="modal" data-target="#validarModal" data-formulador="<%= f.ID_FORMULADOR %>" data-correo ="<%= f.CORREO %>">
                                        <i class="fa fa-info-circle"></i>
                                    </a>
                                    <%} %>
                                </td>
                            </tr>
                            <%} %>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>



        <div class="modal fade" id="validarModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLongTitle">Validar Registro Formulador</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <h5>¿Está seguro de validar el registro de este formulador?</h5>
                        <asp:TextBox runat="server" ID="correof" CssClass="d-none"></asp:TextBox>
                        <asp:TextBox runat="server" ID="idformulador" CssClass="d-none"></asp:TextBox>
                    </div>
                    <div class="modal-footer">
                        <asp:Button runat="server" cssClass="btn btn-success" Text="Sí, Validar Registro" ID="validar" OnClick="validar_Click" />
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">No!, Validar Después</button>

                    </div>
                </div>
            </div>
        </div>
    </form>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="jsextra" runat="server">
    <script src="<%= ResolveClientUrl("~/Views/vendor/datatables/jquery.dataTables.min.js") %>"></script>
    <script src="<%= ResolveClientUrl("~/Views/vendor/datatables/dataTables.bootstrap4.js") %>"></script>
    <script>
        $('#validarModal').on('show.bs.modal', function (event) {
            var button = $(event.relatedTarget);
            var id = button.data('formulador');
            var correo = button.data('correo');
            $('#bodyContentBlank_idformulador').val(id);
            $('#bodyContentBlank_correof').val(correo);
        })
        $(document).ready(function () {
            $('#formuladores').DataTable({
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
