<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Layouts/Layout2.Master" AutoEventWireup="true" CodeBehind="PrecalificacionBeneficiario.aspx.cs" Inherits="MinecPISI.Views.Casos.PrecalificacionBeneficiario" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cssextra" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contenidoNavegacion" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="bodyContentBlank" runat="server">
    <div class="card shadow mb-4">
        <div class="card-header py-3">
            <h5 class="  font-weight-bold text-primary">Precalificación Beneficiario</h5>
        </div>
        <div class="card-body">
            <h5 class="  font-weight-bold text-primary  mb-4"></h5>
            <h5 class="alert alert-primary">¿Alguna vez has realizado un <span class="font-weight-bold">préstamo </span>o alguna <span class="font-weight-bold">otra operación </span>con el Banco de Fomento Agropecuario (BFA)?</h5>
            <div class="form-group text-center">
                <a href="#" class="btn btn-success" id="btnSi">Si</a>
                <a href="#" class="btn btn-warning" id="btnNo">No</a>
            </div>
            <div class="collapse">
                
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="jsextra" runat="server">
    <script>
        $(document).ready(function () {
            $("#btnSi").click(function () {
                $(".collapse").collapse('hide');
            });
            $("#btnNo").click(function () {
                $(".collapse").collapse('show');
            });
        });
    </script>
</asp:Content>
