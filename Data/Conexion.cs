using MySql.Data.MySqlClient;

namespace Stel.Data;

public class Conexion
{

    private string connectionString;
    private MySqlConnection connection;

    public Conexion()
    {
        connectionString = "server=localhost;user=root;database=stelnet;password=;";
        connection = new MySqlConnection(connectionString);
    }

    public MySqlConnection GetConnection()
    {
        return connection;
    }

    //esta parte es para probar si la conexion funciona

    public void ProbarConexion()
    {
        try
        {
            connection.Open();

            string query = "SELECT COUNT(*) FROM tbl_novedades";
            MySqlCommand cmd = new MySqlCommand(query, connection);
            int count = Convert.ToInt32(cmd.ExecuteScalar());

            Console.WriteLine("Conexión exitosa. Número de filas en la tabla: " + count);
        }
        catch (Exception ex)
        {
            Console.WriteLine("Error al probar la conexión: " + ex.Message);
        }
        finally
        {
            connection.Close();
        }
    }

    public string getCadenaMySql()
    {
        return connectionString;
    }
}

