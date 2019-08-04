<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Layouts/Layout2.Master" AutoEventWireup="true" CodeBehind="SectorEconomico.aspx.cs" Inherits="MinecPISI.Views.Catalogos.SectorEconomico" %>
<asp:Content ID="Content1" ContentPlaceHolderID="cssextra" runat="server">
    <link href="<%= ResolveUrl("~/Views/vendor/datatables/dataTables.bootstrap4.min.css") %>" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contenidoNavegacion" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="bodyContentBlank" runat="server">
 <div class="card shadow mb-4">
        <div class="card-header py-3">
            <h6 class="  font-weight-bold text-primary">Administracion de Sector Economico</h6>
            <%-- OBJETOS PARA VISUALIZAR ERRORES O MENSAJES --%>

            <%-- OBJETO DE ERRORES --%>
            <% if (!string.IsNullOrWhiteSpace(errores))
                { %>
            <div class="alert alert-danger" role="alert" disposable>
                <%=errores %>
            </div>
            <% } %>

            <%-- OBJETO DE INFORMACIÓN --%>
            <% if (!string.IsNullOrWhiteSpace(info))
                { %>
            <div class="alert alert-primary" role="alert" disposable>
                <%=info %>
            </div>
            <% } %>


            <a href="#"
                data-toggle="modal"
                data-target="#DataSEconomicoModal"
                data-m="pos"
                data-title="Crear Sector Economico"
                class=" btn btn-sm btn-primary shadow-sm ">
                <i class="fas fa-plus fa-sm text-white-50"></i>
                Agregar nuevo Sector Economico
            </a>
        </div>

        <div class="card-body">
            <div class="table-responsive">
                <table class="table table-bordered" id="dataTableDepartamentos" width="100%" cellspacing="0">
                    <thead>
                        <tr>
                            <th>Codigo Sector Economico</th>
                            <th>Nombre Sector Economico</th>
                            <th>Ver/Editar</th>
                            <th>Eliminar</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% foreach (var item in data)
                            { %>
                        <tr>
                            <td><%=item.COD_SECTOR_ECONOMICO %></td>
                            <td><%=item.NOMBRE %></td>
                            <!--BOTON MODIFIFCAR -->
                            <td class="text-center">
                                <a href="#" class="btn btn-info btn-circle"
                                    data-toggle="modal"
                                    data-target="#DataSEconomicoModal"
                                    data-id-sector-economico="<%= item.ID_SECTOR_ECONOMICO %>"
                                    data-codigo-sector-economico="<%= item.COD_SECTOR_ECONOMICO %>"
                                    data-nombre-sector-economico="<%=item.NOMBRE %>"
                                    data-m="put"
                                    data-title="Editar Sector Economico">
                                    <i class="fas fa-info-circle"></i>
                                </a>
                            </td>
                            <!--BOTON ELIMINAR -->
                            <td class="text-center">
                                <a href="#"
                                    class="btn btn-danger btn-circle"
                                    data-toggle="modal"
                                    data-target="#DataDeleteModal"
                                    data-id-sector-economico="<%= item.ID_SECTOR_ECONOMICO %>"
                                    data-title="Eliminar Sector Economico">
                                    <i class="fas fa-trash"></i>
                                </a>
                            </td>
                        </tr>
                        <% } %>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

    <!-- MODAL NUEVO DEPARTAMENTO -->
    <div class="modal fade show"
        id="DataSEconomicoModal"
        tabindex="-1"
        role="dialog"
        aria-modal="true"
        style="padding-right: 17px; display: none;">

        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title"></h5>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <form action="" method="post">
                    <div class="modal-body">
                        <input type="hidden" name="m" value="put" />
                        <input type="hidden" name="txt_id_sector_economico" value="" />

                        <div class="form-group">
                            <label>Codigo Sector Economico</label>
                            <input type="text" class="form-control" name="txt_codigo_sector_economico" placeholder="Ingrese el Codigo del sector economico" required>
                        </div>
                        <div class="form-group">
                            <label>Nombre Sector Economico</label>
                            <input type="text" class="form-control" name="txt_nombre_sector_economico" placeholder="Ingrese el nombre del sector economico" required>
                        </div>

                    </div>
                    <div class="modal-footer">
                        <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancelar</button>
                        <button class="btn btn-primary" type="submit">Guardar</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <!-- FIN MODAL NUEVO DEPARTAMENTO -->

    <!-- MODAL PARA EL BORRADO DEL DEPARTAMENTO -->
    <div class="modal fade show" id="DataDeleteModal" tabindex="-1" role="dialog" aria-modal="true" style="padding-right: 17px; display: none;">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="">Esta seguro de eliminar el registro?</h5>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body">
                    <p>Si Elimina el registro no habra forma de recuperarlo</p>
                </div>
                <div class="modal-footer">
                    <form action="" method="post">
                        <input type="hidden" name="m" value="del" />
                        <input type="hidden" name="txt_borrar_id_sector_economico" value="" />
                        <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancelar</button>
                        <button type="submit" class="btn btn-danger">Eliminar</button>
                    </form>

                </div>
            </div>
        </div>
    </div>

    <!-- FIN MODAL PARA EL BORRADO DEL DEPARTAMENTO -->
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="jsextra" runat="server">
     <script src="<%= ResolveClientUrl("~/Views/vendor/datatables/jquery.dataTables.min.js") %>"></script>
    <script src="<%= ResolveClientUrl("~/Views/vendor/datatables/dataTables.bootstrap4.js") %>"></script>
    <script>
        $(document).ready(function () {
            $('#dataTableDepartamentos').DataTable({
                "language": {
                    "decimal": "",
                    "emptyTable": "No hay departamentos que Mostrar",
                    "info": "Mostrando _START_ de _END_ Registros",
                    "infoEmpty": "Mostrando 0 de 0 registros",
                    "infoFiltered": "(Filtrado desde _MAX_ Registros Totales)",
                    "infoPostFix": "",
                    "thousands": ",",
                    "lengthMenu": "Mostrar _MENU_ registros",
                    "loadingRecords": "Cargando...",
                    "processing": "Procesando...",
                    "search": "Buscar:",
                    "zeroRecords": "No se encontraron registros",
                    "paginate": {
                        "first": "Primero",
                        "last": "Último",
                        "next": "Siguiente",
                        "previous": "Anterior"
                    },
                    "aria": {
                        "sortAscending": ": Activar para ordenar Ascendentemente",
                        "sortDescending": ": Activar para ordenar Descendentemente"
                    }
                }
            });
        });
    </script>
    <script>
        $("#DataSEconomicoModal").on("show.bs.modal", function (event) {
            var button = $(event.relatedTarget);

            var id_sector_economico = button.data('id-sector-economico');
            var codigo_sector_economico = button.data('codigo-sector-economico');
            var nombre_sector_economico = button.data('nombre-sector-economico');
            var m = button.data('m');
            var title = button.data('title');
           
            $('input[name=m]').val(m);
            $('input[name=txt_id_sector_economico]').val(id_sector_economico);
            $('input[name=txt_codigo_sector_economico]').val(codigo_sector_economico);
            $('input[name=txt_nombre_sector_economico]').val(nombre_sector_economico);
            $('input[name=m]').val(m);

            $('#DataSEconomicoModal').find('.modal-title').text(title);

        });
    </script>
    <script>
        $('#DataDeleteModal').on("show.bs.modal", function (event) {
            var button = $(event.relatedTarget);
            var id_sector_economico = button.data('id-sector-economico');
            $('input[name=txt_borrar_id_sector_economico]').val(id_sector_economico);

        });
    </script>
    <script>
        setTimeout(function () {
            $('div[role=alert][disposable]').fadeOut('slow');
        }, 5000);
    </script>


</asp:Content>
