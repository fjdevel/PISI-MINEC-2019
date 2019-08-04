<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Layouts/Layout2.Master" AutoEventWireup="true" CodeBehind="FormularIniciativaIntegralFormulador.aspx.cs" Inherits="MinecPISI.Views.Formulacion.FormularIniciativaIntegralFormulador" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cssextra" runat="server">
    <link href="<%= ResolveClientUrl("~/Views/css/leaflet.css") %>" rel="stylesheet">
    <link href="<%= ResolveClientUrl("~/Views/css/leafletSearch.css") %>" rel="stylesheet">
    <style>
        table {
            border: 0.3px solid gray !important;
        }

        td {
            border: 0.3px solid gray !important;
        }

        th {
            width: 400px;
            border: 0.3px solid gray !important;
        }

        .celda {
            width: 30px;
            border: 0.3px solid gray !important;
        }

            .celda:hover {
                background: rgba(78,115,223,0.5);
            }

        #map {
            height: 300px;
        }

        #map2 {
            height: 300px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contenidoNavegacion" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="bodyContentBlank" runat="server">
    <form runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server" />
        <asp:UpdatePanel ID="UpdatePanel2" runat="server">
            <ContentTemplate>
                <div class="card shadow mb-4">
                    <div class="card-header py-3">
                        <h6 class="  font-weight-bold text-primary">Iniciativa de Innovación Integral</h6>
                    </div>
                    <div class="card-body">
                        <nav>
                            <div class="nav nav-tabs" id="nav-tab" role="tablist">
                                <a class="nav-item nav-link active" id="plant-tab" data-toggle="tab" href="#nav-planteamiento" role="tab" aria-controls="nav-planteamiento" aria-selected="true">Planteamiento</a>
                                <a class="nav-item nav-link" data-toggle="tab" href="#nav-adopcion" role="tab" aria-selected="false">Adopcion de Técnologia</a>
                                <a class="nav-item nav-link" data-toggle="tab" href="#nav-asistencia" role="tab" aria-selected="false">Asistencia Técnica y/o Transferencia de conocimiento</a>
                                <a class="nav-item nav-link" data-toggle="tab" href="#nav-innovacion" role="tab" aria-selected="false">Innovación Técnologica</a>
                                <a class="nav-item nav-link" data-toggle="tab" href="#nav-contrapartida" role="tab" aria-selected="false">Contrapartida</a>
                                <a class="nav-item nav-link" data-toggle="tab" href="#nav-cronograma" role="tab" aria-selected="false">Cronograma</a>
                            </div>
                        </nav>
                        <div class="tab-content" id="nav-tabContent">
                            <div class="tab-pane fade show active" id="nav-planteamiento" role="tabpanel" aria-labelledby="plant-tab">
                                <div class="form-group mt-2">
                                    <label>Planteamiento del problema u oportunidad a ser aprovechada</label>
                                    <asp:TextBox runat="server" class="form-control" placeholder="Ingresa el planteamiento u oportunidad" ID="planteamiento" TextMode="multiline" Rows="5" />
                                </div>
                                <div class="form-group">
                                    <label>Planteamiento descriptivo de la causa del Problema u oportunidad</label>
                                    <asp:TextBox runat="server" class="form-control" placeholder="Ingrese la descripción de la solución" TextMode="multiline" Rows="5" ID="descripcionSolucion" />
                                </div>
                                <div class="form-group">
                                    <label>Descripción de la Relevancia de la operación o producto a ser afectado con el Proyecto y su relevancia para la operación del Beneficiario</label>
                                    <asp:TextBox runat="server" class="form-control" placeholder="Ingresa la descripción de la revelancia de la operación" TextMode="multiline" Rows="5" ID="descripcionRelevancia" />
                                </div>
                                <div class="form-group">
                                    <label>Incrementos esperados en ventas o mejora de la productividad del Beneficiario</label>
                                    <asp:TextBox runat="server" class="form-control" placeholder="Describe los incrementos o mejoras productivas que esperan lograrse con el proyecto" TextMode="multiline" Rows="5" ID="incrementosEsperados" />
                                </div>
                                <div class="form-group">
                                    <label>Incrementos en ventas o mejora de la productividad del Beneficiario</label>
                                    <asp:TextBox runat="server" class="form-control" placeholder="Ingrese los incrementos en ventas" TextMode="multiline" Rows="5" name="incrementosEnVentas" ID="incrementosEnVentas" />
                                </div>
                                <div class="form-group">
                                    <label>¿Tipo de ejecución?</label>
                                    <div class="form-check form-check-inline">
                                        <asp:RadioButton runat="server" CssClass="form-check-input" GroupName="ejecucion" ID="ejecucionSolo" value="Ejecución Solo" Checked="true"></asp:RadioButton>
                                        <label class="form-check-label">
                                            Ejecución por si solo
                                        </label>
                                    </div>
                                    <div class="form-check form-check-inline">
                                        <asp:RadioButton runat="server" CssClass="form-check-input" GroupName="ejecucion" ID="ejecucionAsistida" value="Ejecución Asistida" Checked="false"></asp:RadioButton>
                                        <label class="form-check-label">
                                            Ejecución Asistida
                                        </label>
                                    </div>
                                </div>
                            </div>
                            <div class="tab-pane fade" id="nav-adopcion">
                                <div class="form-group mt-2">
                                    <label>Adopción o Incorporación Tecnológica</label>
                                    <asp:TextBox runat="server" class="form-control" placeholder="Describe técnicamente el componente" name="adopcionTec" ID="adopcionTec" TextMode="multiline" Rows="5" />
                                </div>
                                <div class="form-group">
                                    <label>Efectos esperados sobre el problema</label>
                                    <asp:TextBox runat="server" class="form-control" placeholder="Como modifica o acciona sobre el problema" name="efectosEsperados" ID="efectosEsperados" TextMode="multiline" Rows="5" />
                                </div>
                                <div class="form-group">
                                    <label>Efectos esperados sobre  el negocio</label>
                                    <asp:TextBox runat="server" class="form-control" placeholder="Describe el efecto esperado sobre el negocio" name="efectosEsperadosNegocio" ID="efectosEsperadosNegocio" TextMode="multiline" Rows="5" />
                                </div>
                                <div class="form-group">
                                    <label>Justificación de la tecnología propuesta</label>
                                    <asp:TextBox runat="server" class="form-control" placeholder="Justifica la tecnología propuesta" name="justificacion" ID="justificacion" TextMode="multiline" Rows="5" />
                                </div>
                                <div class="form-group mt-2">
                                    <label>Incrementos esperados en el margen de utilidad</label>
                                    <asp:TextBox runat="server" class="form-control" placeholder="Describe y justifica los margenes esperados de utilidad" name="margenUtilidad" ID="margenUtilidad" TextMode="multiline" Rows="5" />
                                </div>
                                <div class="form-group mt-2">
                                    <label>Incremento en la producción actual</label>
                                    <asp:TextBox runat="server" class="form-control" placeholder="Describe y justifica el incremento de la produccion actual" name="incrementoProduccion" ID="incrementoProduccion" TextMode="multiline" Rows="5" />
                                </div>
                                <div class="form-group mt-2">
                                    <label>¿Cómo se colocará el nuevo volumen en el mercado?</label>
                                    <asp:TextBox runat="server" class="form-control" placeholder="Describe y justifica como se colocara el nuevo volumen en el mercado así como la logística que se utilizará para el almacenamiento del mismo" name="nuevoVolumen" ID="nuevoVolumen" TextMode="multiline" Rows="5" />
                                </div>
                                <div class="form-group mt-2">
                                    <label>¿Disminuirá el consumo de energía o combustible en la producción, recolección, procesos y entrega de los bienes actuales?</label>
                                    <asp:TextBox runat="server" class="form-control" placeholder="Describe y justifica si el proyecto disminuirá el consumo de energía o combustible en la producción" name="disminucionConsumo" ID="disminucionConsumo" TextMode="multiline" Rows="5" />
                                </div>
                                <div class="form-group mt-2">
                                    <label>¿Reducirá el tiempo de los procesos productivos con
                                                            métodos y/o
                                                            tecnologías alternativas a las utilizadas en la
                                                            actualidad?</label>
                                    <asp:TextBox runat="server" class="form-control" placeholder="Describe y justifica si el proyecto logrará reducir el tiempo de los procesos productivos con métodos y/o tecnologías alternativas a las utilizadas en la actualidad" ID="reducirTiempo" TextMode="multiline" Rows="5" />
                                </div>
                                <div class="form-group mt-2">
                                    <label>¿Reducirá el consumo de materia prima con
                                                            tecnología no
                                                            utilizada actualmente por el beneficiario?</label>
                                    <asp:TextBox runat="server" class="form-control" placeholder="Describe y justifica si el proyecto logrará disminuir el consumo de materia prima con tecnología no utilizada actualmente por el beneficiario" name="disminucionConsumoMateria" ID="disminucionConsumoMateria" TextMode="multiline" Rows="5" />
                                </div>
                                <div class="form-group mt-2">
                                    <label>Otros a ser considerados </label>
                                    <asp:TextBox runat="server" class="form-control" placeholder="Agrega información adicional" name="otrosInfo" ID="otrosInfo" TextMode="multiline" Rows="5" />
                                </div>
                                <div class="form-group mt-2">
                                    <label>Componentes o tecnología adicional necesaria
                                                            para el buen funcionamiento de la tecnología nueva</label>
                                    <asp:TextBox runat="server" class="form-control" placeholder="Describe y determina si el proyecto requerirá de componentes o tecnología adicional necesaria para la correcta instalación y funcionamiento de la tecnología que se adoptará" name="componentesAdicionales" ID="componentesAdicionales" TextMode="multiline" Rows="5" />
                                </div>
                            </div>
                            <div class="tab-pane fade" id="nav-asistencia">
                                <div class="form-group mt-2">
                                    <label>Describe el componente y metodología sugerida</label>
                                    <asp:TextBox runat="server" CssClass="form-control" placeholder="Describe técnicamente el componente y la metodología sugerida de ejecución" name="metodologia" ID="metodologia" TextMode="multiline" Rows="5" />
                                </div>
                                <div class="form-group mt-2">
                                    <label>¿El conocimiento se encuentra disponible localmente?</label>
                                    <div>
                                        <asp:CheckBox runat="server" ID="conocLocal" Checked="false" CssClass="col-md-1 form-control mr-2 text-white" />
                                    </div>
                                </div>
                                <div id="disponibilidad">
                                    <div class="form-group mt-2">
                                        <div>
                                            <label>El proyecto exige desplazar personal técnico extranjero hacia El Salvador </label>
                                            <asp:CheckBox runat="server" ID="atenderLocal" Checked="false" CssClass="col-md-1 form-control mr-2 text-white" />
                                        </div>
                                        <div>
                                            <label>Debe el beneficiario o miembro de la iniciativa recibir entrenamiento o transferencia en el extranjero</label>
                                            <asp:CheckBox runat="server" ID="entrenamiento" Checked="false" CssClass="col-md-1 form-control" />
                                        </div>
                                        <div>
                                            <label>Ejecución Mixta</label>
                                            <asp:CheckBox runat="server" ID="mixta" Checked="false" CssClass="col-md-1 form-control mr-2 text-white" />
                                        </div>
                                    </div>
                                    <div class="form-group mt-2 row">
                                        <div class="col-md-4">
                                            <label>Duración en días</label>
                                            <asp:TextBox runat="server" CssClass="form-control " type="number" ID="duracionDias" />
                                        </div>
                                        <div class="col-md-8 ">
                                            <label>Locación</label>
                                            <asp:TextBox runat="server" disabled="disabled" ID="location" CssClass="d-none" />
                                            <a id="showmap" class="btn btn-success text-white">Obtener locación</a>
                                        </div>
                                    </div>
                                    <div class="form-group mt-2">
                                        <label>La ejecución de la presente, ¿Requiere de recursos técnicos adicionales?</label>
                                        <asp:CheckBox runat="server" ID="recursosAdicionales" Checked="false" CssClass="col-md-1 form-control" />
                                    </div>
                                    <div class="form-group mt-2">
                                        <label>¿Existe necesidad de conocimientos previos para que el conocimiento sea asimilada de forma correcta?</label>
                                        <asp:CheckBox runat="server" ID="conocPrevio" Checked="false" CssClass="col-md-1 form-control" />
                                    </div>
                                    <div class="form-group mt-2">
                                        <label>Descripción de los conocimientos previos necesarios para el proyecto</label>
                                        <asp:TextBox runat="server" CssClass="form-control" ID="requerimientosPrevios" TextMode="multiline" Rows="5"></asp:TextBox>
                                    </div>
                                    <div class="form-group mt-2">
                                        <label>¿El beneficiario actualmente cumple con los anteriores?</label>
                                        <asp:CheckBox runat="server" ID="cumple" Checked="false" CssClass="col-md-1 form-control" />
                                    </div>
                                    <div class="form-group mt-2">
                                        <label>Descripción de componentes o insumos necesarios para lograr el impacto de la asistencia técnica y/o la transferencia de conocimiento</label>
                                        <asp:TextBox runat="server" CssClass="form-control" ID="componentes" TextMode="multiline" Rows="5" />
                                    </div>
                                    <div class="form-group mt-2">
                                        <label>Efectos esperados sobre el problema</label>
                                        <asp:TextBox runat="server" CssClass="form-control" ID="efectosProblema" TextMode="multiline" Rows="5" />
                                    </div>
                                    <div class="form-group mt-2">
                                        <label>Efectos esperados sobre  el negocio</label>
                                        <asp:TextBox runat="server" CssClass="form-control" ID="efectosNegocio" TextMode="multiline" Rows="5" />
                                    </div>
                                    <div class="form-group mt-2">
                                        <label>Incrementos esperados en el margen de utilidad</label>
                                        <asp:TextBox runat="server" CssClass="form-control" ID="incrementoUtilidad" TextMode="multiline" Rows="5" />
                                    </div>
                                    <div class="form-group mt-2">
                                        <label>Describe y justifica si el proyecto reducirá el tiempo de procesos productivos con métodos y/o tecnologías alternativas a las utilizadas en la actualidad</label>
                                        <asp:TextBox runat="server" CssClass="form-control" ID="reduccionTiempo" TextMode="multiline" Rows="5" />
                                    </div>
                                    <div class="form-group mt-2">
                                        <label>Describe y justifica si el proyecto disminuirá el consumo de energía o combustible en la producción, recolección, procesos y entrega de los bienes actuales</label>
                                        <asp:TextBox runat="server" CssClass="form-control" ID="disminuirConsumo" TextMode="multiline" Rows="5" />
                                    </div>
                                    <div class="form-group mt-2">
                                        <label>Describe y justifica si el proyecto reducirá el consumo de materia prima con tecnología no utilizada actualmente por el beneficiario?</label>
                                        <asp:TextBox runat="server" CssClass="form-control" ID="reducirConsumo" TextMode="multiline" Rows="5" />
                                    </div>
                                    <div class="form-group mt-2">
                                        <label>Otros a ser considerados</label>
                                        <asp:TextBox runat="server" CssClass="form-control" ID="otros" TextMode="multiline" Rows="5" />
                                    </div>
                                </div>
                            </div>
                            <div class="tab-pane fade" id="nav-innovacion">
                                <div class="form-group mt-2">
                                    <label>Describe si el proyecto es una innovación en producto y su finalidad o meta a alcanzar</label>
                                    <asp:TextBox runat="server" CssClass="form-control" ID="producto" TextMode="multiline" Rows="5"></asp:TextBox>
                                </div>
                                <div class="form-group mt-2">
                                    <label>Describe si el proyecto es una innovación en proceso y su finalidad o meta a alcanzar</label>
                                    <asp:TextBox runat="server" CssClass="form-control" ID="proceso" TextMode="multiline" Rows="5"></asp:TextBox>
                                </div>
                                <div class="form-group mt-2">
                                    <label>Describe si el proyecto es una innovación en su método de comercialización</label>
                                    <asp:TextBox runat="server" CssClass="form-control" ID="modelo" TextMode="multiline" Rows="5"></asp:TextBox>
                                </div>


                                <div class="form-group mt-2">
                                    <label>¿Los insumos para el desarrollo se encuentra disponible localmente?</label>
                                    <div>
                                        <asp:CheckBox runat="server" ID="insumoLocal" Checked="false" CssClass="col-md-1 form-control mr-2 text-white" />
                                    </div>
                                </div>
                                <div class="form-group mt-2">
                                    <label>Describe genéricamente los insumos necesarios para el desarrollo del proyecto y si cada uno es local o internacional</label>
                                    <asp:TextBox runat="server" CssClass="form-control" ID="generic" TextMode="multiline" Rows="5"></asp:TextBox>
                                </div>
                                <div class="form-group mt-2">
                                    <label>¿El proyecto requerirá de insumos de parte del beneficiario?</label>
                                    <div>
                                        <asp:CheckBox runat="server" ID="insumoBene" Checked="false" CssClass="col-md-1 form-control mr-2 text-white" />
                                    </div>
                                </div>
                                <div class="form-group mt-2">
                                    <label>Describe los insumos que serán requeridos por el proyecto y serán responsabilidad del Beneficiario</label>
                                    <asp:TextBox runat="server" CssClass="form-control" ID="insumoDescrip" TextMode="multiline" Rows="5"></asp:TextBox>
                                </div>
                                <div id="disponibilidad2">
                                    <div class="form-group mt-2">
                                        <div>
                                            <label>Debe venir alguien y atender el tema localmente </label>
                                            <asp:CheckBox runat="server" ID="atenderLocal2" Checked="false" CssClass="col-md-1 form-control mr-2 text-white" />
                                        </div>
                                        <div>
                                            <label>Debe alguien de la iniciativa ir y recibir el entrenamiento o transferencia</label>
                                            <asp:CheckBox runat="server" ID="entrenamiento2" Checked="false" CssClass="col-md-1 form-control" />
                                        </div>
                                        <div>
                                            <label>Mixta</label>
                                            <asp:CheckBox runat="server" ID="mixta2" Checked="false" CssClass="col-md-1 form-control mr-2 text-white" />
                                        </div>
                                    </div>
                                    <div class="form-group mt-2 row">
                                        <div class="col-md-4">
                                            <label>Duración en días</label>
                                            <asp:TextBox runat="server" CssClass="form-control " type="number" ID="dias2" />
                                        </div>
                                        <div class="col-md-8 ">
                                            <label>Locación</label>
                                            <asp:TextBox runat="server" disabled="disabled" ID="location2" CssClass="d-none" />
                                            <a id="showmap2" class="btn btn-success text-white">Obtener locación</a>
                                        </div>
                                    </div>
                                    <div class="form-group mt-2">
                                        <label>¿Requiere de recursos técnicos adicionales?</label>
                                        <asp:CheckBox runat="server" ID="recursos2" Checked="false" CssClass="col-md-1 form-control" />
                                    </div>
                                    <div class="form-group mt-2">
                                        <label>¿Existe necesidad de conocimiento previo para que sea asimilada de forma correcta?</label>
                                        <asp:CheckBox runat="server" ID="necesidadC2" Checked="false" CssClass="col-md-1 form-control" />
                                    </div>
                                    <div class="form-group mt-2">
                                        <label>Describe los requerimientos previos necesarios</label>
                                        <asp:TextBox runat="server" CssClass="form-control" ID="previos" TextMode="multiline" Rows="5"></asp:TextBox>
                                    </div>
                                    <div class="form-group mt-2">
                                        <label>¿Tiene el beneficiario o cumple con los anteriores?</label>
                                        <asp:CheckBox runat="server" ID="cumple2" Checked="false" CssClass="col-md-1 form-control" />
                                    </div>
                                    <div class="form-group mt-2">
                                        <label>Componentes o insumos necesarios para lograr el impacto de la innovación o desarrollo tecnológico </label>
                                        <asp:TextBox runat="server" CssClass="form-control" ID="compo2" TextMode="multiline" Rows="5" />
                                    </div>
                                    <div class="form-group mt-2">
                                        <label>Describe los efectos esperados sobre el problema</label>
                                        <asp:TextBox runat="server" CssClass="form-control" ID="efectPro2" TextMode="multiline" Rows="5" />
                                    </div>
                                    <div class="form-group mt-2">
                                        <label>Describe los efectos esperados sobre  el negocio</label>
                                        <asp:TextBox runat="server" CssClass="form-control" ID="efectNeg2" TextMode="multiline" Rows="5" />
                                    </div>
                                    <div class="form-group mt-2">
                                        <label>Describe y justifique los incrementos esperados en el margen de utilidad</label>
                                        <asp:TextBox runat="server" CssClass="form-control" ID="margen2" TextMode="multiline" Rows="5" />
                                    </div>
                                    <div class="form-group mt-2">
                                        <label>Describe y justifique si el proyecto logrará se reducir el tiempo de procesos productivos con métodos y/o tecnologías alternativas a las utilizadas en la actualidad</label>
                                        <asp:TextBox runat="server" CssClass="form-control" ID="reduc2" TextMode="multiline" Rows="5" />
                                    </div>
                                    <div class="form-group mt-2">
                                        <label>Describe y justifique si el proyecto logrará disminuir el consumo de energía o combustible en la producción, recolección, procesos y entrega de los bienes actuales</label>
                                        <asp:TextBox runat="server" CssClass="form-control" ID="dismConsu" TextMode="multiline" Rows="5" />
                                    </div>
                                    <div class="form-group mt-2">
                                        <label>Describe y justifique si el proyecto logrará reducir el consumo de materia prima con tecnología no utilizada actualmente por el beneficiario</label>
                                        <asp:TextBox runat="server" CssClass="form-control" ID="reduCon" TextMode="multiline" Rows="5" />
                                    </div>
                                    <div class="form-group mt-2">
                                        <label>Otros a ser considerados</label>
                                        <asp:TextBox runat="server" CssClass="form-control" ID="otro2" TextMode="multiline" Rows="5" />
                                    </div>
                                </div>
                            </div>
                            <div class="tab-pane fade" id="nav-contrapartida" role="tabpanel" aria-labelledby="nav-contrapartida">
                                <div class="form-group mt-2">
                                    <label>Descripción de los montos FONDEPRO</label>
                                    <asp:TextBox runat="server" CssClass="form-control" ID="descripcionContrapartida" TextMode="multiline" Rows="5" />
                                </div>
                                <div class="form-group mt-2">
                                    <div class="row">
                                        <label class="col-md-6">Monto de Adopción o Incorporación Tecnológica</label>
                                        <asp:TextBox runat="server" CssClass="form-control col-md-5 fondepro" type="number" step="any" name="montoAdopcion" ID="montoAdopcion" />
                                    </div>
                                </div>
                                <div class="form-group mt-2">
                                    <div class="row">
                                        <label class="col-md-6">Monto de componentes acciones y/o tecnología Adicional  necesaria para la Adquisición, internación, instalación y/o el funcionamiento de la tecnología</label>
                                        <asp:TextBox runat="server" CssClass="form-control col-md-5 fondepro" type="number" step="any" name="montoComponentes" ID="montoComponentes" />
                                    </div>
                                </div>
                                <div class="form-group mt-2">
                                    <div class="row">
                                        <label class="col-md-6">Monto de Asistencia Técnica o Transferecia de Conocimiento</label>
                                        <asp:TextBox runat="server" CssClass="form-control col-md-5 fondepro" type="number" step="any" ID="montoAsistencia" />
                                    </div>
                                </div>

                                <div class="form-group mt-2">
                                    <div class="row">
                                        <label class="col-md-6">Recursos Adicionales  para la  Asistencia Técnica o Transferecia de Conocimiento</label>
                                        <asp:TextBox runat="server" CssClass="form-control col-md-5 fondepro" type="number" step="any" ID="recursosAsistencia" />
                                    </div>
                                </div>
                                <div class="form-group mt-2">
                                    <div class="row">
                                        <label class="col-md-6">Innovación de Tecnologías</label>
                                        <asp:TextBox runat="server" CssClass="form-control col-md-5 fondepro" type="number" step="any" ID="montoInnovacion" />
                                    </div>
                                </div>

                                <div class="form-group mt-2">
                                    <div class="row">
                                        <label class="col-md-6">Recursos Adicionales  para el Proyecto de innovación técnologica</label>
                                        <asp:TextBox runat="server" CssClass="form-control col-md-5 fondepro" type="number" step="any" ID="recursosInnovacion" />
                                    </div>
                                </div>

                                <div class="form-group mt-2">
                                    <div class="row">
                                        <label class="col-md-6">Otros a ser considerados</label>
                                        <asp:TextBox runat="server" CssClass="form-control col-md-5 fondepro" type="number" step="any" ID="montoOtros" />
                                    </div>
                                </div>
                                <hr class="divider" />
                                <h4><b>Descripción de Contrapartida</b></h4>

                                <div class="form-group mt-2">
                                    <div class="row">
                                        <label class="col-md-2">Descripción del monto en especies</label>
                                        <asp:TextBox runat="server" TextMode="multiline" Rows="5" CssClass="form-control col-md-6" ID="descripMontoEspecies" name="descripMontoEspecies" placeholder="Justifique el monto en especies por el beneficiario" />
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="row">
                                        <label class="col-md-2">Monto en Especies</label>
                                        <asp:TextBox runat="server" CssClass="form-control col-md-5" value="0.00" class="form-control col-md-2 contrapartida" type="number" step="any" name="montoEspecies" ID="montoEspecies" />
                                    </div>
                                </div>
                                <div class="form-group mt-2">
                                    <div class="row">
                                        <label class="col-md-2">Descripción del monto en efectivo</label>
                                        <asp:TextBox runat="server" TextMode="multiline" Rows="5" CssClass="form-control col-md-6" ID="descripMontoEfectivo" name="descripMontoEfectivo" placeholder="Justifique el monto en efectivo por el beneficiario" />
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="row">
                                        <label class="col-md-2">Monto en Efectivo</label>
                                        <asp:TextBox runat="server" value="0.00" CssClass="form-control col-md-2 contrapartida" type="number" step="any" name="montoEfectivo" ID="montoEfectivo" />
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="row">
                                        <label class="col-md-2">Monto Total de Contrapartida del Beneficiario</label>
                                    <asp:TextBox runat="server" ID="montoTotalContrapartida" cssClass="form-control col-md-2" type="number" step="any"/>
                                    </div>
                                </div>
                                <hr class="divider" />
                                <h4><b>Total Proyecto</b></h4>
                                <div class="form-group">
                                    <div class="row">
                                        <label class="col-md-2">Monto total del proyecto</label>
                                        <input value="0,00" class="form-control col-md-2" type="number" step="any" id="montoproyecto" disabled="disabled">
                                    </div>
                                </div>
                            </div>
                            <div class="tab-pane fade" id="nav-cronograma" role="tabpanel" aria-labelledby="nav-cronograma">
                                <div class="mt-2 row">
                                    <div class="form-group col-md-4">
                                        <label>Digite la fecha de inicio</label>
                                        <asp:TextBox runat="server" type="date" CssClass="form-control" ID="inputfecha" />
                                    </div>
                                </div>
                                <div class="row mt-3">
                                    <div class="col">

                                        <div class="row mb-5" style="overflow-x: auto">
                                            <table class="col" id="table-cron">
                                            </table>
                                        </div>
                                    </div>
                                </div>

                                <asp:TextBox runat="server" ID="semanasSelec" CssClass="d-none" />
                                 <%if (edit == 0)
                                    { %>
                                <asp:Button runat="server" ID="btnguardar" CssClass="btn btn-success" Text="Presentar Iniciativa" />
                                <asp:Button runat="server" ID="btnProg" CssClass="btn btn-info" Text="Guardar Progreso" />
                                <%}
                                else
                                {%>
                                <asp:Button runat="server" ID="btnEditarProgreso" CssClass="btn btn-info" Text="Guardar Progreso" />

                                <%}%>
                            </div>

                        </div>
                    </div>
                    <div class="card-footer">

                        <asp:Panel runat="server" ID="pnl_observaciones" Visible="false">
                            <div class="card shadow mb-4">

                                <div class="card-header py-3">
                                    <h5>Observaciones</h5>
                                </div>


                                <div class="card-body">
                                    <% foreach (var o in observaciones)
                                        { %>
                                    <p>
                                        <h6>Fecha y Hora: </h6>
                                        <div class="small">
                                            <%=o.FECHA %>
                                        </div>
                                    </p>

                                    <p>
                                        <h6>Descripción:</h6>
                                        <div class="small">
                                            <%= o.DESCRIPCION %>
                                        </div>
                                    </p>
                                    <%}%>
                                    <asp:Button Text="Marcar como resuelta" runat="server" CssClass="btn btn-warning" ID="btn_resolverObservacion"/>
                                </div>

                            </div>
                        </asp:Panel>
                    </div>
                </div>
                <div class="modal fade" id="mapaModal" tabindex="-1" role="dialog">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="exampleModalLabel">Ubicación de la iniciativa</h5>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body">
                                <div class=" d-flex justify-content-center">
                                    <div id="spinner" class="spinner-border " role="status">
                                        <span class="sr-only">Cargando...</span>
                                    </div>
                                </div>

                                <div id="map">
                                </div>
                            </div>
                            <div class="modal-footer">
                                <a class="btn btn-secondary text-white" data-dismiss="modal">Cerrar</a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal fade" id="mapaModal2" tabindex="-1" role="dialog">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title">Por favor haga click en el lugar donde se localizará la iniciativa</h5>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body">
                                <div class=" d-flex justify-content-center">
                                    <div id="spinner2" class="spinner-border " role="status">
                                        <span class="sr-only">Cargando...</span>
                                    </div>
                                </div>

                                <div id="map2">
                                </div>
                            </div>
                            <div class="modal-footer">
                                <a id="guardarubicacion2" class="btn btn-secondary text-white" data-dismiss="modal">Cerrar</a>
                            </div>
                        </div>
                    </div>
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
    </form>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="jsextra" runat="server">
    <script src="<%= ResolveClientUrl("~/Views/js/leaflet.js") %>"></script>
    <script src="<%= ResolveClientUrl("~/Views/js/leafletSearch.js") %>"></script>
    <script src="<%= ResolveClientUrl("~/Views/js/Cronograma.js") %>"></script>
    <% if (edit == 0)
        { %>
    <script>
        $('.fondepro').change(() => {
            var psum = 0;
            for (let i = 0; i < $('.fondepro').length; i++) {
                psum += parseFloat($('.fondepro')[i].value);
            }
            $('#montoFondepro').val(psum.toFixed(2));
            $('#bodyContentBlank_montoTotalContrapartida').val((psum / 9).toFixed(2));
            $('#montoproyecto').val((psum / 0.9).toFixed(2));
        });

        $('.contrapartida').change(() => {
            var psum = 0;
            for (let i = 0; i < $('.contrapartida').length; i++) {
                psum += parseFloat($('.contrapartida')[i].value);
            }
            var monto = parseFloat($('#bodyContentBlank_montoTotalContrapartida').val()).toFixed(2);
            if (psum < monto || psum > monto) {
                alert("la suma de la contrapartida debe estar exactamente: " + monto);
            }

        });

        $(document).ready(function () {
            for (let i = 0; i < $('.fondepro').length; i++) {
                $('.fondepro')[i].value = 0;
            }
            for (let i = 0; i < $('.contrapartida').length; i++) {
                $('.contrapartida')[i].value = 0;
            }
            var headers = [
                        "Adopción o incorporación Tecnológica",
                        "Recursos Adicionales  para la  Adopcion",
                        "Asistenica Tecnica y/o Transferencia tecnologica",
                        "Recursos Adicionales  para la  Asistencia tecnica o transferecia de conocimiento",
                        "Proyecto de innovacion tecnologica",
                        "Recursos Adicionales  para la  Innovacion",
                        "otros a ser considerados",
                        "Monto Contra partida Beneficiario"
                    ];
            var cronograma = new $.Cronograma($('#table-cron'), {
                'numMonth': 6,
                'dateStart': new Date(),
                'subHeaders': headers,
                //habilita las funciones de manejar eventos
                'eventos': true,
                'toSend': 'bodyContentBlank_semanasSelec',
                'data': []
            });
            cronograma.Reload(cronograma.settings.dateStart);
            cronograma.clickEvent();
            $('#bodyContentBlank_inputfecha').change(function () {
                cronograma.Reload($(this).val());
                cronograma.clickEvent();
            });



            $('#disponibilidad').hide();
            $('#bodyContentBlank_conocLocal').change(function () {
                $('#disponibilidad').toggle();

            });
        });
        $('#showmap').click(function () {
            $('#mapaModal').modal('toggle');
            navigator.geolocation.getCurrentPosition(showPosition);

        });
        function showPosition(position) {

            var mymap = L.map('map').setView([position.coords.latitude, position.coords.longitude], 15);

            L.tileLayer('https://api.tiles.mapbox.com/v4/{id}/{z}/{x}/{y}.png?access_token={accessToken}',
                {
                    attribution: 'Map data &copy; <a href="https://www.openstreetmap.org/">OpenStreetMap</a> contributors, <a href="https://creativecommons.org/licenses/by-sa/2.0/">CC-BY-SA</a>, Imagery © <a href="https://www.mapbox.com/">Mapbox</a>',
                    maxZoom: 18,
                    id: 'mapbox.streets',
                    accessToken: 'pk.eyJ1IjoiZmpkZXZlbCIsImEiOiJjanVlZ2liZ2QwMzlsNDlwazJvcHJ6a2JuIn0.twQkqaob2K4OxNQzygJzaA'
                }).addTo(mymap);
            mymap.addControl(new L.Control.Search({
                url: 'https://nominatim.openstreetmap.org/search?format=json&q={s}',
                jsonpParam: 'json_callback',
                propertyName: 'display_name',
                propertyLoc: ['lat', 'lon'],
                marker: L.circleMarker([0, 0], { radius: 30 }),
                autoCollapse: true,
                autoType: false,
                minLength: 2
            }));
            var popup = L.popup();

            function onMapClick(e) {
                popup
                    .setLatLng(e.latlng)
                    .setContent("Iniciativa localizada, coordenadas:" + e.latlng)
                    .openOn(mymap);
                $('#bodyContentBlank_location').val(mymap.getCenter().toString().split("LatLng")[1].replace("(", "").replace(")", ""));

            }

            mymap.on('click', onMapClick);

            $('#spinner').hide();

        }




        $('#disponibilidad2').hide();
        $('#bodyContentBlank_insumoLocal').change(function () {
            $('#disponibilidad2').toggle();

        });
        $('#showmap2').click(function () {
            $('#mapaModal2').modal('toggle');
            navigator.geolocation.getCurrentPosition(showPosition2);

        });
        function showPosition2(position) {

            var mymap2 = L.map('map2').setView([position.coords.latitude, position.coords.longitude], 15);

            L.tileLayer('https://api.tiles.mapbox.com/v4/{id}/{z}/{x}/{y}.png?access_token={accessToken}',
                {
                    attribution: 'Map data &copy; <a href="https://www.openstreetmap.org/">OpenStreetMap</a> contributors, <a href="https://creativecommons.org/licenses/by-sa/2.0/">CC-BY-SA</a>, Imagery © <a href="https://www.mapbox.com/">Mapbox</a>',
                    maxZoom: 18,
                    id: 'mapbox.streets',
                    accessToken: 'pk.eyJ1IjoiZmpkZXZlbCIsImEiOiJjanVlZ2liZ2QwMzlsNDlwazJvcHJ6a2JuIn0.twQkqaob2K4OxNQzygJzaA'
                }).addTo(mymap2);
            mymap2.addControl(new L.Control.Search({
                url: 'https://nominatim.openstreetmap.org/search?format=json&q={s}',
                jsonpParam: 'json_callback',
                propertyName: 'display_name',
                propertyLoc: ['lat', 'lon'],
                marker: L.circleMarker([0, 0], { radius: 30 }),
                autoCollapse: true,
                autoType: false,
                minLength: 2
            }));
            var popup = L.popup();

            function onMapClick(e) {
                popup
                    .setLatLng(e.latlng)
                    .setContent("Iniciativa localizada, coordenadas:" + e.latlng)
                    .openOn(mymap2);
                $('#bodyContentBlank_location2').val(mymap2.getCenter().toString().split("LatLng")[1].replace("(", "").replace(")", ""));

            }

            mymap.on('click', onMapClick);

            $('#spinner2').hide();

        }
    </script>
    <%}
    else
    {%>
    <script>
        $('.fondepro').change(() => {
            var psum = 0;
            for (let i = 0; i < $('.fondepro').length; i++) {
                psum += parseFloat($('.fondepro')[i].value);
            }
            $('#montoFondepro').val(psum.toFixed(2));
            $('#montoTotalContrapartida').val((psum / 9).toFixed(2));
            $('#montoproyecto').val((psum / 0.9).toFixed(2));
        });

        $('.contrapartida').change(() => {
            var psum = 0;
            for (let i = 0; i < $('.contrapartida').length; i++) {
                psum += parseFloat($('.contrapartida')[i].value);
            }
            var monto = parseFloat($('#montoTotalContrapartida').val()).toFixed(2);
            if (psum < monto || psum > monto) {
                alert("la suma de la contrapartida debe estar exactamente: " + monto);
            }

        });
        $(document).ready(function () {
            var headers = [
                "Adopción o incorporación Tecnológica",
                "Recursos Adicionales  para la  Adopcion",
                "Asistenica Tecnica y/o Transferencia tecnologica",
                "Recursos Adicionales  para la  Asistencia tecnica o transferecia de conocimiento",
                "Proyecto de innovacion tecnologica",
                "Recursos Adicionales  para la  Innovacion",
                "otros a ser considerados",
                "Monto Contra partida Beneficiario"
            ];
            var cronograma = new $.Cronograma($('#table-cron'), {
                'numMonth': 6,
                'dateStart': new Date(),
                'subHeaders': headers,
                //habilita las funciones de manejar eventos
                'eventos': true,
                'toSend': 'bodyContentBlank_semanasSelec',
                'data': []
            });
            cronograma.Reload(cronograma.settings.dateStart);
            cronograma.clickEvent();
            $('#bodyContentBlank_inputfecha').change(function () {
                cronograma.Reload($(this).val());
                cronograma.clickEvent();
            });



            $('#disponibilidad').hide();
            $('#bodyContentBlank_conocLocal').change(function () {
                $('#disponibilidad').toggle();

            });
        });
          cronograma.Reload(cronograma.settings.dateStart);
            cronograma.clickEvent();
            $('#bodyContentBlank_inputfecha').change(function () {
                cronograma.Reload($(this).val());
                cronograma.clickEvent();
            });



            $('#disponibilidad').hide();
            $('#bodyContentBlank_conocLocal').change(function () {
                $('#disponibilidad').toggle();

            });
        });
        $('#showmap').click(function () {
            $('#mapaModal').modal('toggle');
            navigator.geolocation.getCurrentPosition(showPosition);

        });
        function showPosition(position) {

            var mymap = L.map('map').setView([position.coords.latitude, position.coords.longitude], 15);

            L.tileLayer('https://api.tiles.mapbox.com/v4/{id}/{z}/{x}/{y}.png?access_token={accessToken}',
                {
                    attribution: 'Map data &copy; <a href="https://www.openstreetmap.org/">OpenStreetMap</a> contributors, <a href="https://creativecommons.org/licenses/by-sa/2.0/">CC-BY-SA</a>, Imagery © <a href="https://www.mapbox.com/">Mapbox</a>',
                    maxZoom: 18,
                    id: 'mapbox.streets',
                    accessToken: 'pk.eyJ1IjoiZmpkZXZlbCIsImEiOiJjanVlZ2liZ2QwMzlsNDlwazJvcHJ6a2JuIn0.twQkqaob2K4OxNQzygJzaA'
                }).addTo(mymap);
            mymap.addControl(new L.Control.Search({
                url: 'https://nominatim.openstreetmap.org/search?format=json&q={s}',
                jsonpParam: 'json_callback',
                propertyName: 'display_name',
                propertyLoc: ['lat', 'lon'],
                marker: L.circleMarker([0, 0], { radius: 30 }),
                autoCollapse: true,
                autoType: false,
                minLength: 2
            }));
            var popup = L.popup();

            function onMapClick(e) {
                popup
                    .setLatLng(e.latlng)
                    .setContent("Iniciativa localizada, coordenadas:" + e.latlng)
                    .openOn(mymap);
                $('#bodyContentBlank_location').val(mymap.getCenter().toString().split("LatLng")[1].replace("(", "").replace(")", ""));

            }

            mymap.on('click', onMapClick);

            $('#spinner').hide();

        }




        $('#disponibilidad2').hide();
        $('#bodyContentBlank_insumoLocal').change(function () {
            $('#disponibilidad2').toggle();

        });
        $('#showmap2').click(function () {
            $('#mapaModal2').modal('toggle');
            navigator.geolocation.getCurrentPosition(showPosition2);

        });
        function showPosition2(position) {

            var mymap2 = L.map('map2').setView([position.coords.latitude, position.coords.longitude], 15);

            L.tileLayer('https://api.tiles.mapbox.com/v4/{id}/{z}/{x}/{y}.png?access_token={accessToken}',
                {
                    attribution: 'Map data &copy; <a href="https://www.openstreetmap.org/">OpenStreetMap</a> contributors, <a href="https://creativecommons.org/licenses/by-sa/2.0/">CC-BY-SA</a>, Imagery © <a href="https://www.mapbox.com/">Mapbox</a>',
                    maxZoom: 18,
                    id: 'mapbox.streets',
                    accessToken: 'pk.eyJ1IjoiZmpkZXZlbCIsImEiOiJjanVlZ2liZ2QwMzlsNDlwazJvcHJ6a2JuIn0.twQkqaob2K4OxNQzygJzaA'
                }).addTo(mymap2);
            mymap2.addControl(new L.Control.Search({
                url: 'https://nominatim.openstreetmap.org/search?format=json&q={s}',
                jsonpParam: 'json_callback',
                propertyName: 'display_name',
                propertyLoc: ['lat', 'lon'],
                marker: L.circleMarker([0, 0], { radius: 30 }),
                autoCollapse: true,
                autoType: false,
                minLength: 2
            }));
            var popup = L.popup();

            function onMapClick(e) {
                popup
                    .setLatLng(e.latlng)
                    .setContent("Iniciativa localizada, coordenadas:" + e.latlng)
                    .openOn(mymap2);
                $('#bodyContentBlank_location2').val(mymap2.getCenter().toString().split("LatLng")[1].replace("(", "").replace(")", ""));

            }

            mymap.on('click', onMapClick);

            $('#spinner2').hide();

        }
    </script>
    <%}%>
</asp:Content>
