﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL.Modelos
{
    public class TB_PERMISO
    {
        public int ID_ROL { get; set; }
        public int ID_PERMISO { get; set; }
        public int USUARIO_CREA { get; set; }
        public int USUARIO_ACTUALIZA { get; set; }
        public DateTime FECHA_CREA { get; set; }
        public DateTime FECHA_ACTUALIZA { get; set; }
        public DateTime FECHA_BORRADO { get; set; }
    }
}
