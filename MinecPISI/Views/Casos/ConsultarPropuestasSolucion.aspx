<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Layouts/Layout2.Master" AutoEventWireup="true" CodeBehind="ConsultarPropuestasSolucion.aspx.cs" Inherits="MinecPISI.Views.Casos.ConsultarPropuestasSolucion" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cssextra" runat="server">
    <link href="<%= ResolveClientUrl("~/Views/vendor/datatables/dataTables.bootstrap4.min.css") %>" rel="stylesheet" />
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="bodyContentBlank" runat="server">
    <form id="form1" runat="server">
        <div class="card shadow mb-4">
        <div class="card-header py-3">
            <h5 class="  font-weight-bold text-primary">Gestión de Casos </h5>
        </div>
        <div class="card-body">
            <h5 class="  font-weight-bold text-primary  mb-4">Consultar Propuestas de Solución</h5>
            <h6 class="text-info mb-4" runat="server" Visible="False" ID="h_beneficiario">Su proyecto ha recibido <span class="text-success font-weight-bold"><%= i %></span> solución</h6>
            
            <div class="table-responsive">
                    <asp:GridView
                        ID="gv_propuestas"
                        runat="server"
                        AutoGenerateColumns="False"
                        DataKeyNames="IdPropuesta"
                        CssClass="table table-bordered"
                        OnRowDataBound="gv_propuestas_OnRowDataBound">
                        <Columns>
                            <asp:TemplateField HeaderText="#">
                                <ItemTemplate>
                                    <%# Container.DataItemIndex + 1 %>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField HeaderText="Formulador" DataField="NombreFormulador"/>
                            <asp:BoundField HeaderText="Proyecto" DataField="NombreProblema"/>
                            <asp:BoundField HeaderText="Fecha Presentación" DataField="FechaPresenta" DataFormatString="{0:dd/MM/yyyy}" Visible="False"/>
                            <asp:BoundField HeaderText="Estado" DataField="NombreEstadoProceso"/>
                            <asp:TemplateField HeaderText="Revisar">
                                <ItemStyle CssClass="text-center"/>
                                <ItemTemplate>
                                    <a href="<%Response.Write(HttpContext.Current.Request.ApplicationPath);%>/Formulacion/Propuesta/Solucion/<%# Eval("IdPropuesta")%>" class="btn btn-info btn-circle">
                                    <i class="fa fa-info-circle"></i>
                                </a>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </div>
            <asp:Panel runat="server" ID="pnl_beneficiario" Visible="False">
                <p class="alert alert-info mt-4">Le recordamos siempre , que su Consultora que es <span class="font-weight-bold"><%Response.Write(miConsultor.NOMBRES + " " + miConsultor.APELLIDOS); %></span> si desea comunicarse con ella puede llamarle al numero  de teléfono <span class="font-weight-bold"><% Response.Write(miConsultor.TEL_CEL); %></span</p>
                
                <div class="row">
                    <p id="mensaje" class="collapse alert alert-success" role="alert">Se ha notificado a <span class="font-weight-bold"><%Response.Write(miConsultor.NOMBRES + " " + miConsultor.APELLIDOS); %></span>, pronto se pondrá en contacto contigo</p>
                </div>
            </asp:Panel>
        </div>
    </div>
    </form>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="jsextra" runat="server">
    <script src="<%= ResolveClientUrl("~/Views/vendor/datatables/jquery.dataTables.min.js") %>"></script>
    <script src="<%= ResolveClientUrl("~/Views/vendor/datatables/dataTables.bootstrap4.js") %>"></script>
    <script>
        $(document).ready(function () {
            $('#<%= gv_propuestas.ClientID %>').DataTable({
                "language": {
                    "decimal": "",
                    "emptyTable": "No hay Propuestas que mostrar",
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
