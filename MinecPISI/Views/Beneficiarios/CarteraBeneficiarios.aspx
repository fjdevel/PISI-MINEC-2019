<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Layouts/Layout2.Master" AutoEventWireup="true" CodeBehind="CarteraBeneficiarios.aspx.cs" Inherits="MinecPISI.Views.Beneficiarios.CarteraBeneficiarios" %>
<asp:Content ID="Content1" ContentPlaceHolderID="cssextra" runat="server">
    <link href="<%= ResolveClientUrl("~/Views/vendor/datatables/dataTables.bootstrap4.min.css") %>" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contenidoNavegacion" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="bodyContentBlank" runat="server">
    <form id="form1" runat="server">
        <asp:ScriptManager runat="server" ID="sm_1"/>
        <div class="card shadow mb-4">

            <div class="card-header py-3">
                <h5 class="  font-weight-bold text-primary">Consultar Beneficiarios</h5>
            </div>

            <div class="card-body">

                <h6 class="  font-weight-bold text-primary  mb-4">Cartera de Beneficiarios</h6>

                <asp:Panel runat="server" ID="pnl_consultor" Visible="False">
                    <h6 class="  font-weight-bold text-primary  mb-4">Cartera de Beneficiarios</h6>
                    <div class="form-group">
                        <a class="btn btn-info btn-icon-split mb-1" href="<%Response.Write(HttpContext.Current.Request.ApplicationPath);%>/Beneficiario/Registro/Paso/1">
                            <span class="icon text-white-50 p-2">
                                <i class="fa fa-user-plus"></i>
                            </span>
                            <span class="font-weight-bold p-2">Ingresar nuevo Beneficiario</span>
                        </a>
                    </div>

                </asp:Panel>


                <div class="table-responsive">
                    <asp:GridView
                        ID="gv_beneficiarios"
                        runat="server"
                        AutoGenerateColumns="False"
                        DataKeyNames="IdBeneficiario"
                        CssClass="table table-bordered"
                        OnRowDataBound="gv_beneficiarios_OnRowDataBound">
                        <Columns>
                            <asp:TemplateField HeaderText="#">
                                <ItemTemplate>
                                    <%# Container.DataItemIndex + 1 %>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField HeaderText="Nombres" DataField="Nombre" />
                            <asp:BoundField HeaderText="Apellidos" DataField="Apellido" />
                            <asp:BoundField HeaderText="Telefono" DataField="Telefono" />
                            <asp:BoundField HeaderText="Departamento" DataField="Departamento" />
                            <asp:BoundField HeaderText="Consultor" DataField="NombreConsultor" />
                            <asp:BoundField HeaderText="Fecha Asignación" DataField="FechaAsignacion" DataFormatString="{0:dd/MM/yyyy}" Visible="False"/>
                            <asp:BoundField HeaderText="Estado" DataField="Estado" Visible="False"/>
                            <asp:TemplateField HeaderText="Revisar">
                                <ItemStyle CssClass="text-center"/>
                                <ItemTemplate>
                                    <a href="<%Response.Write(HttpContext.Current.Request.ApplicationPath);%>/Beneficiario/Documentacion/<%# Eval("IdBeneficiario")%>" class="btn btn-info btn-circle">
                                    <i class="fa fa-info-circle"></i>
                                </a>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </div>
            </div>
        </div>
    </form>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="jsextra" runat="server">
    <script src="<%= ResolveClientUrl("~/Views/vendor/datatables/jquery.dataTables.min.js") %>"></script>
    <script src="<%= ResolveClientUrl("~/Views/vendor/datatables/dataTables.bootstrap4.js") %>"></script>
    <script>
        $(document).ready(function () {
            $('#<%= gv_beneficiarios.ClientID %>').DataTable({
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

