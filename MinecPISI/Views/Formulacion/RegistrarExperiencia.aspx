<%@ Page Language="C#" MasterPageFile="~/Views/Layouts/Layout2.Master" AutoEventWireup="true" CodeBehind="RegistrarExperiencia.aspx.cs" Inherits="MinecPISI.Views.Formulacion.RegistrarExperiencia" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cssextra" runat="server">
    <link href="<%= ResolveUrl("~/Views/vendor/datatables/dataTables.bootstrap4.min.css") %>" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contenidoNavegacion" runat="server">
                </asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="bodyContentBlank" runat="server">
  <div class="card shadow mb-4">
    <div class="card-header py-3">
        <h6 class="  font-weight-bold text-primary">Modificaci&oacute;n de Experiencia</h6>

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

        <a href="#"  class=" btn btn-sm btn-primary shadow-sm" data-toggle="modal" data-target="#DataEditModal"
            data-title="Agregar Experiencia"
            data-m="pos"
            >
            <i class="fas fa-plus fa-sm text-white-50"></i> Agregar Experiencia
        </a>
    </div>
    <div class="card-body">
        <div class="table-responsive">
            <table class="table table-bordered" id="dataTableExperiencia" width="100%" cellspacing="0">
                <thead>
                    <tr>
                        <th>Institución</th>
                        <th>Cargo</th>
                        <th>Tiempo</th>
                        <th>Proyecto</th>
                        <th>Ver/Editar</th>
                        <th>Eliminar</th>
                    </tr>
                </thead>
                <tbody>
                    <%if (data != null)
                            { %>
                    <% foreach (var e in data)
                            { %>
                        <tr>
                            
                            <td><%=e.INSTITUCION %></td>
                            <td><%=e.CARGO %></td>
                            <td><%=e.TIEMPO %></td>
                            <td><%=e.PROYECTO %></td>

                            <td class="text-center">
                                <a href="#" class="btn btn-info btn-circle" data-toggle="modal" data-target="#DataEditModal"
                                    data-id-experiencia="<%=e.ID_EXPERIENCIA%>"
                                    data-experiencia-institucion="<%=e.INSTITUCION%>"
                                    data-experiencia-cargo="<%=e.CARGO%>"
                                    data-experiencia-tiempo="<%=e.TIEMPO%>"
                                    data-experiencia-proyecto="<%=e.PROYECTO%>"
                                    data-title="Editar Experiencia"
                                    data-m="put"
                                    >
                                    <i class="fas fa-info-circle"></i>
                                </a>
                            </td>
                            <td class="text-center">
                                <a href="#" class="btn btn-danger btn-circle" data-toggle="modal" data-target="#DataDeleteModal"
                                    data-id-experiencia="<%=e.ID_EXPERIENCIA%>"                                    
                                    data-title="Eliminar Experiencia"
                                     data-m="del"
                                    >
                                    <i class="fas fa-trash"></i>
                                </a>
                            </td>
                        </tr>
                    <%}
                            } %>

                </tbody>
            </table>
        </div>
    </div>
</div>

<div class="modal fade show" id="DataEditModal" tabindex="-1" role="dialog" aria-modal="true" style="padding-right: 17px; display: none;">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="ModalLabel"></h5>
                <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">×</span>
                </button>
            </div>
            <form action="" method="post">
                <div class="modal-body">

                        <input type="hidden" name="m" value="" />
                        <input type="hidden" name="txt_id_experiencia" value="" />

                        <div class="form-group">
                            <label>Institución</label>
                            <input type="text" class="form-control" name="txt_institucion" placeholder="Ingrese el nombre de la Institución" MaxLength="200" required>
                        </div>
                        <div class="form-group">
                            <label>Cargo</label>
                            <input type="text" class="form-control" name="txt_cargo" placeholder="Ingrese el cargo que desempeñó" MaxLength="200" required>
                        </div>
                        <div class="form-group">
                            <label>Tiempo</label>
                            <input type="text" class="form-control" name="txt_tiempo" placeholder="Ingrese el tiempo que estuvo en dicho cargo (Años)" MaxLength="64" required>
                        </div>

                        <div class="form-group">
                             <label>Proyecto</label>
                            <input type="text" class="form-control" name="txt_proyecto" placeholder="Ingrese un proyecto realizado" MaxLength="300" required>
                        </div>                
                </div>
            <div class="modal-footer">
                <button class="btn btn-secondary" type="button" data-dismiss="modal">Cerrar</button>
                <button class="btn btn-primary" type="submit">Guardar</button>
            </div>
            </form>
        </div>
    </div>
</div>

<div class="modal fade show" id="DataDeleteModal" tabindex="-1" role="dialog" aria-modal="true" style="padding-right: 17px; display: none;">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="">¿Desea eliminar el registro?</h5>
                <button class="close" type="button" data-dismiss="modal" aria-label="Cerrar">
                    <span aria-hidden="true">×</span>
                </button>
            </div>
            <div class="modal-body">
                <p>Si Elimina el registro, no habrá forma de recuperarlo</p>
            </div>
            <div class="modal-footer">
                <form action="" method="post">
                    <input type="hidden" name="m" value="del" />
                    <input type="hidden" name="txt_borrar_id_experiencia" value="" />

                    <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancelar</button>
                    <button class="btn btn-danger" type="submit">Eliminar</button>

                </form>

            </div>
        </div>
    </div>
</div>

</asp:Content>

<asp:Content ID="Content5" ContentPlaceHolderID="jsextra" runat="server">
     <script src="<%= ResolveUrl("~/Views/vendor/datatables/jquery.dataTables.min.js") %>"></script>
    <script src="<%= ResolveUrl("~/Views/vendor/datatables/dataTables.bootstrap4.js") %>"></script>
    <script>
        $(document).ready(function () {
            $('#dataTableExperiencia').DataTable({
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

    <script>
        $("#DataEditModal").on("show.bs.modal", function (event) {
            var button = $(event.relatedTarget);

            var id_experiencia = button.data("id-experiencia");
            var experiencia_institucion = button.data("experiencia-institucion");
            var experiencia_cargo = button.data("experiencia-cargo");
            var experiencia_tiempo = button.data("experiencia-tiempo");
            var experiencia_proyecto = button.data("experiencia-proyecto");
            var title = button.data("title");
            var m = button.data("m");

            $('input[name=m]').val(m);

            $('input[name=txt_id_experiencia]').val(id_experiencia);
            $('input[name=txt_institucion]').val(experiencia_institucion);
            $('input[name=txt_cargo]').val(experiencia_cargo);
            $('input[name=txt_tiempo]').val(experiencia_tiempo);
            $('input[name=txt_proyecto]').val(experiencia_proyecto);

            $('#DataUserModal').find('.modal-title').text(title);
        });

    </script>

    <script>
        $('#DataDeleteModal').on("show.bs.modal", function (event) {
            var button = $(event.relatedTarget);

            var id_experiencia = button.data("id-experiencia");
            
            $('input[name=txt_borrar_id_experiencia]').val(id_experiencia);

        });
    </script>

    <script>
        setTimeout(function () {
            $('div[role=alert][disposable]').fadeOut('slow');
        }, 5000);
    </script>
</asp:Content>
