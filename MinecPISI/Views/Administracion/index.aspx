<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Layouts/Layout1.Master" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="MinecPISI.Views.Administracion.index" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cssextra" runat="server">
    <style>
        .bg-gradient-primary{
            background: linear-gradient(135deg, rgba(255,255,255,1) 0%, rgba(245,245,245,1) 47%, rgba(201,195,201,1) 100%) !important;
        }
        .nav-item:hover{
            background-color:rgba(28,165,243,0.7);
            
        }
        .nav-item,.nav-link{
            transition: all 0.3s ease-out;
        }
        .navbar-light .navbar-nav .nav-link:focus, .navbar-light .navbar-nav .nav-link:hover {
            color: rgba(255,255,255,1);
        }
        .light-overlay, .dark-overlay, .gradient-overlay {
    position: relative;
    overflow: hidden;
}
        .pb-7, .py-7 {
    padding-bottom: 8rem !important;
}
        .pt-7, .py-7 {
    padding-top: 8rem !important;
}
.position-relative {
    position: relative !important;
}
.light-overlay .overlay-content, .dark-overlay .overlay-content, .gradient-overlay .overlay-content {
    position: relative;
    z-index: 20;
}
img.bg-image {
    font-family: 'object-fit: cover;';
    -o-object-fit: cover;
    object-fit: cover;
}
.bg-image {
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    z-index: 0;
}
img {
    vertical-align: middle;
    border-style: none;
}
.bg-morado-light{
    background-color:rgba(141,107,161,0.7) !important;
}
.text-verde{
    color:rgb(172,211,115) !important;
}
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="bodyContent" runat="server">
    <header class="header">
        <nav id="navbar1" class="navbar navbar-expand-lg fixed-top shadow navbar-light bg-white">
            <div class="container-fluid">
          <div class="d-flex align-items-center"><a  href="<%Response.Write(HttpContext.Current.Request.ApplicationPath);%>" class="navbar-brand py-1">
              <img src="<%= ResolveUrl("~/Views/img/letras-logo.JPG") %>" width="110"></a>
          </div>
          <button type="button" data-toggle="collapse" data-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation" class="navbar-toggler navbar-toggler-right"><i class="fa fa-bars"></i></button>
          <!-- Navbar Collapse -->
          <div id="navbarCollapse" class="collapse navbar-collapse">
            
            <ul class="navbar-nav ml-auto">
              <li class="nav-item"><a href="<%Response.Write(HttpContext.Current.Request.ApplicationPath);%>/Beneficiario/RegistroAyuda" class="nav-link">Registrar Beneficiario</a></li>
              <li class="nav-item"><a href="<%Response.Write(HttpContext.Current.Request.ApplicationPath);%>/Formulacion/Registro" class="nav-link">Registrar Formulador</a></li>
              <li class="nav-item"><a href="<%Response.Write(HttpContext.Current.Request.ApplicationPath);%>/login" class="nav-link">Inicio de sesion</a></li>
            </ul>
          </div>
        </div>
        </nav>
    </header>
    <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
        <ol class="carousel-indicators">
            <li data-target="#reg-bebe" data-slide-to="0" class="active"></li>
            <li data-target="#reg-form" data-slide-to="1"></li>
            <li data-target="#reg-cons" data-slide-to="2"></li>
        </ol>
         <div class="carousel-inner">
             <section class="py-7  dark-overlay carousel-item active" id="reg-bene"><img src="<%= ResolveUrl("~/Views/img/pescador.jpg") %>"class="bg-image">
              <div class="container">
                <div class="overlay-content text-white py-lg-5 ">
                  <h1 class="display-3  mb-5 ">¿Deseas ser parte del  Proyecto Especial de Pequeñas Inversiones para Soluciones Innovadoras?</h1>
                    <a href="<%Response.Write(HttpContext.Current.Request.ApplicationPath);%>/Beneficiario/RegistroAyuda" class="btn btn-info"><h5>Registrarme como Beneficiario</h5></a>
                </div>
              </div>
            </section>
            
             <section class="py-7  dark-overlay carousel-item" id="reg-cons"><img src="<%= ResolveUrl("~/Views/img/fish.jpg") %>"class="bg-image">
              <div class="container">
                <div class="overlay-content text-white py-lg-5 ">
                  <h1 class="display-3  mb-5 ">Registro para Formuladores</h1>
                    <a href="<%Response.Write(HttpContext.Current.Request.ApplicationPath);%>/Formulacion/Registro" class="btn btn-info"><h5>Registrarme como Formulador</h5></a>
                </div>
              </div>
            </section>
         </div>
        
        <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="sr-only">Previous</span>
          </a>
          <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="sr-only">Next</span>
          </a>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="jsextra" runat="server">
 <script>
 </script>
</asp:Content>
