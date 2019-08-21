<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Layouts/Layout2.Master" AutoEventWireup="true" CodeBehind="DocumentosGenerales.aspx.cs" Inherits="MinecPISI.Views.Administracion.DocumentosGenerales" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cssextra" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contenidoNavegacion" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="bodyContentBlank" runat="server">
    <form runat="server">
        <div class="card shadow mb-4">
            <div class="card-header py-3">
                <h6 class="  font-weight-bold text-primary">Administracion de documentos</h6>
            </div>

            <div class="card-body">
                <div class="col-sm-6 col-md-6 col-xs-12">
                        <div class="form-group">
                            <div class="input-group">
                                <div class="custom-file">
                                    <asp:FileUpload
                                        CssClass="custom-file-input"
                                        ID="fl_declaracion"
                                        runat="server"
                                        accept=".png,.jpg,.jpeg,.pdf"
                                        onchange="UploadFile(this)" />
                                    <label class="custom-file-label">Declaracion jurada</label>
                                </div>
                                <div class="input-group-append">
                                    <asp:Button ID="btn_upload_declaracion" runat="server" Text="Subir" CssClass="btn btn-secondary" OnClick="btn_upload_declaracion_Click" Style="display: none" />
                                </div>
                            </div>
                            <asp:Label ID="lbl_declaracion" runat="server"></asp:Label>
                        </div>
                    </div>
            </div>
        </div>
    </form>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="jsextra" runat="server">
    <script type="text/javascript">
        function UploadFile(fileUpload) {
            if (fileUpload.value != '') {
                document.getElementById("bodyContentBlank_btn_upload_declaracion").click();

            }
        }
    </script>
</asp:Content>
