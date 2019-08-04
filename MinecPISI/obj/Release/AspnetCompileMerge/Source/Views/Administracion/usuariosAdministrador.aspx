<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Layouts/Layout2.Master" AutoEventWireup="true" CodeBehind="usuariosAdministrador.aspx.cs" Inherits="MinecPISI.Views.Administracion.usuariosAdministrador" %>
<asp:Content ID="Content1" ContentPlaceHolderID="cssextra" runat="server">
    <link href="<%= ResolveUrl("~/Views/vendor/datatables/dataTables.bootstrap4.min.css") %>" rel="stylesheet" />
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
        <h6 class="  font-weight-bold text-primary">Administracion de Usuarios</h6>

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

        <a href="#"  class=" btn btn-sm btn-primary shadow-sm" data-toggle="modal" data-target="#DataUserModal"
            data-title="Agregar Usuario"
            data-m="pos"
            >
            <i class="fas fa-plus fa-sm text-white-50"></i> Agregar nuevo Usuario
        </a>
    </div>
    <div class="card-body">
        <div class="table-responsive">
            <table class="table table-bordered" id="dataTableUsuarios" width="100%" cellspacing="0">
                <thead>
                    <tr>
                        <th>Nombre</th>
                        <th>Apellido</th>
                        <th>Correo</th>
                        <th>Rol</th>
                        <th>Ver/Editar</th>
                        <th>Eliminar</th>
                    </tr>
                </thead>
                <tbody>
                    <% foreach (var p in data) { %>
                        <% BLL.Modelos.TB_USUARIO usuario = new BLL.Acciones.A_USUARIO().getUsuarioByPersona(p.ID_PERSONA); %>

                        <% 
                            if (usuario == null)
                            {
                                continue;
                            }
                        %>
                        <tr>
                            <% BLL.Modelos.TB_ROL rol = new BLL.Acciones.A_ROL().getRolById(usuario.ID_ROL); %>

                            <td><%=p.NOMBRES %></td>
                            <td><%=p.APELLIDOS %></td>
                            <td><%=p.CORREO_E %></td>
                            <td><%=rol.NOMBRE %></td>

                            <td class="text-center">
                                <a href="#" class="btn btn-info btn-circle" data-toggle="modal" data-target="#DataUserModal"
                                    data-id-persona="<%= p.ID_PERSONA%>"
                                    data-persona-nombres="<%=p.NOMBRES %>"
                                    data-persona-apellidos="<%=p.APELLIDOS %>"
                                    data-persona-correo="<%=p.CORREO_E %>"
                                    data-nombre-usuario="<%=usuario.NOMBRE_USUARIO %>"
                                    data-id-departamento="<%= new BLL.Acciones.A_MUNICIPIO().obtenerDepartamentoByIdMunicipio(p.ID_MUNICIPIO).ID_DEPARTAMENTO %>"
                                    data-persona-municipio-id="<%=p.ID_MUNICIPIO %>"
                                    data-id-usuario="<%=usuario.ID_USUARIO %>"
                                    data-id-rol="<%=usuario.ID_ROL %>"
                                    data-title="Editar Usuario"
                                    data-m="put"
                                    >
                                    <i class="fas fa-info-circle"></i>
                                </a>
                            </td>
                            <td class="text-center">
                                <a href="#" class="btn btn-danger btn-circle" data-toggle="modal" data-target="#DataUserDeleteModal"
                                    data-id-persona="<%=p.ID_PERSONA %>"
                                    data-id-usuario="<%=usuario.ID_USUARIO %>"
                                    data-title="Eliminar Usuario"
                                    >
                                    <i class="fas fa-trash"></i>
                                </a>
                            </td>
                        </tr>
                    <%} %>

                </tbody>
            </table>
        </div>
    </div>
</div>

