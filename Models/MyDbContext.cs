using System.Runtime.InteropServices.JavaScript;
using Microsoft.EntityFrameworkCore;

namespace Stel.Models;

public class MyDbContext :DbContext 
{
    public MyDbContext(DbContextOptions<MyDbContext> options) : base(options) {}
    
    // DbSet para usuarios residentes
    public DbSet<Resident> Residentes { get; set; }
    
    // DbSet para usuarios visitantes
    public DbSet<Visitor> Visitantes { get; set; }
    
    // DbSet para usuarios vigilantes
    public DbSet<Worker> Trabajadores { get; set; }
    
}

public class Resident
{
    public  int id { get; set; }
    public String nomResidente { get; set; }
    public int cedResidente { get; set; }
    public String emaResidente { get; set; }
    public long celResidente { get; set; }
    public int numIntegrantes { get; set; }
    
}

public class Visitor
{
    public  int id { get; set; }
    public String nom_visitante { get; set; }
    public int ced_visitante { get; set; }
    private String nomResidente { get; set; } 
    private bool carVisitante { get; set; }
    private bool ingrVisitante { get; set; }
    private JSType.Date fecVisitante { get; set; } 
}

public class Worker
{
    private int id { get; set; }
    private String nomTrabajador { get; set; }
    private int ccTrabajador { get; set; }
    private long celTrabajador { get; set; }
    private String emaTrabajador { get; set; }
    private String tpcoTrabajador { get; set; }
    private String conTrabajador { get; set; }
    private String cargTrabajador { get; set; }
    private String empTrabajador { get; set; }
}    
    
