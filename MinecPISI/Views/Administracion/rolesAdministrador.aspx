<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Layouts/Layout2.Master" AutoEventWireup="true" CodeBehind="rolesAdministrador.aspx.cs" Inherits="MinecPISI.Views.Administracion.rolesAdministrador" %>
<asp:Content ID="Content1" ContentPlaceHolderID="cssextra" runat="server">
    <link href="<%= ResolveClientUrl("~/Views/vendor/datatables/dataTables.bootstrap4.min.css") %>" rel="stylesheet" />

</asp:Content>


<asp:Content ID="Content4" ContentPlaceHolderID="bodyContentBlank" runat="server">
 <div class="card shadow mb-4">
    <div class="card-header py-3">
        <h6 class=" font-weight-bold text-primary">Administracion de Roles</h6>

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
            data-target="#DataRoleModal" 
            data-m="pos" 
            data-title="Crear Rol" 
            class=" btn btn-sm btn-primary shadow-sm ">
                <i class="fas fa-plus fa-sm text-white-50"></i> 
            Agregar nuevo Rol

        </a>

    </div>
    <div class="card-body">
        <div class="table-responsive">
            <table class="table table-bordered" id="dataTableRoles" width="100%" cellspacing="0">
                <thead>
                    <tr>
                        <th>Nombre</th>
                        <th>Descripcion</th>
                        <th>Ver/Editar</th>
                        <th>Eliminar</th>
                    </tr>
                </thead>
                <tbody>

                    <% foreach (BLL.Modelos.TB_ROL r in data) { %>
                       <tr>
                            <td><%=r.NOMBRE %></td>
                            <td><%=r.DESCRIPCION %></td>

                            <td class="text-center">
                                <a href="#" class="btn btn-info btn-circle" 
                                    data-toggle="modal" 
                                    data-target="#DataRoleModal"
                                    data-pk="<%=r.ID_ROL %>"
                                    data-nombre="<%=r.NOMBRE %>"
                                    data-descripcion="<%=r.DESCRIPCION %>"
                                    data-m="put"
                                    data-title="Editar Rol"
                                    data-recursos="<%= new BLL.Acciones.A_PERMISO().getRecursosByRolAsPKString(r) %>">
                                <i class="fas fa-info-circle"></i>
                                </a>
                            </td>

                            <td class="text-center">
                                <a href="#" 
                                    class="btn btn-danger btn-circle" 
                                    data-toggle="modal" 
                                    data-target="#DataDeleteModal"
                                    data-pk="<%=r.ID_ROL %>">
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

<div 
    class="modal fade show" 
    id="DataRoleModal" 
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
                        <input type="hidden" name="txt_editar_id_rol" value="" />

                        <div class="form-group">
                            <label>Nombre</label>
                            <input type="text" name="txt_editar_nombre" class="form-control" placeholder="Ingrese el nombre del Rol" required>
                        </div>
                        <div class="form-group">
                            <label>Descripcion </label>
                            <input type="text" name="txt_editar_descripcion" class="form-control" id="descripcionRol" placeholder="Ingrese la descripcion del rol" required>

                            <input type="hidden" name="txt_editar_permisos" value="" />
                        </div>
                        <div class="col-sm-12">
                        <label ">Permisos</label>
                        <!-- Permisos -->
                            <div class="col-md-12">
                                <div class="well" style="max-height: 300px;overflow: auto;">
                                    <ul id="check-list-box-edit" class="list-group checked-list-box">
                                    </ul>
                                    <br />
                      
                                </div>
                            </div>
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
                    <input type="hidden" name="txt_borrar_id_rol" value="" />
                    <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancelar</button>
                    <button type="submit" class="btn btn-danger">Eliminar</button>
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
          <h5 class="modal-title" id="exampleModalLabel">Seguro de cerrar la sesion?</h5>
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
        
      $('#dataTableRoles').DataTable( {
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
        
        bloque = document.getElementById('check-list-box-edit');

            //agregando JSON
        var json = {

            <% for (int i = 0; i < recursos.Count; i++) {%>

            "<%=i%>": {
                "id": <%= recursos[i]["id"] %>,
                    "recurso": "<%= recursos[i]["recurso"] %>"
            }<%= (i < recursos.Count - 1) ? ',' : ' ' %>

            <%}%>
        };
        
        for (var i in json) {
            var option = document.createElement("li");
            var option2 = document.createElement("li");
            option.setAttribute("class", "list-group-item");
            option2.setAttribute("class",  "list-group-item");
            option.id = json[i].id;
            option2.id = json[i].id;
            option.innerHTML = json[i].recurso;
            option2.innerHTML = json[i].recurso;
            bloque.appendChild(option2); 
        }

        $('.list-group.checked-list-box .list-group-item').each(function () {
        
        // Settings
        var $widget = $(this),
            $checkbox = $('<input type="checkbox" class="d-none" />'),
            color = ($widget.data('color') ? $widget.data('color') : "primary"),
            style = ($widget.data('style') == "button" ? "btn-" : "list-group-item-"),
            settings = {
                on: {
                    icon: 'fas fa-fw fa-check'
                },
                off: {
                    icon: 'fas fa-fw fa-unchecked'
                }
            };
            
        $widget.css('cursor', 'pointer')
        $widget.append($checkbox);

        // Event Handlers
        $widget.on('click', function () {
            $checkbox.prop('checked', !$checkbox.is(':checked'));
            $checkbox.triggerHandler('change');
            updateDisplay();
        });
        $checkbox.on('change', function () {
            updateDisplay();
        });
          

        // Actions
        function updateDisplay() {
            var isChecked = $checkbox.is(':checked');

            // Set the button's state
            $widget.data('state', (isChecked) ? "on" : "off");

            // Set the button's icon
            $widget.find('.state-icon')
                .removeClass()
                .addClass('state-icon ' + settings[$widget.data('state')].icon);

            // Update the button's color
            if (isChecked) {
                $widget.addClass(style + color + ' active');
            } else {
                $widget.removeClass(style + color + ' active');
            }
        }

        // Initialization
        function init() {
            
            if ($widget.data('checked') == true) {
                $checkbox.prop('checked', !$checkbox.is(':checked'));
            }
            
            updateDisplay();

            // Inject the icon if applicable
            if ($widget.find('.state-icon').length == 0) {
                $widget.prepend('<span class="state-icon ' + settings[$widget.data('state')].icon + '"></span>');
            }
        }
        init();
    });
    
    $('.list-group-item').on('click', function(event) {
        event.preventDefault();
        var txt = "";

        $("#check-list-box-edit li.active").each(function(idx, li) {
            txt += $(li).attr('id') + ',';
        });
        $('input[name=txt_editar_permisos]').val(txt);
    });

    });

    </script>

    <script>
        $('#DataRoleModal').on('show.bs.modal', function (event) {
            var button = $(event.relatedTarget); // Button that triggered the modal


            var pk = button.data('pk'); // Extract info from data-* attributes
            var nombre = button.data('nombre'); // Extract info from data-* attributes
            var descripcion = button.data('descripcion'); // Extract info from data-* attributes
            var m = button.data('m'); // Extract info from data-* attributes
            var title = button.data('title');
            var recursos = csvToArray(button.data('recursos'));

            // If necessary, you could initiate an AJAX request here (and then do the updating in a callback).
            // Update the modal's content. We'll use jQuery here, but you could use a data binding library or other methods instead.
            $('input[name=txt_editar_id_rol]').val(pk);
            $('input[name=txt_editar_nombre]').val(nombre);
            $('input[name=txt_editar_descripcion]').val(descripcion);
            $('input[name=m]').val(m);      //Si no encuentra las propiedades de data-* es porque quiere crear, no editar
            $('#DataRoleModal').find('.modal-title').text(title);

            $('input[name=txt_editar_permisos]').val(button.data('recursos'));  //Configurando valores iniciales de los recursos asignados al rol



            //Limpiando selección de los recursos
            $('.list-group.checked-list-box .list-group-item').each(function () {
                var $checkbox = $(this).children('input.d-none');
                $checkbox.prop('checked', false);
                $checkbox.triggerHandler('change');
                updateDisplay($(this), $checkbox);
            });

             //Actualizando selecciones de los recursos seleccionados
            $('.list-group.checked-list-box .list-group-item').each(function () {
                var $checkbox = $(this).children('input.d-none');
                var id = $(this).attr("id");


                if (recursos.includes(id)) {
                    $checkbox.prop('checked', true);
                    $checkbox.triggerHandler('change');
                    $checkbox.triggerHandler('click');
                    updateDisplay($(this), $checkbox);
                }
            });
        });

        $('#DataDeleteModal').on('show.bs.modal', function (event) {
            var button = $(event.relatedTarget); // Button that triggered the modal
            var pk = button.data('pk'); // Extract info from data-* attributes
            // If necessary, you could initiate an AJAX request here (and then do the updating in a callback).
            // Update the modal's content. We'll use jQuery here, but you could use a data binding library or other methods instead.
            $('input[name=txt_borrar_id_rol]').val(pk);
        });
    </script>

    <script>
        function csvToArray(str) {
            var ret = [];

            if (str) {
                ret = str.split(",");
                ret.splice(ret.length-1,1);
            }

            return ret;
        }
    </script>

    <script>
        function updateDisplay($checkbox, $widget) {

            var color = ($widget.data('color') ? $widget.data('color') : "primary"),
            style = ($widget.data('style') == "button" ? "btn-" : "list-group-item-"),
            settings = {
                on: {
                    icon: 'fas fa-fw fa-check'
                },
                off: {
                    icon: 'fas fa-fw fa-unchecked'
                }
                };

            var isChecked = $checkbox.is(':checked');

            // Set the button's state
            $widget.data('state', (isChecked) ? "on" : "off");

            // Set the button's icon
            $widget.find('.state-icon')
                .removeClass()
                .addClass('state-icon ' + settings[$widget.data('state')].icon);

            // Update the button's color
            if (isChecked) {
                $widget.addClass(style + color + ' active');
            } else {
                $widget.removeClass(style + color + ' active');
            }
        }
    </script>

    <script>
        setTimeout(function () {
            $('div[role=alert][disposable]').fadeOut('slow');
        }, 5000);
    </script>
    
</asp:Content>