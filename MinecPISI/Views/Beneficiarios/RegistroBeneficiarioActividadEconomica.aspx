<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Layouts/Layout1.Master" AutoEventWireup="true" CodeBehind="RegistroBeneficiarioActividadEconomica.aspx.cs" Inherits="MinecPISI.Views.Beneficiarios.RegistroBeneficiarioP2ActividadEconomica" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cssextra" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="bodyContent" runat="server">
    <form runat="server" id="form1">
        <asp:ScriptManager ID="ScriptManager1" runat="server" />

        <asp:UpdatePanel ID="UpdatePanel2" runat="server">
            <ContentTemplate>
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
                                            <div>
                                                <h5 class="mt-4">Registro de  Postulante</h5>
                                            </div>
                                            <div class="progress mb-2" style="height: 30px;">
                                                <div id="progressbar" class="progress-bar-striped progress-bar-animated bg-success" role="progressbar" style="width: 75%;" aria-valuenow="75" aria-valuemin="0" aria-valuemax="100">
                                                    <h6 class="text-uppercase text-white font-weight-bold text-center p-1">Paso 3/4</h6>
                                                </div>
                                            </div>
                                            <fieldset>
                                                <h5 class="p-2">Datos de la actividad Económica</h5>
                                                <div class="form-group">
                                                    <div class="form-row col-lg-6 mb-3">
                                                        <label>Dirección</label>
                                                        <asp:TextBox ID="txt_direccion" TextMode="multiline" Columns="70" Rows="2" placeholder="Ej: Residencial Santa Luisa Senda 2" runat="server" required="true" MaxLength="10" />
                                                        <asp:Label ID="lbl_direccion" runat="server" />
                                                        <asp:RegularExpressionValidator runat="server" ID="valInput"
                                                                                        ControlToValidate="txt_direccion"
                                                                                        ValidationExpression="^[\s\S]{0,100}$"
                                                                                        ErrorMessage="Solo puedes ingresar un maximo de 100 caracteres"
                                                                                        ForeColor="red"
                                                                                        Display="Dynamic"></asp:RegularExpressionValidator>
                                                    </div>
                                                    <div class="form-row">
                                                        <div class="form-group col-md-4">
                                                            <div class="select">
                                                                <label for="ddl_sector">Sector</label>
                                                                <asp:DropDownList ID="ddl_sector" CssClass="custom-select" runat="server" AppendDataBoundItems="True">
                                                                    <asp:ListItem Value="0">--Seleccionar--</asp:ListItem>
                                                                </asp:DropDownList>
                                                                <asp:RequiredFieldValidator ID="rfv1" runat="server" ControlToValidate="ddl_sector" InitialValue="0" ErrorMessage="Debes seleccionar un sector económico" ForeColor="red" Display="Dynamic"/>
                                                            </div>
                                                        </div>
                                                        <div class="form-group col-md-4">
                                                            <div class="select">
                                                                <label for="ddl_depto">Departamento</label>
                                                                <asp:DropDownList ID="ddl_depto" AutoPostBack="True" CssClass="custom-select" runat="server" AppendDataBoundItems="True" OnSelectedIndexChanged="ddl_depto_OnSelectedIndexChanged" CausesValidation="false">
                                                                    <asp:ListItem Value="0">--Seleccionar--</asp:ListItem>
                                                                </asp:DropDownList>
                                                            </div>
                                                        </div>
                                                        <div class="form-group col-md-4">
                                                            <div class="select">
                                                                <label for="ddl_municipio">Municipio</label>
                                                                <asp:DropDownList ID="ddl_municipio" AutoPostBack="True" CssClass="custom-select" runat="server" AppendDataBoundItems="True">
                                                                    <asp:ListItem Value="0">--Seleccione un departamento primero--</asp:ListItem>
                                                                </asp:DropDownList>
                                                                <asp:Label runat="server" ForeColor="red" Text="Debes seleccionar un municipio" ID="lbl_muni" Visible="False"></asp:Label>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <asp:Button Text="Anterior" UseSubmitBehavior="False" CssClass="btn btn-info" runat="server" OnClick="OnAnteriorClick" />
                                                <asp:Button Text="Siguiente" UseSubmitBehavior="True" CssClass="next btn btn-info" runat="server" OnClick="OnSiguienteClick" />
                                            </fieldset>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>

    </form>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="jsextra" runat="server">
    <script src="../Views/vendor/jquery/jquery.min.js"></script>
</asp:Content>
