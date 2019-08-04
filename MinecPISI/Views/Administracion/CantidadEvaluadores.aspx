<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Layouts/Layout2.Master" AutoEventWireup="true" CodeBehind="CantidadEvaluadores.aspx.cs" Inherits="MinecPISI.Views.Administracion.CantidadEvaluadores"%>
<asp:Content ID="Content1" ContentPlaceHolderID="cssextra" runat="server">
    <link href="<%= ResolveClientUrl("~/Views/css/leaflet.css") %>" rel="stylesheet">
    <style>
        table{
            border: 0.3px solid gray !important;
        }
        td{
            border: 0.3px solid gray !important;
        }
        th{
            width:400px;
            border: 0.3px solid gray !important;
        }
        .celda{
            width:30px;
            border: 0.3px solid gray !important;
        }
        .celda:hover{
            background:rgba(78,115,223,0.5);
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contenidoNavegacion" runat="server">
    
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="bodyContentBlank" runat="server">
       
       <div class="card shadow mb-4">
    <div class="card-header py-3">
        <h6 class="  font-weight-bold text-primary">Administrar Evaluadores</h6>

    </div>

    <div class="card-body">

    <form runat="server" id="form">
       
                    <div class="form-group col-md-5">
                        <label>Cantidad de evaluadores :</label>                       
                        <asp:TextBox runat="server" type="number" id="cantidad" name="cantidad" class="form-control" MinimumValue ='1' MaximumValue ='cantEvaluadores.CantUserEval'/>      
                    </div>                             
                  <asp:Button runat="server" ID="btnactualizar" CssClass="btn btn-success"  OnClick="btnactualizar_Click" Text="Actualizar" UseSubmitBehavior="True" />           
    </form>

        </div>
           </div>
</asp:Content>

