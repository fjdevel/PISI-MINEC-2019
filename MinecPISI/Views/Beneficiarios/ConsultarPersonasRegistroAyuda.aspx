<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Layouts/Layout2.Master" AutoEventWireup="true" CodeBehind="ConsultarPersonasRegistroAyuda.aspx.cs" Inherits="MinecPISI.Views.Beneficiarios.ConsultarPersonasRegistroAyuda" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cssextra" runat="server">
    <link href="<%= ResolveClientUrl("~/Views/vendor/datatables/dataTables.bootstrap4.min.css") %>" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contenidoNavegacion" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="bodyContentBlank" runat="server">
    <form id="form1" runat="server">
        <div class="card shadow mb-4">

            <div class="card-header py-3">
                <h5 class="  font-weight-bold text-primary">Beneficiarios registrados que requieren ayuda</h5>
            </div>

            <div class="card-body">

                <asp:Panel runat="server" ID="pnl_coordinador" Visible="False">

                    <h6 class="  font-weight-bold text-primary  mb-4">Personas con Registro Basico</h6>

                </asp:Panel>


                <div class="table-responsive">
                    <asp:GridView
                        ID="gv_personas"
                        runat="server"
                        AutoGenerateColumns="False"
                        DataKeyNames="IdPersona, IdConsultor"
                        CssClass="table table-bordered table-hover"
                        OnRowDataBound="gv_personas_OnRowDataBound">
                        <Columns>
                            <asp:TemplateField HeaderText="#">
                                <ItemTemplate>
                                    <%# Container.DataItemIndex + 1 %>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField HeaderText="Persona" DataField="NombrePersona" />
                            <asp:BoundField HeaderText="Numeros de Contacto" DataField="NumerosContacto" />
                            <asp:BoundField HeaderText="Correo" DataField="Correo" />
                            <asp:BoundField HeaderText="Consultor Asignado" DataField="NombreConsultor" ItemStyle-CssClass="nombreC" />
                            <asp:BoundField HeaderText="Departamento" DataField="Departamento" />
                            <asp:BoundField HeaderText="Municipio" DataField="Municipio" />
                            <asp:BoundField HeaderText="Fecha Asignación" DataField="FechaAsignacion" DataFormatString="{0:dd/MM/yyyy}" />
                            <asp:TemplateField HeaderText="Cambiar Asignación">
                                <ItemStyle CssClass="text-center" />
                                <ItemTemplate>
                                    <a data-toggle="modal" data-target="#asignarConsultor" class="cambiarAsignacion btn btn-info btn-circle" data-id="<%# Eval("IdPersona")%>">
                                        <i class="fa fa-user-circle"></i>
                                    </a>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Aprobar Asignación">
                                <ItemStyle CssClass="text-center" />
                                <ItemTemplate>
                                    <a data-toggle="modal" data-target="#verificarConsultor" class="aprobarAsignacion btn btn-success btn-circle" data-id="<%# Eval("IdPersona")%>" data-val="<%# Eval("NombreConsultor")%>" data-id-consultor="<%# Eval("IdConsultor")%>">
                                        <i class="iconoAprobar fas fa-check"></i>
                                    </a>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Registrar Beneficiario" Visible="False">
                                <ItemStyle CssClass="text-center" />
                                <ItemTemplate>
                                    <a data-toggle="modal" data-target="#registrarBeneficiario" class="registrarBene btn btn-warning btn-circle" data-id="<%# Eval("IdPersona")%>">
                                        <i class="far fa-user"></i>
                                    </a>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </div>
            </div>
        </div>

        <asp:TextBox runat="server" ID="hd_idPersona" Style="display: none;" />
        <asp:TextBox runat="server" ID="hd_nombreConsultor" Style="display: none;" />
        <asp:TextBox runat="server" ID="hd_idConsultor" Style="display: none;" />

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
                        <asp:Button Text="Asignar" runat="server" CssClass="btn btn-info" ID="btn_asignarConsultor" OnClick="btn_asignarConsultor_OnClick" CausesValidation="False" OnClientClick="return Validate();" />
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
                    </div>
                </div>
            </div>
        </div>

        <!-- Modal Verificar Consultor-->
        <div class="modal fade show" id="verificarConsultor" tabindex="-1" role="dialog" aria-modal="true" style="padding-right: 17px; display: none;">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title">Aprobar Asignación de Consultor a Beneficiario</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <p>¿Estas seguro que deseas aprobar esta Asignación?</p>
                    </div>
                    <div class="modal-footer">
                        <asp:Button Text="Aprobar" runat="server" CssClass="btn btn-success" ID="btn_verificar" OnClick="btn_verificar_OnClick" CausesValidation="False" />
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
                    </div>
                </div>
            </div>
        </div>

        <!-- Modal Registrar Beneficiario-->
        <div class="modal fade show" id="registrarBeneficiario" tabindex="-1" role="dialog" aria-modal="true" style="padding-right: 17px; display: none;">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title">Registrar Información Beneficiario</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <p>¿Estas seguro que deseas registar este Beneficiario?</p>
                        <asp:TextBox runat="server" ID="TextBox1" Style="display: none;" />
                    </div>
                    <div class="modal-footer">
                        <asp:Button Text="Registrar" runat="server" CssClass="btn btn-warning" ID="btn_registar" OnClick="btn_registar_OnClick" CausesValidation="False" />
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

        $(document).on("click", ".aprobarAsignacion", function () {
            debugger;
            var id = $(this).data('id');
            var val = $(this).data('val');
            var idC = $(this).data('idConsultor');
            $("#<%= hd_idPersona.ClientID%>").val(id);
            $("#<%= hd_nombreConsultor.ClientID%>").val(val);
            $("#<%= hd_idConsultor.ClientID%>").val(idC);
            $('#verificarConsultor').modal('show');
        });

        $(document).on("click", ".registrarBene", function () {
            debugger;
            var id = $(this).data('id');
            $("#<%= hd_idPersona.ClientID%>").val(id);
            $('#registrarBeneficiario').modal('show');
        });

        $(function () {
            $('table tr').each(function () {
                if ($(this).find('.nombreC').html() == 'SIN ASIGNAR') {
                    $(this).find('.aprobarAsignacion').removeClass("btn btn-success").addClass("btn btn-warning").prop("disabled", true);
                    $(this).find('.iconoAprobar').removeClass("fas fa-check").addClass("fas fa-exclamation");
                }
                else {
                    $(this).find('.aprobarAsignacion').prop("disabled", false);
                }
            });
        });
    </script>
    <script>
        $(document).ready(function () {
            $('#<%= gv_personas.ClientID %>').DataTable({
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

