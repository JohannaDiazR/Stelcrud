using System.ComponentModel.DataAnnotations;
namespace Stel.Models
{
    public class ParqueaderoModel
    {
        public int id { get; set; }
        [Required(ErrorMessage = "El tipo es requerido")]
        public string tipo_parqueadero { get; set; }
        [Required(ErrorMessage = "El estado es requerido")]
        public string estado_parqueadero { get; set; }
        [Required(ErrorMessage = "La fecha es requerida")]
        public DateTime fec_parqueadero { get; set; }
        [Required(ErrorMessage = "Los datos del vehículo son requeridos")]
        public string dvte_parqueadero { get; set; }
        [Required(ErrorMessage = "El número de cupo es requerido")]
        public int cup_parqueadero { get; set; }
        public DateTime hora_salida { get; set; }
        [Required(ErrorMessage = "La tarifa es requerida")]
        public int tar_parqueadero { get; set; }
    }
}
