<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Layouts/Layout2.Master" AutoEventWireup="true" CodeBehind="Notificaciones.aspx.cs" Inherits="MinecPISI.Views.Administracion.Notificaciones" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cssextra" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contenidoNavegacion" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="bodyContentBlank" runat="server">
    <div class="card shadow mb-4">
        <div class="card-header py-3">
            <h6 class="  font-weight-bold text-primary">Centro de Notificaciones</h6>
        </div>
        <div class="card-body">
             <!-- Notificaciones del Beneficiario------------------------------------------------------------------------>
            <h5 class="text-secondary ml-3">Beneficiario</h5>
            <!-- Notifica al Beneficiario que se solicita informacion adicional para Precalificarlo -->
            <a class="dropdown-item d-flex align-items-center" href="#">
                <div class="mr-3">
                    <div class="icon-circle bg-warning">
                        <i class="fa fa-plus text-white"></i>
                    </div>
                </div>
                <div>
                    <div class="small text-gray-500">20 de Febrero de 2019</div>
                    <span>Debes ingresar documentación adicional para Precalificarte</span>
                </div>
            </a>
            <!-- Notifica al Beneficiario que tiene una nueva propuesta Solución -->
            <a class="dropdown-item d-flex align-items-center" href="#">
                <div class="mr-3">
                    <div class="icon-circle bg-primary">
                        <i class="fas fa-file-alt text-white"></i>
                    </div>
                </div>
                <div>
                    <div class="small text-gray-500">21 de Febrero de 2019</div>
                    <span>Tienes una nueva propuesta de Solución de <span class="font-weight-bold">UCA2003</span></span>
                </div>
            </a>
            <!-- Notifica al Beneficiario que es elegible -->
            <a class="dropdown-item d-flex align-items-center" href="#">
                <div class="mr-3">
                    <div class="icon-circle bg-success">
                        <i class="fas fa-check text-white"></i>
                    </div>
                </div>
                <div>
                    <div class="small text-gray-500">22 de Febrero de 2019</div>
                    <span class="font-weight-bold">¡Felicidades! Eres elegible para continuar en el Proceso</span>
                </div>
            </a>
            <!-- Notifica al Beneficiario que no es elegible -->
            <a class="dropdown-item d-flex align-items-center" href="#">
                <div class="mr-3">
                    <div class="icon-circle bg-danger">
                        <i class="fa fa-times text-white"></i>
                    </div>
                </div>
                <div>
                    <div class="small text-gray-500">23 de Febrero de 2019</div>
                    <span class="font-weight-bold">Lo sentimos mucho... No cumples con los requisitos para continuar en el Proceso</span>
                </div>
            </a>
            <!-- Notifica al Beneficiario que el Problema ha cambiado de estado -->
            <a class="dropdown-item d-flex align-items-center" href="#">
                <div class="mr-3">
                    <div class="icon-circle bg-success">
                        <i class="fa fa-bullhorn text-white"></i>
                    </div>
                </div>
                <div>
                    <div class="small text-gray-500">24 Febrero de 2019</div>
                    Tu Problema ha cambiado de estado                 
                </div>
            </a>
            <!-- Notifica de citas -->
            <a class="dropdown-item d-flex align-items-center" href="#">
                <div class="mr-3">
                    <div class="icon-circle bg-primary">
                        <i class="fa fa-calendar text-white"></i>
                    </div>
                </div>
                <div>
                    <div class="small text-gray-500">25 Febrero de 2019</div>
                   <span class="font-weight-bold"> Tienes una nueva cita agendada </span>
                </div>
            </a>
             <!--Notifica que un Formulador ha presentado una iniciativa -->
            <a class="dropdown-item d-flex align-items-center" href="#">
                <div class="mr-3">
                    <div class="icon-circle bg-success">
                        <i class="fa fa-flag text-white"></i>
                    </div>
                </div>
                <div>
                    <div class="small text-gray-500">01 Marzo de 2019</div>
                    <span class=" font-weight-bold">UCA2003</span> Ha presentado la iniciativa del Proyecto
                </div>
            </a>
            <!-- Notifica que el proyecto realizará el filtro técnico -->
            <a class="dropdown-item d-flex align-items-center" href="#">
                <div class="mr-3">
                    <div class="icon-circle bg-primary">
                        <i class="fa fa-cogs text-white"></i>
                    </div>
                </div>
                <div>
                    <div class="small text-gray-500">25 Febrero de 2019</div>
                    Se realizará el <span class="font-weight-bold">Filtro Técnico </span>a tu proyecto
                </div>
            </a>
            <!-- Notifica la iniciativa ha sido aprobada -->
            <a class="dropdown-item d-flex align-items-center" href="#">
                <div class="mr-3">
                    <div class="icon-circle bg-primary">
                        <i class="fa fa-star text-warning"></i>
                    </div>
                </div>
                <div>
                    <div class="small text-gray-500">25 Febrero de 2019</div>
                    <span class="font-weight-bold">¡Excelente! tu iniciativa ha sido aprobada</span>
                </div>
            </a>

            <!-- Notificaciones del Consultor de Vinculación----------------------------------------------------------------------->
            <h5 class="text-secondary ml-3">Consultor de Vinculación</h5>
            <!--Notifica que el Beneficiario ha ingresado la información adicional    -->
            <a class="dropdown-item d-flex align-items-center" href="#">
                <div class="mr-3">
                    <div class="icon-circle bg-success">
                        <i class="fa fa-plus text-white"></i>
                    </div>
                </div>
                <div>
                    <div class="small text-gray-500">26 Febrero de 2019</div>
                    <span class=" font-weight-bold">JJLopez93</span> Ha ingresado la información adicional
                </div>
            </a>
            <!--Notifica que uno de los proyectos que el tiene  ha cambiado de estado-->
            <a class="dropdown-item d-flex align-items-center" href="#">
                <div class="mr-3">
                    <div class="icon-circle bg-success">
                        <i class="fa fa-bullhorn text-white"></i>
                    </div>
                </div>
                <div>
                    <div class="small text-gray-500">27 Febrero de 2019</div>
                    El proyecto de <span class=" font-weight-bold">JJLopez93</span> ha cambiado de estado
                </div>
            </a>
             <!--Notifica que un Formulador ha presentado una iniciativa -->
            <a class="dropdown-item d-flex align-items-center" href="#">
                <div class="mr-3">
                    <div class="icon-circle bg-success">
                        <i class="fa fa-flag text-white"></i>
                    </div>
                </div>
                <div>
                    <div class="small text-gray-500">01 Marzo de 2019</div>
                    <span class=" font-weight-bold">UCA2003</span> Ha presentado la iniciativa para el Proyecto <span class=" font-weight-bold">PRY2019</span>
                </div>
            </a>
            <!--Notifica que  uno de sus proyectos ha recibido observaciones -->
            <a class="dropdown-item d-flex align-items-center" href="#">
                <div class="mr-3">
                    <div class="icon-circle bg-warning">
                        <i class="fa fa-search text-white"></i>
                    </div>
                </div>
                <div>
                    <div class="small text-gray-500">28 Febrero de 2019</div>
                    El proyecto <span class=" font-weight-bold">PRY2019</span> ha recibido observación en fase de Evaluación
                </div>
            </a>
             <!-- Notifica la iniciativa ha sido aprobada -->
            <a class="dropdown-item d-flex align-items-center" href="#">
                <div class="mr-3">
                    <div class="icon-circle bg-primary">
                        <i class="fa fa-star text-warning"></i>
                    </div>
                </div>
                <div>
                    <div class="small text-gray-500">25 Febrero de 2019</div>
                    <span class="font-weight-bold">¡Excelente! la iniciativa de JJLopez93 ha sido aprobada</span>
                </div>
            </a>
            <!--Notifica que uno de los Beneficiarios necesita comunicarse -->
            <a class="dropdown-item d-flex align-items-center" href="#">
                <div class="mr-3">
                    <div class="icon-circle bg-info">
                        <i class="fa fa-comment text-white"></i>
                    </div>
                </div>
                <div>
                    <div class="small text-gray-500">29 Febrero de 2019</div>
                    <span class=" font-weight-bold">JJLopez93</span> desea comunicarse contigo
                </div>
            </a>
            
            <!-- Notificaciones del Coordinador-------------------------------------------------------------------------------------->
            <h5 class="text-secondary ml-3">Coordinador de Fomento</h5>
            <!--Notifica que se ha registrado un Beneficiario a la plataforma  -->
            <a class="dropdown-item d-flex align-items-center" href="#">
                <div class="mr-3">
                    <div class="icon-circle bg-info">
                        <i class="fa fa-user-plus text-white"></i>
                    </div>
                </div>
                <div>
                    <div class="small text-gray-500">01 Marzo de 2019</div>
                    <span class=" font-weight-bold">Se ha registrado un nuevo Beneficiario a la plataforma</span>
                </div>
            </a>
            <!--Notifica que un beneficiario ha ingresado un problema -->
            <a class="dropdown-item d-flex align-items-center" href="#">
                <div class="mr-3">
                    <div class="icon-circle bg-info">
                        <i class="fa fa-file text-white"></i>
                    </div>
                </div>
                <div>
                    <div class="small text-gray-500">01 Marzo de 2019</div>
                    <span class=" font-weight-bold">JJLopez93</span> ha ingresado un nuevo problema
                </div>
            </a>
            <!--Notifica que un proyecto ha pasado a la etapa de evaluacion -->
            <a class="dropdown-item d-flex align-items-center" href="#">
                <div class="mr-3">
                    <div class="icon-circle bg-success">
                        <i class="fa fa-users text-white"></i>
                    </div>
                </div>
                <div>
                    <div class="small text-gray-500">01 Marzo de 2019</div>
                    El proyecto <span class=" font-weight-bold">PRY2019</span> ha pasado a la Etapa de Evaluación
                </div>
            </a>
            <!--Notifica que un Formulador ha planteado una iniciativa -->
            <a class="dropdown-item d-flex align-items-center" href="#">
                <div class="mr-3">
                    <div class="icon-circle bg-success">
                        <i class="fa fa-flag text-white"></i>
                    </div>
                </div>
                <div>
                    <div class="small text-gray-500">01 Marzo de 2019</div>
                    <span class=" font-weight-bold">UCA2003</span> Ha planteado una iniciativa para el Proyecto <span class=" font-weight-bold">PRY2019</span> 
                </div>
            </a>
            <!-- Notifica la iniciativa ha sido aprobada -->
            <a class="dropdown-item d-flex align-items-center" href="#">
                <div class="mr-3">
                    <div class="icon-circle bg-primary">
                        <i class="fa fa-star text-warning"></i>
                    </div>
                </div>
                <div>
                    <div class="small text-gray-500">25 Febrero de 2019</div>
                    <span class="font-weight-bold">La iniciativa que presentastó UCA2003 ha sido aprobada</span>
                </div>
            </a>
            <!--Notifica que se debe revisar la contrapartida  -->
            <a class="dropdown-item d-flex align-items-center" href="#">
                <div class="mr-3">
                    <div class="icon-circle bg-warning">
                        <i class="fa fa-folder text-white"></i>
                    </div>
                </div>
                <div>
                    <div class="small text-gray-500">01 Marzo de 2019</div>
                    Se necesita revisar la contrapartida del proyecto <span class=" font-weight-bold">PRY2019</span>
                </div>
            </a>

            <!-- Notificaciones del Formulador------------------------------------------------------------------------------------->
            <h5 class="text-secondary ml-3">Formulador</h5>
            
            <!--Notifica que Se ha publicado un problema -->
            <a class="dropdown-item d-flex align-items-center" href="#">
                <div class="mr-3">
                    <div class="icon-circle bg-info">
                        <i class="fa fa-file text-white"></i>
                    </div>
                </div>
                <div>
                    <div class="small text-gray-500">01 Abril de 2019</div>
                    Se ha publicado un nuevo problema, ¡Haz una <span class=" font-weight-bold">Propuesta de Solución</span>!
                </div>
            </a>
            <!--Notifica que el proyecto ha recibido obseracion -->
            <a class="dropdown-item d-flex align-items-center" href="#">
                <div class="mr-3">
                    <div class="icon-circle bg-warning">
                        <i class="fa fa-search text-white"></i>
                    </div>
                </div>
                <div>
                    <div class="small text-gray-500">02 Abril de 2019</div>
                    Has recibido observación del proyecto <span class=" font-weight-bold">PRY2019</span> en fase de Evaluación
                </div>
            </a>
            <!--Notifica que se aprob'o la propuesta solucion -->
            <a class="dropdown-item d-flex align-items-center" href="#">
                <div class="mr-3">
                    <div class="icon-circle bg-success">
                        <i class="fa fa-check text-white"></i>
                    </div>
                </div>
                <div>
                    <div class="small text-gray-500">02 Abril de 2019</div>
                    Tu Propuesta de Solución fué Aceptada, <span class=" font-weight-bold"> ¡Plantea la iniciativa!</span>
                </div>
            </a>
            <!-- Notifica la iniciativa ha sido aprobada -->
            <a class="dropdown-item d-flex align-items-center" href="#">
                <div class="mr-3">
                    <div class="icon-circle bg-primary">
                        <i class="fa fa-star text-warning"></i>
                    </div>
                </div>
                <div>
                    <div class="small text-gray-500">25 Febrero de 2019</div>
                    <span class="font-weight-bold">¡Excelente! la iniciativa que presentaste ha sido aprobada</span>
                </div>
            </a>
            <!-- Notificaciones del Comité de Evaluación------------------------------------------------------------------------------------->
           <h5 class="text-secondary ml-3">Comité de Evaluación</h5>
            <a class="dropdown-item d-flex align-items-center" href="#">
                <div class="mr-3">
                    <div class="icon-circle bg-success">
                        <i class="fa fa-exclamation-circle text-white"></i>
                    </div>
                </div>
                <div>
                    <div class="small text-gray-500">25 Febrero de 2019</div>
                    <span class="font-weight-bold"> Se debe evaluar la iniciativa del proyecto PRY2019</span>
                </div>
            </a>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="jsextra" runat="server">
</asp:Content>
