<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Layouts/Layout2.Master" AutoEventWireup="true" CodeBehind="ReporteIniciativas.aspx.cs" Inherits="MinecPISI.Views.Reportes.ReporteIniciativas" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cssextra" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contenidoNavegacion" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="bodyContentBlank" runat="server">
    <form id="form17" runat="server">
        <asp:ScriptManager runat="server" ID="sm1"/>
        <div class="row">
            <div class="col shadow-sm p-3 mb-3 bg-white rounded text-secondary">
                <h3><i class="fa fa-bar-chart" aria-hidden="true"></i>Reportes</h3>
            </div>
        </div>

        <div class="card-body">
            <div class="card">
                <div class="card-body">

                    <h5 class="card-title">Reporte Iniciativas</h5>
                    <h6 class="card-subtitle mb-2 text-muted">Seleccione los parametros del reporte</h6>
                    <hr class="my-4">

                    <div class="form-group row">
                        <label for="desde" class="col-sm-2 col-form-label">Fecha Desde </label>
                        <div class="col-sm-4">
                            <asp:TextBox runat="server" ID="fechaDesde" type="date"></asp:TextBox>
                        </div>
                        <label for="hasta" class="col-sm-2 col-form-label">Fecha Hasta</label>
                        <div class="col-sm-4">
                            <asp:TextBox runat="server" ID="fechaHasta" type="date"></asp:TextBox>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="monto" class="col-sm-2 col-form-label">Monto menor</label>
                        <div class="col-sm-4">
                            <asp:TextBox runat="server" ID="txt_montoMenor" CssClass="form-control" Rows="1" required="true" />
                        </div>
                        <label for="monto" class="col-sm-2 col-form-label">Monto mayor</label>
                        <div class="col-sm-4">
                            <asp:TextBox runat="server" ID="txt_montoMayor" CssClass="form-control" Rows="1" required="true" />
                        </div>
                    </div>

                    <div class="form-group row">
                        <label for="sector" class="col-sm-2 col-form-label">Sector</label>
                        <div class="col-sm-5">
                            <div class="select">

                                <asp:DropDownList ID="ddl_sector" CssClass="custom-select" runat="server" AppendDataBoundItems="True">
                                    <asp:ListItem Value="0">--Seleccionar--</asp:ListItem>
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator ID="rfv1" runat="server" ControlToValidate="ddl_sector" InitialValue="0" />
                            </div>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="tipoIniciativa" class="col-sm-2 col-form-label">Tipo de Iniciativa</label>
                        <div class="col-sm-5">

                            <asp:DropDownList ID="ddl_iniciativa" CssClass="custom-select" runat="server" AppendDataBoundItems="True">
                                <asp:ListItem Value="0">--Seleccionar--</asp:ListItem>
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="ddl_iniciativa" InitialValue="0" />

                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="state" class="col-sm-2 col-form-label">Estado</label>
                        <div class="col-sm-5">
                            <asp:DropDownList ID="ddl_estados" CssClass="custom-select" runat="server" AppendDataBoundItems="True">
                                <asp:ListItem Value="0">--Seleccionar--</asp:ListItem>
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="ddl_estados" InitialValue="0" ForeColor="red" Display="Dynamic" />
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="state" class="col-sm-2 col-form-label">Formulador</label>
                        <div class="col-sm-5">

                            <asp:DropDownList ID="ddl_formulador" CssClass="custom-select" runat="server" AppendDataBoundItems="True">
                                <asp:ListItem Value="0">--Seleccionar--</asp:ListItem>
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="ddl_formulador" InitialValue="0" />
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="state" class="col-sm-2 col-form-label">Beneficiario</label>
                        <div class="col-sm-5">

                            <asp:DropDownList ID="ddl_beneficiario" CssClass="custom-select" runat="server" AppendDataBoundItems="True">
                                <asp:ListItem Value="0">--Seleccionar--</asp:ListItem>
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="ddl_beneficiario" InitialValue="0" />
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="state" class="col-sm-2 col-form-label">Consultor Beneficiario</label>
                        <div class="col-sm-5">

                            <asp:DropDownList ID="ddl_consultor" CssClass="custom-select" runat="server" AppendDataBoundItems="True">
                                <asp:ListItem Value="0">--Seleccionar--</asp:ListItem>
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="ddl_consultor" InitialValue="0" />
                        </div>
                    </div>
                    <hr class="my-4">
                    <div class="btn-group float-right" role="group" aria-label="Basic example">

                        <asp:Button ID="btn_imprimir" CssClass="btn btn-success mt-3" Text="Vista Previa" runat="server" OnClick="Btn_imprimir_OnClick" />
                    </div>
                    <div class="table-responsive">
                        <asp:GridView ID="iniciativas" runat="server" AutoGenerateColumns="false" CssClass="table table-bordered" OnRowDataBound="gv_iniciativas_OnRowDataBound">
                            <Columns>
                                <asp:TemplateField HeaderText="#">
                                    <ItemTemplate>
                                        <%# Container.DataItemIndex + 1 %>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField HeaderText="beneficiario" DataField="beneficiario" />
                                <asp:BoundField HeaderText="consultor" DataField="consultor" />
                                <asp:BoundField HeaderText="formulador" DataField="formulador" />
                                <asp:BoundField HeaderText="sector" DataField="sector" />
                                <asp:BoundField HeaderText="iniciativa" DataField="iniciativa" />
                                <asp:BoundField HeaderText="estado" DataField="estado" />
                                <asp:BoundField HeaderText="monto" DataField="monto" />

                                <asp:TemplateField HeaderText="Revisar">
                                    <ItemStyle CssClass="text-center" />
                                    <ItemTemplate>
                                        </a>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>

                    </div>

                </div>
            </div>
        </div>
    </form>

</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="jsextra" runat="server">
    <script src="<%= ResolveClientUrl("~/Views/vendor/datatables/jquery.dataTables.min.js") %>"></script>
    <script src="<%= ResolveClientUrl("~/Views/vendor/datatables/dataTables.bootstrap4.js") %>"></script>
    <script>
        $(document).ready(function () {
            $('#<%= iniciativas.ClientID %>').DataTable({
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
</asp:Content>
