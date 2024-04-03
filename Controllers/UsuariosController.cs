using Microsoft.AspNetCore.Mvc;
using MySql.Data.MySqlClient;
using Stel.Data;
using Stel.Models;

namespace Stel.Controllers
{
    public class UsuariosController : Controller
    {
        private readonly UsuarioDatos _usuarioDatos;
        private readonly Conexion _conexion;
        public UsuariosController()
        {
            _conexion = new Conexion();
            _usuarioDatos = new UsuarioDatos();
        }

        [HttpPost]
        public IActionResult Ingresar(string usuario, string contrasena)
        {
            try
            {
                string connectionString = _conexion.getCadenaMySql();

                using (MySqlConnection con = new MySqlConnection(connectionString))
                {
                    con.Open();
                    string query = "SELECT fkid_rol FROM tbl_usuarios WHERE usuario = @usuario AND contrasena = @contrasena";
                    using (MySqlCommand cmd = new MySqlCommand(query, con))
                    {
                        cmd.Parameters.AddWithValue("@usuario", usuario);
                        cmd.Parameters.AddWithValue("@contrasena", contrasena);
                        using (MySqlDataReader reader = cmd.ExecuteReader())
                        {
                            if (reader.Read())
                            {
                                string fkid_rol = reader["fkid_rol"].ToString();
                                switch (fkid_rol)
                                {
                                    case "1":
                                        return RedirectToAction("Error404", "Home");
                                    case "2":
                                        return RedirectToAction("paginainicioModulos", "Home");
                                    case "3":
                                        return RedirectToAction("Error404", "Error404");
                                    case "4":
                                        return RedirectToAction("Error404", "Error404");
                                    default:
                                        return RedirectToAction("Ingresar", "Usuarios");
                                }
                            }
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                ModelState.AddModelError(string.Empty, "Error al intentar iniciar sesión.");
            }

            return View("Ingresar");
        }

        public IActionResult Ingresar()
        {
            return View();
        }

    }
}
