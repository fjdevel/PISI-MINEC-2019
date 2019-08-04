<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Layouts/Layout2.Master" AutoEventWireup="true" CodeBehind="DetalleCasoRatificado.aspx.cs" Inherits="MinecPISI.Views.Formulacion.DetalleCasoRatificado" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cssextra" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contenidoNavegacion" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="bodyContentBlank" runat="server">
    <form runat="server">
        <div class="card shadow mb-4">
            <div class="card-header py-3">
                <h5 class="  font-weight-bold text-primary">Proyecto Ratificado</h5>
            </div>
            <div class="card-body">

                <div class="table-responsive">
                    <table class="table table-bordered" id="dataTablePropuestasRatificadas">
                        <thead>
                            <tr>
                                <th scope="col">Codigo del Proyecto</th>
                                <th scope="col">Última actualización</th>
                                <th scope="col" colspan="2">Estado</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td><%= proyecto.COD_PROYECTO %></td>
                                <td><%= proyecto.FECHA_ACTUALIZA %></td>
                                <td colspan="2"><%= BLL.Acciones.A_ESTADO_PROCESO.ObtenerPorId(proyecto.ID_ESTADO_PROCESO).DESCRIPCION_ESTADO_PROCESO %></td>
                            </tr>
                            <tr>
                                <th rowspan="2" colspan="2" scope="row" class="text-right">Monto Ratificado</th>
                                <th scope="row">Beneficiario</th>
                                <td class="table-success">US$ <%= (monto/9).ToString("N2") %></td>
                            </tr>
                            <tr>
                                <th scope="row">FONDEPRO</th>
                                <td class="table-success">US$ <%= monto %></td>
                            </tr>
                            <tr class="table-secondary">
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                            </tr>
                            <tr>
                                <th colspan="2" class="text-right">Monto a Facturar</th>
                                <td class="table-success">
                                    <input placeholder="US$ <%= (monto/0.9).ToString("N2") %>" /></td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <div class="form-goup">
                    <div class="form-row mt-5">
                        <div class="col-lg-9">
                            <div class="form-check">
                                <input class="form-check-input" type="checkbox" id="factura">
                                <label class="form-check-label" for="factura">
                                    ¿Factura entregada Físicamente?
                                </label>
                            </div>
                        </div>
                        <div class="col-lg-3">
                            <button class="btn btn-info">Ver ejemplo de Factura o Recibo</button>
                        </div>
                    </div>
                    <div class="col-sm-6 col-md-6 col-xs-12">
                        <div class="form-group">
                            <div class="input-group">
                                <div class="custom-file">
                                    <asp:FileUpload
                                        CssClass="custom-file-input"
                                        ID="fl_factura"
                                        runat="server"
                                        accept=".png,.jpg,.jpeg,.pdf"
                                        onchange="UploadFile(this)" />
                                    <label class="custom-file-label">Otro</label>
                                </div>
                                <div class="input-group-append">
                                    <asp:Button ID="btn_upload_factura" runat="server" Text="Subir" CssClass="btn btn-secondary" OnClick="btn_upload_factura_Click" Style="display: none" />
                                </div>
                            </div>
                            <asp:Label ID="lbl_factura" runat="server"></asp:Label>
                        </div>
                    </div>
                    <div class="form-row mb-5">
                        <div class="col-lg-4">
                            <div>
                                <asp:Button ID="facturarBtn" OnClick="facturarBtn_Click" runat="server" CssClass="btn btn-info mt-3 mb-4" Text="Facturar Proyecto" />
                            </div>
                        </div>
                    </div>
                    <div class="form-row mb-5">
                        <div class="alert alert-info float-left">
                            "Se le recuerda que la factura original y en físico debe ser emitida  a 
                    nombre del Fondo de Desarrollo Productivo  y presentada 
                    físicamente  a mas Tardar  5 hábiles días después de  haber 
                    sido ratificado        "
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </form>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="jsextra" runat="server">
    <script>
        $(() => {
            $('#bodyContentBlank_facturarBtn').addClass("disabled");
        });
        $('#factura').change(() => {
            if ($('#factura')[0].checked)
                $('#bodyContentBlank_facturarBtn').removeClass("disabled");
        });
        function UploadFile(fileUpload) {
            debugger;
            if (fileUpload.value != '') {
                document.getElementById("bodyContentBlank_btn_upload_factura").click();
                 
            }
        }
    </script>
</asp:Content>
