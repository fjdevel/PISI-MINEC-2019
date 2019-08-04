<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Layouts/Layout2.Master" AutoEventWireup="true" CodeBehind="ConsultarCasos.aspx.cs" Inherits="MinecPISI.Views.Casos.ConsultarCasosActivosCoordinador" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cssextra" runat="server">
    <link href="../../Views/vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contenidoNavegacion" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="bodyContentBlank" runat="server">
    <form id="form1" runat="server">
        <div class="card shadow mb-4">
            <div class="card-header py-3">
                <h6 class="  font-weight-bold text-primary">Consulta de casos</h6>
            </div>
            <div class="card-body">
               
                
                <div class="table-responsive">
                    <%-- public string rol = ((BLL.Modelos.ModelosVistas.MV_DetalleUsuario)Session["usuario"]).NOMBRE_ROL.ToUpper(); --%>
                        
                    <asp:GridView
                        ID="gv_casos"
                        runat="server"
                        AutoGenerateColumns="False"
                        DataKeyNames="ID_PROBLEMA"
                        CssClass="table table-bordered"
                        OnRowDataBound="gv_casos_OnRowDataBound">
                        <Columns>
                            <asp:TemplateField HeaderText="#">                                                          <%--1--%>
                                <ItemTemplate>
                                    <%# Container.DataItemIndex + 1 %>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField HeaderText="Nombre del proyecto" DataField="NOMBRE_PROBLEMA" />             <%--2--%>
                            <asp:BoundField HeaderText="Estado" DataField="NOMBRE_ESTADO" />                            <%--3--%>
                            <asp:BoundField HeaderText="Nombre del beneficiario" DataField="NOMBRE_BENEFICIARIO" />     <%--4--%>

                            <asp:TemplateField HeaderText="Última Actualizacion">                                <%--5--%>
                                <ItemTemplate>
                                    <%# BLL.Helpers.H_Objetos.dateTimeCount(((BLL.Modelos.ModelosVistas.MV_DetalleProblema)Container.DataItem).FECHA_ACTUALIZA) %>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:BoundField HeaderText="Observaciones" DataField="OBSERVACION_DESCRIPCION" />           <%--6--%>

                            <asp:TemplateField HeaderText="Consultor de vinculación">                                   <%--7--%>
                                <ItemTemplate>
                                        <%# BLL.Acciones.A_PERSONA.getNombresFromPersona(BLL.Acciones.A_ASIGNACION.getPersonaByIdBeneficiario((int)Eval("ID_BENEFICIARIO"))) %>
                                </ItemTemplate>
                            </asp:TemplateField>
                            
                            <%--8--%>
                            <%--<asp:TemplateField HeaderText="Días Transcurridos">                                        
                                <ItemTemplate>
                                    <% if (rol.Equals("COORDINADOR") || rol.Equals("FORMULADOR"))
                                        { %>
                                        <%# ((BLL.Modelos.ModelosVistas.MV_DetalleProblema)Container.DataItem).DIAS_CREA %>
                                    <%} %>
                                </ItemTemplate>
                            </asp:TemplateField>--%>

                            <asp:BoundField HeaderText="Días Transcurridos" DataField="DIAS_CREA" />                    <%--8--%>
                            
                            <asp:TemplateField HeaderText="Revisar">                                                    <%--9--%>
                                <ItemStyle CssClass="text-center"/>
                                <ItemTemplate>
                                    <a href="<% Response.Write(HttpContext.Current.Request.ApplicationPath);%>/Casos/ProblemaIngresado/<%# Eval("ID_PROBLEMA")%>" class="btn btn-info btn-circle">
                                    <i class="fa fa-info-circle"></i>
                                </a>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </div>
            </div>
        </div>

        <!--Modal Asignar Formulador -->
        <div class="modal fade" id="AsignarFormulador" tabindex="-1" role="dialog" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="labelHeader">Asignar Formulador</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form>
                            <div class="form-group">
                                <label for="ejemploSelect">Selecciona el Formulador para este Caso</label>
                                <select class="form-control" id="ejemploSelect">
                                    <option>Luisa Martell</option>
                                    <option>Alejandro Cárcamo</option>
                                    <option>Ernesto Mejía</option>
                                    <option>Diego Mejía</option>
                                </select>
                            </div>
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
                        <button type="submit" class="btn btn-success">Guardar</button>
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
        $(document).ready(function () {
            $('#<%= gv_casos.ClientID %>').DataTable({
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


