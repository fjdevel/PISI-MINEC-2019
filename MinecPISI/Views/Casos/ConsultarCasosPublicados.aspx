<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Layouts/Layout2.Master" AutoEventWireup="true" CodeBehind="ConsultarCasosPublicados.aspx.cs" Inherits="MinecPISI.Views.Casos.ConsultarCasosDelFormulador" %>
<asp:Content ID="Content1" ContentPlaceHolderID="cssextra" runat="server">
    <link href="../../Views/vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contenidoNavegacion" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="bodyContentBlank" runat="server">
    <form runat="server">
    <div class="card shadow mb-4">
        <div class="card-header py-3">
            <h6 class="  font-weight-bold text-primary">Consulta de casos Publicados</h6>
        </div>
        <div class="card-body">
         <div class="table-responsive">
             <asp:GridView
                        ID="gv_casos"
                        runat="server"
                        AutoGenerateColumns="False"
                        CssClass="table table-bordered"
                        OnRowDataBound="gv_casos_OnRowDataBound">
                 <Columns>
                     <asp:BoundField HeaderText="Nombre del problema" DataField="NOMBRE_PROBLEMA" /> 
                     <asp:BoundField HeaderText="Estado" DataField="NOMBRE_ESTADO" />
                     <asp:BoundField HeaderText="Nombre del beneficiario" DataField="NOMBRE_BENEFICIARIO" /> 
                     <asp:BoundField HeaderText="Días Restantes" DataField="DIAS_RESTANTES" />
                     <asp:TemplateField HeaderText="Consultor de vinculación">                                   
                                <ItemTemplate>
                                        <%# BLL.Acciones.A_ASIGNACION.geConsultorByIdBeneficiario((int)Eval("ID_BENEFICIARIO")).NOMBRES+ " " + BLL.Acciones.A_ASIGNACION.geConsultorByIdBeneficiario((int)Eval("ID_BENEFICIARIO")).APELLIDOS%>
                                </ItemTemplate>
                     </asp:TemplateField>
                     <asp:TemplateField HeaderText="Revisar">                                                    
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
        </form>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="jsextra" runat="server">
    <script src="<%= ResolveClientUrl("~/Views/vendor/datatables/jquery.dataTables.min.js") %>"></script>
    <script src="<%= ResolveClientUrl("~/Views/vendor/datatables/dataTables.bootstrap4.js") %>"></script>
    <script>
        $(document).ready(function () {
            $('#dataTableCasos').DataTable({
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
            $('#dataTableCasosConsultor').DataTable({
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