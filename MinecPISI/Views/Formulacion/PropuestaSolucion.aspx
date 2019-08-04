<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Layouts/Layout2.Master" AutoEventWireup="true" CodeBehind="PropuestaSolucion.aspx.cs" Inherits="MinecPISI.Views.Formulacion.PropuestaSolucion" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cssextra" runat="server">
        <link href="<%= ResolveUrl("~/Views/vendor/datatables/dataTables.bootstrap4.min.css") %>" rel="stylesheet" />

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contenidoNavegacion" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="bodyContentBlank" runat="server">
    <form id="form1" runat="server">
        <asp:ScriptManager runat="server" ID="sm1" />

        <asp:UpdatePanel runat="server">
            <ContentTemplate>
                <div class="card shadow mb-4">
                    <div class="card-header py-3">
                        <h6 class="  font-weight-bold text-primary">Propuesta Solución</h6>
                    </div>
                    <div class="card-body">
                        <div class="row">
                            <div class="col">
                                <h5 class="font-weight-bold">Tipo</h5>
                                <p runat="server" id="p_tipoPropuesta"></p>
                            </div>
                            <div class="col">
                                <h5 class="font-weight-bold">Presentó la Propuesta Solución:</h5>
                                <p runat="server"  class="btn btn-success" id="p_nombreFormulador" data-toggle="modal" data-target="#FormuladorModal"></p>
                            </div>
                            <div class="col">
                                <h5 class="font-weight-bold">Fecha en la que se presentó:</h5>
                                <p runat="server" id="p_fechaPresenta"></p>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="card shadow mb-2">
                    <div class="card-body">
                        <%if (tipoSolucion != "integral")
                            { %>
                        <div class="row pt-3 pl-3 pr-3">
                            <div class="form-group">
                                <h6 class="font-weight-bold text-info">Propuesta Solución</h6>
                                <p runat="server" id="p_propuesta"></p>
                            </div>
                        </div>
                        <%}
                            else
                            { %>
                        <div class="row pt-3 pl-3 pr-3">
                            <div class="form-group">
                                <h6 class="font-weight-bold text-info">Adopción / Incorporación Tecnológica</h6>
                                <p runat="server" id="p_adopcion"></p>
                            </div>
                            <div class="form-group">
                                <h6 class="font-weight-bold text-info">Asistencia Técnica / Transferencia de Conocimiento</h6>
                                <p runat="server" id="p_asistencia"></p>
                            </div>
                            <div class="form-group">
                                <h6 class="font-weight-bold text-info">Innovación</h6>
                                <p runat="server" id="p_inovacion"></p>
                            </div>
                        </div>
                        <%} %>
                        <div class="row pl-3 pr-3">
                            <div class="form-group">
                                <h6 class="font-weight-bold">Componentes Básicos del Proyecto</h6>
                                <p runat="server" id="p_compBasicos"></p>
                            </div>
                        </div>
                        <div class="row pl-3 pr-3">
                            <div class="form-group">
                                <h6 class="font-weight-bold">Información Adicional de Sustento</h6>
                                <p runat="server" id="p_infoAdicional"></p>
                            </div>
                        </div>
                        <div class="row pl-3 pr-3">
                            <div class="form-group">
                                <label class="h6 font-weight-bold">Presupuesto / Contrapartida Aproximada para ejecución</label>
                                <p runat="server" id="p_presupuesto"></p>
                            </div>
                        </div>
                        <%if (usuario == "beneficiario")
                            { %>
                        <div class="text-center mt-4 mb-4">
                            <asp:LinkButton runat="server" ID="lnk_aceptar" CssClass="btn btn-success btn-icon-split mb-1" OnClick="lnk_aceptar_OnClick">
                    <span class="icon text-white-50">
                        <i class="fas fa-check"></i>
                    </span>
                    <span class="text">Aceptar Propuesta</span>
                            </asp:LinkButton>
                            <asp:LinkButton runat="server" ID="lnk_rechazar" CssClass="btn btn-danger btn-icon-split mb-1" OnClick="lnk_rechazar_OnClick">
                    <span class="icon text-white-50">
                        <i class="fas fa-exclamation-triangle"></i>
                    </span>
                    <span class="text">Rechazar Propuesta</span>
                            </asp:LinkButton>
                        </div>
                        <%}%>
                    </div>
                </div>
                <div class="modal fade" id="FormuladorModal" tabindex="-1" role="dialog"  aria-hidden="true">
                  <div class="modal-dialog modal-lg">
                    <div class="modal-content">
                      <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLongTitle">Experiencia del Formulador</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                          <span aria-hidden="true">&times;</span>
                        </button>
                      </div>
                      <div class="modal-body">
                          <h6 class="  font-weight-bold text-primary">Datos Personales</h6>
                        <div class="form-group">
                            <div class="form-row">
                                <div class="form-group col-lg-6">
                                    <label>Nombres</label>
                                    <input type="text" class="form-control" value="<%=infoFormulador.NOMBRES%>" readonly="readonly" >
                                </div>
                                <div class="form-group col-lg-6">
                                    <label>Apellidos</label>
                                    <input type="text" class="form-control" value="<%=infoFormulador.APELLIDOS%>" readonly="readonly">
                                </div>
                            </div>
                           <div class="form-row">
                                <div class="form-group col-lg-6">
                                    <label>Correo</label>
                                    <input type="text" class="form-control" value="<%=infoFormulador.CORREO_E%>" readonly="readonly" >
                                </div>
                                <div class="form-group col-lg-6">
                                    <label>Direcci&oacute;n</label>
                                    <input type="text" class="form-control" value="<%=infoFormulador.DIRECCION%>" readonly="readonly">
                                </div>
                            </div>
                            <div class="form-row">
                                <div class="form-group col-lg-6">
                                    <label>Tel&eacute;fono Fijo</label>
                                    <input type="text" class="form-control" value="<%=infoFormulador.TEL_FIJO%>" readonly="readonly" >
                                </div>
                                <div class="form-group col-lg-6">
                                    <label>Tel&eacute;fono Celular</label>
                                    <input type="text" class="form-control" value="<%=infoFormulador.TEL_CEL%>" readonly="readonly">
                                </div>
                            </div>
                            <div class="form-row">
                                <div class="form-group col-lg-6">
                                    <label>Grado Acad&eacute;mico</label>
                                    <input type="text" class="form-control" value="<%=infoFormulador.GRADO_ACADEMICO%>" readonly="readonly" >
                                </div>
                                <div class="form-group col-lg-6">
                                    <label>A&ntilde;os de Experiencia</label>
                                    <input type="text" class="form-control" value="<%=infoFormulador.ANIOS_EXPERIENCIA%>" readonly="readonly">
                                </div>
                            </div>
                       </div>

                          <div class="table-responsive">
            <table class="table table-bordered" id="dataTableFormulador" width="100%" cellspacing="0">
                <thead>
                    <tr>
                        <th>Institución</th>
                        <th>Cargo</th>
                        <th>Tiempo</th>
                        <th>Proyecto</th>
                    </tr>
                </thead>
                <tbody>
                    <% foreach (var d in detallesFormulador) { %>
                        <tr>
                            
                            <td><%=d.INSTITUCION %></td>
                            <td><%=d.CARGO %></td>
                            <td><%=d.TIEMPO %></td>
                            <td><%=d.PROYECTO %></td>

                        </tr>
                    <%} %>

                </tbody>
            </table>
        </div>
                      </div>
                      <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
                      </div>
                    </div>
                  </div>
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
    </form>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="jsextra" runat="server">
</asp:Content>
