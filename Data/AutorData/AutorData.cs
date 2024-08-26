using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using Data.conexion;
using Microsoft.Data.SqlClient;
using Microsoft.Extensions.Options;
using Modelo.Models;
using Microsoft.EntityFrameworkCore.Metadata.Conventions.Infrastructure;
using Microsoft.Extensions.Configuration;

namespace Data.AutorData
{
    public class AutorData
    {
        private readonly IConfiguration context;

        public AutorData(IConfiguration conexionSQLDATA)
        {

            context = conexionSQLDATA;
        }

    
        public async Task<bool> crear(Autores autores)
        {


            bool respuesta = true;

            List<Autores> listaLibros = new List<Autores>();
            using (var conexion = new SqlConnection(context.GetConnectionString("conexionLEVEL")))
            {
                await conexion.OpenAsync();
                SqlCommand cmd = new SqlCommand("sp_libro_crearAutor", conexion);

                cmd.Parameters.AddWithValue("@nombre", autores.email);
                cmd.Parameters.AddWithValue("@rut", autores.rut);
                cmd.Parameters.AddWithValue("@fechaNacimineto", autores.FechaNacimineto);
                cmd.Parameters.AddWithValue("@email", autores.nombre);

                cmd.CommandType = CommandType.StoredProcedure;


                try
                {

                    await conexion.OpenAsync();
                    respuesta = await cmd.ExecuteNonQueryAsync() > 0 ? true : false;

                }
                catch (Exception)
                {
                    respuesta = false;
                    throw;
                }

                return respuesta;

            }



        }
    }
}
