using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Razor.Compilation;
using Stel.Models;
using System.Diagnostics;

namespace Stel.Controllers
{
    public class HomeController : Controller
    {
        private readonly ILogger<HomeController> _logger;

        public HomeController(ILogger<HomeController> logger)
        {
            _logger = logger;
        }

        
        public IActionResult Index()
        {
            
            return View();
            
        }
        public IActionResult SobreNosotros()
        {
            return View();
        }
        public IActionResult Servicios()
        {
            return View();
        }
        public IActionResult Contactenos() 
        {
            return View();
        }
        public IActionResult Ingresar() 
        {
            return View();
        }
        public IActionResult paginainicioModulos() 
        {
            return View();
        }
        /*public IActionResult Privacy()
        {
            return View();
        }*/
        

        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }
    }
}