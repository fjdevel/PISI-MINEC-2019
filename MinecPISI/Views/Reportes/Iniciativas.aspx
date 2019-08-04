<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Layouts/Layout2.Master" AutoEventWireup="true" CodeBehind="Iniciativas.aspx.cs" Inherits="MinecPISI.Views.Reportes.Iniciativas" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cssextra" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contenidoNavegacion" runat="server">
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="bodyContentBlank" runat="server">


    <form id="form_iniciativas" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server" />
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
                            <asp:TextBox runat="server" ID="fechaDesde" CssClass="form-control" type="date"></asp:TextBox>
                        </div>
                        <label for="hasta" class="col-sm-2 col-form-label">Fecha Hasta</label>
                        <div class="col-sm-4">
                            <asp:TextBox runat="server" ID="fechaHasta" CssClass="form-control" type="date"></asp:TextBox>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="monto" class="col-sm-2 col-form-label">Monto menor</label>
                        <div class="col-sm-4">
                            <asp:TextBox runat="server" ID="txt_montoMenor" CssClass="form-control" Rows="1" />
                        </div>
                        <label for="monto" class="col-sm-2 col-form-label">Monto mayor</label>
                        <div class="col-sm-4">
                            <asp:TextBox runat="server" ID="txt_montoMayor" CssClass="form-control" Rows="1" />
                        </div>
                    </div>

                    <div class="form-group row">
                        <label for="sector" class="col-sm-2 col-form-label">Sector</label>
                        <div class="col-sm-5">


                            <asp:DropDownList ID="ddl_sector" CssClass="custom-select" runat="server" AppendDataBoundItems="True">
                                <asp:ListItem Value="0">--Seleccionar--</asp:ListItem>
                            </asp:DropDownList>

                        </div>

                    </div>
                    <div class="form-group row">
                        <label for="tipoIniciativa" class="col-sm-2 col-form-label">Tipo de Iniciativa</label>
                        <div class="col-sm-5">

                            <asp:DropDownList ID="ddl_iniciativa" CssClass="custom-select" runat="server" AppendDataBoundItems="True">
                                <asp:ListItem Value="0">--Seleccionar--</asp:ListItem>
                            </asp:DropDownList>


                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="state" class="col-sm-2 col-form-label">Estado</label>
                        <div class="col-sm-5">
                            <asp:DropDownList ID="ddl_estados" CssClass="custom-select" runat="server" AppendDataBoundItems="True">
                                <asp:ListItem Value="0">--Seleccionar--</asp:ListItem>
                            </asp:DropDownList>

                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="state" class="col-sm-2 col-form-label">Formulador</label>
                        <div class="col-sm-5">

                            <asp:DropDownList ID="ddl_formulador" CssClass="custom-select" runat="server" AppendDataBoundItems="True">
                                <asp:ListItem Value="0">--Seleccionar--</asp:ListItem>
                            </asp:DropDownList>

                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="state" class="col-sm-2 col-form-label">Beneficiario</label>
                        <div class="col-sm-5">

                            <asp:DropDownList ID="ddl_beneficiario" CssClass="custom-select" runat="server" AppendDataBoundItems="True">
                                <asp:ListItem Value="0">--Seleccionar--</asp:ListItem>
                            </asp:DropDownList>

                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="state" class="col-sm-2 col-form-label">Consultor Beneficiario</label>
                        <div class="col-sm-5">

                            <asp:DropDownList ID="ddl_consultor" CssClass="custom-select" runat="server" AppendDataBoundItems="True">
                                <asp:ListItem Value="0">--Seleccionar--</asp:ListItem>
                            </asp:DropDownList>

                        </div>
                    </div>
                    <hr class="my-4">
                    <div class="btn-group float-right" role="group" aria-label="Basic example">

                        <asp:Button ID="btn_imprimir_iniciativas" CssClass="btn btn-success mt-3" Text="Vista Previa" runat="server" OnClick="btn_imprimir_OnClick" />
                    </div>

                    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                        <ContentTemplate>
                            <div class="table-responsive" id="table">

                                <asp:GridView ID="iniciativas" runat="server" AutoGenerateColumns="false" CssClass="table table-bordered" OnRowDataBound="gv_iniciativas_OnRowDataBound">
                                    <Columns>
                                        <asp:BoundField HeaderText="CODIGO BENEFICIARIO" DataField="CODIGO_BENEFICIARIO" />
                                        <asp:BoundField HeaderText="SECTOR" DataField="NOMBRE_SECTOR" />
                                        <asp:BoundField HeaderText="NOMBRES" DataField="NOMBRES" />
                                        <asp:BoundField HeaderText="APELLIDOS" DataField="APELLIDOS" />
                                        <asp:BoundField HeaderText="Nombre Formulador" DataField="nombre_formulador" />
                                        <asp:BoundField HeaderText="Apellido Formulador" DataField="apellidos_formulador" />
                                        <asp:BoundField HeaderText="Problema" DataField="NOMBRE_PROBLEMA" />
                                        <asp:BoundField HeaderText="Estado" DataField="DESCRIPCION_ESTADO_PROCESO" />
                                        <asp:BoundField HeaderText="Proyecto" DataField="COD_PROYECTO" />
                                        <asp:BoundField HeaderText="Monto" DataField="MONTO" />
                                        <asp:BoundField HeaderText="Tipo Iniciativa" DataField="NOMBRE" />
                                        <asp:BoundField HeaderText="Consultor" DataField="nombres_consultor_vinculacion" />
                                        <asp:BoundField HeaderText="Fecha creación" DataField="FECHA" />
                                    </Columns>

                                </asp:GridView>
                                
                            </div>
                            <div id="elementH"></div>
                            <button class="btn btn-success mt-3" id="imprimirPdf">Generar PDF</button>
                        </ContentTemplate>
                    </asp:UpdatePanel>



                </div>
            </div>
        </div>
    </form>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="jsextra" runat="server">
    <script src="<%= ResolveClientUrl("~/Views/js/html2canvas.min.js") %>"></script>
    
    <script>

        $('#imprimirPdf').click(function () {
            var doc = new jsPDF("l");
            doc.addPage("1800", "900");
           var elementHTML = $('#table').html();
            var specialElementHandlers = {
                '#elementH': function (element, renderer) {
                    return true;
                }
            };
            margins = {
                top: 5,
                bottom: 1,
                left: 10,
                width: 1000
            };
            doc.fromHTML(elementHTML,margins.left, // x coord
            margins.top, { // y coord
                'width': margins.width, // max width of content on PDF
                'elementHandlers': specialElementHandlers
            });

            // Save the PDF
            doc.save('ReporteProyectos-<%= DateTime.Now.Day %><%= DateTime.Now.Month %><%= DateTime.Now.Year %>.pdf');
        });
    </script>

</asp:Content>
