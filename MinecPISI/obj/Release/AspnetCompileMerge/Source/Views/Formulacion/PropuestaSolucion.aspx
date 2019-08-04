<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Layouts/Layout2.Master" AutoEventWireup="true" CodeBehind="PropuestaSolucion.aspx.cs" Inherits="MinecPISI.Views.Formulacion.PropuestaSolucion" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cssextra" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contenidoNavegacion" runat="server">
     <hr class="sidebar-divider">
    <% 
        //Aqui de debe hacer la validacion de que navegacion mostrar si el del coordinador o consultor
        switch (usuario)
        {
            case "Beneficiario":
    %>
    <!--#include file="~/Views/Navegacion/Beneficiario.html"-->
    <%
            break;
        case "Formulador":
    %>
    <!--#include file="~/Views/Navegacion/Formulador.html"-->
    <%
            break;
        }
    %>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="bodyContentBlank" runat="server">
    <div class="card shadow mb-4">
        <div class="card-header py-3">
            <h6 class="  font-weight-bold text-primary">Propuesta solución</h6>
        </div>
        <div class="card-body">
            <div class="row">
                <div class="col">
                    <h5 class="font-weight-bold">Tipo</h5>
                    <p>Innovación</p>
                </div>
                <div class="col">
                    <h5 class="font-weight-bold">Presentó Propuesta</h5>
                    <p>Federico Sánchez</p>
                </div>
                <div class="col">
                    <h5 class="font-weight-bold">Fecha de Presentación</h5>
                    <p>01/01/2019</p>
                </div>
            </div>
        </div>
    </div>
    <div class="card shadow mb-2">
        <div class="card-body">
            <%if (tipoSolucion != "integral")
                { %>
            <div class="row pt-3 pl-3 pr-3">
                <div class="form-group">
                    <h6 class="font-weight-bold text-info">Propuesta</h6>
                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>
                </div>
            </div>
            <%}
                else
                { %>
            <div class="row pt-3 pl-3 pr-3">
                <div class="form-group">
                    <h6 class="font-weight-bold text-info">Adopción / Incorporación Tecnológica</h6>
                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>
                </div>
                <div class="form-group">
                    <h6 class="font-weight-bold text-info">Asistencia Técnica / Transferencia de Conocimiento</h6>
                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>
                </div>
                <div class="form-group">
                    <h6 class="font-weight-bold text-info">Innovación</h6>
                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>
                </div>
            </div>
            <%} %>
            <div class="row pl-3 pr-3">
                <div class="form-group">
                    <h6 class="font-weight-bold">Componentes Básicos del Proyecto</h6>
                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>
                </div>
            </div>
            <div class="row pl-3 pr-3">
                <div class="form-group">
                    <h6 class="font-weight-bold">Información Adicional de Sustento</h6>
                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>
                </div>
            </div>
            <div class="row pl-3 pr-3">
                <div class="form-group">
                    <label class="h6 font-weight-bold">Presupuesto / Contrapartida Aproximada para ejecución</label>
                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>
                </div>
            </div>
            <%if (usuario == "Beneficiario")
                { %>
            <div class="text-center mt-4 mb-4">
                <button class="btn btn-success btn-icon-split mb-1" type="submit">
                    <span class="icon text-white-50">
                        <i class="fas fa-check"></i>
                    </span>
                    <span class="text">Aceptar Propuesta</span>
                </button>
                <button class="btn btn-danger btn-icon-split mb-1" type="submit">
                    <span class="icon text-white-50">
                        <i class="fas fa-exclamation-triangle"></i>
                    </span>
                    <span class="text">Rechazar Propuesta</span>
                </button>
            </div>
            <%}%>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="jsextra" runat="server">
</asp:Content>
