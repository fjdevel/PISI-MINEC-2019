<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Layouts/Layout1.Master" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="MinecPISI.Views.Administracion.logout" %>
<asp:Content ID="Content1" ContentPlaceHolderID="cssextra" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="bodyContent" runat="server">
    <div class="container">

    <!-- Outer Row -->
    <div class="row justify-content-center">

      <div class="col-xl-10 col-lg-12 col-md-9">

        <div class="card o-hidden border-0 shadow-lg my-5">
            <div class="card-header p-0">
                <h4 class="h4 text-center"> Proyecto Especial de Pequeñas Inversiones para Soluciones Innovadoras</h4>
            </div>
          <div class="card-body p-0">
            <!-- Nested Row within Card Body -->
            <div class="row">
              <div class="col-lg-6 d-none d-lg-block ">
                <img src="<%= ResolveUrl("~/Views/img/minec.jpg") %>" width="500">
              </div>
              <div class="col-lg-6">
                <div class="p-5">
                  <div class="text-center">
                    <h1 class="h4 text-gray-900 mb-4">Inicio de sesión</h1>
                      
                  </div>
                  <form class="user" method="post" runat="server">
                    <div class="form-group">
                        <asp:TextBox ID="txt_email" class="form-control" runat="server" required="true" TextMode="Email" placeholder="Ingresa tu correo" aria-describedby="emailHelp"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <asp:TextBox ID="txt_password" runat="server" TextMode="Password" class="form-control" placeholder="Ingresa tu Contraseña" required=""></asp:TextBox>
                    </div>

                    <div class="form-group">
                        <asp:button class="btn btn-warning btn-xs col-lg-12" style="margin-bottom:4px;white-space: normal;" Text="Este usuario ya posee una sesion abierta. Para cerrar la sesión anterior y abrir una nueva, puede hacer clic AQUÍ o intente iniciar sesión con otro usuario" runat="server" id="btn_restart_sesion" OnClick="btn_restart_sesion_Click" />
                        <asp:Label ID="lbl_errors" runat="server" Text="" Hidden=""></asp:Label>
                        <asp:Button ID="btn_login" class="btn btn-primary btn-user btn-block" runat="server" Text="Iniciar Sesión" OnClick="btn_login_Click" />
                    </div>

                      <div class="form-group">
                      </div>
                  </form>

                
                    </div>
                  <hr>
                  <div class="text-center">
                    <a class="small" href="">Olvido la contraseña?</a>
                  </div>
                  <div class="text-center">
                    <a class="small" href="Beneficiario/RegistroAyuda">Registrate!</a>
                  </div>
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
