<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Layouts/Layout1.Master" AutoEventWireup="true" CodeBehind="RegistroAsociacionDocumentacion.aspx.cs" Inherits="MinecPISI.Views.Beneficiarios.RegistroAsociacionP3Documentacion" %>

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
                                <form method="post" runat="server">
                                    <div id="tercero02">
                                        <h5 class="p-2">Ingresa la Documentación</h5>
                                        <div class="row">
                                            <div class="form-group col-md-6">
                                                <div class="input-group">
                                                    <div class="custom-file">
                                                        <asp:FileUpload 
                                                            CssClass="custom-file-input" 
                                                            ID="fl_escritura" runat="server" 
                                                            onchange="UploadFile(this)"/>
                                                        <label class="custom-file-label">Elige tu Escritura de Constitución / Estatutos</label>
                                                    </div>
                                                    <div class="input-group-append">
                                                        <asp:Button ID="btn_upload_escritura" runat="server" Text="Subir" CssClass="btn btn-secondary" OnClick="btn_upload_escritura_OnClick" Style="display: none"/>
                                                    </div>
                                                </div>
                                                <asp:Label ID="lbl_escritura" runat="server"></asp:Label>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="form-group col-md-6">
                                                <div class="input-group">
                                                    <div class="custom-file">
                                                        <asp:FileUpload 
                                                            CssClass="custom-file-input" 
                                                            ID="fl_estadoie" 
                                                            runat="server" 
                                                            onchange="UploadFile(this)"/>
                                                        <label class="custom-file-label">Elige tu Estado de Ingresos y Egresos</label>
                                                    </div>
                                                    <div class="input-group-append">
                                                        <asp:Button ID="btn_upload_estadoie" runat="server" Text="Subir" CssClass="btn btn-secondary" OnClick="btn_upload_estadoie_OnClick" Style="display: none"/>
                                                    </div>
                                                </div>
                                                <asp:Label ID="lbl_estadoie" runat="server"></asp:Label>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="form-group col-md-6">
                                                <div class="input-group">
                                                    <div class="custom-file">
                                                        <asp:FileUpload 
                                                            CssClass="custom-file-input" 
                                                            ID="fl_cuerpo" 
                                                            runat="server" 
                                                            onchange="UploadFile(this)"/>
                                                        <label class="custom-file-label">Elige tu Credencial de Cuerpo Vigente</label>
                                                    </div>
                                                    <div class="input-group-append">
                                                        <asp:Button ID="btn_upload_cuerpo" runat="server" Text="Subir" CssClass="btn btn-secondary" OnClick="btn_upload_cuerpo_OnClick" Style="display: none"/>
                                                    </div>
                                                </div>
                                                <asp:Label ID="lbl_cuerpo" runat="server"></asp:Label>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="form-group col-md-6">
                                                <div class="input-group">
                                                    <div class="custom-file">
                                                        <asp:FileUpload 
                                                            CssClass="custom-file-input" 
                                                            ID="fl_constancia" 
                                                            runat="server"
                                                            onchange="UploadFile(this)"/>
                                                        <label class="custom-file-label">Elige tu Constancia de Alcaldía / Registro MYPE</label>
                                                    </div>
                                                    <div class="input-group-append">
                                                        <asp:Button ID="btn_constancia" runat="server" Text="Subir" CssClass="btn btn-secondary" OnClick="btn_constancia_OnClick" Style="display: none"/>
                                                    </div>
                                                </div>
                                                <asp:Label ID="lbl_constancia" runat="server"></asp:Label>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="form-group col-md-6">
                                                <div class="input-group">
                                                    <div class="custom-file">
                                                        <asp:FileUpload 
                                                            CssClass="custom-file-input" 
                                                            ID="fl_estadore" 
                                                            runat="server" 
                                                            onchange="UploadFile(this)"/>
                                                        <label class="custom-file-label">Estado de Resultados</label>
                                                    </div>
                                                    <div class="input-group-append">
                                                        <asp:Button ID="btn_estadore" runat="server" Text="Subir" CssClass="btn btn-secondary" OnClick="btn_estadore_OnClick" Style="display: none"/>
                                                    </div>
                                                </div>
                                                <asp:Label ID="lbl_estadore" runat="server"></asp:Label>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <button type="button" class="btn btn-secondary" id="declaracion02">Generar Declaración Jurada</button>
                                        </div>
                                        <div class="form-group col-lg-12">
                                            <asp:Button Text="Anterior" CssClass="btn btn-info" runat="server" OnClick="OnAnteriorClick" />
                                            <asp:Button Text="Finalizar" CssClass="btn btn-info" runat="server" OnClick="OnFinalizarClick" />
                                        </div>
                                    </div>
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
            if (fileUpload.value !== '') {
                if (fileUpload.id == 'bodyContent_fl_escritura') {
                    document.getElementById("<%=btn_upload_escritura.ClientID %>").click();
                }
                else if (fileUpload.id == 'bodyContent_fl_estadoie'){
                    document.getElementById("<%=btn_upload_estadoie.ClientID %>").click();
                }
                else if (fileUpload.id == 'bodyContent_fl_cuerpo') {
                    document.getElementById("<%=btn_upload_cuerpo.ClientID %>").click();
                }
                else if (fileUpload.id == 'bodyContent_fl_constancia') {
                    document.getElementById("<%=btn_constancia.ClientID %>").click();
                }
                else if (fileUpload.id == 'bodyContent_fl_estadore') {
                    document.getElementById("<%=btn_estadore.ClientID %>").click();
                }
            }
        }
    </script>
</asp:Content>
