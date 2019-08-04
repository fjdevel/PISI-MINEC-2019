<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Layouts/Layout1.Master" AutoEventWireup="true" CodeBehind="RegistroFormulador.aspx.cs" Inherits="MinecPISI.Views.Formulacion.RegistroFormulador" %>

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
                        <div class="col-lg-12">
                            <div id="">
                                <h5 class="mt-4">Registro de Formulador </h5>
                            </div>
                            <h6 class="p-2">Ingresa tus Datos para Registrarte</h6>
                            <form method="post" id="RegistroFormuladorForm" name="RegistroFormuladorForm" runat="server">
                                <div class="form-group">
                                    <div class="form-row">
                                        <div class="form-group col-lg-6">
                                            <asp:TextBox ID="txt_nombre" type="text" placeholder="Nombres" runat="server" CssClass="form-control" required="true" />
                                        </div>
                                        <div class="form-group col-lg-6">
                                            <asp:TextBox ID="txt_apellido" type="text" placeholder="Apellidos" runat="server" CssClass="form-control" required="true" />
                                        </div>
                                    </div>
                                     <div class="form-row">
                                                        <div class="form-group col-lg-6">
                                                            <asp:TextBox ID="txt_tel" type="text" placeholder="Teléfono Fijo" runat="server" CssClass="form-control" MaxLength="8" />
                                                            <asp:RegularExpressionValidator ErrorMessage="Ingresa un Teléfono Fijo válido y sin guiones" ControlToValidate="txt_tel" runat="server" ValidationExpression="^[2][\d]{7}" SetFocusOnError="true" ForeColor="red" Display="Dynamic" />
                                                        </div>
                                                        <div class="form-group col-lg-6">
                                                            <asp:TextBox ID="txt_cel" type="text" placeholder="Celular" runat="server" CssClass="form-control" required="true" MaxLength="8" />
                                                            <asp:RegularExpressionValidator ErrorMessage="Ingresa celular válido y sin guiones" ControlToValidate="txt_cel" runat="server" ValidationExpression="^[76][\d]{7}" SetFocusOnError="true" ForeColor="red" Display="Dynamic" />
                                                        </div>
                                                    </div>
                                    <div class="form-row">
                                        <div class="form-group col-lg-6">
                                            <asp:TextBox ID="txt_dir" type="text" placeholder="Dirección" runat="server" CssClass="form-control" required="true" />
                                        </div>
                                        <div class="form-group col-lg-6">
                                            <asp:TextBox ID="txt_correo" type="text" placeholder="Correo Electrónico" runat="server" CssClass="form-control" required="true" />
                                            <asp:Label runat="server" ID="lbl_errorCorreo" ForeColor="red"></asp:Label>
                                        </div>
                                    </div>
                                    <div class="form-row">
                                        <div class="form-group col-lg-6">
                                            <asp:TextBox ID="txt_grado" type="text" placeholder="Grado Acad&eacute;mico" runat="server" CssClass="form-control" required="true" MaxLength="64" />
                                        </div>
                                        <div class="form-group col-lg-6">
                                            <asp:TextBox ID="txt_experiencia" type="text" placeholder="A&ntilde;os de Experiencia" runat="server" CssClass="form-control" required="true" MaxLength="2" onkeypress="return isNumberKey(event)" />
                                        </div>
                                    </div>
                                    <div class="form-row">
                                        <div class="form-group col-lg-6">
                                            <div class="input-group">
                                                <asp:TextBox type="password" CssClass="form-control" ID="txt_pass1" placeholder="Contraseña" runat="server" required="true" MaxLength="25" />
                                                <div class="input-group-addon">
                                                    <i id="verPass" class="fa fa-eye" aria-hidden="true" style="padding-top: 10px; padding-left: 5px;"></i>
                                                </div>
                                            </div>
                                            <asp:RegularExpressionValidator ID="Regex1" runat="server" ControlToValidate="txt_pass1"
                                                    ValidationExpression="^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$" ErrorMessage="La contraseña debe contener: mínimo 8 caracteres, al menos 1 letra del alfabeto y 1 numero" ForeColor="Red" Display="Dynamic"/>
                                        </div>
                                        <div class="form-group col-lg-6">
                                            <asp:TextBox type="password" CssClass="form-control" ID="txt_pass2" placeholder="Validar Contraseña" runat="server" required="true" MaxLength="25"/>
                                            <asp:Label runat="server" ID="lbl_error_password2"></asp:Label>
                                        </div>
                                    </div>
                                    <div class="form-row">
                                        <asp:Button Text="Inicio" CssClass="btn btn-info" runat="server" CausesValidation="false" UseSubmitBehavior="false" PostBackUrl="~/Views/Administracion/index.aspx"  />
                                        <asp:Button Text="Continuar" UseSubmitBehavior="True" OnClick="RegistrarFormuladorClick" CssClass="btn btn-success ml-3" runat="server"/>
                                    </div>
                                </div>
                            </form>
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
                    $("#<%=txt_pass1.ClientID%>").attr('type', 'password');
                })
                .mousedown(function () {
                    $('#verPass').removeClass("fa fa-eye-slash");
                    $('#verPass').addClass("fa fa-eye");
                    $("#<%=txt_pass1.ClientID%>").attr('type', 'text');
                });
        });

        function isNumberKey(evt) {
            var charCode = (evt.which) ? evt.which : event.keyCode
            if (charCode < 48 || charCode > 57)
                return false;
            
            return true;
        }
    </script>
</asp:Content>