<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Layouts/Layout2.Master" AutoEventWireup="true" CodeBehind="ConsultarBeneficiario.aspx.cs" Inherits="MinecPISI.Views.Beneficiarios.ConsultarBeneficiario" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cssextra" runat="server">
    <link href="<%= ResolveClientUrl("~/Views/vendor/datatables/dataTables.bootstrap4.min.css") %>" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contenidoNavegacion" runat="server">
    <% 
    //Aqui de debe hacer la validacion de que navegacion mostrar si el del coordinador o consultor
    if (usuario == "Coordinador")
    {    %>
    <!-- menu del coordinador -->
<li class="nav-item ">
    <a class="nav-link" href="<%Response.Write(HttpContext.Current.Request.ApplicationPath);%>/Beneficiario/Consultar/Beneficiario">
        <i class="fas fa-fw fa-users"></i>
        <span>Consultar Beneficiarios</span>
    </a>
</li>
<li class="nav-item">
    <a class="nav-link" href="<%Response.Write(HttpContext.Current.Request.ApplicationPath);%>/Casos/Consulta">
        <i class="fas fa-fw fa-eye"></i>
        <span>Consultar Casos Activos</span>
    </a>
</li>
<li class="nav-item">
    <a class="nav-link" href="<%Response.Write(HttpContext.Current.Request.ApplicationPath);%>/Formulacion/Consultar/Iniciativa">
        <i class="fas fa-fw fa-eye"></i>
        <span>Consultar Iniciativas</span>
    </a>
</li>
<hr class="sidebar-divider d-none d-md-block">
<div class="text-center d-none d-md-inline">
    <a class="btn rounded-circle border-0" id="sidebarToggle"></a>
</div>
<!-- fin del menu del coordinador -->
    <%
        }
        if (usuario == "Consultor") { 
    %>
  <!-- menu del consultor de vinculacion -->
<li class="nav-item ">
    <a class="nav-link" href="<%Response.Write(HttpContext.Current.Request.ApplicationPath);%>/Beneficiario/Consultar/Beneficiario">
        <i class="fas fa-fw fa-users"></i>
        <span>Consultar Cartera de Beneficiarios</span>
    </a>
</li>
<li class="nav-item">
    <a class="nav-link" href="<%Response.Write(HttpContext.Current.Request.ApplicationPath);%>/Casos/Consulta">
        <i class="fas fa-fw fa-eye"></i>
        <span>Consultar Casos </span>
    </a>
</li>

<hr class="sidebar-divider d-none d-md-block">
<div class="text-center d-none d-md-inline">
    <a class="btn rounded-circle border-0" id="sidebarToggle"></a>
</div>
<!-- fin menu del consultor del consultor de vinculacion -->
    <%
        }
    %>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="bodyContentBlank" runat="server">
    <div class="card shadow mb-4">
        <div class="card-header py-3">
            <h5 class="  font-weight-bold text-primary">Consultar Beneficiarios</h5>
        </div>
        <div class="card-body">
            <%if (usuario == "Coordinador")
                {%>
            <h6 class="  font-weight-bold text-primary  mb-4">Beneficiarios No Verificados</h6>
            <% }
                else
                { %>
            <h6 class="  font-weight-bold text-primary  mb-4">Cartera de Beneficiarios</h6>
            <%} %>
            <%if (usuario == "Consultor")
                { %>
            <div class="form-group">
                <a class="btn btn-info btn-icon-split mb-1" href="<%Response.Write(HttpContext.Current.Request.ApplicationPath);%>/Beneficiario/Registro/Paso/1">
                    <span class="icon text-white-50 p-2">
                        <i class="fa fa-user-plus"></i>
                    </span>
                    <span class="font-weight-bold p-2">Ingresar nuevo Beneficiario</span>
                </a>
            </div>
            <%}%>
            <div class="table-responsive">
                <table class="table table-bordered" id="dataTableBeneficiarios">
                    <thead>
                        <tr>
                            <th>Nombre</th>
                            <th>Apellido</th>
                            <th>Telefono</th>
                            <th>Departamento</th>
                            <%if (usuario == "Consultor")
                                {%>
                            <th>Fecha de Asignación </th>
                            <th>Estado</th>
                            <% } %>
                            <th>Revisar</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>Juan</td>
                            <td>Perez</td>
                            <td>777548754</td>
                            <td>San Salvador</td>
                            <%if (usuario == "Consultor")
                                {%>
                            <td>23/09/2019 07:00am</td>
                            <td>SPA</td>
                            <% } %>
                            <td class="text-center">
                                <a href="<%Response.Write(HttpContext.Current.Request.ApplicationPath);%>/Beneficiario/Documentacion/1" class="btn btn-info btn-circle">
                                    <i class="fa fa-info-circle"></i>
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
            $('#dataTableBeneficiarios').DataTable({
                "language": {
                    "decimal": "",
                    "emptyTable": "No hay Beneficiarios que Mostrar",
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
</asp:Content>
