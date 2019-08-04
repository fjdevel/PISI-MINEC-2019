<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Layouts/Layout2.Master" AutoEventWireup="true" CodeBehind="Municipios.aspx.cs" Inherits="MinecPISI.Views.Catalogos.Municipios" %>
<asp:Content ID="Content1" ContentPlaceHolderID="cssextra" runat="server">
    <link href="<%= ResolveUrl("~/Views/vendor/datatables/dataTables.bootstrap4.min.css") %>" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contenidoNavegacion" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="bodyContentBlank" runat="server">
     <div class="card shadow mb-4">
        <div class="card-header py-3">
            <h6 class="  font-weight-bold text-primary">Administracion de Municipios</h6>
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
                data-target="#DataMunicipioModal"
                data-m="pos"
                data-title="Crear Municipio"
                class=" btn btn-sm btn-primary shadow-sm ">
                <i class="fas fa-plus fa-sm text-white-50"></i>
                Agregar Nuevo Municipio
            </a>
        </div>

        <div class="card-body">
            <div class="table-responsive">
                <table class="table table-bordered" id="dataTableDepartamentos" width="100%" cellspacing="0">
                    <thead>
                        <tr>
                            <th>Codigo Municipio</th>
                            <th>Nombre Departamento</th>
                            <th>Nombre Municipio</th>
                            <th>Ver/Editar</th>
                            <th>Eliminar</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% foreach (var item in data)
                            { %>
                        <tr>
                             <% BLL.Modelos.TBC_DEPARTAMENTO departamento = new BLL.Acciones.A_DEPARTAMENTO().geDepartamentoById(Convert.ToInt32(item.ID_DEPARTAMENTO)); %>
                            <td><%=item.COD_MUNICIPIO %></td>
                            <td><%=departamento.NOMBRE %></td>
                            <td><%=item.NOMBRE %></td>
                            <!--BOTON MODIFIFCAR -->
                            <td class="text-center">
                                <a href="#" class="btn btn-info btn-circle"
                                    data-toggle="modal"
                                    data-target="#DataMunicipioModal"
                                    data-id-municipio="<%= item.ID_MUNICIPIO %>"
                                    data-id-departamento="<%= departamento.ID_DEPARTAMENTO %>"
                                    data-codigo-municipio="<%= item.COD_MUNICIPIO %>"
                                    data-nombre-municipio="<%=item.NOMBRE %>"
                                    data-m="put"
                                    data-title="Editar Municipio">
                                    <i class="fas fa-info-circle"></i>
                                </a>
                            </td>
                            <!--BOTON ELIMINAR -->
                            <td class="text-center">
                                <a href="#"
                                    class="btn btn-danger btn-circle"
                                    data-toggle="modal"
                                    data-target="#DataDeleteModal"
                                    data-id-municipio="<%= item.ID_MUNICIPIO %>"
                                    data-title="Eliminar Municipio">
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

    <!-- MODAL NUEVO MUNICIPIO -->
    <div class="modal fade show"
        id="DataMunicipioModal"
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
                        <input type="hidden" name="txt_id_municipio" value="" />
                        <input type="hidden" name="txt_id_departamento" value="" />

                        <div class="form-group">
                            <label>Codigo Municipio</label>
                            <input type="text" class="form-control" name="txt_codigo_municipio" placeholder="Ingrese el Codigo del Municipio" required>
                        </div>
                        <div class="form-group">
                            <label for="sel_id_rol">Seleccione el Departamento</label>
                            <select class="form-control" name="select_id_departamento">
                                <% foreach (BLL.Modelos.TBC_DEPARTAMENTO departamento in new BLL.Acciones.A_DEPARTAMENTO().ObtenerDeptos()) { %>
                                    <option value="<%=departamento.ID_DEPARTAMENTO %>"><%=departamento.NOMBRE %></option>
                                <% } %>
                            </select>
                        </div>
                        <div class="form-group">
                            <label>Nombre Municipio</label>
                            <input type="text" class="form-control" name="txt_nombre_municipio" placeholder="Ingrese el nombre del municipio" required>
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
                        <input type="hidden" name="txt_borrar_id_municipio" value="" />
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
        $("#DataMunicipioModal").on("show.bs.modal", function (event) {
            var button = $(event.relatedTarget);

            var id_municipio = button.data('id-municipio');
            var id_departamento = button.data('id-departamento');
            var codigo_municipio = button.data('codigo-municipio');
            var nombre_municipio = button.data('nombre-municipio');
            var m = button.data('m');
            var title = button.data('title');
           
            $('input[name=m]').val(m);
            
            $('input[name=txt_id_municipio]').val(id_municipio);
            $('input[name=txt_codigo_municipio]').val(codigo_municipio);
            $('input[name=txt_departamento]').val(id_departamento);
            $('input[name=txt_nombre_municipio]').val(nombre_municipio);
            $('input[name=m]').val(m);

            //Borrando la seleccion anterior
            $('select[name=select_id_departamento] option').removeAttr("selected");
            $('select[name=select_id_departamento] option[value=' + id_departamento + ']').attr('selected', 'selected');   //Configurando el departamento del usuario

            $('#DataMunicipioModal').find('.modal-title').text(title);

        });
    </script>
    <script>
        $('#DataDeleteModal').on("show.bs.modal", function (event) {
            var button = $(event.relatedTarget);
            var id_municipio = button.data("id-municipio");
            $('input[name=txt_borrar_id_municipio]').val(id_municipio);

        });
    </script>
    <script>
        setTimeout(function () {
            $('div[role=alert][disposable]').fadeOut('slow');
        }, 5000);
    </script>
</asp:Content>
