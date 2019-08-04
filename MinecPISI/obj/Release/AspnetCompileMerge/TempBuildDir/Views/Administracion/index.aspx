<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Layouts/Layout1.Master" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="MinecPISI.Views.Administracion.index" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cssextra" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="bodyContent" runat="server">
       <div class="row justify-content-center">
           <nav class="navbar navbar-expand-lg navbar-light bg-light col-md-12">
  
  <div class="collapse navbar-collapse" id="navbarNav">
    <ul class="navbar-nav">
      <li class="nav-item active">
        <a class="nav-link" href="<%Response.Write(HttpContext.Current.Request.ApplicationPath);%>/login">LOGIN <span class="sr-only">(current)</span></a>
      </li>
    </ul>
  </div>
</nav>
           
    <div id="carouselExampleControls" class="carousel slide" data-ride="carousel">
        <div class="carousel-inner">
            <div class="carousel-item active">
                <img class="d-block w-100" src="<%= ResolveUrl("~/Views/img/IMG02.jpg") %>" alt="PISI">
            </div>
            <div class="carousel-item">
                <img class="d-block w-100" src="<%= ResolveUrl("~/Views/img/IMG03.png") %>" alt="PISI">
            </div>
            <div class="carousel-item">
                <img class="d-block w-100" src="<%= ResolveUrl("~/Views/img/IMG04.png") %>" alt="Third slide">
            </div>
        </div>
        <a class="carousel-control-prev" href="#carouselExampleControls" role="button" data-slide="PISI">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="sr-only">Anterior</span>
        </a>
        <a class="carousel-control-next" href="#carouselExampleControls" role="button" data-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="sr-only">Siguiente</span>
        </a>
    </div>
    <div class="row">
        <div class="col-sm-6">
            <div class="card">
                <div class="card-body">
                    <h5 class="card-title">PISI</h5>
                    <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam.</p>
                    <a href="#" class="btn btn-info">ir</a>
                </div>
            </div>
        </div>
        <div class="col-sm-6">
            <div class="card">
                <div class="card-body">
                    <h5 class="card-title">PISI</h5>
                    <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam.</p>
                    <a href="#" class="btn btn-info">ir</a>
                </div>
            </div>
        </div>
    </div>
       </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="jsextra" runat="server">
</asp:Content>
