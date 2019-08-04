using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL.DB;

namespace BLL.Modelos.ModelosVistas
{
    public class MV_DetalleBeneficiario
    {
        public int ID_BENEFICIARIO { get; set; }
        public string NOMBRES { get; set; }
        public string APELLIDOS { get; set; }
        public string TEL_FIJO { get; set; }
        public string TEL_CEL { get; set; }
        public string DUI { get; set; }
        public string NIT { get; set; }
        public string Correo { get; set; }
        public short TipoBeneficiario { get; set; }
        public string DIRECCION { get; set; }
        public string MUNICIPIO { get; set; }
        public int IdMunicipio { get; set; }
        public string Departamento { get; set; }
        public int IdDepartamento { get; set; }
        public string NOMBRE_SECTOR { get; set; }
        public int IdSector { get; set; }
        public string LAT { get; set; }
        public string LONG { get; set; }
        public bool? MAS_ANIOS_EN_LUGAR { get; set; }
        public string ESTADO_PROCESO { get; set; }
        public string NOMBRE_CONSULTOR { get; set; }
        public int?  ID_PERSONA { get; set; }
        public int? IdPersonaConsultor { get; internal set; }

        public static explicit operator MV_DetalleBeneficiario(SP_VIEW_DETALLE_BENEFICIARIO_GetAllResult d)
        {
            return new MV_DetalleBeneficiario()
            {
                APELLIDOS = d.APELLIDOS,
                DIRECCION = d.DIRECCION,
                DUI = d.DUI,
                ESTADO_PROCESO = d.ESTADO_PROCESO,
                ID_BENEFICIARIO = d.ID_BENEFICIARIO,
                LAT = d.LAT,
                LONG = d.LONG,
                MAS_ANIOS_EN_LUGAR = d.MAS_ANIOS_EN_LUGAR,
                MUNICIPIO = d.MUNICIPIO,
                NIT = d.NIT,
                NOMBRES = d.NOMBRES,
                NOMBRE_SECTOR = d.NOMBRE_SECTOR,
                TEL_CEL = d.TEL_CEL,
                TEL_FIJO = d.TEL_FIJO,
                NOMBRE_CONSULTOR = d.NOMBRE_CONSULTOR,
                ID_PERSONA = d.ID_PERSONA
            };
        }

        public static explicit operator MV_DetalleBeneficiario(SP_VIEW_DETALLE_BENEFICIARIO_GetByIdBeneficiarioResult d)
        {
            return new MV_DetalleBeneficiario()
            {
                APELLIDOS = d.APELLIDOS,
                DIRECCION = d.DIRECCION,
                DUI = d.DUI,
                ESTADO_PROCESO = d.ESTADO_PROCESO,
                ID_BENEFICIARIO = d.ID_BENEFICIARIO,
                LAT = d.LAT??"",
                LONG = d.LONG??"",
                MAS_ANIOS_EN_LUGAR = d.MAS_ANIOS_EN_LUGAR,
                MUNICIPIO = d.MUNICIPIO,
                NIT = d.NIT,
                NOMBRES = d.NOMBRES,
                NOMBRE_SECTOR = d.NOMBRE_SECTOR,
                TEL_CEL = d.TEL_CEL,
                TEL_FIJO = d.TEL_FIJO,
                NOMBRE_CONSULTOR = d.NOMBRE_CONSULTOR,
                ID_PERSONA = d.ID_PERSONA
            };
        }
    }
}
