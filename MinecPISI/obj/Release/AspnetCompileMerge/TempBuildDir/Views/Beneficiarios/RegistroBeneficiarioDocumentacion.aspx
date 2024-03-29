﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Layouts/Layout1.Master" AutoEventWireup="true" CodeBehind="RegistroBeneficiarioDocumentacion.aspx.cs" Inherits="MinecPISI.Views.Beneficiarios.RegistroBeneficiarioP3Documentacion" %>

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
                                    <div id="progressbar" class="progress-bar-striped progress-bar-animated bg-success" role="progressbar" style="width: 100%;" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100">
                                        <h6 class="text-uppercase text-white font-weight-bold text-center p-1">Paso 4/4</h6>
                                    </div>
                                </div>
                                <form method="post" id="DocumentosBeneficiarioForm" enctype="multipart/form-data" runat="server">
                                    <fieldset>
                                        <h5 class="p-2">Ingresa la Documentación</h5>
                                        <div class="row">  
                                            <div class="col-sm-6 col-md-6 col-xs-12">  
                                                <div class="form-group">
                                                    <div class="input-group">  
                                                        <div class="custom-file">  
                                                            <asp:FileUpload 
                                                                CssClass="custom-file-input" 
                                                                ID="fl_constancia_alcaldia" 
                                                                runat="server"
                                                                onchange="UploadFile(this)"/>
                                                            <label class="custom-file-label">Elige tu Constancia de Alcaldía / Registro MYPE</label>
                                                        </div> 
                                                        <div class="input-group-append">  
                                                            <asp:Button ID="btn_upload_constancia" runat="server" Text="Subir" CssClass="btn btn-secondary" OnClick="btn_upload_constancia_OnClick" Style="display: none"/>  
                                                        </div>
                                                    </div>  
                                                    <asp:Label ID="lbl_constancia" runat="server"></asp:Label>
                                                </div>  
                                            </div>  
                                        </div>
                                        <div class="row">
                                            <div class="col-sm-6 col-md-6 col-xs-12">  
                                                <div class="form-group">
                                                    <div class="input-group">  
                                                        <div class="custom-file">  
                                                            <asp:FileUpload 
                                                                CssClass="custom-file-input" 
                                                                ID="fl_otro" 
                                                                runat="server" 
                                                                onchange="UploadFile(this)"/>
                                                            <label class="custom-file-label">Otro</label>  
                                                        </div> 
                                                        <div class="input-group-append">  
                                                            <asp:Button ID="btn_upload_otro" runat="server" Text="Subir" CssClass="btn btn-secondary" OnClick="btn_upload_otro_OnClick" Style="display: none"/>  
                                                        </div>
                                                    </div>  
                                                    <asp:Label ID="lbl_otro" runat="server"></asp:Label>
                                                </div>  
                                            </div> 
                                        </div>
                                        <div class="form-group">
                                            <button type="button" class="btn btn-secondary" id="declaracion">Generar Declaración Jurada</button>
                                        </div>
                                        <asp:Button Text="Anterior" CssClass="btn btn-info" runat="server" OnClick="OnAnteriorClick"/>
                                        <asp:Button Text="Finalizar" CssClass="btn btn-info" runat="server" OnClick="OnFinalizarClick"/>
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
    <script type="text/javascript">
        function UploadFile(fileUpload) {
            debugger;
            if (fileUpload.value != '') {
                if (fileUpload.id == 'bodyContent_fl_constancia_alcaldia') {
                    document.getElementById("<%=btn_upload_constancia.ClientID %>").click();
                } else {
                    document.getElementById("<%=btn_upload_otro.ClientID %>").click();

                }

            }
        }
    </script>
</asp:Content>
