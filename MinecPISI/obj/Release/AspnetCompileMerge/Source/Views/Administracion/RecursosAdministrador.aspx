<%@ Page Title="Administrar Recursos" Language="C#" MasterPageFile="~/Views/Layouts/Layout2.Master" AutoEventWireup="true" CodeBehind="RecursosAdministrador.aspx.cs" Inherits="MinecPISI.Views.Administracion.RecursosAdministrador" %>
<asp:Content ID="Content1" ContentPlaceHolderID="cssextra" runat="server">
    <link href="<%= ResolveClientUrl("~/Views/vendor/datatables/dataTables.bootstrap4.min.css") %>" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contenidoNavegacion" runat="server">
   <!-- Divider -->
<hr class="sidebar-divider">
<li class="nav-item">
    <a class="nav-link" href="<%Response.Write(HttpContext.Current.Request.ApplicationPath);%>/Administrar/Usuarios">
        <i class="fas fa-fw fa-user"></i>
        <span>Usuarios</span>
    </a>
</li>
<li class="nav-item">
    <a class="nav-link" href="<%Response.Write(HttpContext.Current.Request.ApplicationPath);%>/Administrar/Roles">
        <i class="fas fa-fw fa-user-tag"></i>
        <span>Roles y Permisos</span>
    </a>
</li>
<li class="nav-item">
    <a class="nav-link" href="<%Response.Write(HttpContext.Current.Request.ApplicationPath);%>/Administrar/Recursos">
        <i class="fas fa-fw fa-key"></i>
        <span>Recursos</span>
    </a>
