<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Layouts/Layout2.Master" AutoEventWireup="true" CodeBehind="FiltroTecnico.aspx.cs" Inherits="MinecPISI.Views.Formulacion.FiltroTecnico" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cssextra" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contenidoNavegacion" runat="server">
    <hr class="sidebar-divider">    
        <li class="nav-item">
            <a class="nav-link" href="/Casos/Consulta">
                <i class="fas fa-fw fa-arrow-circle-left"></i>
                <span>Regresar</span>
            </a>
        </li>  
    <!--#include file="~/Views/Navegacion/Coordinador.html"-->
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="bodyContentBlank" runat="server">
    <div class="card shadow mb-4">
        <div class="card-header py-3">
            <h5 class="font-weight-bold text-primary">Filtro Técnico</h5>
        </div>
        <div class="card-body">
            <h6 class="  font-weight-bold text-secondary  mb-4">Pertinencia, Resultados y Capacidad de Ejecución</h6>
            <div class="table-responsive">
                <table class="table table-bordered">
                    <thead class="text-center">
                        <tr>
                            <th>Criterio</th>
                            <th>Campo</th>
                            <th>Puntaje</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td rowspan="2">El grado de pertinencia para el beneficiario de la iniciativa y la solución</td>
                            <td><span class="font-weight-bolder mr-2">1.</span>La iniciativa soluciona un cuello de botella, o un límite (Físico / Intangible), o garantiza la solución de un problema operacional para el beneficiario</td>
                            <td>
                                <div class="form-group">
                                    <select class="form-control" id="nota">
                                        <option>0</option>
                                        <option>1</option>
                                        <option>2</option>
                                    </select>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td><span class="font-weight-bolder mr-2">2.</span> El monto de fondos solicitados al FONDEPRO es coherente con el tipo de iniciativa</td>
                            <td>
                                <div class="form-group">
                                    <select class="form-control" id="nota02">
                                        <option>0</option>
                                        <option>1</option>
                                    </select>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td rowspan="4">Resultados</td>
                            <td><span class="font-weight-bolder mr-2">1.</span>Los beneficios de ejecutar la iniciativa son o se vuelven de carácter permanentes</td>
                            <td>
                                <div class="form-group">
                                    <select class="form-control" id="nota03">
                                        <option>0</option>
                                        <option>1</option>
                                    </select>
                                </div>
                            </td>
                        </tr>
                        <tr>

                            <td><span class="font-weight-bolder mr-2">2.</span>El resultado de ejecutar la iniciativa tiene efecto directamente en sus ventas, o en su capacidad de acceder nuevos mercados, o en su capacidad de acceder nuevos mercados, o incrementar su participación en el mercado actual</td>
                            <td>
                                <div class="form-group">
                                    <select class="form-control" id="nota04">
                                        <option>0</option>
                                        <option>1</option>
                                        <option>2</option>
                                    </select>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td><span class="font-weight-bolder mr-2">3.</span>Los resultados potenciales esperados superan la inversión propuesta</td>
                            <td>
                                <div class="form-group">
                                    <select class="form-control" id="nota05">
                                        <option>0</option>
                                        <option>1</option>
                                    </select>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td><span class="font-weight-bolder mr-2">4.</span>La iniciativa presenta los indicadores de resultado</td>
                            <td>
                                <div class="form-group">
                                    <select class="form-control" id="nota06">
                                        <option>0</option>
                                        <option>1</option>
                                    </select>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td rowspan="2">Capacidad de ejecución</td>
                            <td><span class="font-weight-bolder mr-2">1.</span>El Beneficiario cuenta con la infraestructura física para ejecutar la iniciativa</td>
                            <td>
                                <div class="form-group">
                                    <select class="form-control" id="nota07">
                                        <option>0</option>
                                        <option>1</option>
                                    </select>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td><span class="font-weight-bolder mr-2">2.</span>El Beneficiario puede darle continuidad a la iniciativa después de la ejecución</td>
                            <td>
                                <div class="form-group">
                                    <select class="form-control" id="nota08">
                                        <option>0</option>
                                        <option>1</option>
                                    </select>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">Máximo puntaje posible</td>
                            <td class="font-weight-bolder">10.00</td>
                        </tr>
                        <tr>
                            <td colspan="2">Nota mínima de aprobación</td>
                            <td class="font-weight-bolder">7.00</td>
                        </tr>
                        <tr>
                            <td colspan="2">Puntaje de la Iniciativa</td>
                            <td class="font-weight-bolder">8.00</td>
                        </tr>
                    </tbody>
                </table>
            </div>
            <h6 class="  font-weight-bold text-secondary  mt-4">Innovación y Diversificación</h6>
            <div class="table-responsive">
                <table class="table table-bordered">
                    <thead class="text-center">
                        <tr>
                            <th>Criterio</th>
                            <th>Campo</th>
                            <th>Puntaje</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td rowspan="3">La viabilidad técnica de la ejecución de la iniciativa y los resultados técnicos esperados</td>
                            <td><span class="font-weight-bolder mr-2">1.</span>La justificación de la selección de solución o forma de aprovechar la oportunidad es clara</td>
                            <td>
                                <div class="form-group">
                                    <select class="form-control" id="nota09">
                                        <option>0</option>
                                        <option>1</option>
                                    </select>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td><span class="font-weight-bolder mr-2">2.</span>El cambio a realizar en la tecnología, el producto, proceso u operaciones actuales, es claro y alcanzable en el período y tiempo estipulado</td>
                            <td>
                                <div class="form-group">
                                    <select class="form-control" id="nota10">
                                        <option>0</option>
                                        <option>1</option>
                                        <option>2</option>
                                    </select>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td><span class="font-weight-bolder mr-2">3.</span>La iniciativa presenta el análisis y selección de: Tecnología(dura / blanda), maquinaria, equipo y proveedores, según el caso
                                <p>Es factible en términos de costo / beneficio</p>
                            </td>
                            <td>
                                <div class="form-group">
                                    <select class="form-control" id="nota11">
                                        <option>0</option>
                                        <option>1</option>
                                        <option>2</option>
                                    </select>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td rowspan="2">El grado de innovación de la iniciativa </td>
                            <td><span class="font-weight-bolder mr-2">1.</span>La iniciativa implica una innovación a nivel de la operación actual del Beneficiario y logra evidenciarse el efecto en las ventas esperadas</td>
                            <td>
                                <div class="form-group">
                                    <select class="form-control" id="nota12">
                                        <option>0</option>
                                        <option>1</option>
                                        <option>2</option>
                                        <option>3</option>
                                    </select>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td><span class="font-weight-bolder mr-2">2.</span>La innovación potencia otros procesos y/u operaciones en la operación del beneficiario</td>
                            <td>
                                <div class="form-group">
                                    <select class="form-control" id="nota13">
                                        <option>0</option>
                                        <option>1</option>
                                        <option>2</option>
                                    </select>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">Máximo puntaje posible</td>
                            <td class="font-weight-bolder">10.00</td>
                        </tr>
                        <tr>
                            <td colspan="2">Nota mínima de aprobación</td>
                            <td class="font-weight-bolder">7.00</td>
                        </tr>
                        <tr>
                            <td colspan="2">Puntaje de la Iniciativa</td>
                            <td class="font-weight-bolder">9.00</td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
        <div class="text-center mt-4 mb-4">
            <button class="btn btn-success btn-icon-split mb-1" type="submit">
                <span class="icon text-white-50">
                    <i class="fas fa-check"></i>
                </span>
                <span class="text">Aprobar Filtro Técico</span>
            </button>
            <a class="btn btn-warning btn-icon-split text-white mb-1" data-toggle="modal" data-target="#RecomendacionesModal">
                <span class="icon text-white-50">
                    <i class="fas fa-info-circle"></i>
                </span>
                <span class="text">Hacer Observaciones</span>
            </a>
        </div>
        <!--Modal hacer observaciones -->
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
                            <textarea class="form-control" id="recomendacionesInput" placeholder="Ingresa las Observaciones que tienes para esta iniciativa"></textarea>
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
    </div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="jsextra" runat="server">
</asp:Content>
