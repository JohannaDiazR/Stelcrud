using System.Data;
using MySqlConnector;
using Org.BouncyCastle.Cms;
using Stel.Models;

namespace Stel.Data
{
    public class ParqueaderoDatos
    {
        string connectionString = "Server=localhost;Database=stelnet;User Id=root;Allow Zero Datetime=True;";

        public List<ParqueaderoModel> Listar()
        {
            var oLista = new List<ParqueaderoModel>();

            using (MySqlConnection connection = new MySqlConnection(connectionString))
            {
                try
                {
                    connection.Open();
                    string query = "SELECT id, tipo_parqueadero, estado_parqueadero, fec_parqueadero, dvte_parqueadero, cup_parqueadero, hora_salida, tar_parqueadero FROM tbl_parqueadero";
                    using (MySqlCommand cmd = new MySqlCommand(query, connection))
                    {
                        using (MySqlDataReader dr = cmd.ExecuteReader())
                        {
                            while (dr.Read())
                            {
                                DateTime fec_parqueadero;
                                if (dr.IsDBNull("fec_parqueadero"))
                                {
                                    fec_parqueadero = DateTime.MinValue;
                                }
                                else
                                {
                                    var mysqlDateTime = dr.GetMySqlDateTime("fec_parqueadero");
                                    fec_parqueadero = mysqlDateTime.IsValidDateTime ? mysqlDateTime.GetDateTime() : DateTime.MinValue;
                                }
                                DateTime hora_salida;
                                if (dr.IsDBNull("hora_salida"))
                                {
                                    hora_salida = DateTime.MinValue;
                                }
                                else
                                {
                                    var mysqlDateTime = dr.GetMySqlDateTime("hora_salida");
                                    hora_salida = mysqlDateTime.IsValidDateTime ? mysqlDateTime.GetDateTime() : DateTime.MinValue;
                                }

                                oLista.Add(new ParqueaderoModel()
                                {
                                    id = Convert.ToInt32(dr["id"]),
                                    tipo_parqueadero = dr["tipo_parqueadero"].ToString(),
                                    estado_parqueadero = dr["estado_parqueadero"].ToString(),
                                    fec_parqueadero = fec_parqueadero,
                                    dvte_parqueadero = dr["dvte_parqueadero"].ToString(),
                                    cup_parqueadero = Convert.ToInt32(dr["cup_parqueadero"]),
                                    hora_salida = hora_salida,
                                    tar_parqueadero = Convert.ToInt32(dr["tar_parqueadero"])
                                });
                            }
                        }
                    }
                }
                catch (Exception ex)
                {
                    Console.WriteLine("Error: " + ex.Message);
                }
            }

            return oLista;
        }


        public ParqueaderoModel Obtener(int id)
        {
            var oParqueadero = new ParqueaderoModel();
            var cn = new Conexion();

            using (var conexion = new MySqlConnection(cn.getCadenaMySql()))
            {
                conexion.Open();

                string query = "SELECT * FROM tbl_parqueadero WHERE id = @id";
                MySqlCommand cmdObtener = new MySqlCommand(query, conexion);
                cmdObtener.Parameters.AddWithValue("@id", id);

                using (var dr = cmdObtener.ExecuteReader())
                {
                    while (dr.Read())
                    {
                        DateTime fec_parqueadero;
                        if (dr.IsDBNull("fec_parqueadero"))
                        {
                            fec_parqueadero = DateTime.MinValue;
                        }
                        else
                        {
                            var mysqlDateTime = dr.GetMySqlDateTime("fec_parqueadero");
                            fec_parqueadero = mysqlDateTime.IsValidDateTime ? mysqlDateTime.GetDateTime() : DateTime.MinValue;
                        }
                        DateTime hora_salida;
                        if (dr.IsDBNull("hora_salida"))
                        {
                            hora_salida = DateTime.MinValue;
                        }
                        else
                        {
                            var mysqlDateTime = dr.GetMySqlDateTime("hora_salida");
                            hora_salida = mysqlDateTime.IsValidDateTime ? mysqlDateTime.GetDateTime() : DateTime.MinValue;
                        }

                        oParqueadero.id = Convert.ToInt32(dr["id"]);
                        oParqueadero.tipo_parqueadero = dr["tipo_parqueadero"].ToString();
                        oParqueadero.estado_parqueadero = dr["estado_parqueadero"].ToString();
                        oParqueadero.fec_parqueadero = (fec_parqueadero);
                        oParqueadero.dvte_parqueadero = dr["dvte_parqueadero"].ToString();
                        oParqueadero.cup_parqueadero = Convert.ToInt32(dr["cup_parqueadero"]);
                        oParqueadero.hora_salida = (hora_salida);
                        oParqueadero.tar_parqueadero = Convert.ToInt32(dr["tar_parqueadero"]);
                    }
                }
            }

            return oParqueadero;
        }
        public bool Guardar(ParqueaderoModel oParqueadero)
        {
            bool rpta;
            try
            {
                var cn = new Conexion();
                using (var conexion = new MySqlConnection(cn.getCadenaMySql()))
                {
                    conexion.Open();
                    MySqlCommand cmd = new MySqlCommand("INSERT INTO tbl_parqueadero (tipo_parqueadero, estado_parqueadero, fec_parqueadero, dvte_parqueadero, cup_parqueadero, hora_salida, tar_parqueadero) VALUES (@tipo_parqueadero, @estado_parqueadero, @fec_parqueadero, @dvte_parqueadero, @cup_parqueadero, @hora_salida, @tar_parqueadero)", conexion);
                    cmd.Parameters.AddWithValue("@tipo_parqueadero", oParqueadero.tipo_parqueadero);
                    cmd.Parameters.AddWithValue("@estado_parqueadero", oParqueadero.estado_parqueadero);
                    cmd.Parameters.AddWithValue("@fec_parqueadero", oParqueadero.fec_parqueadero);
                    cmd.Parameters.AddWithValue("@dvte_parqueadero", oParqueadero.dvte_parqueadero);
                    cmd.Parameters.AddWithValue("@cup_parqueadero", oParqueadero.cup_parqueadero);
                    cmd.Parameters.AddWithValue("@hora_salida", oParqueadero.hora_salida);
                    cmd.Parameters.AddWithValue("@tar_parqueadero", oParqueadero.tar_parqueadero);

                    cmd.ExecuteNonQuery();
                }

                rpta = true;
            }
            catch (Exception e)
            {
                string error = e.Message;
                rpta = false;
            }

            return rpta;
        }

