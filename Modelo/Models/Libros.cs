using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Modelo.Models
{
    public class Libros
    {

        public int? idLibro { get; set; }
        public string? titulo {  get; set; }
        public int? anio { get; set; }
        public string? genero { get; set; }
        public int? nPaginas { get; set; }
        public string? autor { get; set; }

        public bool? error { get; set; }
        public string? errorDetalle { get; set; }


    }
}
