using MySqlConnector;
using Stel.Models;
using System;
using System.Data;
using System.Linq;

namespace Stel.Data
{
    public class UsuarioDatos
    {
        string connectionString = "Server=localhost;Database=stelnet;User Id=root;Allow Zero Datetime=True;";

        public UsuarioModel ValidarCredenciales(string usuario, string contrasena)
        {
            UsuarioModel usuarioValidado = null;

            using (MySqlConnection connection = new MySqlConnection(connectionString))
            {
                try
                {
                    connection.Open();
                    string query = "SELECT * FROM tbl_usuarios WHERE usuario = @usuario AND contrasena = @contrasena";
                    using (MySqlCommand cmd = new MySqlCommand(query, connection))
                    {
                        cmd.Parameters.AddWithValue("@usuario", usuario);
                        cmd.Parameters.AddWithValue("@contrasena", contrasena);

                        using (MySqlDataReader dr = cmd.ExecuteReader())
                        {
                            if (dr.Read())
                            {
                                usuarioValidado = new UsuarioModel()
                                {
                                    id = Convert.ToInt32(dr["id"]),
                                    usuario = dr["usuario"].ToString(),
                                    contrasena = dr["contrasena"].ToString()
                                };
                            }
                        }
                    }
                }
                catch (Exception ex)
                {
                    Console.WriteLine("Error: " + ex.Message);
                }
            }

            return usuarioValidado;
        }
    }
}

