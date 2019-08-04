<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Layouts/Layout2.Master" AutoEventWireup="true" CodeBehind="RegistrarInformacionComplementariaVinculacion2.aspx.cs" Inherits="MinecPISI.Views.Beneficiarios.RegistrarInformacionComplementariaVinculacion2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cssextra" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="bodyContentBlank" runat="server">
    <form id="form1" class="mt-2" runat="server">
    <div class="card shadow mb-4">
        <div class="card-header py-3">
            <h6 class="  font-weight-bold text-primary">Información Complementaria del Beneficiario</h6>
        </div>
        <div class="card-body">
            <div class="row">
                <div class="col">
                    <h4 class="small font-weight-bold">Nombre:</h4>
                    <asp:Label ID="lbl_nombre" runat="server" />
                </div>
                <div class="col">
                    <h4 class="small font-weight-bold">NIT:</h4>
                    <asp:Label ID="lbl_nit" runat="server" />
                </div>
                <div class="col">
                    <h4 class="small font-weight-bold">Telefono</h4>
                    <asp:Label ID="lbl_telefono" runat="server" />
                </div>
                <%--<div class="col">
                                <h4 class="small font-weight-bold">Estado</h4>
                                <asp:Label ID="lbl_estado" runat="server" />
                            </div>--%>
                <div class="col">
                    <h4 class="small font-weight-bold">Municipio</h4>
                    <asp:Label ID="lbl_muni" runat="server" />
                </div>
            </div>

                <div class="form-row">

                    <h3 class="col-12">Archivos Complementarios</h3>

                    <div class="form-group col-md-6">
                        <label>Imagen del DUI</label>
                        <asp:FileUpload
                            CssClass="form-control-file"
                            ID="fl_dui"
                            runat="server"
                            onchange="UploadFile(this)"
                            accept=".png,.jpg,.jpeg" />
                        <asp:Label ID="lbl_duiT" runat="server" />
                        <asp:Button ID="btn_dui" runat="server" OnClick="btn_uploadDui_OnClick" Text="subir" Style="display: none" />
                    </div>

                    <div class="form-group col-md-6">
                        <label>Imagen del NIT</label>
                        <asp:FileUpload
                            CssClass="form-control-file"
                            ID="fl_nit"
                            runat="server"
                            onchange="UploadFile(this)"
                            accept=".png,.jpg,.jpeg" UseSubmitBehavior="False"/>
                        <asp:Label ID="lbl_nitT" runat="server" />
                        <asp:Button ID="btn_nit" runat="server" OnClick="btn_uploadNit_OnClick" Style="display: none" />
                    </div>

                    <div class="form-group col-md-6">
                        <label>Imagen de los productos</label>
                        <asp:FileUpload
                            CssClass="form-control-file"
                            ID="fl_imagenProductos"
                            runat="server"
                            onchange="UploadFile(this)"
                            AllowMultiple="True"
                            accept=".png,.jpg,.jpeg" UseSubmitBehavior="False"/>
                        <asp:Label ID="lbl_imagenProductos" runat="server" />
                        <asp:Button ID="btn_imagenProductos" runat="server" OnClick="btn_uploadImagenProductos_OnClick" Style="display: none" />
                    </div>

                    
                    <div class="form-group col-md-6">
                        <label>Imagen del lugar</label>
                        <asp:FileUpload
                            CssClass="form-control-file"
                            ID="fl_imagenLugar"
                            runat="server"
                            onchange="UploadFile(this)"
                            AllowMultiple="True"
                            accept=".png,.jpg,.jpeg" UseSubmitBehavior="False"/>
                        <asp:Label ID="lbl_imagenLugar" runat="server" />
                        <asp:Button ID="btn_imagenLugar" runat="server" OnClick="btn_uploadImagenLugar_OnClick" Style="display: none" />
                    </div>

                    
                    <div class="form-group col-md-6">
                        <label>Imagen de las Ventas</label>
                        <asp:FileUpload
                            CssClass="form-control-file"
                            ID="fl_imagenVentas"
                            runat="server"
                            onchange="UploadFile(this)"
                            accept=".png,.jpg,.jpeg" UseSubmitBehavior="False"/>
                        <asp:Label ID="lbl_imagenVentas" runat="server" />
                        <asp:Button ID="btn_imagenVentas" runat="server" OnClick="btn_uploadImagenVentas_OnClick" Style="display: none" />
                    </div>

                    
                    <div class="form-group col-md-6">
                        <label>Imagen de los activos</label>
                        <asp:FileUpload
                            CssClass="form-control-file"
                            ID="fl_imagenActivos"
                            runat="server"
                            onchange="UploadFile(this)"
                            accept=".png,.jpg,.jpeg" UseSubmitBehavior="False"/>
                        <asp:Label ID="lbl_imagenActivos" runat="server" />
                        <asp:Button ID="btn_imagenActivos" runat="server" OnClick="btn_uploadImagenActivos_OnClick" Style="display: none" />
                    </div>

                    <div class="form-group col-lg-12">      
                        <asp:Button Text="Cancelar" ID="btn_cancelar" UseSubmitBehavior="False" CssClass="btn btn-secondary offset-md-5" runat="server" OnClick="btn_cancelar_OnClick" />
                        <asp:Button Text="Registrar" ID="btn_registrar" UseSubmitBehavior="False" CssClass="btn btn-success offset-md-5" runat="server" OnClick="btn_registrar_OnClick" />
                    </div>

                </div>
        </div>
    </div>
    </form>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="jsextra" runat="server">
    <script type="text/javascript">
        function UploadFile(fileUpload) {
            debugger;
            if (fileUpload.value != '') {
                if (fileUpload.id == 'bodyContentBlank_fl_dui') {
                    $("#<%=btn_dui.ClientID %>").click();
                }
                else if (fileUpload.id == 'bodyContentBlank_fl_nit') {
                    $("#<%=btn_nit.ClientID %>").click();
                }
                else if (fileUpload.id == 'bodyContentBlank_fl_imagenLugar') {
                    $("#<%=btn_imagenLugar.ClientID %>").click();
                }
                else if (fileUpload.id == 'bodyContentBlank_fl_imagenVentas') {
                    $("#<%=btn_imagenVentas.ClientID %>").click();
                }
                else if (fileUpload.id == 'bodyContentBlank_fl_imagenProductos') {
                    $("#<%=btn_imagenProductos.ClientID %>").click();
                }
                else if (fileUpload.id == 'bodyContentBlank_fl_imagenActivos') {
                    $("#<%=btn_imagenActivos.ClientID %>").click();
                }

            }
        }
    </script>
</asp:Content>