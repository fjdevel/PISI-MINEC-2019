<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Layouts/Layout2.Master" AutoEventWireup="true" CodeBehind="Sectores.aspx.cs" Inherits="MinecPISI.Views.Catalogos.Sectores" %>
<asp:Content ID="Content1" ContentPlaceHolderID="cssextra" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contenidoNavegacion" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="bodyContentBlank" runat="server">

<form id="form16" runat="server">
        <div class="card shadow mb-4">

            <div class="card-header py-3">
                <h5 class="  font-weight-bold text-primary">Catalagos del sistema</h5>
            </div>

            <div class="card-body">
                <asp:Panel runat="server"  Visible="true">
                    <h6 class="  font-weight-bold text-primary  mb-4">Catalogo Departamentos</h6>
                    <div class="form-group">
                        <a class="btn btn-info btn-icon-split mb-1" href="<%Response.Write(HttpContext.Current.Request.ApplicationPath);%>/Administrar/RegistroSector/">
                            <span class="icon text-white-50 p-2">
                                <i class="fa fa-user-plus"></i>
                            </span>
                            <span class="font-weight-bold p-2">Ingresar nuevo Sectore</span>
                        </a>
                    </div>

                </asp:Panel>

                <div class="table-responsive">
                    <asp:GridView
                        ID="gv_sectores"
                        runat="server"
                        AutoGenerateColumns="False"                        
                        CssClass="table table-bordered"
                        OnRowDataBound="gv_sectores_OnRowDataBound">
                        <Columns>
                            <asp:TemplateField HeaderText="#">
                                <ItemTemplate>
                                    <%# Container.DataItemIndex + 1 %>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField HeaderText="Codigo sector" DataField="COD_SECTOR_ECONOMICO" />
                            <asp:BoundField HeaderText="Nombre" DataField="NOMBRE" />
                            <asp:BoundField HeaderText="Fecha de creacion" DataFormatString="{0:dd/MM/yyyy}" Visible="False" DataField="FECHA_CREA" />                            
                            <asp:TemplateField HeaderText="Revisar">
                                <ItemStyle CssClass="text-center"/>
                                <ItemTemplate>
                                    
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
<asp:Content ID="Content4" ContentPlaceHolderID="jsextra" runat="server">
    <script src="<%= ResolveClientUrl("~/Views/vendor/datatables/jquery.dataTables.min.js") %>"></script>
    <script src="<%= ResolveClientUrl("~/Views/vendor/datatables/dataTables.bootstrap4.js") %>"></script>
    <script>
        $(document).ready(function () {
            $('#<%= gv_sectores.ClientID %>').DataTable({
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
