<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Layouts/Layout2.Master" AutoEventWireup="true" CodeBehind="ConsultarBeneficiario.aspx.cs" Inherits="MinecPISI.Views.Beneficiarios.ConsultarBeneficiario" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cssextra" runat="server">
    <link href="<%= ResolveClientUrl("~/Views/vendor/datatables/dataTables.bootstrap4.min.css") %>" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contenidoNavegacion" runat="server">
    <style type="text/css">
  .hiddencol
  {
    display: none;
  }
</style>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="bodyContentBlank" runat="server">
    <form id="form1" runat="server">
        <asp:ScriptManager runat="server" ID="sm_1"/>
        <div class="card shadow mb-4">

            <div class="card-header py-3">
                <h5 class="  font-weight-bold text-primary">Consultar Beneficiarios</h5>
            </div>

            <div class="card-body">

                <asp:Panel runat="server" ID="pnl_coordinador" Visible="False">

                    <h6 class="  font-weight-bold text-primary  mb-4">Beneficiarios No Verificados</h6>

                </asp:Panel>

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
                        DataKeyNames="IdBeneficiario, IdPersonaBeneficiario, IdPersonaConsultor"
                        CssClass="table table-bordered"
                        OnRowDataBound="gv_beneficiarios_OnRowDataBound">
                        <Columns>
                            <asp:TemplateField HeaderText="#">
                                <ItemTemplate>
                                    <%# Container.DataItemIndex + 1 %>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField HeaderText="Nombre del Beneficiario" DataField="NombreBeneficiario" />
                            <asp:BoundField HeaderText="Numeros de Contacto" DataField="NumerosContacto" />
                            <asp:BoundField HeaderText="Correo" DataField="CorreoBeneficiario" />
                            <asp:BoundField HeaderText="Consultor Asignado" DataField="NombreConsultor" ItemStyle-CssClass="nombreC"/>
                            <asp:BoundField HeaderText="Departamento" DataField="Departamento" />
                            <asp:BoundField HeaderText="Municipio" DataField="Municipio" />
                            <asp:BoundField HeaderText="Estado Proceso" DataField="Estado" />
                            <asp:BoundField HeaderText="Fecha Asignación" DataField="FechaAsignacion" DataFormatString="{0:dd/MM/yyyy}" />
                            <asp:TemplateField HeaderText="Cambiar Asignación">
                                <ItemStyle CssClass="text-center" />
                                <ItemTemplate>
                                    <a data-toggle="modal" data-target="#asignarConsultor" class="cambiarAsignacion btn btn-warning btn-circle" data-id="<%# Eval("IdPersonaBeneficiario")%>">
                                        <i class="fa fa-user-circle"></i>
                                    </a>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Revisar">
                                <ItemStyle CssClass="text-center"/>
                                <ItemTemplate>
                                    <a href="<%Response.Write(HttpContext.Current.Request.ApplicationPath);%>/Beneficiario/Documentacion/<%# Eval("IdBeneficiario")%>" class="revisarDetalle btn btn-info btn-circle">
                                        <i class="fa fa-info-circle"></i>
                                    </a>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Editar" Visible="false">
                                <ItemStyle CssClass="text-center"/>
                                <ItemTemplate>
                                    <a href="<%Response.Write(HttpContext.Current.Request.ApplicationPath);%>/Beneficiario/Documentacion/<%# Eval("IdBeneficiario")%>?editMode=1" class="revisarDetalle editarDetalle btn btn-warning btn-circle">
                                        <i class="far fa-edit"></i>
                                    </a>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="CodigoEstado" ItemStyle-CssClass="nombreEP hiddencol" HeaderStyle-CssClass="hiddencol"/>
                        </Columns>
                    </asp:GridView>
                </div>
            </div>
        </div>

        <asp:TextBox runat="server" ID="hd_idPersona" Style="display: none;" />

        <!-- Modal Asignar Consultor-->
        <div class="modal fade show" id="asignarConsultor" tabindex="-1" role="dialog" aria-modal="true" style="padding-right: 17px; display: none;">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title">Asignar Consultor a Beneficiario</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <div class="form-group">
                            <label>Consultor</label>
                            <asp:DropDownList ID="ddl_consultores" CssClass="custom-select" runat="server" AppendDataBoundItems="True">
                                <asp:ListItem Value="0">--Seleccionar--</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <asp:Button Text="Asignar" runat="server" CssClass="btn btn-info" ID="btn_asignarConsultor" OnClick="btn_asignarConsultor_OnClick" CausesValidation="False"  OnClientClick="return Validate();"/>
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
    <script type="text/javascript">
        $(function () {
            $("#<%= btn_asignarConsultor.ClientID %>").click(function () {
                var ddl = $("#<%= ddl_consultores.ClientID %>");
                debugger;
                if (ddl.val() == "0") {
                    //If the "Please Select" option is selected display error.
                    alert("Debes seleccionar una opción!");
                    return false;
                }
                return true;
            });
        });
    </script>
    <script>
        $(document).on("click", ".cambiarAsignacion", function () {
            debugger;
            var id = $(this).data('id');
            $("#<%= hd_idPersona.ClientID%>").val(id);
            $('#asignarConsultor').modal('show');
        });

        $(function () {
            $('table tr').each(function () {
                if ($(this).find('.nombreC').html() == 'SIN ASIGNAR') {
                    $(this).find('.revisarDetalle').hide();
                }
                else if ($(this).find('.nombreEP').html() != 'B03') {
                    $(this).find('.editarDetalle').hide();
                }
                else {
                    $(this).find('.revisarDetalle').show();
                }
            });
        });
    </script>
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
