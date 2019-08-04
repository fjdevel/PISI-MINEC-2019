; (function ($) {

    $.Cronograma = function (el, options) {
        var defaults = {
            'data':[]
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
            if (plugin.settings.numMonth != null || plugin.settings.numMonth != 0) {
                table.append('<thead><tr><th></th></tr></thead><tbody></tbody>');
                for (var i = 0; i < plugin.settings.numMonth; i++) {
                    table.find("thead").find("tr").append('<td colspan="4">' + mesesSeguidos(fechaInicio.getMonth() + i, fechaInicio.getFullYear()) + '</td>');

                }
                for (var i = 0; i < plugin.settings.subHeaders.length; i++) {
                    var row = [];
                    for (var k = 0; k < plugin.settings.numMonth * 4; k++) {
                        row[k] = '<td class="celda"  data-week="' + (parseInt(getWeekNumber(fechaInicio)) + k) + '" ></td>';
                        
                    }

                    table.find("tbody").append('<tr> <th ><small>' + plugin.settings.subHeaders[i] + "</small></th>" + row.toString() + "</tr>");
                }
            }
        }
        //Metodo para eliminar evento
        plugin.removeEvent = function (week) {
        }
        //Metodo para agregar un evento
        plugin.addEvent = function (celda) {
            var week = celda.data("week");
            var fecha = getDateByWeek(week, new Date(plugin.settings.dateStart).getFullYear());
            var start = fecha.getDate() + '/' + (parseInt(fecha.getMonth()) + 1) + '/' + fecha.getFullYear();
            fecha = new Date(fecha.getTime() + ((8.64e+7) * 7));
            var end = fecha.getDate() + '/' + (parseInt(fecha.getMonth()) + 1) + '/' + fecha.getFullYear();
            var title = celda.siblings('th').text();
            var evento =  new Object();
            evento.start = start;
            evento.end = end;
            evento.title = title;
            plugin.settings.data.push(evento);
        }
        //metodo para obtener la data
        plugin.getEvents = function () {
            return plugin.settings.data;
        }

        plugin.clickEvent = function () {
            let celda = document.getElementsByClassName('celda');
            for (let i = 0; i < celda.length; i++) {
                celda[i].addEventListener('click', function () {
                    /*if (this.hasClass('bg-info')) {
                        this.removeClass('bg-info');
                        if (plugin.settings.eventos) {
                            plugin.addEvent(this);
                        }
                    } else {
                        this.addClass('bg-info');
                        if (plugin.settings.eventos) {
                            plugin.removeEvent(this);
                        }
                    }*/
                    console.log(this);
                });
            }
        }

        init();
        

    }

})(jQuery);