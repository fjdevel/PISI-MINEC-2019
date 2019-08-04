<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Layouts/Layout2.Master" AutoEventWireup="true" CodeBehind="ConsultarPropuestasSolucion.aspx.cs" Inherits="MinecPISI.Views.Casos.ConsultarPropuestasSolucion" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cssextra" runat="server">
    <link href="<%= ResolveClientUrl("~/Views/vendor/datatables/dataTables.bootstrap4.min.css") %>" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contenidoNavegacion" runat="server">
    <hr class="sidebar-divider">
    <% 
        //Aqui de debe hacer la validacion de que navegacion mostrar si el del coordinador o consultor
        switch (usuario)
        {
            case "Beneficiario":
    %>
    <li class="nav-item ">
    <a class="nav-link" href="<%Response.Write(HttpContext.Current.Request.ApplicationPath);%>/Beneficiario/Registro/Problema">
        <i class="fas fa-fw fa-eye"></i>
        <span>Registrar Problema</span>
    </a>
</li>
<li class="nav-item ">
    <a class="nav-link" href="<%Response.Write(HttpContext.Current.Request.ApplicationPath);%>/Casos/Consulta/Propuestas">
        <i class="fas fa-fw fa-eye"></i>
        <span>Consultar Propuestas</span>
    </a>
</li>
<li class="nav-item ">
    <a class="nav-link" href="<%Response.Write(HttpContext.Current.Request.ApplicationPath);%>/Formulacion/Consultar/Iniciativa">
        <i class="fas fa-fw fa-users"></i>
        <span>Consultar Iniciativas</span>
    </a>
</li>
<hr class="sidebar-divider d-none d-md-block">
<div class="text-center d-none d-md-inline">
    <a class="btn rounded-circle border-0" id="sidebarToggle"></a>
</div>
    <%
            break;
        case "Formulador":
    %>
    <!--#include file="~/Views/Navegacion/Formulador.html"-->
    <%
            break;
        }
    %>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="bodyContentBlank" runat="server">
    <div class="card shadow mb-4">
        <div class="card-header py-3">
            <h5 class="  font-weight-bold text-primary">Gestión de Casos </h5>
        </div>
        <div class="card-body">
            <h5 class="  font-weight-bold text-primary  mb-4">Consultar Propuestas de Solución</h5>
            <% if (usuario == "Beneficiario")
                {%>
            <h6 class="text-info mb-4">Su proyecto ha recibido <span class="text-success font-weight-bold">1</span> solución</h6>
            <%} %>
            <div class="table-responsive">
                <table class="table table-bordered" id="dataTablePropuestas">
                    <thead>
                        <tr>
                            <%if (usuario != "Beneficiario")
                                { %>
                            <th>Beneficiario</th>
                            <%} %>
                            <%if (usuario == "Formulador" || usuario == "Coordinador")
                                {%>
                            <th>Consultor/Ejecutivo a Cargo</th>
                            <%} %>
                            <th>Proyecto</th>
                            <%if (usuario != "Formulador")
                                { %>
                            <th>Presenta Propuesta</th>
                            <th>Fecha Presentación</th>
                            <%} %>
                            <th>Última actualización</th>
                            <th>Status</th>
                            <%if (usuario != "Beneficiario")
                                { %>
                            <th>Etapa</th>
                            <%} %>
                            <th>Revisar</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <%if (usuario != "Beneficiario")
                                { %>
                            <td>Juan José López</td>
                            <%} %>
                            <%if (usuario == "Formulador" || usuario == "Coordinador")
                                {%>
                            <td>Luisa Alejandra Martell</td>
                            <%} %>
                            <td>Crianza de Camarones </td>
                            <%if (usuario != "Formulador")
                                { %>
                            <td>FM787678</td>
                            <td>01/02/2019</td>
                            <%} %>
                            <td>20/02/2019</td>
                            <td>Activo</td>
                            <%if (usuario != "Beneficiario")
                                { %>
                            <td>Aceptado / Formulación</td>
                            <%} %>
                            <td class="text-center btn-inline">
                                <%if (usuario == "Formulador")
                                    {%>
                                <a href="<%Response.Write(HttpContext.Current.Request.ApplicationPath);%>/Formulacion/Propuesta/Solucion/1" class="btn btn-info btn-circle" data-toggle="tooltip" title="Propuesta Solución">
                                    <i class="fa fa-info-circle"></i>
                                </a>
                                <a href="" class="btn btn-success btn-circle" data-toggle="tooltip" title="Plantear Iniciativa">
                                    <i class="fa fa-info-circle"></i>
                                </a>
                                <a href="" class="btn btn-warning btn-circle" data-toggle="tooltip" title="Ver Iniciativa">
                                    <i class="fa fa-info-circle"></i>
                                </a><%}
                                        else
                                        {%>
                                <a href="<%Response.Write(HttpContext.Current.Request.ApplicationPath);%>/Formulacion/Propuesta/Solucion/1" class="btn btn-warning btn-circle" data-toggle="tooltip" title="Ver Iniciativa">
                                    <i class="fa fa-info-circle"></i>
                                </a><%} %>
                            </td>
                        </tr>
                        <tr>
                            <%if (usuario != "Beneficiario")
                                { %>
                            <td>Juan José López</td>
                            <%} %>
                            <%if (usuario == "Formulador" || usuario == "Coordinador")
                                {%>
                            <td>Luisa Alejandra Martell</td>
                            <%} %>
                            <td>Pesca Artesanal </td>
                            <%if (usuario != "Formulador")
                                { %>
                            <td>FM787678</td>
                            <td>01/02/2018</td>
                            <%} %>
                            <td>20/02/2018</td>
                            <td>Evaluacion de propuestas de solucion</td>
                            <%if (usuario != "Beneficiario")
                                { %>
                            <td>Aceptado / Formulación</td>
                            <%} %>
                            <td class="text-center btn-inline">
                                <%if (usuario == "Formulador")
                                    {%>
                                <a href="<%Response.Write(HttpContext.Current.Request.ApplicationPath);%>/Formulacion/Propuesta/Solucion/1" class="btn btn-info btn-circle" data-toggle="tooltip" title="Propuesta Solución">
                                    <i class="fa fa-info-circle"></i>
                                </a>
                                <a href="" class="btn btn-success btn-circle" data-toggle="tooltip" title="Plantear Iniciativa">
                                    <i class="fa fa-info-circle"></i>
                                </a>
                                <a href="" class="btn btn-warning btn-circle" data-toggle="tooltip" title="Ver Iniciativa">
                                    <i class="fa fa-info-circle"></i>
                                </a><%}
                                        else
                                        {%>
                                <a href="<%Response.Write(HttpContext.Current.Request.ApplicationPath);%>/Formulacion/Propuesta/Solucion/1" class="btn btn-warning btn-circle" data-toggle="tooltip" title="Ver Propuesta Solución">
                                    <i class="fa fa-info-circle"></i>
                                </a><%} %>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
            <p class="alert alert-info mt-4">Le recordamos siempre , que su Consultora que es <span class="font-weight-bold">Alejandra Martell</span> si desea comunicarse con ella puede llamarle al numero  de teléfono <span class="font-weight-bold">7789-9000 </span>o enviarle  por aquí un mensaje para que se comunique con usted</p>
            <div class="row float-right">
                <button class="btn btn-info" data-toggle="collapse" data-target="#mensaje">Solicitar apoyo a Consultor</button>
            </div>
            <div class="row">
                <p id="mensaje" class="collapse alert alert-success" role="alert">Se ha notificado a <span class="font-weight-bold">Alejandra Martell</span>, pronto se pondrá en contacto contigo</p>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="jsextra" runat="server">
    <script src="<%= ResolveClientUrl("~/Views/vendor/datatables/jquery.dataTables.min.js") %>"></script>
    <script src="<%= ResolveClientUrl("~/Views/vendor/datatables/dataTables.bootstrap4.js") %>"></script>
    <script>
        $(document).ready(function () {
            $('#dataTablePropuestas').DataTable({
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
