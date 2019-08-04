using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
using System.Threading.Tasks;

namespace BLL.Helpers
{
    public class H_Usuario
    {
        public static string GenerarNombreUsuario(string nombreC, string apellidoC, int id)
        {
            var username = "";
            var nombreCompleto = nombreC.Trim();
            var apellidoCompleto = apellidoC.Trim();

            var nombres = nombreCompleto.Split(' ');
            var apellidos = apellidoCompleto.Split(' ');

            if (apellidos.Length == 0 && nombres.Length == 0)
                return string.Empty;

            switch (nombres.Length)
            {
                case 2:
                    username = nombres[0].Substring(0, 1) + QuitarAcentos(nombres[1]).Substring(0, 1) + QuitarAcentos(apellidos[0]) + id;
                    break;
                case 1:
                    username = QuitarAcentos(nombres[0]).Substring(0, 1) + QuitarAcentos(apellidos[0]) + id;
                    break;
            }

            return username;
        }
        public static string QuitarAcentos(string inputString)
        {
            var a = new Regex("[á|à|ä|â]", RegexOptions.Compiled);
            var e = new Regex("[é|è|ë|ê]", RegexOptions.Compiled);
            var i = new Regex("[í|ì|ï|î]", RegexOptions.Compiled);
            var o = new Regex("[ó|ò|ö|ô]", RegexOptions.Compiled);
            var u = new Regex("[ú|ù|ü|û]", RegexOptions.Compiled);
            var n = new Regex("[ñ|Ñ]", RegexOptions.Compiled);

            inputString = a.Replace(inputString, "a");
            inputString = e.Replace(inputString, "e");
            inputString = i.Replace(inputString, "i");
            inputString = o.Replace(inputString, "o");
            inputString = u.Replace(inputString, "u");
            inputString = n.Replace(inputString, "n");

            return inputString;
        }   
    }
}
