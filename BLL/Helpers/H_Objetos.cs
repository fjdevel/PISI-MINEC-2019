using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Security.Cryptography;

namespace BLL.Helpers
{
    public class H_Objetos
    {
        /// <summary>
        /// Función que evalúa un objeto en busca de propiedades nulas
        /// </summary>
        /// <typeparam name="T"></typeparam>
        /// <param name="obj"></param>
        /// <returns>TRUE si cualquier propiedad es nula. False en el otro caso</returns>
        public static bool TienePropiedadesNulas<T>(T obj)
        {
            return typeof(T).GetProperties().Any(propertyInfo => propertyInfo.GetValue(obj) == null);
        }

        public static string ListMensajesToString(List<string> mensajes)
        {
            StringBuilder builder = new StringBuilder();

            foreach (string msj in mensajes)
            {
                builder.Append(msj + "<br />");
            }

            return builder.ToString();
        }

        /// <summary>
        /// Función que calcula cuánto tiempo ha pasado desde una fecha determinada
        /// </summary>
        /// <param name="datetime"></param>
        /// <returns>Un String con los minutos, horas, días, semanas, meses o años pasados. Null si no se introduce una fecha</returns>
        public static string dateTimeCount(DateTime? datetime)
        {
            if (datetime != null)
            {
                //Contando el tiempo transcurrido desde la fecha ingresada
                TimeSpan tiempo = (DateTime.Now - datetime.Value).Duration();

                StringBuilder builder = new StringBuilder();

                if (tiempo.TotalDays >= 365)
                    builder.Append((tiempo.TotalDays / 7 / 4 / 12) + " Año(s)");

                if (tiempo.TotalDays >= 28 && tiempo.TotalDays < 364)
                    builder.Append(" " + (tiempo.TotalDays / 7 / 4) + " Mes(es)");

                if (tiempo.TotalDays >= 7 && tiempo.TotalDays < 28)
                    builder.Append(" " + (tiempo.TotalDays / 7).ToString() + " Semana(s)");

                if (tiempo.Days > 0 && tiempo.Days < 7)
                    builder.Append(" " + tiempo.Days.ToString() + " Día(s)");

                if (tiempo.Hours > 0 && tiempo.Hours < 23)
                    builder.Append(" " + tiempo.Hours.ToString() + " Hora(s)");

                if (tiempo.Minutes > 0 && tiempo.Minutes < 59)
                    builder.Append(" " + tiempo.Minutes.ToString() + " Minuto(s)");

                builder.Append(" " + tiempo.Seconds.ToString() + " Segundo(s)");

                return builder.ToString();
            }

            return null;
        }

        /// <summary>
        /// Método que genera el hash SHA-256 de una cadena de caracteres
        /// </summary>
        /// <param name="payload">Cadena de caracteres a encriptar</param>
        /// <returns>El hash del payload en una cadena de caracteres</returns>
        public static string Encriptar(string payload)
        {
            SHA256 sha256 = SHA256Managed.Create();
            byte[] bytes = Encoding.UTF8.GetBytes(payload);
            byte[] hash = sha256.ComputeHash(bytes);

            StringBuilder result = new StringBuilder();
            for (int i = 0; i < hash.Length; i++)
            {
                result.Append(hash[i].ToString("X2"));
            }
            return result.ToString();
        }
    }
}