<div class="modal fade show" id="DataUserModal" tabindex="-1" role="dialog" aria-modal="true" style="padding-right: 17px; display: none;">
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
                        <input type="hidden" name="txt_id_persona" value="" />
                        <input type="hidden" name="txt_id_usuario" value="" />

                        <div class="form-group">
                            <label>Nombres</label>
                            <input type="text" class="form-control" name="txt_nombres" placeholder="Ingrese el nombre del Usuario" required>
                        </div>
                        <div class="form-group">
                            <label>Apellidos</label>
                            <input type="text" class="form-control" name="txt_apellidos" placeholder="Ingrese el apellido del Usuario" required>
                        </div>
                        <div class="form-group">
                            <label>Correo</label>
                            <input type="email" class="form-control" name="txt_correo" placeholder="Ingrese el Correo del Usuario" required>
                        </div>

                    <div class="form-group">
                        <label>Nombre de Usuario</label>
                        <input type="text" class="form-control" name="txt_nombre_usuario" placeholder="Ingrese un nombre de usuario" required>
                    </div>

                    <div class="form-group">
                         <label>Contraseña</label>
                        <input type="password" class="form-control" name="txt_contrasena1" placeholder="Ingrese una contraseña de 4 caracteres o más" onchange="requirePass()" required>
                    </div>
                    <div class="form-group">
                        <input type="password" class="form-control" name="txt_contrasena2" placeholder="Repita la contraseña" required>
                    </div>
                        <div class="form-group">
                            <label for="sel_id_rol">Seleccione el Rol</label>
                            <select class="form-control" name="sel_id_rol">
                                <% foreach (BLL.Modelos.TB_ROL rol in new BLL.Acciones.A_ROL().getAll()) { %>
                                    <option value="<%=rol.ID_ROL %>"><%=rol.NOMBRE %></option>
                                <% } %>
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="sel_id_departamento">Seleccione el Departamento</label>
                            <select class="form-control" name="sel_id_departamento" onchange="actualizarMunicipios()">
                                <% foreach (BLL.Modelos.TBC_DEPARTAMENTO dept in new BLL.Acciones.A_DEPARTAMENTO().ObtenerDeptos()) { %>
                                    <option value="<%=dept.ID_DEPARTAMENTO %>"><%=dept.NOMBRE %></option>
                                <% } %>
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="sel_id_municipio">Seleccione el Municipio</label>
                            <select class="form-control" name="sel_id_municipio">
                            
                            </select>
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

