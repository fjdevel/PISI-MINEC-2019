<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Layouts/Layout2.Master" AutoEventWireup="true" CodeBehind="EvaluarIniciativa.aspx.cs" Inherits="MinecPISI.Views.Formulacion.EvaluarIniciativa" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cssextra" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contenidoNavegacion" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="bodyContentBlank" runat="server">
    <div class="card shadow mb-4">
        <div class="card-header py-3">
            <h5 class="font-weight-bold text-primary">Evaluar la iniciativa</h5>
        </div>
        <div class="card-body">
            <h6 class="  font-weight-bold text-secondary  mb-4">Comité evaluador de FONDEPRO</h6>
            <div class="table-responsive">
                <table class="table table-bordered">
                    <thead class="text-center">
                        <tr>
                            <th>Criterio</th>
                            <th>Puntaje</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td><span class="font-weight-bolder mr-2">1.</span>El Beneficiario tiene total conocimiento y dominio de iniciativa, conoce la solución planteada y tiene expectativas de los resultados</td>
                            <td>
                                <div class="form-group">
                                    <select class="form-control" id="nota01">
                                        <option>0</option>
                                        <option>1</option>
                                    </select>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td><span class="font-weight-bolder mr-2">2.</span>La iniciativa genera diversificación productiva</td>
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
                            <td><span class="font-weight-bolder mr-2">3.</span>La iniciativa tiene la posibilidad de beneficiar a otras empresas del mismo rubro con su testimonio</td>
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
                            <td><span class="font-weight-bolder mr-2">4.</span>La ejecución de la iniciativa brindará los beneficios esperados en menos de seis meses de haber concluido</td>
                            <td>
                                <div class="form-group">
                                    <select class="form-control" id="nota04">
                                        <option>0</option>
                                        <option>1</option>
                                    </select>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td><span class="font-weight-bolder mr-2">5.</span>Los beneficios tendrán que aumentar o al menos serán estables en el tiempo</td>
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
                            <td><span class="font-weight-bolder mr-2">6.</span>La iniciativa tiene el potencial de  detonar otros proyectos de inversión en la zona</td>
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
                            <td><span class="font-weight-bolder mr-2">7.</span>La ejecución de la iniciativa tiene potencial de generar empleos</td>
                            <td>
                                <div class="form-group">
                                    <select class="form-control" id="nota07">
                                        <option>0</option>
                                        <option>1</option>
                                        <option>2</option>
                                    </select>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td><span class="font-weight-bolder mr-2">8.</span>La ejecución de la iniciativa tiene el potencial de incrementar las ventas</td>
                            <td>
                                <div class="form-group">
                                    <select class="form-control" id="nota08">
                                        <option>0</option>
                                        <option>1</option>
                                        <option>2</option>
                                    </select>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>Máximo puntaje posible</td>
                            <td class="font-weight-bolder">10.00</td>
                        </tr>
                        <tr>
                            <td>Nota mínima de aprobación</td>
                            <td class="font-weight-bolder">7.00</td>
                        </tr>
                        <tr>
                            <td>Puntaje de la iniciativa</td>
                            <td class="font-weight-bolder">9.00</td>
                        </tr>
                    </tbody>
                </table>
            </div>

            <div class="text-center mt-4 mb-4">
                <button class="btn btn-success btn-icon-split mb-1" type="submit">
                    <span class="icon text-white-50">
                        <i class="fas fa-check"></i>
                    </span>
                    <span class="text">Aprobar Iniciativa</span>
                </button>
                <button class="btn btn-danger btn-icon-split mb-1" type="submit">
                    <span class="icon text-white-50">
                        <i class="fas fa-exclamation-triangle"></i>
                    </span>
                    <span class="text">Denegar Iniciativa</span>
                </button>
            </div>
        </div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="jsextra" runat="server">
</asp:Content>
