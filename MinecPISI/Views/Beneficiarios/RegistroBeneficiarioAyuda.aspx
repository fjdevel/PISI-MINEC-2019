<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Layouts/Layout1.Master" AutoEventWireup="true" CodeBehind="RegistroBeneficiarioAyuda.aspx.cs" Inherits="MinecPISI.Views.Beneficiarios.RegistroBeneficiario" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cssextra" runat="server">
    <style type="text/css">
        #AyudaForm fieldset:not(:first-of-type) {
            display: none;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="bodyContent" runat="server">
    <div class="row justify-content-center">

        <div class="col-xl-10 col-lg-12 col-md-9">

            <div class="card o-hidden border-0 shadow-lg my-5">
                <div class="card-header p-0">
                    <h4 class="h4 text-center">Proyecto Especial de Pequeñas Inversiones para Soluciones Innovadoras</h4>
                </div>
                <div class="card-body p-0">
                    <div class="form-group">
                        <div class="row">
                            <div class="col-lg-5">
                                <img src="<%= ResolveUrl("~/Views/img/corredor-productivo.jpg")%>" alt="MINEC" width="450" />
                            </div>
                            <div id="AyudaForm" class="col-lg-7 text-center">
                                <form runat="server" id="form1">
                                    <asp:ScriptManager ID="ScriptManager1" runat="server" />

                                    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                                        <ContentTemplate>
                                            <asp:Panel ID="panel_info" runat="server" Visible="False">
                                                <fieldset>
                                                    <h5 class="mt-4">Registro de Beneficiario</h5>
                                                    <div class="alert alert-primary m-4">
                                                        <h5 class="font-weight-bold">Documentos requeridos para Registrarte</h5>
                                                        <h6 class="font-weight-bold">Persona Natural</h6>
                                                        <ul class="text-left">
                                                            <li>Constancia de la alcaldía / Constancia registro MYPE</li>
                                                            <li>Otro (Documento que evidencie la actividad productiva</li>
                                                        </ul>
                                                        <h6 class="font-weight-bold">Persona Jurídica / Asociación</h6>
                                                        <ul class="text-left">
                                                            <li>Escritura de Constitución/ Estatutos</li>
                                                            <li>Estado de Ingresos y Egresos</li>
                                                            <li>Credencial de Cuerpo Directivo Vigente (Si Aplica)</li>
                                                            <li>Constancia de Ubicación: Constancia Alcaldía / Constancia Registro MyPe</li>
                                                            <li>Estados de Resultados</li>
                                                        </ul>
                                                    </div>
                                                    <h5>¿Necesitas ayuda para registrarte?</h5>
                                                    <asp:Button Text="Sí" runat="server" CssClass="btn btn-warning" UseSubmitBehavior="False" ID="btn_ver" OnClick="btn_ver_OnClick" />
                                                    <a href="<%Response.Write(HttpContext.Current.Request.ApplicationPath);%>/Beneficiario/Registro/Paso/1" class="btn btn-success">No</a>
                                                </fieldset>
                                            </asp:Panel>
                                            <asp:Panel ID="panel_formulario" runat="server" Visible="False">
                                                <fieldset>
                                                    <h5 class="mt-4">Ingresa tus Datos Personales</h5>
                                                    <div class="form-group m-4">
                                                        <div class="form-row">
                                                            <div class="form-group col-lg-6">
                                                                <input type="text" class="form-control" id="nombre" placeholder="Nombres" runat="server" maxlength="60" required/>
                                                                <asp:RegularExpressionValidator ErrorMessage="Nombre inválido, vuelve a intentarlo" ControlToValidate="nombre" runat="server" ValidationExpression="^[a-zA-ZñÑáéíóúÁÉÍÓÚ ]*$" SetFocusOnError="true" ForeColor="red" Display="Dynamic" />
                                                            </div>
                                                            <div class="form-group col-lg-6">
                                                                <input type="text" class="form-control" id="apellido" placeholder="Apellidos" runat="server" maxlength="60" required/>
                                                                <asp:RegularExpressionValidator ErrorMessage="Apellido inválido, vuelve a intentarlo" ControlToValidate="apellido" runat="server" ValidationExpression="^[a-zA-ZñÑáéíóúÁÉÍÓÚ ]*$" SetFocusOnError="true" ForeColor="red" Display="Dynamic" />
                                                            </div>
                                                        </div>
                                                        <div class="form-row">
                                                            <div class="form-group col-lg-6">
                                                                <input type="text" class="form-control" id="tel" placeholder="Teléfono Fijo" runat="server" maxlength="8" required/>
                                                                <asp:RegularExpressionValidator ErrorMessage="Ingresa un Teléfono Fijo válido y sin guiones" ControlToValidate="tel" runat="server" ValidationExpression="^[2][\d]{7}" SetFocusOnError="true" ForeColor="red" Display="Dynamic" />
                                                            </div>
                                                            <div class="form-group col-lg-6">
                                                                <input type="text" class="form-control" id="cel" placeholder="Celular" runat="server" maxlength="8" required />
                                                                <asp:RegularExpressionValidator ErrorMessage="Ingresa celular válido y sin guiones" ControlToValidate="cel" runat="server" ValidationExpression="^[76][\d]{7}" SetFocusOnError="true" ForeColor="red" Display="Dynamic" />
                                                            </div>
                                                        </div>
                                                        <div class="form-row">
                                                            <div class="form-group col-lg-6">
                                                                <input type="email" class="form-control" id="correo" placeholder="Correo Electrónico" runat="server" maxlength="30" required />
                                                                <asp:Label runat="server" ID="lbl_errorCorreo" ForeColor="red"></asp:Label>
                                                            </div>
                                                        </div>
                                                        <div class="form-row">
                                                            <div class="form-group col-md-6">
                                                                <div class="select">
                                                                    <label for="ddl_depto">Departamento</label>
                                                                    <asp:DropDownList ID="ddl_depto" AutoPostBack="True" CssClass="custom-select" runat="server" AppendDataBoundItems="True" OnSelectedIndexChanged="ddl_depto_OnSelectedIndexChanged">
                                                                        <asp:ListItem Value="0">--Seleccionar--</asp:ListItem>
                                                                    </asp:DropDownList>
                                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="ddl_depto" InitialValue="0" ErrorMessage="Debes seleccionar un departamento" ForeColor="red" Display="Dynamic" />
                                                                </div>
                                                            </div>
                                                            <div class="form-group col-md-6">
                                                                <div class="select">
                                                                    <label for="inputMuni">Municipio</label>
                                                                    <div class="select">
                                                                        <asp:DropDownList ID="ddl_municipio" AutoPostBack="True" CssClass="custom-select" runat="server" AppendDataBoundItems="True">
                                                                            <asp:ListItem Value="0">--Seleccione un departamento primero--</asp:ListItem>
                                                                        </asp:DropDownList>
                                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="ddl_municipio" InitialValue="0" ErrorMessage="Debes seleccionar un municipio" ForeColor="red" Display="Dynamic" />
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <a href="<%=Request.ApplicationPath %>/login" class="btn btn-info">Inicio</a>
                                                    <asp:Button Text="Enviar" ID="btnEnviar" runat="server" CssClass="next btn btn-success" OnClick="btn_enviar_OnClick" UseSubmitBehavior="True" />

                                                </fieldset>
                                            </asp:Panel>
                                            <asp:Panel ID="panel_mensaje" runat="server" Visible="False">
                                                <fieldset>
                                                    <p class="alert alert-success mt-4">
                                                        ¡Gracias!, Hemos enviado tu información, uno de nuetros Consultores de Vinculación se comunicará contigo pronto.                                
                                                    </p>
                                                    <a href="<%=Request.ApplicationPath %>/login" class=" next btn btn-info">Inicio</a>
                                                </fieldset>
                                            </asp:Panel>
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