<div class="modal fade show" id="DataUserDeleteModal" tabindex="-1" role="dialog" aria-modal="true" style="padding-right: 17px; display: none;">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="">Esta seguro de eliminar el registro del Usuario?</h5>
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
                    <input type="hidden" name="txt_borrar_id_persona" value="" />
                    <input type="hidden" name="txt_borrar_id_usuario" value="" />

                    <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancelar</button>
                    <button class="btn btn-danger" type="submit">Eliminar</button>

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
     <script src="<%= ResolveUrl("~/Views/vendor/datatables/jquery.dataTables.min.js") %>"></script>
    <script src="<%= ResolveUrl("~/Views/vendor/datatables/dataTables.bootstrap4.js") %>"></script>
    <script>
    $(document).ready(function() {
      $('#dataTableUsuarios').DataTable( {
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
        $("#DataUserModal").on("show.bs.modal", function (event) {
            var button = $(event.relatedTarget);

            var id_persona = button.data("id-persona");
            var persona_nombres = button.data("persona-nombres");
            var persona_apellidos = button.data("persona-apellidos");
            var persona_correo = button.data("persona-correo");
            var id_departamento = button.data("id-departamento");
            var persona_municipio_id = button.data("persona-municipio-id");
            var id_usuario = button.data("id-usuario");
            var nombre_usuario = button.data("nombre-usuario");
            var id_rol = button.data("id-rol");
            var title = button.data("title");
            var m = button.data("m");

            $('input[name=m]').val(m);
            $('input[name=txt_id_persona]').val(id_persona);
            $('input[name=txt_id_usuario]').val(id_usuario);
            $('input[name=txt_nombres]').val(persona_nombres);
            $('input[name=txt_nombres]').val(persona_nombres);
            $('input[name=txt_apellidos]').val(persona_apellidos);
            $('input[name=txt_correo]').val(persona_correo);
            $('input[name=txt_nombre_usuario]').val(nombre_usuario);

            var $contra1 = $('input[name=txt_contrasena1]');
            var $contra2 = $('input[name=txt_contrasena2]');

            if (m === "pos") {  //Si esta creando
                $contra1.prop("placeholder","Ingrese una contraseña de 4 caracteres o más");
                $contra2.prop("placeholder", "Repita la contraseña");


                $contra1.prop("required", true);
                $contra2.prop("required", true);

            }
            else {  //Si está editando
                $contra1.prop("placeholder", "Deje en blanco para no cambiar");
                $contra2.prop("placeholder", "Deje en blanco para no cambiar");

                $contra1.prop('required', false);
                $contra2.prop('required', false);
            }

            //Borrando la seleccion anterior
            $('select[name=sel_id_rol] option').removeAttr("selected");
            $('select[name=sel_id_rol] option[value=' + id_rol + ']').attr('selected', 'selected');   //Configurando el departamento del usuario

            //Borrando la seleccion anterior
            $('select[name=sel_id_departamento] option').removeAttr("selected");
            $('select[name=sel_id_departamento] option[value=' + id_departamento + ']').attr('selected', 'selected');   //Configurando el departamento del usuario

            actualizarMunicipios();     //Buscando los municipios del departamento seleccionado

            //Borrando la seleccion anterior
            $('select[name=sel_id_municipio] option').removeAttr("selected");
            $('select[name=sel_id_municipio] option[value=' + persona_municipio_id + ']').attr('selected', 'selected');   //Configurando el departamento del usuario
            //$('select[name=sel_id_departamento]').val(persona_municipio_id);   //Configurando el departamento del usuario

            $('#DataUserModal').find('.modal-title').text(title);
        });

        //Reiniciando los controles del municipio
        $('#DataUserModal').on("hidden.bs.modal", function (event) {
            resetMunicipios();
        });
    </script>

    <script>
        $('#DataUserDeleteModal').on("show.bs.modal", function (event) {
            var button = $(event.relatedTarget);

            var id_persona = button.data("id-persona");
            var id_usuario = button.data("id-usuario");

            $('input[name=txt_borrar_id_persona]').val(id_persona);
            $('input[name=txt_borrar_id_usuario]').val(id_usuario);
        });
    </script>

    <script>
        function getMunicipios(depto) {
            var departamentos = '{' +
        <% for (int i = 0; i < departamentos.Count; i++) { %>
                '' +
                <% List<BLL.Modelos.TBC_MUNICIPIO> municipios = new BLL.Acciones.A_MUNICIPIO().ObtenerMunicipiosXDepartamento(departamentos[i].ID_DEPARTAMENTO);%>
                '"p<%= departamentos[i].ID_DEPARTAMENTO%>" : {' +
                    '"nombre" : "<%= departamentos[i].NOMBRE%>",' +
                    '"municipios" : [' +
                        <% for (int j =0; j < municipios.Count; j++) {%>
                        '{' +
                        '"id" : <%= municipios[j].ID_MUNICIPIO%>,' +
                        '"nombre" : "<%= municipios[j].NOMBRE%>"' +
                        '<%= (j < (municipios.Count - 1)) ? "}," : "}"%>' +
                        <% }%>
                        ']' +
                    '<%= (i < (departamentos.Count - 1)) ? "}," : "}"%>' +
        <% } %>'}';

            var d = JSON.parse(departamentos);

            return d["p" + depto].municipios;
        }
    </script>

    <script>
        function actualizarMunicipios() {

            var depto = $('select[name=sel_id_departamento]').val();

            var municipios = getMunicipios(depto);
            var select = $('select[name=sel_id_municipio]');
            $options = $('select[name=sel_id_municipio] option');

            if ($options.length > 0) {
                $options.remove();
            }
            
            for (var i = 0; i < municipios.length; i++) {
                var opt = document.createElement('option');

                opt.value = municipios[i].id;
                opt.innerHTML = municipios[i].nombre;

                select.append(opt);
            }

        }
    </script>

    <script>
        function resetMunicipios() {
            $sel_deptos = $('select[name=sel_id_departamento]');
            $sel_deptos.val("1");

            $sel_deptos.triggerHandler('change');
        }
    </script>

    <script>
        $(document).on('load', function () {
            actualizarMunicipios();
        });
    </script>

    <script>
        function requirePass() {

            var $m = $('input[name=m]');

             var $contra1 = $('input[name=txt_contrasena1]');
            var $contra2 = $('input[name=txt_contrasena2]');

            if ($m.val() === "put") {
                if ($contra1.val() != "") {     //Si está editando y la contraseña1 está vacía (no quiere cambiarla)
                    $contra1.prop("required", true);
                $contra2.prop("required", true);
                }
                else {
                     $contra1.prop('required', false);
                $contra2.prop('required', false);
                }
            }
        }
    </script>

    <script>
        setTimeout(function () {
            $('div[role=alert][disposable]').fadeOut('slow');
        }, 5000);
    </script>
</asp:Content>
