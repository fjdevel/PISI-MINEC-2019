<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Layouts/Layout1.Master" AutoEventWireup="true" CodeBehind="RegistroBeneficiarioCredenciales.aspx.cs" Inherits="MinecPISI.Views.Beneficiarios.RegistroBeneficiarioP4Credenciales" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cssextra" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="bodyContent" runat="server">
    <div class="row justify-content-center">

        <div class="col-xl-10 col-lg-12 col-md-9">

            <div class="card o-hidden border-0 shadow-lg my-5">
                <div class="card-header p-0">
                    <h4 class="h4 text-center">Proyecto Especial de Pequeñas Inversiones para Soluciones Innovadoras</h4>
                </div>
                <div class="card-body p-0">
                    <div class="form-group m-4">
                        <div class="row">
                            <div class="col-lg-12">
                                <div id="">
                                    <h5 class="mt-4">Registro de Beneficiario / Postulante</h5>
                                </div>
                                <div class="progress mb-2" style="height: 30px;">
                                    <div id="progressbar" class="progress-bar-striped progress-bar-animated bg-success" role="progressbar" style="width: 25%;" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100">
                                        <h6 class="text-uppercase text-white font-weight-bold text-center p-1">Paso 1/4</h6>
                                    </div>
                                </div>
                                <form method="post" id="CredencialesBeneficiarioForm" name="CredencialesBeneficiarioForm" runat="server">
                                    <fieldset>
                                        <div class="form-group">
                                            <h5 class="p-2">Ingresa las Credenciales</h5>
                                            <div class="form-row">
                                                <div class="form-group col-lg-6">
                                                    <asp:TextBox type="email" CssClass="form-control" ID="txt_correo" placeholder="Correo Ej: josue@gmail.com" runat="server" required="true"/>
                                                </div>
                                            </div>
                                            <div class="form-row">
                                                <div class="form-group col-lg-3">
                                                    <div class="input-group">
                                                        <asp:TextBox type="password" CssClass="form-control" ID="txt_password1" placeholder="Contraseña" runat="server" required="true"/>
                                                        <div class="input-group-addon">
                                                            <i id="verPass" class="fa fa-eye" aria-hidden="true" style="padding-top: 10px; padding-left: 5px;"></i>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="form-group col-lg-3">
                                                    <asp:TextBox type="password" CssClass="form-control" ID="txt_password2" placeholder="Validar Contraseña" runat="server" required="true"/>
                                                    <asp:Label runat="server" ID="lbl_error_password2"></asp:Label>
                                                </div>
                                            </div>
                                        </div>
                                        <asp:Button Text="Siguiente" UseSubmitBehavior="True" CssClass="next btn btn-info" runat="server" OnClick="OnSiguienteClick" />
                                    </fieldset>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="jsextra" runat="server">
    <script>
        $(document).ready(function () {
            $("#verPass")
                .mouseup(function () {
                    $('#verPass').removeClass("fa fa-eye");
                    $('#verPass').addClass("fa fa-eye-slash");
                    $("#<%=txt_password1.ClientID%>").attr('type', 'password');
                })
                .mousedown(function () {
                    $('#verPass').removeClass("fa fa-eye-slash");
                    $('#verPass').addClass("fa fa-eye");
                    $("#<%=txt_password1.ClientID%>").attr('type', 'text');
                });
        });
    </script>
</asp:Content>
