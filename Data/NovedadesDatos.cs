    using System.Data;
    using MySqlConnector;
    using Org.BouncyCastle.Cms;
    using Stel.Models;

namespace Stel.Data;

public class NovedadesDatos
{
    string connectionString = "Server=localhost;Database=stelnet;User Id=root;Allow Zero Datetime=True;";

    public List<NovedadesModel> Listar()
    {
        var oLista = new List<NovedadesModel>();

        using (MySqlConnection connection = new MySqlConnection(connectionString))
        {
            try
            {
                connection.Open();
                string query = "SELECT id, asunto_novedades, desc_novedades, est_novedades, fec_novedades, rem_novedades, res_novedades, tipo_novedad FROM tbl_novedades";
                using (MySqlCommand cmd = new MySqlCommand(query, connection))
                {
                    using (MySqlDataReader dr = cmd.ExecuteReader())
                    {
                        while (dr.Read())
                        {
                            DateTime fec_novedades;
                            if (dr.IsDBNull("fec_novedades"))
                            {
                                fec_novedades = DateTime.MinValue;
                            }
                            else
                            {
                                var mysqlDateTime = dr.GetMySqlDateTime("fec_novedades");
                                fec_novedades = mysqlDateTime.IsValidDateTime ? mysqlDateTime.GetDateTime() : DateTime.MinValue;
                            }

                            oLista.Add(new NovedadesModel()
                            {
                                id = Convert.ToInt32(dr["id"]),
                                asunto_novedades = dr["asunto_novedades"].ToString(),
                                desc_novedades = dr["desc_novedades"].ToString(),
                                est_novedades = dr["est_novedades"].ToString(),
                                fec_novedades = fec_novedades,
                                rem_novedades = dr["rem_novedades"].ToString(),
                                res_novedades = dr["res_novedades"].ToString(),
                                tipo_novedad = dr["tipo_novedad"].ToString()
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

    
    public NovedadesModel Obtener(int id)
    {
        var oNovedades = new NovedadesModel();
        var cn = new Conexion();

        using (var conexion = new MySqlConnection(cn.getCadenaMySql()))
        {
            conexion.Open();

            string query = "SELECT * FROM tbl_novedades WHERE id = @id";
            MySqlCommand cmdObtener = new MySqlCommand(query, conexion);
            cmdObtener.Parameters.AddWithValue("@id", id);

            using (var dr = cmdObtener.ExecuteReader())
            {
                while (dr.Read())
                {
                    DateTime fec_novedades;
                    if (dr.IsDBNull("fec_novedades"))
                    {
                        fec_novedades = DateTime.MinValue;
                    }
                    else
                    {
                        var mysqlDateTime = dr.GetMySqlDateTime("fec_novedades");
                        fec_novedades = mysqlDateTime.IsValidDateTime ? mysqlDateTime.GetDateTime() : DateTime.MinValue;
                    }
                    oNovedades.id = Convert.ToInt32(dr["id"]);
                    oNovedades.asunto_novedades = dr["asunto_novedades"].ToString();
                    oNovedades.desc_novedades = dr["desc_novedades"].ToString();
                    oNovedades.est_novedades = dr["est_novedades"].ToString();
                    oNovedades.fec_novedades = (fec_novedades);
                    oNovedades.rem_novedades = dr["rem_novedades"].ToString();
                    oNovedades.res_novedades = dr["res_novedades"].ToString();
                    oNovedades.tipo_novedad = dr["tipo_novedad"].ToString();
                }
            }
        }

        return oNovedades;
    }
    public bool Guardar(NovedadesModel oNovedades)
    {
        bool rpta;
        try
        {
            var cn = new Conexion();
            using (var conexion = new MySqlConnection(cn.getCadenaMySql()))
            {
                conexion.Open();
                MySqlCommand cmd = new MySqlCommand("INSERT INTO tbl_novedades (asunto_novedades, desc_novedades, est_novedades, fec_novedades, rem_novedades, res_novedades, tipo_novedad) VALUES (@asunto, @descripcion, @est_novedades, @fec_novedades, @rem_novedades, @res_novedades, @tipo_novedad)", conexion);
                cmd.Parameters.AddWithValue("@asunto", oNovedades.asunto_novedades);
                cmd.Parameters.AddWithValue("@descripcion", oNovedades.desc_novedades);
                cmd.Parameters.AddWithValue("@est_novedades", oNovedades.est_novedades);
                cmd.Parameters.AddWithValue("@fec_novedades", oNovedades.fec_novedades);
                cmd.Parameters.AddWithValue("@rem_novedades", oNovedades.rem_novedades);
                cmd.Parameters.AddWithValue("@res_novedades", oNovedades.res_novedades);
                cmd.Parameters.AddWithValue("@tipo_novedad", oNovedades.tipo_novedad);

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

    public bool Editar(NovedadesModel oNovedades)
    {
        bool rpta;
        try
        {
            var cn = new Conexion();

            using (var conexion = new MySqlConnection(cn.getCadenaMySql()))
            {
                conexion.Open();
                MySqlCommand cmd = new MySqlCommand("UPDATE tbl_novedades SET asunto_novedades = @asunto, desc_novedades = @descripcion, est_novedades = @est_novedades, fec_novedades = @fec_novedades, rem_novedades = @rem_novedades, res_novedades = @res_novedades, tipo_novedad = @tipo_novedad WHERE id = @id", conexion);
                cmd.Parameters.AddWithValue("@id", oNovedades.id);
                cmd.Parameters.AddWithValue("@asunto", oNovedades.asunto_novedades);
                cmd.Parameters.AddWithValue("@descripcion", oNovedades.desc_novedades);
                cmd.Parameters.AddWithValue("@est_novedades", oNovedades.est_novedades);
                cmd.Parameters.AddWithValue("@fec_novedades", oNovedades.fec_novedades);
                cmd.Parameters.AddWithValue("@rem_novedades", oNovedades.rem_novedades);
                cmd.Parameters.AddWithValue("@res_novedades", oNovedades.res_novedades);
                cmd.Parameters.AddWithValue("@tipo_novedad", oNovedades.tipo_novedad);

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
                MySqlCommand cmd = new MySqlCommand("DELETE FROM tbl_novedades WHERE id = @id", conexion);
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