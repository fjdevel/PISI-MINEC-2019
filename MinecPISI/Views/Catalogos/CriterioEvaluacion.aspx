<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Layouts/Layout2.Master" AutoEventWireup="true" CodeBehind="CriterioEvaluacion.aspx.cs" Inherits="MinecPISI.Views.Catalogos.CriterioEvaluacion" %>
<asp:Content ID="Content1" ContentPlaceHolderID="cssextra" runat="server">
    <link href="<%= ResolveUrl("~/Views/vendor/datatables/dataTables.bootstrap4.min.css") %>" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contenidoNavegacion" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="bodyContentBlank" runat="server">
    <div class="card shadow mb-4">
        <div class="card-header py-3">
            <h6 class="  font-weight-bold text-primary">Administracion de Criterios de evaluacion</h6>
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
                data-target="#DataCEvaluacionModal"
                data-m="pos"
                data-title="Crear Criterio Evaluacio"
                class=" btn btn-sm btn-primary shadow-sm ">
                <i class="fas fa-plus fa-sm text-white-50"></i>
                Agregar Nuevo Criterio Evaluacion
            </a>
        </div>

        <div class="card-body">
            <div class="table-responsive">
                <table class="table table-bordered" id="dataTableDepartamentos" width="100%" cellspacing="0">
                    <thead>
                        <tr>
                            <th>Criterio evaluacion tecnica</th>
                            <th>Campo</th>
                            <th>Puntaja Maximo</th>
                            <th>Ver/Editar</th>
                            <th>Eliminar</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% foreach (var item in data)
                            { %>
                        <tr>
                             <% BLL.Modelos.TBC_CAMPOS_EVALUACION_TECNICA criterio = new BLL.Acciones.A_CAMPOS_EVALUACION_TECNICA().geEvaluacionTecnicaById(Convert.ToInt32(item.ID_CRITERIO_EVAL_TECNICO)); %>
                            <td><%=criterio.CRITERIO %></td>
                            <td><%=item.CAMPO %></td>
                            <td><%=item.PUNTAJE_MAX %></td>
                            <!--BOTON MODIFIFCAR -->
                            <td class="text-center">
                                <a href="#" class="btn btn-info btn-circle"
                                    data-toggle="modal"
                                    data-target="#DataCEvaluacionModal"
                                    data-id-evaluacion-tecnica="<%= item.ID_CAMPO_CRITERIO_EVAL %>"
                                    data-id-criterio-tecnica="<%= criterio.ID_CRITERIO_EVAL_TECNICO %>"
                                    data-campo-evaluacion-tecnica="<%= item.CAMPO %>"
                                    data-puntaje-maximo-evaluacion-tecnica="<%=item.PUNTAJE_MAX %>"
                                    data-m="put"
                                    data-title="Editar Criterio Evaluacio">
                                    <i class="fas fa-info-circle"></i>
                                </a>
                            </td>
                            <!--BOTON ELIMINAR -->
                            <td class="text-center">
                                <a href="#"
                                    class="btn btn-danger btn-circle"
                                    data-toggle="modal"
                                    data-target="#DataDeleteModal"
                                    data-id-evaluacion-tecnica="<%= item.ID_CAMPO_CRITERIO_EVAL %>"
                                    data-title="Eliminar Criterio Evaluacio">
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
        id="DataCEvaluacionModal"
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
                        <input type="hidden" name="txt_id_evaluacion_tecnica" value="" />
                        <input type="hidden" name="txt_id_criterio_tecnica" value="" />

                        <div class="form-group">
                            <label for="select_id_criterio_tecnica">Seleccione el criterio de evaluacion</label>
                            <select class="form-control" name="select_id_criterio_tecnica">
                                <% foreach (BLL.Modelos.TBC_CAMPOS_EVALUACION_TECNICA criterio in new BLL.Acciones.A_CAMPOS_EVALUACION_TECNICA().ObtenerEvaluacionTecnica()) { %>
                                    <option value="<%=criterio.ID_CRITERIO_EVAL_TECNICO %>"><%=criterio.CRITERIO %></option>
                                <% } %>
                            </select>
                        </div>
                        <div class="form-group">
                            <label>Campo</label>
                            <input type="text" class="form-control" name="txt_campo_evaluacion_tecnica" placeholder="Ingrese Campo" required>
                        </div>
                        
                        <div class="form-group">
                            <label>Puntaje Maximo</label>
                            <input type="text" class="form-control" name="txt_puntaje_maximo_evaluacion_tecnica" placeholder="Ingrese puntaje maximo" required>
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
                        <input type="hidden" name="txt_borrar_id_evaluacion_tecnica" value="" />
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
        $("#DataCEvaluacionModal").on("show.bs.modal", function (event) {
            var button = $(event.relatedTarget);

            var id_evaluacion_tecnica = button.data('id-evaluacion-tecnica');
            var id_criterio_tecnica = button.data('id-criterio-tecnica');
            var campo_evaluacion_tecnica = button.data('campo-evaluacion-tecnica');
            var puntaje_maximo_evaluacion_tecnica = button.data('puntaje-maximo-evaluacion-tecnica');
            var m = button.data('m');
            var title = button.data('title');
                                    
            $('input[name=txt_id_evaluacion_tecnica]').val(id_evaluacion_tecnica);
            $('input[name=txt_id_criterio_tecnica]').val(id_criterio_tecnica);
            $('input[name=txt_campo_evaluacion_tecnica]').val(campo_evaluacion_tecnica);
            $('input[name=txt_puntaje_maximo_evaluacion_tecnica]').val(puntaje_maximo_evaluacion_tecnica);
            $('input[name=m]').val(m);

            //Borrando la seleccion anterior
            $('select[name=select_id_criterio_tecnica] option').removeAttr("selected");
            $('select[name=select_id_criterio_tecnica] option[value=' + id_criterio_tecnica + ']').attr('selected', 'selected');   //Configurando el departamento del usuario

            $('#DataCEvaluacionModal').find('.modal-title').text(title);

        });
    </script>
    <script>
        $('#DataDeleteModal').on("show.bs.modal", function (event) {
            var button = $(event.relatedTarget);
            var id_evaluacion_tecnica = button.data('id-evaluacion-tecnica');
            $('input[name=txt_borrar_id_evaluacion_tecnica]').val(id_evaluacion_tecnica);

        });
    </script>
    <script>
        setTimeout(function () {
            $('div[role=alert][disposable]').fadeOut('slow');
        }, 5000);
    </script>
</asp:Content>
