﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL.Modelos
{
    public class TBC_SECTOR_ECONOMICO
    {
        public int ID_SECTOR_ECONOMICO { get; set; }
        public string COD_SECTOR_ECONOMICO { get; set; }
        public string NOMBRE { get; set; }
        public int USUARIO_CREA { get; set; }
        public int USUARIO_ACTUALIZA { get; set; }
        public DateTime FECHA_CREA { get; set; }
        public DateTime FECHA_ACTUALIZA { get; set; }
        public DateTime FECHA_BORRADO { get; set; }
    }
}
