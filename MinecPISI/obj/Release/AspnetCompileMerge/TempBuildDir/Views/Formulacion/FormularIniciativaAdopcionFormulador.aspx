<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Layouts/Layout2.Master" AutoEventWireup="true" CodeBehind="FormularIniciativaAdopcionFormulador.aspx.cs" Inherits="MinecPISI.Views.Formulacion.FormularIniciativaAdopcionFormulador" %>
<asp:Content ID="Content1" ContentPlaceHolderID="cssextra" runat="server">
    <style>
        th{
            width:400px;
        }
        .celda{
            width:30px;
        }
        .celda:hover{
            background:rgba(78,115,223,0.5);
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contenidoNavegacion" runat="server">
    
    <hr class="sidebar-divider">
    <!--#include file="~/Views/Navegacion/Formulador.html"-->
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="bodyContentBlank" runat="server">
    <div class="card shadow mb-4">
        <div class="card-header py-3">
            <h6 class="  font-weight-bold text-primary">Iniciativa de Adopción tecnológica</h6>
        </div>
        <div class="card-body">
            <nav>
              <div class="nav nav-tabs" id="nav-tab" role="tablist">
                <a class="nav-item nav-link active" id="nav-planteamiento-tab" data-toggle="tab" href="#nav-planteamiento" role="tab" aria-controls="nav-planteamiento" aria-selected="true">Planteamiento #1</a>
                <a class="nav-item nav-link" id="nav-adopcion-tab" data-toggle="tab" href="#nav-adopcion" role="tab" aria-controls="nav-adopcion" aria-selected="false">Planteamiento #2</a>
                <a class="nav-item nav-link" id="nav-adopcion-2-tab" data-toggle="tab" href="#nav-adopcion-2" role="tab" aria-controls="nav-adopcion-2" aria-selected="false">Planteamiento #3</a>
                <a class="nav-item nav-link" id="nav-contrapartida-tab" data-toggle="tab" href="#nav-contrapartida" role="tab" aria-controls="nav-contrapartida" aria-selected="false">Contrapartida</a>
                <a class="nav-item nav-link" id="nav-matriz-tab" data-toggle="tab" href="#nav-matriz" role="tab" aria-controls="nav-matriz" aria-selected="false">Adopción o incorporación Tecnológica</a>
              </div>
            </nav>
            <form class="tab-content" id="nav-tabContent" method="post">
                
                  <div class="tab-pane fade show active" id="nav-planteamiento" role="tabpanel" aria-labelledby="nav-planteamiento-tab">
                      <div class="form-group mt-2">
                          <label>Planteamiento del problema u oportunidad a ser aprovechada</label>
                          <textarea class="form-control" required="required" placeholder="Ingrese el planteamiento u oportunidad" name="planteamiento" id="planteamiento" rows="4"></textarea>
                      </div>
                      <div class="form-group">
                          <label>Planteamiento descriptivo de la solución o Problema u oportunidad</label>
                          <textarea class="form-control" required="required" placeholder="Ingrese la descripción de la solución" rows="4" name="descripcionSolucion"></textarea>
                      </div>
                       <div class="form-group">
                          <label>Descripción de la Relevancia para el beneficiario del Beneficiario de la Operación y o Producto a ser afectado con el proyecto o solución</label>
                          <textarea class="form-control" required="required" placeholder="Ingrese la descripción de la revelancia de la operacion" rows="4" name="descripcionRelevancia" id="descripcionRelevancia"></textarea>
                      </div>
                      <div class="form-group">
                          <label>Incrementos esperados en ventas o mejora de la productividad del Beneficiario</label>
                          <textarea class="form-control" required="required" placeholder="Ingrese los incrementos esperados" rows="4" name="incrementosEsperados" id="incrementosEsperados"></textarea>
                      </div>
                      <div class="form-group">
                          <label>Incrementos en ventas o mejora de la productividad del Beneficiario</label>
                          <textarea class="form-control" required="required" placeholder="Ingrese los incrementos en ventas" rows="4" name="incrementosEnVentas" id="incrementosEnVentas"></textarea>
                      </div>
                      <div class="form-group">
                          <label>¿Tipo de ejecución?</label>
                         <div class="form-check form-check-inline">
                          <input class="form-check-input" type="radio" name="ejecucion" id="ejecucionSolo" value="Ejecución Solo" checked>
                          <label class="form-check-label" >
                            Ejecución Solo
                          </label>
                        </div>
                        <div class="form-check form-check-inline">
                          <input class="form-check-input" type="radio" name="ejecucion" id="ejecucionAsistida" value="Ejecución Asistida">
                          <label class="form-check-label">
                            Ejecución Asistida
                          </label>
                        </div>
                      </div>

                  </div>
                  <div class="tab-pane fade" id="nav-adopcion" role="tabpanel" aria-labelledby="nav-adopcion-tab">
                      <div class="form-group mt-2">
                          <label>Adopción o incorporación Tecnológica</label>
                          <textarea class="form-control" required="required" placeholder="Descripción de la solución, del equipo sus componentes" name="adopcionTec" id="adopcionTec" rows="4"></textarea>
                      </div>
                      <div class="form-group">
                          <label>Efectos esperados sobre el problema</label>
                          <textarea class="form-control" required="required" placeholder="Como modifica o acciona sobre el problema" name="efectosEsperados" id="efectosEsperados" rows="4"></textarea>
                      </div>
                      <div class="form-group">
                          <label>Efectos esperados sobre  el negocio</label>
                          <textarea class="form-control" required="required" placeholder="Como modifica o acciona sobre el problema" name="efectosEsperadosNegocio" id="efectosEsperadosNegocio" rows="4"></textarea>
                      </div>
                      <div class="form-group">
                          <label>Justificación de la tecnología propuesta</label>
                          <textarea class="form-control" required="required" placeholder="Justifique la tecnología propuesta" name="justificacion" id="justificacion" rows="4"></textarea>
                      </div>
                  </div>
                  <div class="tab-pane fade" id="nav-adopcion-2" role="tabpanel" aria-labelledby="nav-adopcion-2-tab">
                       <div class="form-group mt-2">
                          <label>Incrementos esperados en el margen de utilidad</label>
                          <textarea class="form-control" required="required" placeholder="Ingrese los margenes esperados de utilidad" name="margenUtilidad" id="margenUtilidad" rows="4"></textarea>
                      </div>
                      <div class="form-group mt-2">
                          <label>Incremento en la producción actual</label>
                          <textarea class="form-control" required="required" placeholder="Ingrese el incremento de la produccion actual" name="incrementoProduccion" id="incrementoProduccion" rows="4"></textarea>
                      </div>
                      <div class="form-group mt-2">
                          <label>¿Como se colocara el nuevo volumen en el mercado?</label>
                          <textarea class="form-control" required="required" placeholder="Explique como se colocara el nuevo volumen en el mercado" name="nuevoVolumen" id="nuevoVolumen" rows="4"></textarea>
                      </div>
                      <div class="form-group mt-2">
                          <label>Disminuir el consumo de energía o combustible en la producción, recolección, procesos y entrega de los bienes actuales</label>
                          <textarea class="form-control" required="required" placeholder="Explique como disminuir los consumos o procesos actuales" name="disminucionConsumo" id="disminucionConsumo" rows="4"></textarea>
                      </div>
                      <div class="form-group mt-2">
                          <label>Reducir el consumo de materia prima con tecnología no utilizada actualmente por el beneficiario.</label>
                          <textarea class="form-control" required="required" placeholder="Explique como disminuir los consumos de materia prima" name="disminucionConsumoMateria" id="disminucionConsumoMateria" rows="4"></textarea>
                      </div>
                      <div class="form-group mt-2">
                          <label>Otros a ser considerados </label>
                          <textarea class="form-control" required="required" placeholder="Agregue informacion adicional" name="otrosInfo" id="otrosInfo" rows="4"></textarea>
                      </div>
                      <div class="form-group mt-2">
                          <label>Componentes o tecnología Adicional  necesaria para el funcionamiento de la tecnología</label>
                          <textarea class="form-control" required="required" placeholder="Componentes o tecnología adicional" name="componentesAdicionales" id="componentesAdicionales" rows="4"></textarea>
                      </div>
                  </div>
                  <div class="tab-pane fade" id="nav-contrapartida" role="tabpanel" aria-labelledby="nav-contrapartida-tab">
                     <div class="form-group mt-2">
                          <label>Descripción de la Contrapartida</label>
                          <textarea class="form-control" required="required" placeholder="Componentes o tecnología adicional" name="descripcionContrapartida" id="montoAdocion"></textarea>
                      </div>
                      <div class="form-group mt-2">
                          <div class="row">
                              <label class="col-md-6">Monto de Adopción o incorporación tecnológica</label>
                              <input class="form-control col-md-5" type="number" step="any" required="required" name="montoAdopcion" id="montoAdopcion">
                          </div>
                      </div>
                      <div class="form-group mt-2">
                          <div class="row">
                              <label class="col-md-6">Montos de componentes acciones y/o tecnología Adicional  necesaria para la Adquisición, internación, instalación y/o el funcionamiento de la tecnología</label>
                              <input class="form-control col-md-5" type="number" step="any" required="required" name="montoComponentes" id="montoComponentes">
                          </div>
                      </div>
                      <div class="form-group mt-2">
                          <div class="row">
                              <label class="col-md-6">Otros a ser considerados</label>
                              <input class="form-control col-md-5" type="number" step="any" required="required" name="montoOtros" id="montoOtros">
                          </div>
                      </div>
                      <hr class="divider" />
                      <h4><b>Descripción de Contrapartida</b></h4>
                      
                      <div class="form-group mt-2">
                          <div class="row">
                              <label class="col-md-2">Descripcion del monto en especies</label>
                              <textarea class="form-control col-md-6" id="descripMontoEspecies" name="descripMontoEspecies" placeholder="Justifique el monto en especies por el beneficiario"></textarea>
                          </div>
                      </div>
                      <div class="form-group">
                          <div class="row">
                              <label class="col-md-2">Monto en Especies</label>
                              <input value="0,00" class="form-control col-md-2 monto" type="number" step="any" required="required" name="montoEspecies" id="montoEspecies">
                          </div>
                      </div>
                      <div class="form-group mt-2">
                          <div class="row">
                              <label class="col-md-2">Descripcion del monto en especies</label>
                              <textarea class="form-control col-md-6" id="descripMontoEfectivo" name="descripMontoEfectivo" placeholder="Justifique el monto en efectivo por el beneficiario"></textarea>
                          </div>
                      </div>
                      <div class="form-group">
                          <div class="row">
                              <label class="col-md-2">Monto en Efectivo</label>
                              <input value="0.00" class="form-control col-md-2 monto" type="number" step="any" required="required" name="montoEfectivo" id="montoEfectivo">
                          </div>
                      </div>
                      <div class="form-group">
                          <div class="row">
                              <label class="col-md-2">Monto Contrapartida del Beneficiario</label>
                              <input value="0,00" id="montoTotalContrapartida" class="form-control col-md-2" disabled="disabled" type="number" step="any">
                          </div>
                      </div>
                      <hr class="divider" />
                      <div class="form-group">
                          <div class="row">
                              <label class="col-md-2">Valor del Proyecto</label>
                              <input value="0.00" class="form-control col-md-2" type="number" step="any" required="required" name="montoProyecto" id="montoProyecto">
                          </div>
                      </div>
                      <div class="form-group">
                          <div class="row">
                              <label class="col-md-2">Monto a ser Cofinanciado</label>
                              <input value="0,00" class="form-control col-md-2" type="number" step="any" required="required" name="montoCofinanciado" id="montoCofinanciado">
                          </div>
                      </div>
                  </div>
                  <div class="tab-pane fade" id="nav-matriz" role="tabpanel" aria-labelledby="nav-matriz-tab">
                      <div class="mt-2 row">
                          <div class="form-group col-md-4">
                              <label>Digite la fecha de inicio</label>
                              <input type="date" class="form-control" id="inputfecha" />
                          </div>
                      </div>
                      <div class="row mt-3">
                        <div class="col">
                            <div class="row">
                                <p class="col-md-6">La tecnología se encuentra disponible localmente</p>
                                <input checked id="checkCron" type="checkbox"  class="col-md-1 form-control mr-2 text-white">
                            </div>
                            
                            <div class="row mb-5" style="overflow-x:auto">
                                <table class="col" id="table-cron">
                                </table>
                            </div>
                        </div>
                    </div>

                      <input id="semanasSelec" type="text"  class="d-none" />
                      <button class="btn btn-success" type="submit">Guardar Iniciativa</button>
                  </div>
                
              
            </form>
                
        </div>
    </div>

</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="jsextra" runat="server">
<script src="<%= ResolveClientUrl("~/Views/js/Cronograma.js" +
    "" +
    "") %>"></script>
 <script>
     



     $(document).ready(function () {
         var headers = [
        "Adopción o incorporación Tecnológica",
        "Componentes, tecnología Adicional",
        "Otros a ser considerados ",
        "Monto Contra partida Beneficiario"
    ]
         var cronograma = new $.Cronograma($('#table-cron'), {
             'numMonth': 3,
             'dateStart':new Date(),
             'subHeaders': headers,
             //habilita las funciones de manejar eventos
             'eventos': true
         });

         $('#checkCron').click(function () {
             if (cronograma.settings.numMonth == 3) {
                 cronograma.settings.numMonth = 6;
                 cronograma.Reload(cronograma.settings.dateStart);
                 cronograma.clickEvent();
             } else {
                 cronograma.settings.numMonth = 3;
                 cronograma.Reload(cronograma.settings.dateStart);
                 cronograma.clickEvent();
             }
         });
         $('#inputfecha').change(function () {
             cronograma.Reload($(this).val());
             cronograma.clickEvent();
         });
         //para obtener los eventos registrados
         console.log(cronograma.getEvents());
     });



     
     $('#montoEspecies').change(function () {
         $('#montoTotalContrapartida').val(parseFloat($('#montoEspecies').val()) + parseFloat($('#montoEfectivo').val()));
     });
     $('#montoEfectivo').change(function () {
         $('#montoTotalContrapartida').val(parseFloat($('#montoEspecies').val()) + parseFloat($('#montoEfectivo').val()));
     });
 </script>
</asp:Content>
