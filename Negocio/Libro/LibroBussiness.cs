using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Xml.Serialization;
using Modelo.Models;
using Data.LibroData;
using Microsoft.Extensions.Configuration;
using Data.AutorData;

namespace Negocio.Libro
{
    public  class  LibroBussiness
    {
        private readonly AutorData _autorData1;
        private readonly LibroData _libroData;
        public LibroBussiness(AutorData autorData, LibroData libroData)
        {
            _autorData1 = autorData;
            _libroData = libroData;
        }

        public  Task<List<Libros>> GetLibros() {

            return _libroData.lista();
        }
   

        public async Task<bool> CrearLibro(Autores autores) {
            
            return await _autorData1.crear(autores);

        }

    }
}
