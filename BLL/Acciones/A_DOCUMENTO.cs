using System;
using System.Collections.Generic;
using System.Linq;
using DAL.DB;
using BLL.Modelos;

namespace BLL.Acciones
{
    public class A_DOCUMENTO
    {
        private static readonly PISIDataContext _context = new PISIDataContext();

        public static void GuardarDocumento(int idBeneficiario, string direccion, string nombreDocumento)
        {
            //var docRes = _context.TB_DOCUMENTO
            //    .Where(d => d.ID_BENEFICIARIO == idBeneficiario && d.NOMBRE_DOCUMENTO == nombreDocumento);

            //if (docRes.Any())
            //    _context.TB_DOCUMENTO.DeleteAllOnSubmit(docRes);

            //_context.SubmitChanges();
            
            //var doc = new TB_DOCUMENTO
            //{
            //    ID_BENEFICIARIO = idBeneficiario,
            //    DIRECCION = direccion,
            //    NOMBRE_DOCUMENTO = nombreDocumento
            //};
            _context.SP_TB_DOCUMENTO_GuardarDocumento(idBeneficiario, direccion, nombreDocumento);
            
        }

        public static List<TB_DOCUMENTO> ObtenerXIdBeneficiario(int idBeneficiario, string nombreDocumento)
        {
            return _context.SP_TB_DOCUMENTO_ObtenerPorIdBeneficiarioYNombre(idBeneficiario,nombreDocumento).Select(r => new TB_DOCUMENTO
            {
                DIRECCION = r.DIRECCION,
                ID_BENEFICIARIO = r.ID_BENEFICIARIO,
                FECHA_CREA = r.FECHA_CREA,
                NOMBRE_ARCHIVO = r.NOMBRE_DOCUMENTO
            }).ToList();
        }
    }
}