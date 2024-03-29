﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Layouts/Layout2.Master" AutoEventWireup="true" CodeBehind="EstadoProceso.aspx.cs" Inherits="MinecPISI.Views.Catalogos.EstadoProceso" %>
<asp:Content ID="Content1" ContentPlaceHolderID="cssextra" runat="server">
    <link href="<%= ResolveUrl("~/Views/vendor/datatables/dataTables.bootstrap4.min.css") %>" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contenidoNavegacion" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="bodyContentBlank" runat="server">
     <div class="card shadow mb-4">
        <div class="card-header py-3">
            <h6 class="  font-weight-bold text-primary">Administracion de Estados Proceso</h6>
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
                data-target="#DataEProcesoModal"
                data-m="pos"
                data-title="Crear Estado de Proceso"
                class=" btn btn-sm btn-primary shadow-sm ">
                <i class="fas fa-plus fa-sm text-white-50"></i>
                Agregar nuevo Estado de Proceso
            </a>
        </div>

        <div class="card-body">
            <div class="table-responsive">
                <table class="table table-bordered" id="dataTableDepartamentos" width="100%" cellspacing="0">
                    <thead>
                        <tr>
                            <th>Codigo Estado</th>
                            <th>Descripcion</th>
                            <th>Icono</th>
                            <th>Color</th>
                            <th>Ver/Editar</th>
                            <th>Eliminar</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% foreach (var item in data)
                            { %>
                        <tr>
                            <td><%=item.CODIGO_ESTADO_PROCESO %></td>
                            <td><%=item.DESCRIPCION_ESTADO_PROCESO %></td>
                            <td><%=item.ICONO_ESTADO_PROCESO %></td>
                            <td><%=item.COLOR_ESTADO_PROCESO %></td>
                            <!--BOTON MODIFIFCAR -->
                            <td class="text-center">
                                <a href="#" class="btn btn-info btn-circle"
                                    data-toggle="modal"
                                    data-target="#DataEProcesoModal"
                                    data-id-estado-proceso="<%= item.ID_ESTADO_PROCESO %>"
                                    data-codigo-estado-proceso="<%= item.CODIGO_ESTADO_PROCESO %>"
                                    data-descrpcion-estado-proceso="<%=item.DESCRIPCION_ESTADO_PROCESO %>"
                                    data-icono-estado-proceso="<%=item.ICONO_ESTADO_PROCESO %>"
                                     data-color-estado-proceso="<%=item.COLOR_ESTADO_PROCESO %>"
                                    data-m="put"
                                    data-title="Editar Estado de Proceso">
                                    <i class="fas fa-info-circle"></i>
                                </a>
                            </td>
                            <!--BOTON ELIMINAR -->
                            <td class="text-center">
                                <a href="#"
                                    class="btn btn-danger btn-circle"
                                    data-toggle="modal"
                                    data-target="#DataDeleteModal"
                                    data-id-estado-proceso="<%=item.ID_ESTADO_PROCESO %>"
                                    data-title="Eliminar Estado de Proceso">
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
        id="DataEProcesoModal"
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
                        <input type="hidden" name="txt_id_estado_proceso" value="" />

                        <div class="form-group">
                            <label>Codigo</label>
                            <input type="text" class="form-control" name="txt_codigo_estado_proceso" placeholder="Ingrese el Codigo de estado" required>
                        </div>
                        <div class="form-group">
                            <label>Descripcion</label>
                            <input type="text" class="form-control" name="txt_descripcion_estado_proceso" placeholder="Ingrese descripcion de estado" required>
                        </div>
                         <div class="form-group">
                            <label>Icono</label>
                            <input type="text" class="form-control" name="txt_icono_estado_proceso" placeholder="Ingrese nombre icono estado" required>
                        </div>
                         <div class="form-group">
                            <label>Color</label>
                            <input type="text" class="form-control" name="txt_color_estado_proceso" placeholder="Ingrese el color icono estado" required>
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
    <!-- FIN MODAL NUEVO ESTADO DE PROCESO -->

    <!-- MODAL PARA EL BORRADO DEL ESTADO DE PROCESO -->
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
                        <input type="hidden" name="txt_borrar_id_estado_proceso" value="" />
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
        $("#DataEProcesoModal").on("show.bs.modal", function (event) {
            var button = $(event.relatedTarget);
        
            var id_estado_proceso = button.data('id-estado-proceso');
            var codigo_estado_proceso = button.data('codigo-estado-proceso');
            var descripcion_estado_proceso = button.data('descrpcion-estado-proceso');
            var icono_estado_proceso = button.data('icono-estado-proceso');
            var color_estado_proceso = button.data('color-estado-proceso');
            var m = button.data('m');
            var title = button.data('title');
           
           
            $('input[name=txt_id_estado_proceso]').val(id_estado_proceso);
            $('input[name=txt_codigo_estado_proceso]').val(codigo_estado_proceso);
            $('input[name=txt_descripcion_estado_proceso]').val(descripcion_estado_proceso);
            $('input[name=txt_icono_estado_proceso]').val(icono_estado_proceso);
            $('input[name=txt_color_estado_proceso]').val(color_estado_proceso);
            $('input[name=m]').val(m);

            $('#DataEProcesoModal').find('.modal-title').text(title);

        });
    </script>
    <script>
        $('#DataDeleteModal').on("show.bs.modal", function (event) {
            var button = $(event.relatedTarget);
            var id_estado_proceso = button.data('id-estado-proceso');
            $('input[name=txt_borrar_id_estado_proceso]').val(id_estado_proceso);

        });
    </script>
    <script>
        setTimeout(function () {
            $('div[role=alert][disposable]').fadeOut('slow');
        }, 5000);
    </script>

</asp:Content>