        public bool Editar(ParqueaderoModel oParqueadero)
        {
            bool rpta;
            try
            {
                var cn = new Conexion();

                using (var conexion = new MySqlConnection(cn.getCadenaMySql()))
                {
                    conexion.Open();
                    MySqlCommand cmd = new MySqlCommand("UPDATE tbl_parqueadero SET tipo_parqueadero = @tipo_parqueadero, estado_parqueadero = @estado_parqueadero, fec_parqueadero = @fec_parqueadero, dvte_parqueadero = @dvte_parqueadero, cup_parqueadero = @cup_parqueadero, hora_salida = @hora_salida, tar_parqueadero = @tar_parqueadero WHERE id = @id", conexion);
                    cmd.Parameters.AddWithValue("@id", oParqueadero.id);
                    cmd.Parameters.AddWithValue("@tipo_parqueadero", oParqueadero.tipo_parqueadero);
                    cmd.Parameters.AddWithValue("@estado_parqueadero", oParqueadero.estado_parqueadero);
                    cmd.Parameters.AddWithValue("@fec_parqueadero", oParqueadero.fec_parqueadero);
                    cmd.Parameters.AddWithValue("@dvte_parqueadero", oParqueadero.dvte_parqueadero);
                    cmd.Parameters.AddWithValue("@cup_parqueadero", oParqueadero.cup_parqueadero);
                    cmd.Parameters.AddWithValue("@hora_salida", oParqueadero.hora_salida);
                    cmd.Parameters.AddWithValue("@tar_parqueadero", oParqueadero.tar_parqueadero);

                    int rowsAffected = cmd.ExecuteNonQuery();

                    if (rowsAffected > 0)
                    {
                        rpta = true;
                    }
                    else
                    {
                        rpta = false;
                    }
                }
            }
            catch (Exception e)
            {
                Console.WriteLine("Error: " + e.Message);
                rpta = false;
            }

            return rpta;
        }
        public bool Eliminar(int id)
        {
            bool rpta;
            try
            {
                var cn = new Conexion();

                using (var conexion = new MySqlConnection(cn.getCadenaMySql()))
                {
                    conexion.Open();
                    MySqlCommand cmd = new MySqlCommand("DELETE FROM tbl_parqueadero WHERE id = @id", conexion);
                    cmd.Parameters.AddWithValue("@id", id);

                    int rowsAffected = cmd.ExecuteNonQuery();

                    if (rowsAffected > 0)
                    {
                        rpta = true;
                    }
                    else
                    {
                        rpta = false;
                    }
                }
            }
            catch (Exception e)
            {
                Console.WriteLine("Error: " + e.Message);
                rpta = false;
            }

            return rpta;
        }

    }
}
