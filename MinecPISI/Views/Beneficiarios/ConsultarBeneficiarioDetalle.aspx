<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Layouts/Layout2.Master" AutoEventWireup="true" CodeBehind="ConsultarBeneficiarioDetalle.aspx.cs" Inherits="MinecPISI.Views.Beneficiarios.ConsultarBeneficiarios" EnableEventValidation="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cssextra" runat="server">
    <%--<style type="text/css">
        .modal-backdrop {
            /* bug fix - no overlay */    
            display: none;    
        }
    </style>--%>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contenidoNavegacion" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="bodyContentBlank" runat="server">
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server" />
        <div class="card shadow mb-12">
            <div class="card-header py-3">
                <h6 class="m-0 font-weight-bold text-primary">Informacion Registrada del Beneficiario</h6>
            </div>
            <div class="card-body">
                <!-- Inicio Info Personal -->
                <div class="row no-gutters align-items-center">
                    <div class="col mr-2">
                        <div class="text-xs font-weight-bold text-primary  mb-1">Nombres</div>
                        <div class="h5 mb-0 font-weight-bold text-gray-800">
                            <asp:TextBox runat="server" ID="txt_nombres" ClientIDMode="Static" Enabled="False" OnTextChanged="txt_nombres_OnTextChanged" required="true" MaxLength="64" />
                        </div>
                        <asp:RegularExpressionValidator ErrorMessage="Nombre inválido!" ControlToValidate="txt_nombres" runat="server" ValidationExpression="^[a-zA-ZñÑáéíóúÁÉÍÓÚ ]*$" SetFocusOnError="true" ForeColor="red" Display="Dynamic" />
                    </div>
                    <div class="col mr-2">
                        <div class="text-xs font-weight-bold text-primary  mb-1">Apellidos</div>
                        <div class="h5 mb-0 font-weight-bold text-gray-800">
                            <asp:TextBox runat="server" ID="txt_apellidos" Enabled="False" OnTextChanged="txt_apellidos_OnTextChanged" required="true" MaxLength="64" />
                        </div>
                        <asp:RegularExpressionValidator ErrorMessage="Apellido inválido!" ControlToValidate="txt_apellidos" runat="server" ValidationExpression="^[a-zA-ZñÑáéíóúÁÉÍÓÚ ]*$" SetFocusOnError="true" ForeColor="red" Display="Dynamic" />
                    </div>
                    <div class="col mr-2">
                        <div class="text-xs font-weight-bold text-primary  mb-1">Fijo</div>
                        <div class="h5 mb-0 font-weight-bold text-gray-800">
                            <asp:TextBox runat="server" ID="txt_telefono" Enabled="False" OnTextChanged="txt_telefono_OnTextChanged" required="true" MaxLength="8" />
                        </div>
                        <%--<asp:RegularExpressionValidator ErrorMessage="Ingresa un Teléfono Fijo válido" ControlToValidate="txt_telefono" runat="server" ValidationExpression="^[2][\d]{7}" SetFocusOnError="true" ForeColor="red" Display="Dynamic" />--%>

                    </div>
                    <div class="col mr-2">
                        <div class="text-xs font-weight-bold text-primary  mb-1">Celular</div>
                        <div class="h5 mb-0 font-weight-bold text-gray-800">
                            <asp:TextBox runat="server" ID="txt_celular" Enabled="False" OnTextChanged="txt_celular_OnTextChanged" required="true" MaxLength="8" />
                        </div>
                        <%--<asp:RegularExpressionValidator ErrorMessage="Ingresa celular válido" ControlToValidate="txt_celular" runat="server" ValidationExpression="^[76][\d]{7}" SetFocusOnError="true" ForeColor="red" Display="Dynamic" />--%>
                    </div>
                </div>
                <div class="row no-gutters align-items-center mt-5">
                    <div class="col mr-2">
                        <div class="text-xs font-weight-bold text-success mb-1">Dui</div>
                        <div class="h5 mb-0 font-weight-bold text-gray-800">
                            <asp:Label runat="server" ID="lbl_dui" />
                        </div>
                    </div>
                    <div class="col mr-2">
                        <div class="text-xs font-weight-bold text-success  mb-1">Nit</div>
                        <div class="h5 mb-0 font-weight-bold text-gray-800">
                            <asp:Label runat="server" ID="lbl_nit" />
                        </div>
                    </div>
                    <div class="col mr-2">
                        <div class="text-xs font-weight-bold text-success  mb-1">Correo Electrónico</div>
                        <div class="h5 mb-0 font-weight-bold text-gray-800">
                            <asp:Label runat="server" ID="lbl_correo" />
                        </div>
                    </div>
                    <div class="col mr-2">
                        <div class="text-xs font-weight-bold text-success mb-1">Tipo Beneficiario</div>
                        <div class="h5 mb-0 font-weight-bold text-gray-800">
                            <asp:Label runat="server" ID="lbl_tipoPersona" />
                        </div>
                    </div>
                </div>
                <div class="row no-gutters align-items-center mt-5">
                    <div class="col mr-2">
                        <div class="text-xs font-weight-bold text-success mb-1">Dirección</div>
                        <div class="h5 mb-0 font-weight-bold text-gray-800">
                            <asp:Label runat="server" ID="lbl_direccion" />
                        </div>
                    </div>
                    <div class="col mr-2">
                        <div class="text-xs font-weight-bold text-success  mb-1">Municipio</div>
                        <div class="h5 mb-0 font-weight-bold text-gray-800">
                            <asp:Label runat="server" ID="lbl_muni" />
                        </div>
                    </div>
                    <div class="col mr-2">
                        <div class="text-xs font-weight-bold text-success  mb-1">Departamento</div>
                        <div class="h5 mb-0 font-weight-bold text-gray-800">
                            <asp:Label runat="server" ID="lbl_depto" />
                        </div>
                    </div>
                    <div class="col mr-2">
                        <div class="text-xs font-weight-bold text-success mb-1">Sector</div>
                        <div class="h5 mb-0 font-weight-bold text-gray-800">
                            <asp:Label runat="server" ID="lbl_sector" />
                        </div>
                    </div>
                </div>
                <!-- Fin Info Personal -->

                <!-- Inicio Descarga de Documentos -->
                <asp:Panel runat="server" ID="pnl_personaNatural" Visible="False">
                    <div class="row mt-5 align-items-center ">
                        <div class="col-xl-4 col-md-4 mb-4">
                            <div class="card border-left-warning h-100 py-2">
                                <div class="card-body">
                                    <div class="row no-gutters align-items-center">
                                        <div class="col mr-2">
                                            <div class="text-xs font-weight-bold text-primary mb-1">Declaracion Jurada</div>
                                            <div class="h5 mb-0 font-weight-bold text-gray-800">
                                                <asp:LinkButton Text="Descargar" runat="server" ID="lnk_declaracion" OnClick="lnk_declaracion_OnClick" />
                                                <a href="javascript:void(0)" title="Subir Declaración" onclick="subirDeclaracion()" class="subirOculto">Subir</a>
                                                <asp:FileUpload
                                                    ID="fl_declaracion"
                                                    runat="server"
                                                    ClientIDMode="Static"
                                                    onchange="UploadFile(this)"
                                                    accept=".png,.jpg,.jpeg,.pdf"
                                                    Style="display: none;" />
                                                <asp:Button ID="btn_uploadDeclaracion" ClientIDMode="Static" runat="server" Text="Submit" OnClick="btn_uploadDeclaracion_OnClick" Style="display: none;" />
                                            </div>
                                        </div>
                                        <div class="col-auto">
                                            <i class="fas fa-file-invoice fa-2x text-gray-300"></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-xl-4 col-md-4 mb-4">
                            <div class="card border-left-warning h-100 py-2">
                                <div class="card-body">
                                    <div class="row no-gutters align-items-center">
                                        <div class="col mr-2">
                                            <div class="text-xs font-weight-bold text-primary mb-1">Constancia Alcaldía / R. MYPE</div>
                                            <div class="h5 mb-0 font-weight-bold text-gray-800" id="divConstancia">
                                                <asp:LinkButton Text="Descargar" runat="server" ID="lnk_constancia" OnClick="lnk_constancia_OnClick" />
                                                <a href="javascript:void(0)" title="Subir Constancia Alcaldía" onclick="subirConstancia()" class="subirOculto">Subir</a>
                                                <asp:FileUpload
                                                    ID="fl_constancia"
                                                    runat="server"
                                                    ClientIDMode="Static"
                                                    onchange="UploadFile(this)"
                                                    accept=".png,.jpg,.jpeg,.pdf"
                                                    Style="display: none;" />
                                                <asp:Button ID="btn_uploadConstancia" ClientIDMode="Static" runat="server" Text="Submit" OnClick="btn_uploadConstancia_OnClick" Style="display: none;" />
                                            </div>
                                        </div>
                                        <div class="col-auto">
                                            <i class="fa fa-file-invoice fa-2x text-gray-300"></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-xl-4 col-md-4 mb-4">
                            <div class="card border-left-warning h-100 py-2">
                                <div class="card-body">
                                    <div class="row no-gutters align-items-center">
                                        <div class="col mr-2">
                                            <div class="text-xs font-weight-bold text-primary mb-1">Otro</div>
                                            <div class="h5 mb-0 font-weight-bold text-gray-800">
                                                <asp:LinkButton Text="Descargar" runat="server" ID="lnk_otro" OnClick="lnk_otro_OnClick" />
                                                <a href="javascript:void(0)" title="Subir Otro" onclick="subirOtro()" class="subirOculto">Subir</a>
                                                <asp:FileUpload
                                                    ID="fl_otro"
                                                    runat="server"
                                                    ClientIDMode="Static"
                                                    onchange="UploadFile(this)"
                                                    accept=".png,.jpg,.jpeg,.pdf"
                                                    Style="display: none;" />
                                                <asp:Button ID="btn_uploadOtro" ClientIDMode="Static" runat="server" Text="Submit" OnClick="btn_uploadOtro_OnClick" Style="display: none;" />
                                            </div>
                                        </div>
                                        <div class="col-auto">
                                            <i class="fa fa-file fa-2x text-gray-300"></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </asp:Panel>

                <asp:Panel runat="server" ID="pnl_personaJuridica" Visible="False">
                    <div class="row mt-5 align-items-center ">
                        <div class="col-xl-2 col-md-2 mb-2">
                            <div class="card border-left-warning h-100 py-2">
                                <div class="card-body">
                                    <div class="row no-gutters align-items-center">
                                        <div class="col mr-2">
                                            <div class="text-xs font-weight-bold text-primary mb-1">Declaracion Jurada</div>
                                            <div class="h5 mb-0 font-weight-bold text-gray-800">
                                                <a href="#">Descargar</a>
                                            </div>
                                        </div>
                                        <div class="col-auto">
                                            <i class="fas fa-file-invoice fa-2x text-gray-300"></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-xl-2 col-md-2 mb-2">
                            <div class="card border-left-warning h-100 py-2">
                                <div class="card-body">
                                    <div class="row no-gutters align-items-center">
                                        <div class="col mr-2">
                                            <div class="text-xs font-weight-bold text-primary mb-1">Escritura de Constitución</div>
                                            <div class="h5 mb-0 font-weight-bold text-gray-800">
                                                <asp:LinkButton Text="Descargar" runat="server" ID="lnk_escritura" OnClick="lnk_escritura_OnClick" />
                                            </div>
                                        </div>
                                        <div class="col-auto">
                                            <i class="fa fa-file-invoice fa-2x text-gray-300"></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-xl-2 col-md-2 mb-2">
                            <div class="card border-left-warning h-100 py-2">
                                <div class="card-body">
                                    <div class="row no-gutters align-items-center">
                                        <div class="col mr-2">
                                            <div class="text-xs font-weight-bold text-primary mb-1">Estado de Ingresos y Egresos</div>
                                            <div class="h5 mb-0 font-weight-bold text-gray-800">
                                                <asp:LinkButton Text="Descargar" runat="server" ID="lnk_estadoie" OnClick="lnk_estadoie_OnClick" />
                                            </div>
                                        </div>
                                        <div class="col-auto">
                                            <i class="fa fa-file fa-2x text-gray-300"></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-xl-2 col-md-2 mb-2">
                            <div class="card border-left-warning h-100 py-2">
                                <div class="card-body">
                                    <div class="row no-gutters align-items-center">
                                        <div class="col mr-2">
                                            <div class="text-xs font-weight-bold text-primary mb-1">Credencial de Cuerpo</div>
                                            <div class="h5 mb-0 font-weight-bold text-gray-800">
                                                <asp:LinkButton Text="Descargar" runat="server" ID="lnk_cuerpo" OnClick="lnk_cuerpo_OnClick" />
                                            </div>
                                        </div>
                                        <div class="col-auto">
                                            <i class="fa fa-file fa-2x text-gray-300"></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-xl-2 col-md-2 mb-2">
                            <div class="card border-left-warning h-100 py-2">
                                <div class="card-body">
                                    <div class="row no-gutters align-items-center">
                                        <div class="col mr-2">
                                            <div class="text-xs font-weight-bold text-primary mb-1">Constancia Alcaldía / R. MYPE</div>
                                            <div class="h5 mb-0 font-weight-bold text-gray-800">
                                                <asp:LinkButton Text="Descargar" runat="server" ID="lnk_constanciaA" OnClick="lnk_constancia_OnClick" />
                                            </div>
                                        </div>
                                        <div class="col-auto">
                                            <i class="fa fa-file-invoice fa-2x text-gray-300"></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-xl-2 col-md-2 mb-2">
                            <div class="card border-left-warning h-100 py-2">
                                <div class="card-body">
                                    <div class="row no-gutters align-items-center">
                                        <div class="col mr-2">
                                            <div class="text-xs font-weight-bold text-primary mb-1">Estado de Ingresos y Egresos</div>
                                            <div class="h5 mb-0 font-weight-bold text-gray-800">
                                                <asp:LinkButton Text="Descargar" runat="server" ID="lnk_estadore" OnClick="lnk_estadore_OnClick" />
                                            </div>
                                        </div>
                                        <div class="col-auto">
                                            <i class="fa fa-file fa-2x text-gray-300"></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </asp:Panel>
                <!-- fin de Descarga de documentos -->

                <asp:Panel runat="server" ID="pnl_observaciones" Visible="false">
                    <div class="card shadow mb-4">

                        <div class="card-header py-3">
                            <h5>Observaciones</h5>
                        </div>

                        
                        <div class="card-body">
                            <% foreach (var o in observaciones)
                                { %>
                            <p>
                                <h6>Fecha y Hora: </h6>
                                <div class="small">
                                    <%=o.FECHA %>
                                </div>
                            </p>

                            <p>
                                <h6>Descripción:</h6>
                                <div class="small">
                                    <%= o.DESCRIPCION %>
                                </div>
                            </p>
                            <%}%>
                            <asp:Button Text="Marcar como resuelta" runat="server" CssClass="btn btn-warning" ID="btn_resolverObservacion" OnClick="btn_resolverObservacion_OnClick"/>
                        </div>
                        
                    </div>
                </asp:Panel>

                <%if (Usuario == "COORDINADOR" && beneficiario.ESTADO_PROCESO=="B02" || beneficiario.ESTADO_PROCESO=="B03" && Usuario == "COORDINADOR" )
                    {
                %>
                <asp:Panel runat="server" ID="pnl_coordinador">
                    <div class="text-center mt-4 mb-4">
                        <asp:LinkButton ID="btn_verificarBene" runat="server" CssClass="btn btn-success btn-icon-split mb-1" OnClick="btn_verificarBeneficiario_OnClick">
                            <span class="icon text-white-50">
                                <i class="fas fa-check"></i>
                            </span>
                            <span class="text">Beneficiario Verificado</span>
                        </asp:LinkButton>
                        <a class="btn btn-warning btn-icon-split text-white mb-1" data-toggle="modal" data-target="#RecomendacionesModal">
                            <span class="icon text-white-50">
                                <i class="fas fa-info-circle"></i>
                            </span>
                            <span class="text">Hacer Observaciones</span>
                        </a>
                        <asp:LinkButton ID="btn_denegarBene" runat="server" CssClass="btn btn-danger btn-icon-split mb-1" OnClick="btn_denegarBeneficiario_OnClick">
                            <span class="icon text-white-50">
                                <i class="fas fa-exclamation-triangle"></i>
                            </span>
                            <span class="text">Denegar Registro</span>
                        </asp:LinkButton>
                    </div>
                </asp:Panel>
                <%  }
                    if(Usuario == "CONSULTOR")
                    {
                %>
                <asp:LinkButton CssClass="btn btn-info btn-icon-split mb-1" runat="server" ID="lnk_registrarCita" OnClick="lnk_registrarCita_OnClick">
                            <span class="icon text-white-50">
                                <i class="fa fa-address-book"></i>
                            </span>
                            <span class="text">Agendar Cita</span>
                        </asp:LinkButton>
                        
                        <asp:LinkButton CssClass="btn btn-info btn-icon-split mb-1" runat="server" ID="lnk_agregarInfo" OnClick="lnk_agregarInfo_OnClick">
                                <span class="icon text-white-50">
                                    <i class="fas fa-info-circle"></i>
                                </span>
                                <span class="text">Agregar Información Complementaria</span>
                        </asp:LinkButton>
                <asp:Panel runat="server" ID="pnl_estadoVerificado" Visible="false">
                    <div class="text-center mt-4 mb-4">

                        <%if (beneficiario.ESTADO_PROCESO != "B06" )
                            { %>
                        <a class="btn btn-info btn-icon-split mb-1" data-toggle="modal" href="#preCalificacionModal">
                            <span class="icon text-white-50">
                                <i class="fa fa-plus"></i>
                            </span>
                            <span class="text">Registrar Precalificación</span>
                        </a>
                        <a class="btn btn-info btn-icon-split mb-1" data-toggle="modal" href="#usuarioModal">
                            <span class="icon text-white-50">
                                <i class="fa fa-user-circle"></i>
                            </span>
                            <span class="text">Generar Usuario</span>
                        </a>
                        <%}%>
                    </div>
                </asp:Panel>
                <%
                    }
                %>
            </div>
        </div>

        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>

                <!-- Modal Recomendaciones Coordinador -->
                <div class="modal fade" id="RecomendacionesModal" tabindex="-1" role="dialog" aria-hidden="true">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="exampleModalLabel">Hacer Observaciones</h5>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body">
                                <form>
                                    <div class="form-group">
                                        <label>Observaciones</label>
                                        <asp:TextBox ID="txt_observa" TextMode="MultiLine" CssClass="form-control" placeholder="Ingresa las Observaciones que tienes en el registro del Beneficiario" runat="server" MaxLength="200" />
                                    </div>
                                </form>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
                                <asp:Button Text="Guardar" runat="server" CssClass="btn btn-success" ID="btn_hacerObservaciones" OnClick="btn_hacerObservaciones_OnClick" CausesValidation="False" />
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Modal Generar Usuario -->
                <div class="modal fade" id="usuarioModal" tabindex="-1" role="dialog" aria-labelledby="usuarioModalLabel" aria-hidden="true">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="usuarioModalLabel">Usuario de Beneficiario</h5>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body">
                                <div class="form-group">
                                    <label>
                                        El Usuario para
                                        <asp:Label class="font-weight-bold" runat="server" ID="lbl_nombreCompleto"></asp:Label>
                                        es:</label>
                                    <asp:TextBox ID="txt_nombreUsuario" CssClass="text-center" Text="JJLopez2019" runat="server" Enabled="False" />
                                </div>
                            </div>
                            <div class="modal-footer">
                                <asp:Button Text="Guardar" runat="server" CssClass="btn btn-success" ID="btn_generarUsuario" OnClick="btn_generarUsuario_OnClick" CausesValidation="False" />
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Modal Registrar Precalificación -->
                <div class="modal fade" id="preCalificacionModal" tabindex="-1" role="dialog" aria-labelledby="preCalificacionModalLabel" aria-hidden="true">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="preCalificacionModalLabel">Ingresar Precalificación</h5>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body">
                                <div class="form-group form-check-inline align-content-center">
                                    <div class="form-check">
                                        <asp:RadioButton ID="rb_elegible" runat="server" CssClass="form-check-input" Checked="True" GroupName="precalificacion" />
                                        <label class="form-check-label" for="elegible">
                                            Beneficiario Elegible
                                        </label>
                                    </div>
                                    <div class="form-check">
                                        <asp:RadioButton ID="rb_noElegible" runat="server" CssClass="form-check-input" Checked="False" GroupName="precalificacion" />
                                        <label class="form-check-label" for="asociacion">
                                            Beneficiario <span class="font-weight-bold">NO</span> Elegible
                                        </label>
                                    </div>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <asp:Button Text="Guardar" runat="server" CssClass="btn btn-success" ID="btn_pre" OnClick="btn_pre_OnClick" CausesValidation="False" />
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
                            </div>
                        </div>
                    </div>
                </div>

            </ContentTemplate>

            <Triggers>
                <asp:PostBackTrigger ControlID="btn_hacerObservaciones" />
                <asp:PostBackTrigger ControlID="btn_generarUsuario" />
                <asp:PostBackTrigger ControlID="btn_pre" />
            </Triggers>
        </asp:UpdatePanel>
    </form>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="jsextra" runat="server">

    <script type="text/javascript">

        $(document).ready(function () {
            if ('<%= beneficiario.ESTADO_PROCESO%>' != 'B03') {
                $(".subirOculto").hide();
            }
            else {
                $(".subirOculto").show();
            }
        });

        function subirConstancia() {
            $("#fl_constancia").click();
        }
        function subirDeclaracion() {
            $("#fl_declaracion").click();
        }
        function subirOtro() {
            $("#fl_otro").click();
        }


        function UploadFile(fileUpload) {
            if (fileUpload.value != '') {
                if (fileUpload.id == 'fl_constancia') {
                    $('#btn_uploadConstancia').click();
                }
                else if (fileUpload.id == 'fl_otro') {
                    $('#btn_uploadOtro').click();

                }
                else if (fileUpload.id == 'fl_declaracion') {
                    $('#btn_uploadDeclaracion').click();

                }

            }
        }

    </script>
</asp:Content>
