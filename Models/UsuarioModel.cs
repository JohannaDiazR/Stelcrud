using System.ComponentModel.DataAnnotations;
namespace Stel.Models
{
    public class UsuarioModel
    {
        public int id {  get; set; }
        [Required(ErrorMessage = "El nombre de usuario es requerido")]
        public string usuario {  get; set; }
        [Required(ErrorMessage = "La contraseña es requerida")]
        public string contrasena { get; set; }
    }
}
