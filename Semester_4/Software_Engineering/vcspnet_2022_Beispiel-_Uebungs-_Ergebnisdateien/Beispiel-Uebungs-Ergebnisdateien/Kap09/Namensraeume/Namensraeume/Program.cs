using System;
using System.Collections.Generic;
using System.Text;
using AnzahlAutos;

namespace Namensraeume
{
  class Program
  {
    static void Main(string[] args)
    {
      Fahrzeug LKW = new Fahrzeug(80);  // statt AnzahlAutos.Fahrzeug...
      Fahrzeug PKW = new Fahrzeug(130);

      Console.WriteLine("Anzahl der Fahrzeuge: " + Fahrzeug.Anzahl);
      Console.WriteLine("Fahrzeug 1 {0} km/h", LKW.Geschwindigkeit);
      Console.WriteLine("Fahrzeug 2 {0} km/h", PKW.Geschwindigkeit);
    }
  }
}