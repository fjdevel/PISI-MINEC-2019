<%@ Page Title="" Language="C#" AutoEventWireup="true" MasterPageFile="~/Views/Layouts/Layout2.Master" CodeBehind="ConsultoresMuniSector.aspx.cs" Inherits="MinecPISI.Views.Administracion.ConsultoresMuniSector" %>


<asp:Content ID="Content1" ContentPlaceHolderID="cssextra" runat="server">
    <link href="<%= ResolveClientUrl("~/Views/vendor/datatables/dataTables.bootstrap4.min.css") %>" rel="stylesheet" />
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="bodyContentBlank" runat="server">
    <form runat="server">
        <div class="card shadow mb-4">

            <div class="card-header py-3">
                <h6 class=" font-weight-bold text-primary">Administracion de Consultores Asignados Por Municipio y Sector Ecónomico</h6>
                <div class="container">
                    <div class="row">
                        <div class="form-group col-md-4">
                            <label>Nombre</label>
                            <asp:TextBox runat="server" type="text" CssClass="form-control" ID="nombreConsultor" placeholder="Ingrese el nombre del consultor" />
                        </div>
                        <div class="form-group col-md-4">
                            <label>Apellido</label>
                            <asp:TextBox runat="server" type="text" CssClass="form-control" ID="apellidoConsultor" placeholder="Ingrese el nombre del consultor" />
                        </div>
                        <div class="form-group col-md-4">
                            <label>Dirección</label>
                            <asp:TextBox runat="server" type="text" CssClass="form-control" ID="direccionConsultor" placeholder="Ingrese la dirrección del consultor" />
                        </div>
                        <div class="form-group col-md-4">
                            <label>Telefono Fijo</label>
                            <asp:TextBox runat="server" type="text" CssClass="form-control" ID="telFijoConsultor" placeholder="Ingrese el telefono fijo del consultor" />
                        </div>
                        <div class="form-group col-md-4">
                            <label>Celular</label>
                            <asp:TextBox runat="server" type="text" CssClass="form-control" ID="celularConsultor" placeholder="Ingrese el celular del consultor" />
                        </div>

                        <div class="form-group col-md-4">
                            <div class="select">
                                <label for="ddl_depto">Departamento</label>
                                <asp:DropDownList ID="ddl_depto" AutoPostBack="True" CssClass="custom-select" runat="server" AppendDataBoundItems="True" OnSelectedIndexChanged="ddl_depto_OnSelectedIndexChanged" CausesValidation="false">
                                    <asp:ListItem Value="0">--Seleccionar--</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                        </div>
                        <div class="form-group col-md-4">
                            <div class="select">
                                <label for="ddl_municipio">Municipio</label>
                                <asp:DropDownList ID="ddl_municipio" AutoPostBack="True" CssClass="custom-select" runat="server" AppendDataBoundItems="True">
                                    <asp:ListItem Value="0">--Seleccione un departamento primero--</asp:ListItem>
                                </asp:DropDownList>
                                <asp:Label runat="server" ForeColor="red" Text="Debes seleccionar un municipio" ID="lbl_muni" Visible="False"></asp:Label>
                            </div>
                        </div>
                        <div class="form-group col-md-4">
                            <label>Correo Electronico</label>
                            <asp:TextBox runat="server" type="email" CssClass="form-control" ID="correoConsultor" placeholder="Ingrese el correo del consultor" />
                        </div>
                        <div class="form-group col-md-4">
                            <label>Contraseña</label>
                            <asp:TextBox runat="server" type="password" CssClass="form-control" ID="passwordConsultor" placeholder="Contraseña"></asp:TextBox>
                        </div>
                    </div>
                    <div>
                        <asp:Button runat="server" CssClass="btn btn-primary" Text="Guardar Consultor" ID="GuardarConsultor" OnClick="GuardarConsultor_Click" />

                    </div>

                </div>
            </div>
            <div class="card-body">
                <div class="table-responsive">
                    <table class="table table-bordered" id="dataTableConsultores" width="100%" cellspacing="0">
                        <thead>
                            <tr>
                                <th>Nombre del Consultor</th>
                                <th>Departamento</th>
                                <th>Municipio</th>
                                <th>Asignación</th>
                            </tr>
                        </thead>
                        <tbody>
                            <% if (consultores.Count > 0)
                                { %>
                            <% foreach (BLL.Modelos.ModelosVistas.MV_DetallePersonasConsultor c in consultores)
                                { %>
                            <tr>
                                <td><%=c.NombreConsultor %></td>
                                <td><%=c.Municipio %></td>
                                <td><%=c.Departamento %></td>
                                <td class="text-center">
                                    <a class="btn btn-info btn-circle" data-toggle="modal" data-target="#modalAsignar" data-persona="<%= c.IdConsultor%>">
                                        <i class="fas fa-info-circle"></i>
                                    </a>
                                </td>
                            </tr>
                            <% }
                                } %>
                        </tbody>
                    </table>
                </div>
            </div>

        </div>

        <div class="modal fade" id="modalAsignar" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title">Asignación de municipio y sector</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <div class="form-group">
                            <asp:TextBox runat="server" type="text" CssClass="form-control d-none" ID="idPersonaConsultorForm" />
                        </div>
                        <div class="form-group col-md-4">
                            <div class="select">
                                <label for="ddl_sector">Sector</label>
                                <asp:DropDownList ID="ddl_sector" CssClass="custom-select" runat="server" AppendDataBoundItems="True">
                                    <asp:ListItem Value="0">--Seleccionar--</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                        </div>
                        <div class="form-group col-md-4">
                            <div class="select">
                                <label for="ddl_municipio2">Municipio</label>
                                <asp:DropDownList ID="ddl_municipioA" CssClass="custom-select" runat="server">
                                    <asp:ListItem Value="0">--Seleccione un departamento primero--</asp:ListItem>
                                </asp:DropDownList>
                                <asp:Label runat="server" ForeColor="red" Text="Debes seleccionar un municipio" ID="Label1" Visible="False"></asp:Label>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <asp:Button runat="server" CssClass="btn btn-primary" Text="Guardar Asignación" ID="GuardarAsig" OnClick="GuardarAsig_Click" />
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
                    </div>
                </div>
            </div>
        </div>
    </form>
</asp:Content>

<asp:Content ID="Content5" ContentPlaceHolderID="jsextra" runat="server">
    <script src="<%= ResolveClientUrl("~/Views/vendor/datatables/jquery.dataTables.min.js") %>"></script>
    <script src="<%= ResolveClientUrl("~/Views/vendor/datatables/dataTables.bootstrap4.js") %>"></script>
    <script>
        $('#modalAsignar').on('show.bs.modal', function (event) {
            var button = $(event.relatedTarget);
            var recipient = button.data('persona');
            $('#bodyContentBlank_idPersonaConsultorForm').val(recipient);
        });
        $(document).ready(function () {

            $('#dataTableConsultores').DataTable({
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


</asp:Content>

