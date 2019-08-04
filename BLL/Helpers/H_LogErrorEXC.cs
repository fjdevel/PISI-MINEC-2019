using System;
using System.Data.Common;
using System.IO;
using System.Runtime.CompilerServices;
using System.Security.AccessControl;
using System.Security.Principal;
using DAL.DB;
using System.Reflection;

namespace BLL.Helpers
{
    public class H_LogErrorEXC
    {
        /// <summary>
        /// Método encargado de Guardar Excepcion en un archivo txt
        /// </summary>
        /// <param name="exc">Excepcion tomada del try catch</param>
        /// <param name="IdUsuario">Id Del dominio que genero el error</param>
        /// <param name="NombreMetodo">Nombre del método donde se genero</param>
        /// <param name="Direccion">Dirección del método</param>
        /// <param name="NumLinea">Num de linea de codigo</param>
        public static void GuardarRegistroLogError(Exception exc, int? IdUsuario = null, [CallerMemberName] string NombreMetodo = "", [CallerFilePath] string Direccion = "", [CallerLineNumber] int NumLinea = 0)
        {
            string fecha = DateTime.Now.ToString("yyyyMMdd");
            string hora = DateTime.Now.ToString("HH:mm:ss");
            string NombreArchivo = fecha + ".Txt";
            var prue = ExisteRepositorio();

            using (StreamWriter sw = new StreamWriter(PathArchivos("~/Logs/" + NombreArchivo), true))
            {
                sw.Write("******************** " + DateTime.Now);
                sw.WriteLine(" ********************");
                if (exc.InnerException != null)
                {
                    sw.Write("Inner Exception Tipo: ");
                    sw.WriteLine(exc.InnerException.GetType().ToString());
                    sw.Write("Inner Exception: ");
                    sw.WriteLine(exc.InnerException.Message);
                    sw.Write("Inner Source: "); 
                    sw.WriteLine(exc.InnerException.Source);
                    if (exc.InnerException.StackTrace != null)
                    {
                        sw.WriteLine("Inner Stack Trace: ");
                        sw.WriteLine(exc.InnerException.StackTrace);
                    }
                }
                sw.Write("Exception Tipo: ");
                sw.WriteLine(exc.GetType().ToString());
                sw.WriteLine("Exception: " + exc.Message);
                sw.WriteLine("Source: " + Direccion);
                sw.WriteLine("Stack Trace: ");
                if (exc.StackTrace != null)
                    sw.WriteLine(exc.StackTrace);
                sw.WriteLine();
                sw.Close();
            }
        }

        public static string PathArchivos(string Ubicacion)
        {
            var Resultado = Path.Combine(AppDomain.CurrentDomain.BaseDirectory, Ubicacion);
            return Resultado;
        }

        public static DirectoryInfo ExisteRepositorio()
        {
            DirectoryInfo dir = new DirectoryInfo(PathArchivos("~/Logs/"));
            if (!dir.Exists)
            {
                dir.Create();
                DirectorySecurity dSecurity = dir.GetAccessControl();
                dSecurity.AddAccessRule(new FileSystemAccessRule(new SecurityIdentifier(WellKnownSidType.WorldSid, null), FileSystemRights.FullControl, InheritanceFlags.ObjectInherit | InheritanceFlags.ContainerInherit, PropagationFlags.NoPropagateInherit, AccessControlType.Allow));
                dir.SetAccessControl(dSecurity);
            }
            return dir;
        }

        public static Modelos.ModelosVistas.MV_Exception resultToException(object result)
        {
            Modelos.ModelosVistas.MV_Exception excepcion = new Modelos.ModelosVistas.MV_Exception();

            PropertyInfo[] properties = result.GetType().GetProperties();

            foreach (PropertyInfo prop in properties)
            {
                var val = prop.GetValue(result);

                switch(prop.Name.ToUpper())
                {
                    case "IDENTITY":
                        excepcion.IDENTITY = (val != null) ? decimal.Parse(val.ToString()) : (decimal?) null;
                        break;

                    case "ERROR_NUMBER":
                        excepcion.ERROR_NUMBER = (val != null) ? int.Parse(val.ToString()) : (int?)null;
                        break;

                    case "ERROR_MESSAGE":
                        excepcion.ERROR_MESSAGE = (val != null) ? val.ToString() : null;
                        break;

                    case "ERROR_PROCEDURE":
                        excepcion.ERROR_PROCEDURE = (val != null) ? val.ToString() : null;
                        break;

                    case "ERROR_LINE":
                        excepcion.ERROR_LINE = (val != null) ? int.Parse(val.ToString()) : (int?)null;
                        break;
                }
            }

            return excepcion;
        }

    }
}
