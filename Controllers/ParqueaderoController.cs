using Microsoft.AspNetCore.Mvc;
using Stel.Data;
using Stel.Models;

namespace Stel.Controllers
{
    public class ParqueaderoController : Controller
    {
        private ParqueaderoDatos _ParqueaderoDatos = new ParqueaderoDatos();
        public IActionResult Listar()
        {
            var oLista = _ParqueaderoDatos.Listar();
            return View(oLista);
        }

        public IActionResult Guardar()
        {
            return View();
        }
        [HttpPost]
        public IActionResult Guardar(ParqueaderoModel oParqueadero)
        {
            if (!ModelState.IsValid)
                return View();

            var respuesta = _ParqueaderoDatos.Guardar(oParqueadero);

            if (respuesta)
                return RedirectToAction("Listar");
            else
                return View();
        }
        public IActionResult Editar(int id)
        {
            var parqueadero = _ParqueaderoDatos.Obtener(id);
            if (parqueadero == null)
            {
                return NotFound();  // Retorna un error 404 si no se encuentra el registro
            }
            return View(parqueadero);
        }

        [HttpPost]
        public IActionResult Editar(ParqueaderoModel oParqueadero)
        {
            if (!ModelState.IsValid)
            {
                return View(oParqueadero);
            }

            var respuesta = _ParqueaderoDatos.Editar(oParqueadero);

            if (respuesta)
            {
                return RedirectToAction("Listar");
            }
            else
            {
                return View(oParqueadero);
            }
        }

        public IActionResult Eliminar(int id)
        {
            var respuesta = _ParqueaderoDatos.Eliminar(id);

            if (respuesta)
                return RedirectToAction("Listar");
            else
                return RedirectToAction("Listar");  // Puedes redirigir a una vista de error si lo deseas
        }
    }
}
