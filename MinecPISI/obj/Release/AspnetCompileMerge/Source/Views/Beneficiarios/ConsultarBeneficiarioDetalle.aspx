<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Layouts/Layout2.Master" AutoEventWireup="true" CodeBehind="ConsultarBeneficiarioDetalle.aspx.cs" Inherits="MinecPISI.Views.ConsultorVinculacion.ConsultarBeneficiarios" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cssextra" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contenidoNavegacion" runat="server">
    <% 
        switch (usuario)
        {
            case "Coordinador":
    %>
    <!--#include file="~/Views/Navegacion/Coordinador.html"-->
    <%
            break;
        case "Consultor":
    %>
    <!-- menu del consultor de vinculacion -->
<li class="nav-item ">
    <a class="nav-link" href="<%Response.Write(HttpContext.Current.Request.ApplicationPath);%>/BeneficiarioConsultarBeneficiario">
        <i class="fas fa-fw fa-users"></i>
        <span>Consultar Cartera de Beneficiarios</span>
    </a>
</li>
<li class="nav-item">
    <a class="nav-link" href="<%Response.Write(HttpContext.Current.Request.ApplicationPath);%>/CasosConsulta">
        <i class="fas fa-fw fa-eye"></i>
        <span>Consultar Casos </span>
    </a>
</li>

<hr class="sidebar-divider d-none d-md-block">
<div class="text-center d-none d-md-inline">
    <a class="btn rounded-circle border-0" id="sidebarToggle"></a>
</div>
    <%
            break;
        }
    %>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="bodyContentBlank" runat="server">
    <div class="card shadow mb-12">
        <div class="card-header py-3">
            <h6 class="m-0 font-weight-bold text-primary">Informacion Registrada del Beneficiario</h6>
        </div>
        <div class="card-body">
            <div class="row no-gutters align-items-center">
                <div class="col mr-2">
                    <div class="text-xs font-weight-bold text-primary  mb-1">Nombres</div>
                    <div class="h5 mb-0 font-weight-bold text-gray-800">
                        <asp:Label runat="server" ID="lbl_nombres" />
                    </div>
                </div>
                <div class="col mr-2">
                    <div class="text-xs font-weight-bold text-primary  mb-1">Apellidos</div>
                    <div class="h5 mb-0 font-weight-bold text-gray-800">
                        <asp:Label runat="server" ID="lbl_apellidos" />
                    </div>
                </div>
                <div class="col mr-2">
                    <div class="text-xs font-weight-bold text-primary  mb-1">Telefono</div>
                    <div class="h5 mb-0 font-weight-bold text-gray-800">
                        <asp:Label runat="server" ID="lbl_telefono" />
                    </div>
                </div>
                <div class="col mr-2">
                    <div class="text-xs font-weight-bold text-primary  mb-1">Celular</div>
                    <div class="h5 mb-0 font-weight-bold text-gray-800">
                        <asp:Label runat="server" ID="lbl_celular" />
                    </div>
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
            <!-- Inicio Descarga de Documentos -->
            <div class="row mt-5 align-items-center ">
                <div class="col-xl-3 col-md-6 mb-4">
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
                <div class="col-xl-3 col-md-6 mb-4">
                    <div class="card border-left-warning h-100 py-2">
                        <div class="card-body">
                            <div class="row no-gutters align-items-center">
                                <div class="col mr-2">
                                    <div class="text-xs font-weight-bold text-primary mb-1">Constancia Alcaldía / R. MYPE</div>
                                    <div class="h5 mb-0 font-weight-bold text-gray-800">
                                        <a href="#">Descargar</a>
                                    </div>
                                </div>
                                <div class="col-auto">
                                    <i class="fa fa-file-invoice fa-2x text-gray-300"></i>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-xl-3 col-md-6 mb-4">
                    <div class="card border-left-warning h-100 py-2">
                        <div class="card-body">
                            <div class="row no-gutters align-items-center">
                                <div class="col mr-2">
                                    <div class="text-xs font-weight-bold text-primary mb-1">Constancia de Ingresos</div>
                                    <div class="h5 mb-0 font-weight-bold text-gray-800">
                                        <a href="#">Descargar</a>
                                    </div>
                                </div>
                                <div class="col-auto">
                                    <i class="fa fa-file fa-2x text-gray-300"></i>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-xl-3 col-md-6 mb-4">
                    <div class="card border-left-warning h-100 py-2">
                        <div class="card-body">
                            <div class="row no-gutters align-items-center">
                                <div class="col mr-2">
                                    <div class="text-xs font-weight-bold text-primary mb-1">Otro</div>
                                    <div class="h5 mb-0 font-weight-bold text-gray-800">
                                        <a href="#">Descargar</a>
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
            <!-- fin de Descarga de documentos -->
            <%if (usuario == "Coordinador")
                { %>
            <div class="text-center mt-4 mb-4">
                <button class="btn btn-success btn-icon-split mb-1" type="submit">
                    <span class="icon text-white-50">
                        <i class="fas fa-check"></i>
                    </span>
                    <span class="text">Beneficiario Verificado</span>
                </button>
                <a class="btn btn-warning btn-icon-split text-white mb-1" data-toggle="modal" data-target="#RecomendacionesModal">
                    <span class="icon text-white-50">
                        <i class="fas fa-info-circle"></i>
                    </span>
                    <span class="text">Hacer Observaciones</span>
                </a>
                <a class="btn btn-info btn-icon-split text-white mb-1" data-toggle="modal" data-target="#AsignarConsultorModal">
                    <span class="icon text-white-50">
                        <i class="fas fa-user"></i>
                    </span>
                    <span class="text">Asignar Consultor de Vinculación</span>
                </a>
                <button class="btn btn-danger btn-icon-split mb-1" type="submit">
                    <span class="icon text-white-50">
                        <i class="fas fa-exclamation-triangle"></i>
                    </span>
                    <span class="text">Denegar Registro</span>
                </button>
            </div>
            <%}
                else
                { %>
            <div class="text-center mt-4 mb-4">
                <a class="btn btn-info btn-icon-split mb-1" data-toggle="modal" href="#preCalificacionModal">
                    <span class="icon text-white-50">
                        <i class="fa fa-plus"></i>
                    </span>
                    <span class="text">Registrar Precalificación</span>
                </a>
                <a class="btn btn-info btn-icon-split mb-1" href="/Calendario/ProgramarCita/1">
                    <span class="icon text-white-50">
                        <i class="fa fa-address-book"></i>
                    </span>
                    <span class="text">Agendar Cita</span>
                </a>
                <a class="btn btn-info btn-icon-split mb-1" data-toggle="modal" href="#usuarioModal">
                    <span class="icon text-white-50">
                        <i class="fa fa-user-circle"></i>
                    </span>
                    <span class="text">Generar Usuario</span>
                </a>
                <a class="btn btn-info btn-icon-split mb-1" href="/Beneficiario/AgregarInformacion/1">
                    <span class="icon text-white-50">
                        <i class="fas fa-info-circle"></i>
                    </span>
                    <span class="text">Agregar Información Complementaria</span>
                </a>
            </div>
            <%} %>
        </div>
    </div>

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
                            <textarea class="form-control" id="recomendacionesInput" placeholder="Ingresa las Observaciones que tienes en el registro del Beneficiario"></textarea>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
                    <button type="submit" class="btn btn-success">Enviar</button>
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
                        <label>El Usuario para <span class="font-weight-bold">Juan José Lopez Quintanilla</span> es:</label>
                        <input class="text-center" type="text" name="usuario" value="JJLopez2019" disabled />
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-success">Guardar</button>
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
                            <input class="form-check-input" type="radio" id="elegible" name="precalificacion" value="1">
                            <label class="form-check-label" for="elegible">
                                Beneficiario Elegible
                            </label>
                        </div>
                        <div class="form-check">
                            <input class="form-check-input" type="radio" id="noElegible" name="precalificacion" value="0">
                            <label class="form-check-label" for="asociacion">
                                Beneficiario <span class="font-weight-bold">NO</span> Elegible
                            </label>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-success">Guardar</button>
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
                </div>
            </div>
        </div>
    </div>
    <!--Modal Asignar Consultar de Vinculación -->
    <div class="modal fade" id="AsignarConsultorModal" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="labelHeader">Asignar Consultor de Vinculación</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <form>
                        <div class="form-group">
                            <label for="ejemploSelect">Seleccionar Consultor de Vinculación</label>
                            <select class="form-control" id="ejemploSelect">
                                <option>Luisa Martell</option>
                                <option>Alejandro Cárcamo</option>
                                <option>Ernesto Mejía</option>
                                <option>Diego Mejía</option>
                            </select>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
                    <button type="submit" class="btn btn-success">Guardar</button>
                </div>
            </div>
        </div>
    </div>

</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="jsextra" runat="server">
</asp:Content>
