<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Layouts/Layout1.Master" AutoEventWireup="true" CodeBehind="RegistroBeneficiarioInfoPersonal.aspx.cs" Inherits="MinecPISI.Views.Beneficiarios.RegistroBeneficiario1" %>

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
                                    <div id="progressbar" class="progress-bar-striped progress-bar-animated bg-success" role="progressbar" style="width: 50%;" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100">
                                        <h6 class="text-uppercase text-white font-weight-bold text-center p-1">Paso 2/4</h6>
                                    </div>
                                </div>
                                <form runat="server" id="InfoBeficiarioForm">
                                    <asp:ScriptManager ID="ScriptManager1" runat="server" />

                                    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                                        <ContentTemplate>
                                            <fieldset>
                                                <h6 class="p-2">Tipo de Beneficiario</h6>
                                                <div class="form-group">
                                                    <div class="form-row">
                                                        <div class="form-group form-check-inline align-content-center">
                                                            <div class="form-check">
                                                                <input class="form-check-input" runat="server" type="radio" id="beneficiario" name="beneficiario" value="personaNatural" checked="true" />
                                                                <label class="form-check-label" for="beneficiario">
                                                                    Beneficiario
                                                                </label>
                                                            </div>
                                                            <div class="form-check">
                                                                <input class="form-check-input" runat="server" type="radio" id="asociacion" name="beneficiario" value="PersonaJuridica" />
                                                                <label class="form-check-label" for="asociacion">
                                                                    Persona Jurídica / Asociación
                                                                </label>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <h6 class="p-2">Ingresa tus Datos Personales</h6>
                                                <div class="form-group">
                                                    <div class="form-row">
                                                        <div class="form-group col-lg-6">
                                                            <asp:TextBox ID="txt_nombre" type="text" placeholder="Nombres" runat="server" CssClass="form-control" required="true" MaxLength="64" />
                                                            <asp:RegularExpressionValidator ErrorMessage="Nombre inválido, vuelve a intentarlo" ControlToValidate="txt_nombre" runat="server" ValidationExpression="^[a-zA-ZñÑáéíóúÁÉÍÓÚ ]*$" SetFocusOnError="true" ForeColor="red" Display="Dynamic"/>
                                                        </div>
                                                        <div class="form-group col-lg-6">
                                                            <asp:TextBox ID="txt_apellido" type="text" placeholder="Apellidos" runat="server" CssClass="form-control" required="true" MaxLength="64" />
                                                            <asp:RegularExpressionValidator ErrorMessage="Apellido inválido, vuelve a intentarlo" ControlToValidate="txt_apellido" runat="server" ValidationExpression="^[a-zA-ZñÑáéíóúÁÉÍÓÚ ]*$" SetFocusOnError="true" ForeColor="red" Display="Dynamic" />
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
                                                            <asp:TextBox ID="txt_dui" type="text" placeholder="DUI" runat="server" CssClass="form-control" required="true" MaxLength="9" />
                                                            <asp:RegularExpressionValidator ErrorMessage="Ingresa un dui válido y sin guiones" ControlToValidate="txt_dui" runat="server" ValidationExpression="^\d{9}" SetFocusOnError="true" ForeColor="red" Display="Dynamic" />
                                                            <asp:Label runat="server" ID="lbl_dui" ForeColor="red" Text=""/>
                                                        </div>
                                                        <div class="form-group col-lg-6">
                                                            <asp:TextBox ID="txt_nit" type="text" placeholder="NIT" runat="server" CssClass="form-control" required="true" MaxLength="14" />
                                                            <asp:RegularExpressionValidator ErrorMessage="Ingresa un NIT válido y sin guiones" ControlToValidate="txt_nit" runat="server" ValidationExpression="\d{14}" SetFocusOnError="true" ForeColor="red" Display="Dynamic" />
                                                        </div>
                                                    </div>
                                                </div>
                                                <asp:Button Text="Anterior" UseSubmitBehavior="False" CssClass="btn btn-info" runat="server" OnClick="OnAnteriorClick" />
                                                <asp:Button Text="Siguiente" UseSubmitBehavior="True" CssClass="next btn btn-info" runat="server" OnClick="OnSiguienteClick" />
                                            </fieldset>
                                        </ContentTemplate>
                                    </asp:UpdatePanel>

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
</asp:Content>

