using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Security.Principal;
using System.Text;
using System.Text.Json;
using System.Threading.Tasks;
using Azure.Core;
using Microsoft.Data.SqlClient;
using Microsoft.Extensions.Configuration;
using Microsoft.IdentityModel.Protocols;
using Modelo.Models;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;

namespace Data.LibroData
{
    public class LibroData
    {
        private readonly IConfiguration context;

        public LibroData(IConfiguration conexionSQLDATA)
        {

            context = conexionSQLDATA;
        }


        public List<Libros> getLibrosAll()
        {



            return new List<Libros>();
        }


        public List<Libros> GetLibros()
        {
            string jsonData = string.Empty;

            jsonData = File.ReadAllText(@"C:\VS\Data\libros.json");

            List<Libros> listaLibros = JsonConvert.DeserializeObject<List<Libros>>(jsonData);
            return listaLibros;
        }


        public Libros GetLibrosById()
        {

            return new Libros();
        }
        public async  Task<List<Libros>> lista()
        {
            try
            {
                using (SqlConnection sql = new SqlConnection(context.GetConnectionString("conexionLEVEL")))
                {
                    using (SqlCommand cmd = new SqlCommand("sp_libro_GetLibro", sql))
                    {
                        cmd.CommandType = System.Data.CommandType.StoredProcedure;
                        var response = new List<Libros>();
                        await sql.OpenAsync();

                        using (var reader = await cmd.ExecuteReaderAsync())
                        {
                            while (await reader.ReadAsync())
                            {
                                response.Add(MapToValue(reader));
                            }
                        }

                        return response;
                    }
                }

            }
            catch (Exception ex)
            {
                var aaa = ex.Message.ToString();
                throw;
            }
        }


        private Libros MapToValue(SqlDataReader reader)
        {
            return new Libros()
            {
                 anio = (int)reader["anio"],
                 autor = reader["autor"].ToString(),
                idLibro = (int)reader["idLibro"],
                titulo = reader["titulo"].ToString(),
                nPaginas = (int)reader["nPaginas"],

            };
        }
        public async Task<bool> CrearLibro(Libros libros)
        {


            bool respuesta = true;

            List<Libros> listaLibros = new List<Libros>();
            using (var conexion = new SqlConnection(context.GetConnectionString("conexionLEVEL")))
            {
                await conexion.OpenAsync();
                SqlCommand cmd = new SqlCommand("sp_libro_crearLibro", conexion);

                cmd.Parameters.AddWithValue("@titulo", libros.titulo);
                cmd.Parameters.AddWithValue("@anio", libros.nPaginas);
                cmd.Parameters.AddWithValue("@paginas", libros.anio);
                cmd.Parameters.AddWithValue("@autor", libros.autor);

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
