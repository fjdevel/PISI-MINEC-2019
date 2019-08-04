<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Layouts/Layout2.Master" AutoEventWireup="true" CodeBehind="DetalleCasoRatificado.aspx.cs" Inherits="MinecPISI.Views.Formulacion.DetalleCasoRatificado" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cssextra" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contenidoNavegacion" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="bodyContentBlank" runat="server">
    <div class="card shadow mb-4">
        <div class="card-header py-3">
            <h5 class="  font-weight-bold text-primary">Proyecto Ratificado</h5>
        </div>
        <div class="card-body">
            <h6 class="  font-weight-bold text-primary  mb-4">Propuesta de Solución</h6>

            <div class="table-responsive">
                <table class="table table-bordered" id="dataTablePropuestasRatificadas">
                    <thead>
                        <tr>
                            <th scope="col">Nombre del Proyecto</th>
                            <th scope="col">Última actualización</th>
                            <th scope="col">Status</th>
                            <th scope="col">Etapa</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>ACF4860</td>
                            <td>6 horas</td>
                            <td>ACTIVO</td>
                            <td>RATIFICADO</td>
                        </tr>
                        <tr>
                            <th rowspan="2" colspan="2" scope="row" class="text-right">Monto Ratificado</th>
                            <th scope="row">Beneficiario</th>
                            <td class="table-success">US$ 1,111.00</td>
                        </tr>
                        <tr>
                            <th scope="row">FONDEPRO</th>
                            <td class="table-success">US$ 10,000.00</td>
                        </tr>
                        <tr class="table-secondary">
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                        </tr>
                        <tr>
                            <th colspan="2" class="text-right">Monto a Facturar</th>
                            <td>Formulador de Solución</td>
                            <td class="table-success">
                                <input placeholder="US$ 650.000" /></td>
                        </tr>
                    </tbody>
                </table>
            </div>
            <div class="form-goup">
                <div class="form-row col-lg-4 mt-4">
                    <div class="input-group">
                        <div class="custom-file">
                            <label class="custom-file-label">Subir Imagen</label>
                        </div>
                        <div class="input-group-append">
                        </div>
                    </div>
                </div>
                <div class="form-row mb-5">
                    <div class="col-lg-4">
                        <div>
                            <button class="btn btn-info mt-3 mb-4">Remitir avance al FONDEPRO</button>
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
                <div class="form-row mt-5">
                    <div class="col-lg-9">
                        <div class="form-check">
                            <input class="form-check-input" type="checkbox" value="" id="factura" required>
                            <label class="form-check-label" for="factura">
                                Factura entregada Físicammente
                            </label>
                        </div>
                    </div>
                    <div class="col-lg-3">
                        <button class="btn btn-info">Ver ejemplo de Factura o Recibo</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="jsextra" runat="server">
</asp:Content>
