using Microsoft.AspNetCore.Mvc;
using Stel.Data;
using Stel.Models;
namespace Stel.Controllers;

public class NovedadesController : Controller
{
    private NovedadesDatos _NovedadesDatos = new NovedadesDatos();
    public IActionResult Listar()
    {
        var oLista = _NovedadesDatos.Listar();
        return View(oLista);
    }
    
    public IActionResult Guardar()
    {
        return View();
    }
    [HttpPost]
    public IActionResult Guardar(NovedadesModel oNovedades)
    {
        if (!ModelState.IsValid)
            return View();

        var respuesta = _NovedadesDatos.Guardar(oNovedades);

        if (respuesta)
            return RedirectToAction("Listar");
        else
            return View();
    }
    public IActionResult Editar(int id)
    {
        var novedad = _NovedadesDatos.Obtener(id);
        if (novedad == null)
        {
            return NotFound();  // Retorna un error 404 si no se encuentra el registro
        }
        return View(novedad);
    }

    [HttpPost]
    public IActionResult Editar(NovedadesModel oNovedades)
    {
        if (!ModelState.IsValid)
        {
            return View(oNovedades);
        }

        var respuesta = _NovedadesDatos.Editar(oNovedades);

        if (respuesta)
        {
            return RedirectToAction("Listar");
        }
        else
        {
            return View(oNovedades);
        }
    }

    public IActionResult Eliminar(int id)
    {
        var respuesta = _NovedadesDatos.Eliminar(id);

        if (respuesta)
            return RedirectToAction("Listar");
        else
            return RedirectToAction("Listar");  // Puedes redirigir a una vista de error si lo deseas
    }
}