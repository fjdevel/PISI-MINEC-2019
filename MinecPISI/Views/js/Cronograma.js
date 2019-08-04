; (function ($) {

    $.Cronograma = function (el, options) {
        var defaults = {
        }
        let meses = ["Enero", "Febrero", "Marzo", "Abril", "Mayo", "Junio", "Julio", "Agosto", "Septiembre", "Octubre", "Noviembre", "Diciembre"];
        var plugin = this;

        plugin.settings = {
            
        }

        var init = function () {
            plugin.settings = $.extend({}, defaults, options);
            plugin.el = el;
            if (plugin.settings.data == "" || plugin.settings.data==null) {
                construccionBase();
            }
            
        }


        var construccionBase = function () {
            var table = $(plugin.el);
            table.addClass("table-bordered table-striped text-center");
            
            plugin.Reload(plugin.settings.dateStart);
            plugin.clickEvent();

        }
        var getDateByWeek = function(week,year){
            var d = (1 + (week - 1) * 7); // calcula el numero de dias a partir del 1 de enero
            return new Date(year, 0, d);
        }
        var getWeekNumber = function (d) {
            d.setHours(0, 0, 0, 0);   //Nos aseguramos de limpiar la hora.
            d.setDate(d.getDate() + 4 - (d.getDay() || 7)); // Recorremos los días para asegurarnos de estar "dentro de la semana"
            //Finalmente, calculamos redondeando y ajustando por la naturaleza de los números en JS:
            return Math.ceil((((d - new Date(d.getFullYear(), 0, 1)) / 8.64e7) + 1) / 7);
        }
        var mesesSeguidos = function (mes,year) {
            if (mes > 11) {
                return meses[mes - 12] + ' ' + (parseInt(year) + 1);
            } else {
                return meses[mes]+' '+year;
            }
        }
       
        //Metodos Publicos

        plugin.Reload = function (fecha) {
            var fechaInicio = new Date(fecha);
            var table = $(plugin.el);
            table.empty();
            table.addClass("table-bordered table-striped text-center");
            var acum = 0;
            if (plugin.settings.numMonth != null || plugin.settings.numMonth != 0) {
                table.append('<thead><tr><th></th></tr></thead><tbody></tbody>');
                for (var i = 0; i < plugin.settings.numMonth; i++) {
                    table.find("thead").find("tr").append('<td colspan="4">' + mesesSeguidos(fechaInicio.getMonth() + i, fechaInicio.getFullYear()) + '</td>');
                }
                for (var i = 0; i < plugin.settings.subHeaders.length; i++) {
                    var row = [];
                    for (var k = 0; k < plugin.settings.numMonth * 4; k++) {
                        acum ++;
                        row[k] = '<td class="celda" data-head="' + plugin.settings.subHeaders[i]+'" data-num="'+ acum+'"  data-week="' + (parseInt(getWeekNumber(fechaInicio)) + k) + '" ></td>';
                    }

                    table.find("tbody").append('<tr> <th ><small>' + plugin.settings.subHeaders[i] + "</small></th>" + row.toString() + "</tr>");
                }
                if (plugin.getEvents().length > 0) {
                    var json = JSON.parse(plugin.getEvents());
                    var celdas = $(".celda");
                    for (let p = 0; p < celdas.length; p++) {
                        for (let q = 0; q < json.length; q++) {
                            if (celdas[p].getAttribute("data-num") == json[q].num) {
                                celdas[p].className += " bg-info";
                                celdas[p].setAttribute("data-start", json[q].start);
                                celdas[p].setAttribute("data-end", json[q].end);
                            }
                        }
                    }
                }
                
                
            }

        }
        //Metodo para eliminar evento
        plugin.removeEvent = function (week) {
        }
        //Metodo para agregar un evento
        plugin.addEvent = function (celda) {
            var num = celda.getAttribute("data-num");
            var week = celda.getAttribute("data-week");
            var fecha = getDateByWeek(week, new Date(plugin.settings.dateStart).getFullYear());
            var start = fecha.getDate() + '/' + (parseInt(fecha.getMonth()) + 1) + '/' + fecha.getFullYear();
            fecha = new Date(fecha.getTime() + ((8.64e+7) * 7));
            var end = fecha.getDate() + '/' + (parseInt(fecha.getMonth()) + 1) + '/' + fecha.getFullYear();
            var title = celda.parentNode.childNodes[1].innerText;
            var evento =  new Object();
            evento.start = start;
            evento.end = end;
            evento.title = title;
            evento.week = week;
            evento.num = num;
            plugin.settings.data.push(evento);
            document.getElementById(plugin.settings.toSend).value = JSON.stringify(plugin.getEvents());
        }
        //metodo para obtener la data
        plugin.getEvents = function () {
            return plugin.settings.data;
        }

        plugin.clickEvent = function () {
            var celda = document.getElementsByClassName('celda');
            for (let i = 0; i < celda.length; i++) {
                celda[i].addEventListener('click', function () {
                    if (plugin.settings.seguimiento == true) {
                        if (this.className == "celda bg-info") {
                           
                        }
                    }
                    else {
                        if (this.className == "celda bg-info") {
                            if (plugin.settings.eventos) {
                                this.classList.remove("bg-info");
                                plugin.removeEvent(this);
                                //console.log(plugin.getEvents());
                            }
                        } else {
                            if (plugin.settings.eventos) {
                                this.className += " bg-info";

                                plugin.addEvent(this);

                                //console.log(plugin.getEvents());
                            };
                        }
                    }
                    
                });
            }
            
        }

        init();
        

    }

})(jQuery);