</li>
<!-- Divider -->
    <hr class="sidebar-divider d-none d-md-block">
    <!-- Sidebar Toggler (Sidebar) -->
    <div class="text-center d-none d-md-inline">
        <a class="btn rounded-circle border-0" id="sidebarToggle"></a>
    </div>
    <!-- End of Sidebar -->
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="bodyContentBlank" runat="server">
  <div class="card shadow mb-4">

    <div class="card-header py-3">
        <h6 class=" font-weight-bold text-primary">Administracion de Recursos</h6>

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

        <a href="#" data-toggle="modal" data-target="#NewRoleModal" class=" btn btn-sm btn-primary shadow-sm "><i class="fas fa-plus fa-sm text-white-50"></i> Agregar nuevo Recurso</a>

    </div>

    <div class="card-body">
        <div class="table-responsive">
            <table class="table table-bordered" id="dataTableRecursos" width="100%" cellspacing="0">
                <thead>
                    <tr>
                        <th>Nombre</th>
                        <th>Recurso</th>
                        <th>Ver/Editar</th>
                        <th>Eliminar</th>
                    </tr>
                </thead>
                <tbody>

                    <% foreach (BLL.Modelos.TB_RECURSO r in data) { %>
                        <tr>
                            <td><%=r.NOMBRE %></td>
                            <td><%=r.URL_RECURSO %></td>
                            <td class="text-center">
                                <a href="#" class="btn btn-info btn-circle" data-toggle="modal" data-target="#DataEditModal" 
                                    data-pk="<%=r.ID_RECURSO %>"
                                    data-nombre="<%=r.NOMBRE %>"
                                    data-url="<%=r.URL_RECURSO %>">
                                    <i class="fas fa-info-circle"></i>
                                </a>
                            </td>
                            <td class="text-center">
                                <a href="#" class="btn btn-danger btn-circle" data-toggle="modal" data-target="#DataDeleteModal"
                                    data-pk="<%=r.ID_RECURSO %>">
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
   


        <div class="modal fade show" id="NewRoleModal" tabindex="-1" role="dialog" aria-modal="true" style="padding-right: 17px; display: none;">
    <div class="modal-dialog" role="document">
       
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Agregar Nuevo Recurso</h5>
                <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">×</span>
                </button>
            </div>
                    <div class="modal-body">

                     <form action="" method="post">
                        <fieldset>
                            <input type="hidden" name="m" value="pos" />
                            <div class="form-group">
                                <label>Nombre</label>
                                <input type="text" name="txt_crear_nombre" value="" required class="form-control" placeholder="Ingrese el nombre del Recurso" />
                            </div>
                            <div class="form-group">
                                <label>URL</label>
                                <input type="text" name="txt_crear_url" value="" required class="form-control" placeholder="Ingrese el nombre la URL del Recurso" />
                            </div>
                        <div class="modal-footer">
                            <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancelar</button>
                            <button class="btn btn btn-success" type="submit" >Guardar</button>

                        </div>

                        </fieldset>
                    </form>

                    </div>
        </div>
    </div>
</div>

    
<div class="modal fade show" id="DataEditModal" tabindex="-1" role="dialog" aria-modal="true" style="padding-right: 17px; display: none;">
    <div class="modal-dialog" role="document">
       
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Editar Recurso</h5>
                <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">×</span>
                </button>
            </div>
                    <div class="modal-body">

                     <form action="" method="post">
                        <fieldset>
                            <input type="hidden" name="m" value="put" />

                            <div class="form-group" hidden>
                                <label>ID</label>
                                <input type="text" name="txt_editar_id_recurso" value="" required class="form-control" placeholder="Ingrese el ID del Recurso" />
                            </div>

                            <div class="form-group">
                                <label>Nombre</label>
                                <input type="text" name="txt_editar_nombre" value="" required class="form-control" placeholder="Ingrese el nombre del Recurso" />
                            </div>
                            <div class="form-group">
                                <label>URL</label>
                                <input type="text" name="txt_editar_url" value="" required class="form-control" placeholder="Ingrese el nombre la URL del Recurso" />
                            </div>
                        <div class="modal-footer">
                            <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancelar</button>
                            <button class="btn btn btn-success" type="submit" >Guardar</button>

                        </div>

                        </fieldset>
                    </form>

                    </div>
        </div>
    </div>
</div>


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
                    <fieldset>
                        <input type="number" name="txt_borrar_id_recurso" value="" hidden />
                        <input type="hidden" name="m" value="del" />
                        <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancelar</button>
                        <button class="btn btn-danger" type="submit">Eliminar</button>
                    </fieldset>
                </form>
            </div>
        </div>
    </div>
</div>

        





    <!-- Logout Modal-->
  <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title">Seguro de cerrar la sesion?</h5>
          <button class="close" type="button" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">×</span>
          </button>
        </div>
        <div class="modal-body">Seleccione Desloguear para cerrar su sesion</div>
        <div class="modal-footer">
          <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancelar</button>
          <a class="btn btn-primary" href="/">Cerrar sesion</a>
        </div>
      </div>
    </div>
  </div>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="jsextra" runat="server">
     <script src="<%= ResolveClientUrl("~/Views/vendor/datatables/jquery.dataTables.min.js") %>"></script>
    <script src="<%= ResolveClientUrl("~/Views/vendor/datatables/dataTables.bootstrap4.js") %>"></script>
    <script>
    $(document).ready(function() {
      $('#dataTableRecursos').DataTable( {
        "language": {
            "decimal":        "",
            "emptyTable":     "No hay datos registrados",
            "info":           "Mostrando _START_ de _END_ of _TOTAL_ Registros",
            "infoEmpty":      "Mostrando 0 de 0 registros",
            "infoFiltered":   "(Filtrado desde _MAX_ registros totales)",
            "infoPostFix":    "",
            "thousands":      ",",
            "lengthMenu":     "Mostrar _MENU_ entradas",
            "loadingRecords": "Cargando...",
            "processing":     "Procesando...",
            "search":         "Buscar:",
            "zeroRecords":    "No se encontraron registros",
            "paginate": {
                "first":      "Primero",
                "last":       "Ultimo",
                "next":       "Siguiente",
                "previous":   "Anterior"
            },
            "aria": {
                "sortAscending":  ": activar para ordenar Ascendentemente",
                "sortDescending": ": activar para ordenar Descendentemente"
            }
                }
            } );
            });

    </script>


    <script>
        $(document).ready(function () {
            try {
                var err = JSON.parse('<%= Session["msg"] %>');

                if (err != "") {
                    var msj = "";

                    for (var i = 0; i < err.length ; i++) {
                        msj += err[i] + "\n";
                    }

                    alert(msj);
                } 
            }
            catch (e)
            {
            console.log(e);
            }
        });
    </script>

    <script>
        $('#DataEditModal').on('show.bs.modal', function (event) {
            var button = $(event.relatedTarget); // Button that triggered the modal
            var pk = button.data('pk'); // Extract info from data-* attributes
            var nombre = button.data('nombre'); // Extract info from data-* attributes
            var url = button.data('url'); // Extract info from data-* attributes
                // If necessary, you could initiate an AJAX request here (and then do the updating in a callback).
                // Update the modal's content. We'll use jQuery here, but you could use a data binding library or other methods instead.
            
            $('input[name=txt_editar_id_recurso]').val(pk);
            $('input[name=txt_editar_nombre]').val(nombre);
            $('input[name=txt_editar_url]').val(url);
        });

        $('#DataDeleteModal').on('show.bs.modal', function (event) {
            var button = $(event.relatedTarget); // Button that triggered the modal
            var pk = button.data('pk'); // Extract info from data-* attributes
                // If necessary, you could initiate an AJAX request here (and then do the updating in a callback).
                // Update the modal's content. We'll use jQuery here, but you could use a data binding library or other methods instead.
            
            $('input[name=txt_borrar_id_recurso]').val(pk);
        });
    </script>

    <script>
        setTimeout(function () {
            $('div[role=alert][disposable]').fadeOut('slow');
        }, 5000);
    </script>
</asp:Content>

