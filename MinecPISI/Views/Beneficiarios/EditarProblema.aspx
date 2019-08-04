﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Layouts/Layout2.Master" AutoEventWireup="true" CodeBehind="EditarProblema.aspx.cs" Inherits="MinecPISI.Views.Beneficiarios.EditarProblema" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cssextra" runat="server">
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="bodyContentBlank" runat="server">
    <form id="registrarProblema" runat="server" onsubmit="topFunction(); return true">
        <asp:ScriptManager ID="ScriptManager1" runat="server" />

        <asp:UpdatePanel ID="UpdatePanel2" runat="server">
            <ContentTemplate>
                <div class="card shadow mb-4">
            <div class="card-header py-3">
                <h5 class="  font-weight-bold text-primary">Describe tu Problema u Oportunidad</h5>
            </div>
            <div class="card-body">

                <div class="row justify-content-center">
                    <div class="col-lg-12 p-4 rounded">
                        <div class="form-group">
                            <div class="row mb-3">
                                <label class="font-weight-bold">¿Nombre del Problema?</label>
                                <asp:TextBox runat="server" ID="txt_nombreProblema" TextMode="MultiLine" CssClass="form-control" Rows="1" required="true" placeholder="Ej: Crianza de Camarones" />
                            </div>
                            <div class="row">
                                <label class="font-weight-bold">¿A qué se dedica tu negocio?</label>
                                <asp:TextBox runat="server" ID="txt_negocio" TextMode="MultiLine" CssClass="form-control" Rows="1" required="true" placeholder="Ej: Se dedica a cultivar Camarones" />
                            </div>
                            <div class="row mt-4">
                                <label class="font-weight-bold">¿A quiénes les vendes?</label>
                                <asp:TextBox runat="server" ID="txt_clientes" TextMode="MultiLine" CssClass="form-control" Rows="1" required="true" placeholder="Ej: Local, personas de mi municipio, tiendas, mercados" />
                            </div>
                            <div class="row mt-4">
                                <div class="col-3">
                                    <label class="font-weight-bold">¿Cuánto vendes durante el día?</label>
                                </div>
                                <asp:TextBox runat="server" ID="txt_ventaDia" TextMode="MultiLine" CssClass="form-control" Rows="1" Columns="50" required="true" placeholder="Ej: 20 libras por día aproximadamente" />
                            </div>
                            <div class="row mt-4">
                                <div class="col-3">
                                    <label class="font-weight-bold">¿Cuántos empleados tienes?</label>
                                </div>
                                <asp:TextBox runat="server" ID="txt_empleados" placeholder="4" required="true" MaxLength="5" onkeypress="return isNumberKey(event)" />
                            </div>
                            <div class="row mt-4">
                                <div class="col-3">
                                    <label class="font-weight-bold">¿Cuánto vendes en el Mes?</label>
                                </div>
                                <asp:TextBox runat="server" ID="txt_ventasMes" placeholder="1,500.00" required="true" MaxLength="10" onkeyup="addComma(this);" onkeypress="return isNumberKey(event)" />
                            </div>
                        </div>
                        <div id="oportunidad" class="form-group mt-4">
                            <label class="font-weight-bold">Problema u Oportunidad</label>
                            <asp:TextBox runat="server" ID="txt_problema" TextMode="MultiLine" CssClass="form-control" Rows="3" required="true" placeholder="Describe el problema u Oportunidad que deseas solucionar" />
                        </div>
                        <div id="oportunidad2" class="form-group mt-4">
                            <label class="font-weight-bold" for="problema">¿Tienes algún otro problema?</label>
                            <asp:TextBox runat="server" ID="txt_problema2" TextMode="MultiLine" CssClass="form-control" Rows="3" placeholder="Describe otro problema" />
                        </div>
                        
                        
                        <div class="form-group">
                            <asp:Button ID="btn_enviar" CssClass="btn btn-success mt-3" Text="Enviar" runat="server" UseSubmitBehavior="True" OnClick="btn_enviar_OnClick" />
                        </div>
                    </div>
                </div>
            </div>
        </div>
            </ContentTemplate>
        </asp:UpdatePanel>
    </form>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="jsextra" runat="server">
    <script>


        function addComma(txt) {
            txt.value = txt.value.replace(",", "").replace(/(\d+)(\d{3})/, "$1,$2");
        }

        function isNumberKey(evt) {
            var charCode = (evt.which) ? evt.which : event.keyCode
            if (charCode > 31 && (charCode < 48 || charCode > 57))
                return false;

            return true;
        }

        function topFunction() {
            document.body.scrollTop = 0;
            document.documentElement.scrollTop = 0;
        }
    </script>
</asp:Content>
